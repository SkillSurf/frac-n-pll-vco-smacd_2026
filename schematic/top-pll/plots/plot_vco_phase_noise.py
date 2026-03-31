#!/usr/bin/env python3
"""
VCO Phase Noise Plot
====================
Computes SSB phase noise L(f) [dBc/Hz] from the standalone LC-VCO
transient simulation (LC_VCO_tb.raw) using the period-jitter method.

Signal  : v(OUT)   — single-ended buffered VCO output
Raw file: schematic/lc-vco/simulations/LC_VCO_tb.raw

Method
------
  1. Load v(OUT) from the settled region (t > T_SETTLE = 100 ns)
  2. Find rising zero-crossings with sub-step linear interpolation
  3. Period deviation  dT_k = T_k - T_mean
  4. Welch PSD  S_dT(f)  of dT_k at sample rate f0
  5. SSB phase noise:  L(f) = f0^4 * S_dT(f) / (2 * f^2)

Usage
-----
  python3 plot_vco_phase_noise.py
  python3 plot_vco_phase_noise.py /path/to/LC_VCO_tb.raw
  python3 plot_vco_phase_noise.py /path/to/LC_VCO_tb.raw --threshold 0.6 --tsettle 100e-9
"""

import os, sys, argparse
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from scipy.signal import welch

try:
    import scienceplots          # noqa: F401
    HAS_SCIENCE = True
except ImportError:
    HAS_SCIENCE = False

# ── Colours ───────────────────────────────────────────────────────────────────
C_LINE  = "#1A6FBF"   # blue  — VCO phase noise curve
C_SPEC  = "#E87722"   # orange — spec / annotation markers
C_VCTRL = "#2E8B57"   # green  — VCTRL annotation

# ── Default parameters ────────────────────────────────────────────────────────
T_SETTLE  = 100e-9    # skip first 100 ns (VCTRL ramp + VCO startup)
THRESHOLD = 0.6       # V — zero-crossing level (VDD/2 = 1.2/2 = 0.6 V)
N_SEGS    = 8         # Welch segments (more = smoother but coarser resolution)

# ── Spec targets for standalone VCO ──────────────────────────────────────────
#    Adjust to your design targets
SPECS = [
    (1e6,  -100, "-100 dBc/Hz @ 1 MHz"),
    (10e6, -120, "-120 dBc/Hz @ 10 MHz"),
]


# =============================================================================
# 1. ngspice binary .raw header parser
# =============================================================================
def parse_raw_header(filepath):
    meta, variables = {}, []
    with open(filepath, "rb") as f:
        while True:
            line = f.readline()
            if not line:
                break
            text = line.decode("ascii", errors="replace").strip()
            if text.startswith("No. Variables:"):
                meta["n_vars"]   = int(text.split(":", 1)[1])
            elif text.startswith("No. Points:"):
                meta["n_points"] = int(text.split(":", 1)[1])
            elif text.startswith("Variables:"):
                for _ in range(meta["n_vars"]):
                    vl = f.readline().decode("ascii", errors="replace").strip()
                    p  = vl.split()
                    variables.append({"index": int(p[0]), "name": p[1]})
            elif text.startswith("Binary:"):
                meta["data_offset"] = f.tell()
                break
    meta["variables"] = variables
    return meta


# =============================================================================
# 2. Signal loader
# =============================================================================
def load_signal(filepath, sig_name, t_start=None):
    meta     = parse_raw_header(filepath)
    n_vars   = meta["n_vars"]
    n_points = meta["n_points"]
    offset   = meta["data_offset"]

    var_idx = next(
        (v["index"] for v in meta["variables"] if v["name"] == sig_name), None)
    if var_idx is None:
        avail = [v["name"] for v in meta["variables"]]
        raise ValueError(
            f"Signal '{sig_name}' not found.\n  Available: {avail}")

    mm = np.memmap(filepath, dtype=np.float64, mode="r",
                   offset=offset, shape=(n_points, n_vars))
    t = np.array(mm[:, 0])
    v = np.array(mm[:, var_idx])
    del mm

    if t_start is not None:
        idx = np.searchsorted(t, t_start)
        t, v = t[idx:], v[idx:]
    return t, v


def list_signals(filepath):
    meta = parse_raw_header(filepath)
    return [v["name"] for v in meta["variables"]]


# =============================================================================
# 3. Rising zero-crossing detector
# =============================================================================
def find_rising_crossings(t, v, threshold=THRESHOLD):
    above    = v > threshold
    edge_idx = np.where(np.diff(above.astype(np.int8)) == 1)[0]
    dv       = v[edge_idx + 1] - v[edge_idx]
    frac     = np.where(dv != 0.0, (threshold - v[edge_idx]) / dv, 0.5)
    return t[edge_idx] + frac * (t[edge_idx + 1] - t[edge_idx])


# =============================================================================
# 4. Phase noise via Welch PSD of period jitter
# =============================================================================
def compute_phase_noise(t_cross, n_segs=N_SEGS):
    """
    Returns
    -------
    f_off  : offset frequency array (Hz), DC excluded
    L_dBc  : SSB phase noise (dBc/Hz)
    f0     : carrier frequency (Hz)
    periods: raw period array (s) — for statistics
    """
    periods = np.diff(t_cross)
    T0      = np.mean(periods)
    f0      = 1.0 / T0
    dT      = periods - T0

    nperseg = max(64, len(dT) // n_segs)
    f_psd, S_dT = welch(dT, fs=f0, nperseg=nperseg,
                        window="hann", scaling="density",
                        noverlap=nperseg // 2)

    valid  = f_psd > 0
    f_off  = f_psd[valid]
    S      = S_dT[valid]

    # SSB phase noise formula
    L_lin  = (f0 ** 4) * S / (2.0 * f_off ** 2)
    L_dBc  = 10.0 * np.log10(np.maximum(L_lin, 1e-300))

    return f_off, L_dBc, f0, periods


# =============================================================================
# 5. Plot
# =============================================================================
def plot_vco_phase_noise(f_off, L_dBc, f0, periods, vctrl_v,
                         save_path, specs=SPECS):
    style = ["science", "no-latex"] if HAS_SCIENCE else []
    with plt.style.context(style):
        plt.rcParams.update({
            "figure.dpi": 300,
            "axes.grid":  True,
            "grid.alpha": 0.35,
        })

        fig, ax = plt.subplots(figsize=(6, 4))

        # ── Y / X limits ──────────────────────────────────────────────────
        y_lo = min(np.percentile(L_dBc, 3) - 10, -180)
        y_hi = max(np.percentile(L_dBc, 97) + 20, -20)
        ax.set_ylim(y_lo, y_hi)
        ax.set_xlim(f_off.min(), f_off.max())

        # ── Phase noise curve ─────────────────────────────────────────────
        ax.semilogx(f_off, L_dBc,
                    color=C_LINE, linewidth=1.6, zorder=4,
                    label=f"VCO  $f_0$ = {f0/1e9:.4f} GHz")

        # ── Spec lines + measured values ──────────────────────────────────
        for f_s, L_s, label in specs:
            if f_s < f_off.min() or f_s > f_off.max():
                continue
            idx    = np.argmin(np.abs(f_off - f_s))
            L_meas = L_dBc[idx]
            passed = L_meas <= L_s

            ax.axvline(f_s, color=C_SPEC, linewidth=0.8,
                       linestyle="--", zorder=2, alpha=0.8)
            ax.axhline(L_s, color=C_SPEC, linewidth=0.8,
                       linestyle="--", zorder=2, alpha=0.8)

            # Marker dot on curve
            ax.plot(f_s, L_meas, "o",
                    color=C_LINE, markersize=5, zorder=6)

            # Annotation: measured vs spec
            offset_sign = +1 if (y_hi - L_meas) > (L_meas - y_lo) * 0.3 else -1
            ax.annotate(
                f"{L_meas:.1f} dBc/Hz\n(spec {L_s} dBc/Hz)  "
                + ("PASS" if passed else "FAIL"),
                xy=(f_s, L_meas),
                xytext=(f_s * 2.5, L_meas + offset_sign * (y_hi - y_lo) * 0.08),
                fontsize=7.5,
                color="darkgreen" if passed else "#CC0000",
                arrowprops=dict(arrowstyle="-|>",
                                color=C_SPEC, lw=0.8))

        # ── Info box ──────────────────────────────────────────────────────
        jitter_rms = np.std(periods) * 1e12   # ps
        info = (
            f"$f_0$         = {f0/1e9:.4f} GHz\n"
            f"$V_{{CTRL}}$    = {vctrl_v:.3f} V\n"
            f"Jitter RMS = {jitter_rms:.2f} ps\n"
            f"Cycles     = {len(periods):,}"
        )
        ax.text(0.97, 0.97, info,
                transform=ax.transAxes, ha="right", va="top",
                fontsize=8, family="monospace",
                bbox=dict(boxstyle="round,pad=0.4", fc="white",
                          ec="#aaaaaa", alpha=0.95, lw=0.8))

        # ── Axes ──────────────────────────────────────────────────────────
        ax.set_xlabel("Frequency Offset (Hz)", fontsize=10)
        ax.set_ylabel(r"$\mathcal{L}(f)$  (dBc/Hz)",
                      fontsize=10, color=C_LINE)
        ax.tick_params(axis="y", colors=C_LINE, which="both")
        ax.spines["left"].set_color(C_LINE)
        ax.xaxis.set_major_formatter(ticker.EngFormatter())
        ax.xaxis.set_major_locator(ticker.LogLocator(base=10, numticks=8))
        ax.legend(fontsize=8.5, loc="lower left", framealpha=0.9)
        ax.set_title(
            f"LC-VCO Phase Noise  |  $f_0$ = {f0/1e9:.4f} GHz"
            f"  |  $V_{{CTRL}}$ = {vctrl_v:.2f} V",
            fontsize=10, pad=8)

        fig.tight_layout(pad=0.5)
        fmt = "pdf" if save_path.endswith(".pdf") else "png"
        fig.savefig(save_path, dpi=600, bbox_inches="tight", format=fmt)
        print(f"  Saved: {save_path}")
        plt.close(fig)


# =============================================================================
# 6. Main
# =============================================================================
def main():
    parser = argparse.ArgumentParser(
        description="LC-VCO phase noise from ngspice transient .raw file")
    parser.add_argument("raw_file", nargs="?",
        help="Path to LC_VCO_tb.raw (default: auto-detected)")
    parser.add_argument("--threshold", type=float, default=THRESHOLD,
        help=f"Zero-crossing threshold V [default {THRESHOLD}]")
    parser.add_argument("--tsettle",   type=float, default=T_SETTLE,
        help=f"Skip settling time s [default {T_SETTLE:.0e}]")
    parser.add_argument("--nsegs",     type=int,   default=N_SEGS,
        help=f"Welch segments [default {N_SEGS}]")
    args = parser.parse_args()

    script_dir = os.path.dirname(os.path.abspath(__file__))

    # Default path: lc-vco simulation relative to this script
    raw_path = (os.path.abspath(args.raw_file) if args.raw_file else
                os.path.abspath(os.path.join(
                    script_dir,
                    "../../lc-vco/simulations/LC_VCO_tb.raw")))

    if not os.path.isfile(raw_path):
        print(f"Error: '{raw_path}' not found.")
        print("Pass the raw file path as an argument:")
        print("  python3 plot_vco_phase_noise.py /path/to/LC_VCO_tb.raw")
        sys.exit(1)

    print(f"\nRaw file : {raw_path}  ({os.path.getsize(raw_path)/1024**2:.1f} MB)")

    # List available signals
    signals = list_signals(raw_path)
    print(f"Signals  : {signals}")

    # Pick output signal — try v(OUT) first, fallback to first non-time signal
    sig_name = "v(out)" if "v(out)" in signals else signals[1]
    print(f"Using    : {sig_name}")

    # Load v(OUT)
    print(f"Loading {sig_name}  (skip first {args.tsettle*1e9:.0f} ns) ...")
    t, v = load_signal(raw_path, sig_name, t_start=args.tsettle)
    span_ns = (t[-1] - t[0]) * 1e9
    print(f"  {len(t):,} points  |  span = {span_ns:.1f} ns"
          f"  |  v range: {v.min():.3f} – {v.max():.3f} V")

    # Check threshold
    thr_ok = v.min() < args.threshold < v.max()
    print(f"  Threshold {args.threshold} V  "
          f"({'OK' if thr_ok else 'WARNING: outside signal range!'})")
    if not thr_ok:
        print(f"  Tip: use --threshold {(v.min()+v.max())/2:.2f}  (signal midpoint)")

    # Load VCTRL to report the operating point
    vctrl_v = 0.6   # fallback default
    try:
        _, vctrl_arr = load_signal(raw_path, "v(vctrl)", t_start=args.tsettle)
        vctrl_v = float(np.mean(vctrl_arr))
        print(f"  VCTRL    = {vctrl_v:.4f} V  (mean over settled window)")
    except ValueError:
        print(f"  VCTRL signal not found — using default {vctrl_v} V")

    # Rising zero-crossings
    print(f"Detecting rising edges ...")
    t_cross = find_rising_crossings(t, v, threshold=args.threshold)
    n_cycles = len(t_cross)
    print(f"  {n_cycles:,} crossings found")

    if n_cycles < 64:
        print("ERROR: too few crossings. Extend simulation or check threshold.")
        sys.exit(1)
    if n_cycles < 512:
        print("WARNING: few cycles — phase noise estimate may be noisy.")

    # Phase noise
    print(f"Computing phase noise (Welch, {args.nsegs} segments) ...")
    f_off, L_dBc, f0, periods = compute_phase_noise(t_cross, n_segs=args.nsegs)

    # Console report
    print(f"\n  Carrier f0     : {f0/1e9:.6f} GHz")
    print(f"  VCTRL          : {vctrl_v:.4f} V")
    print(f"  Jitter RMS     : {np.std(periods)*1e12:.2f} ps")
    print(f"  Offset range   : {f_off.min()/1e3:.1f} kHz – {f_off.max()/1e6:.1f} MHz")
    print(f"  Freq resolution: {(f_off[1]-f_off[0])/1e3:.2f} kHz / bin")
    print()
    for f_s, L_s, _ in SPECS:
        if f_s < f_off.min() or f_s > f_off.max():
            print(f"  L({f_s/1e6:.0f} MHz) : out of range (extend simulation)")
            continue
        idx  = np.argmin(np.abs(f_off - f_s))
        flag = "PASS" if L_dBc[idx] <= L_s else "FAIL"
        print(f"  L({f_s/1e6:.0f} MHz) = {L_dBc[idx]:.1f} dBc/Hz"
              f"  (spec {L_s} dBc/Hz)  [{flag}]")

    # Save plots
    base = os.path.join(script_dir, "vco_phase_noise")
    print()
    for ext in (".png", ".pdf"):
        plot_vco_phase_noise(f_off, L_dBc, f0, periods, vctrl_v,
                             base + ext, specs=SPECS)


if __name__ == "__main__":
    main()

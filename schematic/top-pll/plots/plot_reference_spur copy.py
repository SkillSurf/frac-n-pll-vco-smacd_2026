#!/usr/bin/env python3
"""
Reference Spur Extraction from PLL Transient Simulation
========================================================
Computes the reference spur level [dBc] at a specified offset frequency
(default 10 MHz) from v(clk_out) in pll_top.raw using the same
period-jitter (zero-crossing) method as plot_phase_noise.py.

Method
------
  1. Load v(clk_out) from the settled region using numpy memmap
     (identical to phase_noise script)
  2. Find rising zero-crossings with sub-step linear interpolation
  3. Period deviation sequence δT_k = T_k − T̄
  4. High-resolution FFT of δT_k (zero-padded) sampled at carrier rate f₀
  5. Convert to SSB phase noise spectrum L(f) = f₀⁴ · S(f) / (2 · f²)
  6. Read spur level at f_ref offset; report dBc relative to carrier

Key difference vs. plot_phase_noise.py
---------------------------------------
  Welch PSD  →  good for smooth broadband noise floor (phase noise plot)
  Zero-padded FFT  →  mandatory for resolving a narrow discrete spur tone
  Both start from the same δT_k sequence and the same L(f) formula.

Usage
-----
  cd schematic/blocks/top-pll/simulations/
  python3 plot_reference_spur.py
  python3 plot_reference_spur.py /path/to/pll_top.raw
  python3 plot_reference_spur.py /path/to/pll_top.raw --fref 10e6
"""

import os, sys, struct, argparse
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import scienceplots                          # noqa: F401  (registers styles)

# ── Style (matches phase noise script) ───────────────────────────────────────
C_LINE  = "#C0143C"   # crimson  – spectrum curve
C_SPUR  = "#F5A623"   # amber    – spur marker
C_NOISE = "#4A90D9"   # blue     – noise floor annotation

# ── Default settling threshold (same as phase_noise script) ──────────────────
T_SETTLE = 20e-6      # skip first 20 µs

# ── Zero-padding factor: more → finer freq resolution around spur ─────────────
ZPAD_FACTOR = 8       # effective FFT length = ZPAD_FACTOR × len(dT)


# ---------------------------------------------------------------------------
# 1.  Raw file header parser  (identical to phase_noise script)
# ---------------------------------------------------------------------------

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


# ---------------------------------------------------------------------------
# 2.  Memory-efficient signal loader  (identical to phase_noise script)
# ---------------------------------------------------------------------------

def load_two_signals(filepath, sig_name, downsample=1, t_start=None):
    meta     = parse_raw_header(filepath)
    n_vars   = meta["n_vars"]
    n_points = meta["n_points"]
    offset   = meta["data_offset"]

    var_idx = next(
        (v["index"] for v in meta["variables"] if v["name"] == sig_name), None
    )
    if var_idx is None:
        raise ValueError(f"Signal '{sig_name}' not in raw file.")

    mm = np.memmap(filepath, dtype=np.float64, mode="r",
                   offset=offset, shape=(n_points, n_vars))
    t = np.array(mm[:, 0])
    v = np.array(mm[:, var_idx])
    del mm

    if t_start is not None:
        idx = np.searchsorted(t, t_start)
        t, v = t[idx:], v[idx:]

    if downsample > 1:
        t, v = t[::downsample], v[::downsample]

    return t, v


# ---------------------------------------------------------------------------
# 3.  Rising zero-crossing detector  (identical to phase_noise script)
# ---------------------------------------------------------------------------

def find_rising_crossings(t, v, threshold=0.6):
    above    = v > threshold
    edge_idx = np.where(np.diff(above.astype(np.int8)) == 1)[0]

    t_cross = np.empty(len(edge_idx))
    for i, k in enumerate(edge_idx):
        dv = v[k + 1] - v[k]
        frac = (threshold - v[k]) / dv if dv != 0.0 else 0.5
        t_cross[i] = t[k] + frac * (t[k + 1] - t[k])

    return t_cross


# ---------------------------------------------------------------------------
# 4.  High-resolution FFT-based spur extraction
#     (replaces Welch in phase_noise; same δT_k input, same L(f) formula)
# ---------------------------------------------------------------------------

def compute_spur_spectrum(t_cross, zpad=ZPAD_FACTOR):
    """
    Compute SSB phase noise spectrum via zero-padded FFT of period jitter.

    The math is identical to the Welch path in compute_phase_noise():
        L(f) = f₀⁴ · |FFT(δT_k)|² / (2 · N_fft · f_s · f²)

    Zero-padding increases the number of FFT bins (→ finer resolution)
    without changing the underlying noise/spur level.

    Returns
    -------
    f_off  : frequency offset array (Hz), positive half only, DC excluded
    L_dBc  : SSB phase noise / spur power spectral density (dBc/Hz)
    f0     : carrier frequency (Hz)
    """
    periods = np.diff(t_cross)
    T0      = np.mean(periods)
    f0      = 1.0 / T0
    dT      = periods - T0

    N       = len(dT)
    N_fft   = N * zpad                       # zero-padded FFT length

    # Apply Hann window before FFT to suppress spectral leakage from noise
    # (a spur is a coherent tone and will still stand above the windowed floor)
    window  = np.hanning(N)
    dT_win  = dT * window
    w_power = np.sum(window ** 2)            # normalise for window energy loss

    # FFT → single-sided power spectral density (s²/Hz)
    X       = np.fft.rfft(dT_win, n=N_fft)
    f_fft   = np.fft.rfftfreq(N_fft, d=1.0 / f0)  # freq axis at sample rate f₀

    # PSD: |X|² normalised by window power and frequency resolution
    df      = f0 / N_fft                    # bin width (Hz)
    S_dT    = (np.abs(X) ** 2) / (w_power * df)   # s²/Hz, same units as Welch

    # Convert to SSB phase noise using identical formula to phase_noise script
    valid   = f_fft > 0
    f_off   = f_fft[valid]
    S       = S_dT[valid]
    L_lin   = f0 ** 4 * S / (2.0 * f_off ** 2)
    L_dBc   = 10.0 * np.log10(np.maximum(L_lin, 1e-300))

    return f_off, L_dBc, f0


# ---------------------------------------------------------------------------
# 5.  Read spur level at a target offset frequency
# ---------------------------------------------------------------------------

def read_spur_level(f_off, L_dBc, f_target, search_bw=0.5e6):
    """
    Return the peak L(f) within ±search_bw of f_target.
    A narrow search window avoids picking up broadband noise instead of spur.

    Parameters
    ----------
    f_target  : nominal spur frequency (Hz), e.g. 10e6
    search_bw : search half-bandwidth (Hz); default ±0.5 MHz

    Returns
    -------
    f_spur   : actual frequency of the peak (Hz)
    L_spur   : spur level (dBc/Hz)  ← this is a PSD value
    """
    mask    = np.abs(f_off - f_target) <= search_bw
    if not np.any(mask):
        raise ValueError(
            f"No FFT bins within ±{search_bw/1e3:.0f} kHz of "
            f"{f_target/1e6:.1f} MHz. Try increasing ZPAD_FACTOR."
        )
    idx     = np.argmax(L_dBc[mask])
    f_spur  = f_off[mask][idx]
    L_spur  = L_dBc[mask][idx]
    return f_spur, L_spur


# ---------------------------------------------------------------------------
# 6.  Plot: SSB spectrum around the spur
# ---------------------------------------------------------------------------

def plot_spur_spectrum(f_off, L_dBc, f_spur, L_spur, f0, save_path,
                       plot_bw=5e6):
    """
    Plot L(f) in a ±plot_bw window around f_spur with spur annotation.
    A second inset panel shows the full spectrum for context.
    """
    with plt.style.context(["science", "no-latex"]):
        plt.rcParams.update({
            "figure.dpi": 300,
            "axes.grid":  True,
            "grid.alpha": 0.4,
        })

        fig, (ax_main, ax_full) = plt.subplots(
            1, 2, figsize=(7.0, 2.8),
            gridspec_kw={"width_ratios": [2, 1]}
        )

        # ── Main panel: zoom around spur ───────────────────────────────────
        f_lo = max(f_off.min(), f_spur - plot_bw)
        f_hi = min(f_off.max(), f_spur + plot_bw)
        mask = (f_off >= f_lo) & (f_off <= f_hi)

        ax_main.plot(f_off[mask] / 1e6, L_dBc[mask],
                     color=C_LINE, linewidth=1.2, zorder=4)

        # Spur marker
        ax_main.axvline(f_spur / 1e6, color=C_SPUR,
                        linewidth=0.9, linestyle="--", zorder=3)
        ax_main.plot(f_spur / 1e6, L_spur,
                     "^", color=C_SPUR, markersize=6, zorder=5,
                     label=f"Spur: {L_spur:.1f} dBc/Hz\n@ {f_spur/1e6:.3f} MHz")

        ax_main.legend(fontsize=6.5, loc="upper right",
                       framealpha=0.85, edgecolor="none")
        ax_main.set_xlabel("Frequency Offset (MHz)")
        ax_main.set_ylabel(r"$\mathcal{L}(f)$ (dBc/Hz)", color=C_LINE)
        ax_main.tick_params(axis="y", colors=C_LINE, which="both")
        ax_main.spines["left"].set_color(C_LINE)
        ax_main.set_title(
            f"Reference Spur @ {f_spur/1e6:.1f} MHz  "
            f"(carrier {f0/1e9:.4f} GHz)",
            fontsize=7.5
        )

        # ── Right panel: full log-freq spectrum for context ─────────────────
        ax_full.semilogx(f_off / 1e6, L_dBc,
                         color=C_LINE, linewidth=0.9, zorder=4)
        ax_full.axvline(f_spur / 1e6, color=C_SPUR,
                        linewidth=0.8, linestyle="--", zorder=3)
        ax_full.plot(f_spur / 1e6, L_spur,
                     "^", color=C_SPUR, markersize=5, zorder=5)

        ax_full.set_xlabel("Offset (MHz)")
        ax_full.set_ylabel(r"$\mathcal{L}(f)$ (dBc/Hz)", color=C_LINE)
        ax_full.tick_params(axis="y", colors=C_LINE, which="both")
        ax_full.spines["left"].set_color(C_LINE)
        ax_full.set_title("Full Spectrum", fontsize=7.5)
        ax_full.xaxis.set_major_formatter(ticker.EngFormatter())

        fig.tight_layout(pad=0.5)
        fig.savefig(save_path, dpi=600, bbox_inches="tight",
                    format="pdf" if save_path.endswith(".pdf") else "png")
        print(f"Saved: {save_path}")


# ---------------------------------------------------------------------------
# 7.  Main
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description="Extract reference spur from PLL transient simulation."
    )
    parser.add_argument("raw_file", nargs="?",
                        help="Path to .raw file (default: ../simulations/pll_sim.raw)")
    parser.add_argument("--fref", type=float, default=10e6,
                        help="Reference spur frequency offset in Hz (default: 10e6)")
    parser.add_argument("--search_bw", type=float, default=0.5e6,
                        help="Search half-bandwidth around fref in Hz (default: 0.5e6)")
    parser.add_argument("--zpad", type=int, default=ZPAD_FACTOR,
                        help=f"Zero-padding factor (default: {ZPAD_FACTOR})")
    args = parser.parse_args()

    script_dir = os.path.dirname(os.path.abspath(__file__))

    if args.raw_file:
        raw_path = os.path.abspath(args.raw_file)
    else:
        raw_path = os.path.abspath(
            os.path.join(script_dir, "../simulations/pll_sim.raw"))

    if not os.path.isfile(raw_path):
        print(f"Error: '{raw_path}' not found.")
        sys.exit(1)

    print(f"Raw file : {raw_path}  ({os.path.getsize(raw_path)/1024**2:.0f} MB)")
    print(f"Loading v(clk_out) (settled region t > {T_SETTLE*1e6:.0f} µs, "
          f"downsample=4) ...")

    t, v = load_two_signals(raw_path, "v(clk_out)",
                            downsample=4, t_start=T_SETTLE)

    dt_mean = np.mean(np.diff(t))
    print(f"  {len(t):,} points  "
          f"dt≈{dt_mean*1e12:.0f} ps  "
          f"span={(t[-1]-t[0])*1e6:.1f} µs  "
          f"fs≈{1/dt_mean/1e9:.2f} GHz")

    print("  Detecting rising zero-crossings (threshold = 0.6 V) ...")
    t_cross = find_rising_crossings(t, v, threshold=0.6)
    print(f"  {len(t_cross):,} crossings found")

    if len(t_cross) < 256:
        print("Error: too few crossings — verify the PLL has settled.")
        sys.exit(1)

    print(f"  Computing high-resolution FFT spectrum (zpad={args.zpad}) ...")
    f_off, L_dBc, f0 = compute_spur_spectrum(t_cross, zpad=args.zpad)

    # FFT frequency resolution (unpadded) and bin width
    periods  = np.diff(t_cross)
    N        = len(periods)
    df_raw   = f0 / N                        # resolution before zero-padding
    df_pad   = f0 / (N * args.zpad)          # resolution after zero-padding
    print(f"\n  Carrier f0      : {f0/1e9:.6f} GHz")
    print(f"  Period jitter N : {N:,} samples")
    print(f"  FFT resolution  : {df_raw/1e3:.2f} kHz  "
          f"(zero-padded → {df_pad/1e3:.2f} kHz)")
    print(f"  Searching for spur at {args.fref/1e6:.1f} MHz "
          f"±{args.search_bw/1e3:.0f} kHz ...")

    f_spur, L_spur = read_spur_level(f_off, L_dBc, args.fref, args.search_bw)

    print(f"\n  ┌─────────────────────────────────────────────┐")
    print(f"  │  Reference spur @ {f_spur/1e6:.3f} MHz            │")
    print(f"  │  Spur level     : {L_spur:7.1f} dBc/Hz            │")
    print(f"  └─────────────────────────────────────────────┘")

    # Noise floor: median L(f) in an octave around the spur, excluding spur peak
    mask_oct = (f_off > args.fref * 0.7) & (f_off < args.fref * 1.4)
    L_floor  = np.median(L_dBc[mask_oct])
    print(f"  Noise floor near spur : {L_floor:.1f} dBc/Hz")
    print(f"  Spur above noise floor: {L_spur - L_floor:.1f} dB")

    base = os.path.join(script_dir, "reference_spur")
    plot_spur_spectrum(f_off, L_dBc, f_spur, L_spur, f0,
                       base + ".pdf", plot_bw=3 * args.fref)
    plot_spur_spectrum(f_off, L_dBc, f_spur, L_spur, f0,
                       base + ".png", plot_bw=3 * args.fref)


if __name__ == "__main__":
    main()
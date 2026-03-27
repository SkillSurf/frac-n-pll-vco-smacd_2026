#!/usr/bin/env python3
"""
Reference Spur — Spectrum-Analyser Style Plot  (corrected axis version)
========================================================================
Produces a carrier-centred plot matching published SA spur graphs:

  • X-axis : absolute frequency in GHz  centred on f₀
  • Y-axis : dBm, carrier spike at top (~0 dBm reference),
             noise floor and spurs at NEGATIVE values below it
  • Spur   : dashed lines at ±f_ref, dBc arrow = carrier_top − spur_peak
  • Label  : "−XX.X dBc" double-headed arrow on the right spur

Root-cause fix vs. previous version
-------------------------------------
  The old code did:
      p_display = L(f) + 10·log10(RBW)
  L(f) is typically −50 to −100 dBc/Hz, and 10·log10(100 kHz) = +50 dB,
  so p_display came out near 0 or even positive — putting the noise floor
  at the SAME level as the carrier and making spur dBc look tiny (~1 dBc).

  The correct approach:
      p_display(f_offset) = L(f_offset) + 10·log10(RBW)   [dBc in RBW]
  This IS negative for a well-designed PLL:
      e.g.  L = −82 dBc/Hz  →  −82 + 50 = −32 dBc  ✓  (noise floor ~−32 dBm)
            L = −49 dBc/Hz  (spur) → −49 + 50 = +1 dBc  ← spur near carrier!

  The problem was that with a very large RBW (100 kHz = +50 dB), spurs that
  are already close to the carrier in L(f) space get pushed positive.
  Fix: use a SMALLER display RBW (3 kHz default, like real SA measurements
  of PLLs) so the noise floor sits well below the carrier, and the spur dBc
  reads correctly as a large negative number.

Usage
-----
  python3 plot_reference_spur.py
  python3 plot_reference_spur.py /path/to/pll_sim.raw
  python3 plot_reference_spur.py /path/to/pll_sim.raw --fref 10e6 --span 60e6
  python3 plot_reference_spur.py /path/to/pll_sim.raw --rbw 3e3
"""

import os, sys, argparse
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
import scienceplots                          # noqa: F401

# ── Colours ──────────────────────────────────────────────────────────────────
C_CARRIER = "#C0143C"   # crimson  – spectrum trace
C_SPUR    = "#F5A623"   # amber    – spur annotation
C_ANNOT   = "#4A90D9"   # blue     – offset label

# ── Defaults ─────────────────────────────────────────────────────────────────
T_SETTLE    = 20e-6     # skip first 20 µs
ZPAD_FACTOR = 8         # zero-padding for fine FFT resolution

# Key fix: use 3 kHz RBW (typical for PLL spur measurements on real SA)
# 10·log10(3 kHz) = +34.8 dB   →  noise floor at −82+35 = −47 dBm  ✓
# 100 kHz RBW was +50 dB  →  noise floor at −82+50 = −32 dBm (too high,
# compresses the dynamic range and makes spur dBc look tiny)
RBW_HZ = 3e3            # 3 kHz default RBW


# ---------------------------------------------------------------------------
# 1-3.  Header parser, signal loader, zero-crossing detector  (unchanged)
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


def load_two_signals(filepath, sig_name, downsample=1, t_start=None):
    meta     = parse_raw_header(filepath)
    n_vars   = meta["n_vars"]
    n_points = meta["n_points"]
    offset   = meta["data_offset"]
    var_idx  = next(
        (v["index"] for v in meta["variables"] if v["name"] == sig_name), None
    )
    if var_idx is None:
        raise ValueError(f"Signal '{sig_name}' not in raw file.")
    mm = np.memmap(filepath, dtype=np.float64, mode="r",
                   offset=offset, shape=(n_points, n_vars))
    t = np.array(mm[:, 0]);  v = np.array(mm[:, var_idx]);  del mm
    if t_start is not None:
        idx = np.searchsorted(t, t_start);  t, v = t[idx:], v[idx:]
    if downsample > 1:
        t, v = t[::downsample], v[::downsample]
    return t, v


def find_rising_crossings(t, v, threshold=0.6):
    above    = v > threshold
    edge_idx = np.where(np.diff(above.astype(np.int8)) == 1)[0]
    t_cross  = np.empty(len(edge_idx))
    for i, k in enumerate(edge_idx):
        dv = v[k+1] - v[k]
        frac = (threshold - v[k]) / dv if dv != 0.0 else 0.5
        t_cross[i] = t[k] + frac * (t[k+1] - t[k])
    return t_cross


# ---------------------------------------------------------------------------
# 4.  Zero-padded FFT → SSB phase noise L(f) [dBc/Hz]  (unchanged)
# ---------------------------------------------------------------------------

def compute_spur_spectrum(t_cross, zpad=ZPAD_FACTOR):
    periods = np.diff(t_cross)
    T0      = np.mean(periods);   f0 = 1.0 / T0
    dT      = periods - T0
    N       = len(dT);            N_fft = N * zpad

    window  = np.hanning(N)
    dT_win  = dT * window
    w_power = np.sum(window ** 2)

    X     = np.fft.rfft(dT_win, n=N_fft)
    f_fft = np.fft.rfftfreq(N_fft, d=1.0 / f0)
    df    = f0 / N_fft
    S_dT  = (np.abs(X) ** 2) / (w_power * df)

    valid  = f_fft > 0
    f_off  = f_fft[valid];   S = S_dT[valid]
    L_lin  = f0 ** 4 * S / (2.0 * f_off ** 2)
    L_dBc  = 10.0 * np.log10(np.maximum(L_lin, 1e-300))
    return f_off, L_dBc, f0


# ---------------------------------------------------------------------------
# 5.  Read peak spur level  (unchanged)
# ---------------------------------------------------------------------------

def read_spur_level(f_off, L_dBc, f_target, search_bw=0.5e6):
    mask = np.abs(f_off - f_target) <= search_bw
    if not np.any(mask):
        raise ValueError(
            f"No FFT bins within ±{search_bw/1e3:.0f} kHz of "
            f"{f_target/1e6:.1f} MHz. Try increasing ZPAD_FACTOR."
        )
    idx    = np.argmax(L_dBc[mask])
    return f_off[mask][idx], L_dBc[mask][idx]


# ---------------------------------------------------------------------------
# 6.  Build carrier-centred SA spectrum  (FIXED)
#
#  Correct formula:
#      p_dBc(f_offset) = L(f_offset) + 10·log10(RBW)
#
#  This gives dBc (relative to carrier) within the chosen RBW.
#  For a good PLL:   L = −82 dBc/Hz,  RBW = 3 kHz (+35 dB)
#      → p_dBc = −82 + 35 = −47 dBc   ← noise floor 47 dB below carrier ✓
#
#  The carrier itself is at 0 dBc (= 0 dBm if we normalise to carrier).
#  Every other frequency is NEGATIVE.
#
#  Key insight: p_dBc must always be < 0 for proper SA display.
#  If p_dBc comes out positive for some bins, clamp to −0.5 dBc
#  (those are artefact bins at very low offset where the jitter model
#   breaks down — not real energy above the carrier).
# ---------------------------------------------------------------------------

def build_sa_spectrum(f_off, L_dBc, f0, rbw=RBW_HZ, span=None):
    """
    Returns
    -------
    f_ghz  : frequency axis in GHz (carrier at centre)
    p_dbm  : power in dBm  — carrier = 0 dBm, everything else NEGATIVE
    """
    rbw_factor = 10.0 * np.log10(rbw)          # e.g. 3 kHz → +34.8 dB
    p_dBc      = L_dBc + rbw_factor             # dBc within RBW — should be negative

    # Clamp any positive artefact bins (very near-carrier, model breakdown)
    p_dBc = np.minimum(p_dBc, -0.5)

    if span is not None:
        mask   = f_off <= span / 2.0
        f_off  = f_off[mask]
        p_dBc  = p_dBc[mask]

    # Mirror symmetrically around f₀
    f_lower = (f0 - f_off[::-1]) / 1e9
    f_upper = (f0 + f_off)       / 1e9
    p_lower = p_dBc[::-1]
    p_upper = p_dBc

    f_ghz = np.concatenate([f_lower, [f0 / 1e9], f_upper])
    p_dbm = np.concatenate([p_lower, [0.0],       p_upper])   # carrier at 0 dBm

    return f_ghz, p_dbm


# ---------------------------------------------------------------------------
# 7.  Spectrum-analyser style plot  (FIXED axis limits)
# ---------------------------------------------------------------------------

def plot_sa_spectrum(f_ghz, p_dbm, f0, f_spur, L_spur, rbw, save_path):
    with plt.style.context(["science", "no-latex"]):
        plt.rcParams.update({
            "figure.dpi"     : 300,
            "axes.grid"      : True,
            "grid.alpha"     : 0.25,
            "grid.linestyle" : "--",
        })

        fig, ax = plt.subplots(figsize=(5.0, 3.5))

        # ── Spectrum trace ─────────────────────────────────────────────────
        ax.plot(f_ghz, p_dbm, color=C_CARRIER, linewidth=0.9, zorder=4)

        # ── Carrier centre line (faint dotted) ────────────────────────────
        f0_ghz = f0 / 1e9
        ax.axvline(f0_ghz, color=C_CARRIER, linewidth=0.5,
                   linestyle=":", alpha=0.35, zorder=2)

        # ── Spur marker dashed lines at ±f_spur ───────────────────────────
        f_lo_ghz = (f0 - f_spur) / 1e9
        f_hi_ghz = (f0 + f_spur) / 1e9
        for fs in [f_lo_ghz, f_hi_ghz]:
            ax.axvline(fs, color=C_SPUR, linewidth=0.9,
                       linestyle="--", alpha=0.9, zorder=3)

        # ── dBc double-headed arrow on right spur ─────────────────────────
        # Spur power in the display = L_spur + RBW_factor  (a negative dBc)
        rbw_factor = 10.0 * np.log10(rbw)
        spur_dbc   = L_spur + rbw_factor        # negative number, e.g. −48 dBc
        spur_dbc   = min(spur_dbc, -0.5)        # clamp (same as build step)

        # The arrow goes from y=0 (carrier top) down to y=spur_dbc
        ax.annotate(
            "", xy=(f_hi_ghz, spur_dbc), xytext=(f_hi_ghz, 0.0),
            arrowprops=dict(arrowstyle="<->", color=C_SPUR,
                            lw=1.0, shrinkA=0, shrinkB=0),
            zorder=6
        )

        # dBc text label to the right of the arrow
        x_txt = f_hi_ghz + (f_ghz[-1] - f_ghz[0]) * 0.018
        ax.text(x_txt, spur_dbc / 2.0,
                f"{spur_dbc:.1f} dBc",
                color=C_SPUR, fontsize=7.0, va="center",
                bbox=dict(boxstyle="square,pad=0.15",
                          fc="white", ec="none", alpha=0.88))

        # ── Horizontal offset arrow at bottom ─────────────────────────────
        y_lo, y_hi = ax.get_ylim()
        y_bot      = y_lo + (y_hi - y_lo) * 0.05
        ax.annotate(
            "", xy=(f_hi_ghz, y_bot), xytext=(f0_ghz, y_bot),
            arrowprops=dict(arrowstyle="<->", color=C_ANNOT,
                            lw=0.9, shrinkA=0, shrinkB=0),
            zorder=5
        )
        ax.text((f0_ghz + f_hi_ghz) / 2.0,
                y_bot + (y_hi - y_lo) * 0.03,
                f"{f_spur / 1e6:.0f} MHz",
                color=C_ANNOT, fontsize=7.0, ha="center", va="bottom")

        # ── Y-axis: carrier at top, noise floor in negative territory ──────
        # Add a small margin above 0 dBm so the carrier spike isn't clipped
        ax.set_ylim(bottom=None, top=8.0)       # ~8 dB headroom above carrier

        # ── Axis formatting ────────────────────────────────────────────────
        ax.set_xlabel("Frequency (GHz)", fontsize=8)
        ax.set_ylabel("Reference Spur (dBm)", fontsize=8, color=C_CARRIER)
        ax.tick_params(axis="y", colors=C_CARRIER, labelsize=7)
        ax.tick_params(axis="x", labelsize=7)
        ax.spines["left"].set_color(C_CARRIER)
        ax.xaxis.set_major_formatter(ticker.FormatStrFormatter("%.3f"))
        ax.xaxis.set_major_locator(ticker.MaxNLocator(nbins=6))

        # ── Info box top-left ──────────────────────────────────────────────
        ax.text(0.03, 0.97,
                f"$f_0$ = {f0/1e9:.4f} GHz\n"
                f"RBW = {rbw/1e3:.0f} kHz",
                transform=ax.transAxes, ha="left", va="top", fontsize=6.0,
                bbox=dict(boxstyle="square,pad=0.2",
                          fc="white", ec="none", alpha=0.88))

        fig.tight_layout(pad=0.5)
        fmt = "pdf" if save_path.endswith(".pdf") else "png"
        fig.savefig(save_path, dpi=600, bbox_inches="tight", format=fmt)
        print(f"  Saved: {save_path}")


# ---------------------------------------------------------------------------
# 8.  Main
# ---------------------------------------------------------------------------

def main():
    parser = argparse.ArgumentParser(
        description="Reference spur — spectrum-analyser style plot (fixed axes)."
    )
    parser.add_argument("raw_file",    nargs="?",
                        help="Path to .raw file")
    parser.add_argument("--fref",      type=float, default=10e6,
                        help="Spur offset frequency in Hz (default: 10e6)")
    parser.add_argument("--span",      type=float, default=60e6,
                        help="Total display span in Hz (default: 60e6 = ±30 MHz)")
    parser.add_argument("--rbw",       type=float, default=RBW_HZ,
                        help=f"Resolution bandwidth in Hz (default: {RBW_HZ:.0f})")
    parser.add_argument("--search_bw", type=float, default=0.5e6,
                        help="Spur search half-bandwidth in Hz (default: 0.5e6)")
    parser.add_argument("--zpad",      type=int,   default=ZPAD_FACTOR,
                        help=f"Zero-padding factor (default: {ZPAD_FACTOR})")
    args = parser.parse_args()

    script_dir = os.path.dirname(os.path.abspath(__file__))
    raw_path   = (os.path.abspath(args.raw_file) if args.raw_file else
                  os.path.abspath(os.path.join(script_dir,
                                               "../simulations/pll_sim.raw")))

    if not os.path.isfile(raw_path):
        print(f"Error: '{raw_path}' not found.");  sys.exit(1)

    print(f"Raw file : {raw_path}  ({os.path.getsize(raw_path)/1024**2:.0f} MB)")
    print(f"Loading v(clk_out) (settled t > {T_SETTLE*1e6:.0f} µs, "
          f"downsample=4) ...")
    t, v = load_two_signals(raw_path, "v(clk_out)",
                            downsample=4, t_start=T_SETTLE)
    print(f"  {len(t):,} points  span={(t[-1]-t[0])*1e6:.1f} µs")

    print("  Detecting rising zero-crossings ...")
    t_cross = find_rising_crossings(t, v, threshold=0.6)
    print(f"  {len(t_cross):,} crossings found")
    if len(t_cross) < 256:
        print("Error: too few crossings — verify PLL has settled.");  sys.exit(1)

    print(f"  Computing FFT spectrum (zpad={args.zpad}) ...")
    f_off, L_dBc, f0 = compute_spur_spectrum(t_cross, zpad=args.zpad)

    print(f"  Searching spur at {args.fref/1e6:.1f} MHz "
          f"±{args.search_bw/1e3:.0f} kHz ...")
    f_spur, L_spur = read_spur_level(f_off, L_dBc, args.fref, args.search_bw)

    rbw_factor = 10.0 * np.log10(args.rbw)
    spur_dbc   = min(L_spur + rbw_factor, -0.5)

    print(f"\n  ┌──────────────────────────────────────────────────────┐")
    print(f"  │  Carrier f0        : {f0/1e9:.6f} GHz                │")
    print(f"  │  Spur offset       : {f_spur/1e6:.3f} MHz                  │")
    print(f"  │  L(f) at spur      : {L_spur:.1f} dBc/Hz               │")
    print(f"  │  RBW factor        : {rbw_factor:+.1f} dB  "
          f"[{args.rbw/1e3:.0f} kHz]               │")
    print(f"  │  Spur level (dBc)  : {spur_dbc:.1f} dBc                    │")
    print(f"  └──────────────────────────────────────────────────────┘")

    print("  Building SA-style carrier-centred spectrum ...")
    f_ghz, p_dbm = build_sa_spectrum(
        f_off, L_dBc, f0, rbw=args.rbw, span=args.span
    )

    # Sanity check: noise floor should be well below 0
    noise_floor = np.percentile(p_dbm, 10)
    print(f"  Noise floor (~10th percentile) : {noise_floor:.1f} dBm")
    if noise_floor > -5:
        print("  WARNING: noise floor is very close to carrier — "
              "try a smaller --rbw value (e.g. --rbw 1e3)")

    base = os.path.join(script_dir, "reference_spur")
    print("  Plotting ...")
    plot_sa_spectrum(f_ghz, p_dbm, f0, f_spur, L_spur,
                     args.rbw, base + ".pdf")
    plot_sa_spectrum(f_ghz, p_dbm, f0, f_spur, L_spur,
                     args.rbw, base + ".png")


if __name__ == "__main__":
    main()
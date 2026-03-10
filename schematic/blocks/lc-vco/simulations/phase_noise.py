import numpy as np
import matplotlib.pyplot as plt
from scipy.signal import welch
from spicelib import RawRead

raw = RawRead("LC_VCO_tb.raw")

t = raw.get_trace("time").get_wave()
v = raw.get_trace("v(outp)").get_wave()

print("Samples:", len(v))

# Downsample
v = v[::20]
t = t[::20]

T = t[-1] - t[0]
fs = len(t) / T

print("Sampling frequency:", fs/1e9, "GHz")

v = v - np.mean(v)

f, Pxx = welch(v, fs, nperseg=2097152)

Pxx_dB = 10*np.log10(Pxx)

carrier_idx = np.argmax(Pxx_dB)
carrier_power = Pxx_dB[carrier_idx]
f_carrier = f[carrier_idx]

print("Carrier frequency:", f_carrier/1e9, "GHz")

L = Pxx_dB - carrier_power

mask = f > 1e3
f = f[mask]
L = L[mask]

plt.figure(figsize=(8,5))
plt.semilogx(f, L)

plt.xlabel("Offset Frequency (Hz)")
plt.ylabel("Phase Noise (dBc/Hz)")
plt.title("VCO Phase Noise")

plt.grid(True)
plt.xlim(1e3,1e7)
plt.ylim(-180,0)

plt.savefig("phase_noise.png", dpi=300)
plt.show()
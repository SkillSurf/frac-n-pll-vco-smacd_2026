v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 2320 70 2320 110 {
lab=#net1}
N 2060 40 2100 40 {
lab=#net1}
N 2250 110 2320 110 {
lab=#net1}
N 2020 -50 2320 -50 {
lab=VDD}
N 2020 260 2080 260 {lab=#net2}
N 2260 260 2320 260 {lab=#net3}
N 2020 -10 2020 10 {lab=VDD}
N 2320 -10 2320 10 {lab=VDD}
N 2320 40 2380 40 {lab=VDD}
N 2380 -10 2380 40 {lab=VDD}
N 1960 40 2020 40 {lab=VDD}
N 1960 -10 1960 40 {lab=VDD}
N 1960 -10 2020 -10 {lab=VDD}
N 2380 500 2380 560 {lab=GND}
N 2320 500 2380 500 {lab=GND}
N 2320 530 2320 570 {
lab=Vx}
N 1960 500 1960 560 {lab=GND}
N 1960 500 2020 500 {lab=GND}
N 2020 530 2020 570 {
lab=Vx}
N 2320 430 2320 480 {
lab=OUTp}
N 2020 430 2020 480 {
lab=OUTn}
N 2020 -50 2020 -10 {lab=VDD}
N 2320 -50 2320 -10 {lab=VDD}
N 2240 40 2280 40 {
lab=#net4}
N 2060 500 2100 500 {
lab=OUTp}
N 2240 500 2280 500 {
lab=OUTn}
N 2020 110 2090 110 {
lab=#net4}
N 2020 70 2020 110 {
lab=#net4}
N 2090 110 2240 40 {lab=#net4}
N 2100 40 2250 110 {lab=#net1}
N 2020 430 2090 430 {
lab=OUTn}
N 2250 430 2320 430 {
lab=OUTp}
N 2100 500 2250 430 {lab=OUTp}
N 2090 430 2240 500 {lab=OUTn}
N 2320 -10 2380 -10 {lab=VDD}
N 2170 810 2230 810 {lab=GND}
N 2230 760 2230 810 {lab=GND}
N 2170 760 2230 760 {lab=GND}
N 2170 810 2170 850 {lab=GND}
N 2170 790 2170 810 {lab=GND}
N 2170 570 2320 570 {
lab=Vx}
N 2320 220 2320 260 {lab=#net3}
N 2320 110 2320 160 {lab=#net1}
N 2320 260 2320 300 {lab=#net3}
N 2320 360 2320 430 {lab=OUTp}
N 2170 570 2170 630 {lab=Vx}
N 2020 570 2170 570 {
lab=Vx}
N 2170 690 2170 730 {lab=#net5}
N 1810 810 1870 810 {lab=GND}
N 1810 760 1810 810 {lab=GND}
N 1810 760 1870 760 {lab=GND}
N 1870 810 1870 850 {lab=GND}
N 1870 790 1870 810 {lab=GND}
N 2020 760 2130 760 {lab=Vgs}
N 1870 710 1870 730 {lab=Vgs}
N 2020 710 2020 760 {lab=Vgs}
N 1910 760 2020 760 {lab=Vgs}
N 1870 710 2020 710 {lab=Vgs}
N 2020 220 2020 260 {lab=#net2}
N 2020 110 2020 160 {lab=#net4}
N 2020 360 2020 430 {lab=OUTn}
N 2020 260 2020 300 {lab=#net2}
N 2260 220 2260 260 {lab=#net3}
N 2080 220 2080 260 {lab=#net2}
N 2160 250 2160 300 {lab=GND}
N 1750 260 1750 290 {lab=GND}
N 1750 260 1800 260 {lab=GND}
N 1750 230 1750 260 {lab=GND}
N 1640 320 1710 320 {lab=OUTn}
N 1640 260 1640 320 {lab=OUTn}
N 1640 200 1710 200 {lab=OUTn}
N 1790 320 1860 320 {lab=OUTp}
N 1860 260 1860 320 {lab=OUTp}
N 1790 200 1860 200 {lab=OUTp}
N 1860 260 1880 260 {lab=OUTp}
N 1860 200 1860 260 {lab=OUTp}
N 1620 260 1640 260 {lab=OUTn}
N 1640 200 1640 260 {lab=OUTn}
N 1750 120 1750 170 {lab=VCTRL}
N 1750 350 1750 400 {lab=VCTRL}
N 2260 260 2260 370 {lab=#net3}
N 2080 260 2080 370 {lab=#net2}
N 2080 370 2120 370 {lab=#net2}
N 2210 370 2260 370 {lab=#net3}
N 2080 220 2130 220 {lab=#net2}
N 2190 220 2260 220 {lab=#net3}
N 1870 690 1870 710 {lab=Vgs}
N 1870 610 1870 630 {lab=Ibias}
C {opin.sym} 2320 390 0 0 {name=p11 lab=OUTp
}
C {opin.sym} 2020 390 0 1 {name=p12 lab=OUTn


}
C {sg13g2_pr/sg13_lv_nmos.sym} 2150 760 0 0 {name=M6
l=0.5u
w=70.29u
ng=20
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 2300 40 0 0 {name=M4
l=0.13u
w=34.52u
ng=10
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 2040 40 0 1 {name=M3
l=0.13u
w=34.52u
ng=10
m=1
model=sg13_lv_pmos
spiceprefix=X5}
C {sg13g2_pr/sg13_lv_nmos.sym} 2300 500 0 0 {name=M2
l=0.13u
w=25.11u
ng=8
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 2040 500 0 1 {name=M1
l=0.13u
w=25.11u
ng=8
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {ammeter.sym} 2320 190 0 0 {name=Vpmos_p savecurrent=true spice_ignore=0}
C {ammeter.sym} 2320 330 0 0 {name=Vnmos_p savecurrent=true spice_ignore=0}
C {ammeter.sym} 2170 660 0 0 {name=Vtail savecurrent=true spice_ignore=0}
C {lab_pin.sym} 2170 570 1 0 {name=p2 sig_type=std_logic lab=Vx
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1890 760 0 1 {name=M5
l=0.5u
w=17.95u
ng=6
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {ammeter.sym} 2020 190 0 1 {name=Vpmos_n savecurrent=true spice_ignore=0}
C {ammeter.sym} 2020 330 0 1 {name=Vnmos_n savecurrent=true spice_ignore=0}
C {lab_pin.sym} 2020 710 2 0 {name=p1 sig_type=std_logic lab=Vgs
}
C {ihp_4nh_inductor.sym} 2160 360 2 1 {name=x1}
C {sg13g2_pr/cap_rfcmim.sym} 2160 220 3 0 {name=C1 
model=cap_rfcmim
lvs_model=rfcmim
w=22.15e-6
l=22.15e-6
wfeed=10.0e-6
spiceprefix=X}
C {gnd.sym} 2160 300 0 0 {name=l11 lab=GND}
C {sg13g2_pr/sg13_svaricap.sym} 1750 320 2 0 {name=C3 
model=sg13_hv_svaricap 
w=9.74u 
l=0.8u 
Nx=7
spiceprefix=X
}
C {sg13g2_pr/sg13_svaricap.sym} 1750 200 0 1 {name=C2 
model=sg13_hv_svaricap 
w=9.74u 
l=0.8u 
Nx=7
spiceprefix=X
}
C {gnd.sym} 1800 260 3 0 {name=l10 lab=GND}
C {lab_pin.sym} 1880 260 2 0 {name=p6 sig_type=std_logic lab=OUTp
}
C {lab_pin.sym} 1620 260 2 1 {name=p7 sig_type=std_logic lab=OUTn
}
C {lab_pin.sym} 1750 400 3 0 {name=p5 sig_type=std_logic lab=VCTRL
}
C {iopin.sym} 1750 120 3 0 {name=p8 lab=VCTRL}
C {iopin.sym} 1870 610 3 0 {name=p3 lab=Ibias}
C {lab_pin.sym} 1960 560 3 0 {name=p4 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 2380 560 3 0 {name=p9 sig_type=std_logic lab=GND
}
C {lab_pin.sym} 1870 850 3 0 {name=p10 sig_type=std_logic lab=GND
}
C {iopin.sym} 2170 850 1 0 {name=p13 lab=GND}
C {iopin.sym} 2170 -50 3 0 {name=p14 lab=VDD}
C {ammeter.sym} 1870 660 0 0 {name=Vbias savecurrent=true spice_ignore=0}

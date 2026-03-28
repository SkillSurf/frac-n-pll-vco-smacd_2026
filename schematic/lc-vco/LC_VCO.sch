v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 1780 40 2100 40 {}
L 4 2100 -20 2100 40 {}
L 4 2930 740 3140 740 {}
L 4 2930 740 2930 800 {}
L 4 1980 440 2200 440 {}
L 4 1980 380 1980 440 {}
L 4 2200 590 2410 590 {}
L 4 2410 530 2410 590 {}
L 4 2930 590 3140 590 {}
L 4 2930 530 2930 590 {}
P 4 5 2200 -20 3140 -20 3140 800 2200 800 2200 -20 {}
P 4 5 2200 380 2200 -20 1780 -20 1780 380 2200 380 {}
P 4 5 1780 380 2200 380 2200 800 1780 800 1780 380 {}
P 4 5 2930 160 2930 530 3140 530 3140 160 2930 160 {}
P 4 5 2410 160 2410 530 2200 530 2200 160 2410 160 {}
T {S-Varicap Based Varactors} 1800 0 0 0 0.4 0.4 {}
T {Type-IV LC VCO} 2950 760 0 0 0.4 0.4 {}
T {Bias Current Gen} 2000 400 0 0 0.4 0.4 {}
T {Load Balancing} 2220 550 0 0 0.4 0.4 {}
T {Output Buffer} 3110 550 0 1 0.4 0.4 {}
N 2820 150 2820 190 {
lab=#net1}
N 2560 120 2600 120 {
lab=#net1}
N 2750 190 2820 190 {
lab=#net1}
N 2520 30 2820 30 {
lab=VDD}
N 2520 330 2580 330 {lab=#net2}
N 2760 330 2820 330 {lab=#net3}
N 2520 70 2520 90 {lab=VDD}
N 2820 70 2820 90 {lab=VDD}
N 2820 120 2880 120 {lab=VDD}
N 2880 70 2880 120 {lab=VDD}
N 2460 120 2520 120 {lab=VDD}
N 2460 70 2460 120 {lab=VDD}
N 2460 70 2520 70 {lab=VDD}
N 2880 580 2880 640 {lab=GND}
N 2820 580 2880 580 {lab=GND}
N 2820 610 2820 650 {
lab=#net4}
N 2460 580 2460 640 {lab=GND}
N 2460 580 2520 580 {lab=GND}
N 2520 610 2520 650 {
lab=#net4}
N 2820 510 2820 560 {
lab=OUTp}
N 2520 510 2520 560 {
lab=OUTn}
N 2520 30 2520 70 {lab=VDD}
N 2820 30 2820 70 {lab=VDD}
N 2740 120 2780 120 {
lab=#net5}
N 2560 580 2600 580 {
lab=OUTp}
N 2740 580 2780 580 {
lab=OUTn}
N 2520 190 2590 190 {
lab=#net5}
N 2520 150 2520 190 {
lab=#net5}
N 2590 190 2740 120 {lab=#net5}
N 2600 120 2750 190 {lab=#net1}
N 2520 510 2590 510 {
lab=OUTn}
N 2750 510 2820 510 {
lab=OUTp}
N 2600 580 2750 510 {lab=OUTp}
N 2590 510 2740 580 {lab=OUTn}
N 2820 70 2880 70 {lab=VDD}
N 2080 730 2140 730 {lab=GND}
N 2140 680 2140 730 {lab=GND}
N 2080 680 2140 680 {lab=GND}
N 2080 710 2080 730 {lab=GND}
N 2820 330 2820 350 {lab=#net3}
N 2820 190 2820 240 {lab=#net1}
N 2820 350 2820 380 {lab=#net3}
N 2820 440 2820 510 {lab=OUTp}
N 2670 650 2820 650 {
lab=#net4}
N 1840 730 1900 730 {lab=GND}
N 1840 680 1840 730 {lab=GND}
N 1840 680 1900 680 {lab=GND}
N 1900 710 1900 730 {lab=GND}
N 1990 680 2040 680 {lab=Vgs}
N 2520 330 2520 350 {lab=#net2}
N 2520 190 2520 240 {lab=#net5}
N 2520 440 2520 510 {lab=OUTn}
N 2520 350 2520 380 {lab=#net2}
N 1990 210 1990 240 {lab=GND}
N 1990 210 2040 210 {lab=GND}
N 1990 180 1990 210 {lab=GND}
N 1880 270 1950 270 {lab=OUTn}
N 1880 210 1880 270 {lab=OUTn}
N 1880 150 1950 150 {lab=OUTn}
N 2030 270 2100 270 {lab=OUTp}
N 2100 210 2100 270 {lab=OUTp}
N 2030 150 2100 150 {lab=OUTp}
N 2100 210 2120 210 {lab=OUTp}
N 2100 150 2100 210 {lab=OUTp}
N 1860 210 1880 210 {lab=OUTn}
N 1880 150 1880 210 {lab=OUTn}
N 1990 90 1990 120 {lab=VCTRL}
N 2710 450 2760 450 {lab=#net3}
N 2580 450 2620 450 {lab=#net2}
N 2670 330 2670 380 {lab=GND}
N 2580 300 2640 300 {lab=#net2}
N 2580 330 2580 450 {lab=#net2}
N 2760 330 2760 450 {lab=#net3}
N 2700 300 2760 300 {lab=#net3}
N 2670 650 2670 680 {lab=#net4}
N 2520 650 2670 650 {
lab=#net4}
N 1990 90 2050 90 {lab=VCTRL}
N 1990 300 1990 330 {lab=VCTRL}
N 1990 330 2050 330 {lab=VCTRL}
N 2080 730 2080 750 {lab=GND}
N 1900 730 1900 750 {lab=GND}
N 2670 740 2670 770 {lab=Vx}
N 2570 770 2670 770 {lab=Vx}
N 1990 610 1990 680 {lab=Vgs}
N 1900 610 1900 650 {lab=Vgs}
N 1900 490 1960 490 {lab=VDD}
N 1960 490 1960 540 {lab=VDD}
N 1900 540 1960 540 {lab=VDD}
N 1900 490 1900 510 {lab=VDD}
N 1900 470 1900 490 {lab=VDD}
N 1940 680 1990 680 {lab=Vgs}
N 1900 610 1990 610 {lab=Vgs}
N 1900 570 1900 610 {lab=Vgs}
N 2080 520 2080 650 {lab=Vx}
N 1740 540 1860 540 {lab=VBGR}
N 3030 350 3030 380 {lab=OUT}
N 3030 320 3030 350 {lab=OUT}
N 2960 410 2990 410 {lab=#net3}
N 2960 290 2990 290 {lab=#net3}
N 3030 460 3030 480 {lab=GND}
N 3030 240 3030 260 {lab=VDD}
N 3030 290 3090 290 {lab=VDD}
N 3090 240 3090 290 {lab=VDD}
N 3030 240 3090 240 {lab=VDD}
N 3030 220 3030 240 {lab=VDD}
N 3030 460 3090 460 {lab=GND}
N 3090 410 3090 460 {lab=GND}
N 3030 410 3090 410 {lab=GND}
N 3030 440 3030 460 {lab=GND}
N 2820 350 2960 350 {lab=#net3}
N 2960 350 2960 410 {lab=#net3}
N 2310 320 2310 380 {lab=#net6}
N 2350 410 2380 410 {lab=#net2}
N 2350 290 2380 290 {lab=#net2}
N 2310 460 2310 480 {lab=GND}
N 2310 240 2310 260 {lab=VDD}
N 2250 290 2310 290 {lab=VDD}
N 2250 240 2250 290 {lab=VDD}
N 2250 240 2310 240 {lab=VDD}
N 2310 220 2310 240 {lab=VDD}
N 2250 460 2310 460 {lab=GND}
N 2250 410 2250 460 {lab=GND}
N 2250 410 2310 410 {lab=GND}
N 2310 440 2310 460 {lab=GND}
N 2380 350 2380 410 {lab=#net2}
N 2380 350 2520 350 {lab=#net2}
N 2380 290 2380 350 {lab=#net2}
N 2960 290 2960 350 {lab=#net3}
N 2760 300 2760 330 {lab=#net3}
N 2820 300 2820 330 {lab=#net3}
N 2520 300 2520 330 {lab=#net2}
N 2580 300 2580 330 {lab=#net2}
N 2980 60 3040 60 {lab=VDD}
N 2980 40 2980 60 {lab=VDD}
N 2980 100 3040 100 {lab=GND}
N 2980 100 2980 120 {lab=GND}
N 3030 350 3180 350 {lab=OUT}
C {sg13g2_pr/sg13_lv_nmos.sym} 2060 680 0 0 {name=M5
l=0.5u
w=70.29u
ng=20
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 2800 120 0 0 {name=M4
l=0.13u
w=34.52u
ng=10
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 2540 120 0 1 {name=M3
l=0.13u
w=34.52u
ng=10
m=1
model=sg13_lv_pmos
spiceprefix=X}
C {sg13g2_pr/sg13_lv_nmos.sym} 2800 580 0 0 {name=M2
l=0.13u
w=25.11u
ng=8
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 2540 580 0 1 {name=M1
l=0.13u
w=25.11u
ng=8
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} 2460 640 0 0 {name=l1 lab=GND}
C {gnd.sym} 2880 640 0 1 {name=l2 lab=GND}
C {gnd.sym} 2080 750 0 0 {name=l3 lab=GND}
C {ammeter.sym} 2820 270 0 0 {name=Vpmos_p savecurrent=true spice_ignore=0}
C {ammeter.sym} 2820 410 0 0 {name=Vnmos_p savecurrent=true spice_ignore=0}
C {ammeter.sym} 2670 710 0 0 {name=Vtail savecurrent=true spice_ignore=0}
C {lab_pin.sym} 2080 520 1 0 {name=p2 sig_type=std_logic lab=Vx
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1920 680 0 1 {name=M6
l=0.5u
w=17.95u
ng=6
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} 1900 750 0 1 {name=l8 lab=GND}
C {ammeter.sym} 2520 270 0 1 {name=Vpmos_n savecurrent=true spice_ignore=0}
C {ammeter.sym} 2520 410 0 1 {name=Vnmos_n savecurrent=true spice_ignore=0}
C {lab_pin.sym} 1990 610 2 0 {name=p1 sig_type=std_logic lab=Vgs
}
C {ihp_4nh_inductor.sym} 2660 440 2 1 {name=x1
}
C {sg13g2_pr/cap_rfcmim.sym} 2670 300 3 0 {name=C1 
model=cap_rfcmim
lvs_model=rfcmim
w=21.77e-6
l=21.77e-6
wfeed=10.0e-6
spiceprefix=X
}
C {gnd.sym} 2670 380 0 0 {name=l11 lab=GND}
C {sg13g2_pr/sg13_svaricap.sym} 1990 270 2 0 {name=C3 
model=sg13_hv_svaricap 
w=9.74u 
l=0.8u 
Nx=7
spiceprefix=X
}
C {sg13g2_pr/sg13_svaricap.sym} 1990 150 0 1 {name=C2 
model=sg13_hv_svaricap 
w=9.74u 
l=0.8u 
Nx=7
spiceprefix=X
}
C {gnd.sym} 2040 210 3 0 {name=l10 lab=GND}
C {lab_pin.sym} 2120 210 2 0 {name=p6 sig_type=std_logic lab=OUTp
}
C {lab_pin.sym} 1860 210 2 1 {name=p7 sig_type=std_logic lab=OUTn
}
C {lab_pin.sym} 2570 770 2 1 {name=p10 sig_type=std_logic lab=Vx
}
C {lab_pin.sym} 2050 330 0 1 {name=p13 sig_type=std_logic lab=VCTRL
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1880 540 0 0 {name=M7
l=0.5u
w=16.72u
ng=6
m=1
model=sg13_lv_pmos
spiceprefix=X}
C {sg13g2_pr/sg13_lv_pmos.sym} 3010 290 0 0 {name=M8
l=0.13u
w=25.10u
ng=15
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 3010 410 0 0 {name=M9
l=0.13u
w=1.64u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} 3030 480 0 0 {name=l14 lab=GND}
C {sg13g2_pr/sg13_lv_pmos.sym} 2330 290 0 1 {name=M10
l=0.13u
w=25.10u
ng=15
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 2330 410 0 1 {name=M11
l=0.13u
w=1.64u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {gnd.sym} 2310 480 0 1 {name=l16 lab=GND}
C {opin.sym} 3180 350 0 0 {name=p5 lab=OUT
}
C {lab_pin.sym} 2520 480 2 1 {name=p8 sig_type=std_logic lab=OUTn
}
C {lab_pin.sym} 2820 480 2 0 {name=p9 sig_type=std_logic lab=OUTp
}
C {ipin.sym} 2050 90 2 0 {name=p11 lab=VCTRL}
C {ipin.sym} 1740 540 0 0 {name=p4 lab=VBGR}
C {iopin.sym} 3040 60 0 0 {name=p14 lab=VDD}
C {iopin.sym} 3040 100 0 0 {name=p3 lab=GND}
C {gnd.sym} 2980 120 0 0 {name=l5 lab=GND}
C {vdd.sym} 1900 480 0 0 {name=l6 lab=VDD}
C {vdd.sym} 2310 220 0 0 {name=l9 lab=VDD}
C {vdd.sym} 2680 30 0 0 {name=l7 lab=VDD}
C {vdd.sym} 2980 40 0 0 {name=l4 lab=VDD}
C {vdd.sym} 3030 220 0 0 {name=l12 lab=VDD}

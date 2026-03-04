v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 320 -960 1010 -960 {}
L 4 1010 -960 1010 -230 {}
L 4 320 -230 1010 -230 {}
L 4 320 -960 320 -230 {}
L 4 1050 -960 1050 -230 {}
L 4 1050 -230 1700 -230 {}
L 4 1700 -960 1700 -230 {}
L 4 1050 -960 1700 -960 {}
L 4 1730 -960 1730 -230 {}
L 4 1730 -230 2050 -230 {}
L 4 2050 -960 2050 -230 {}
L 4 1730 -960 2050 -960 {}
T {Bias Generator} 340 -950 0 0 0.4 0.4 {}
T {Charge Pump} 1070 -950 0 0 0.4 0.4 {}
T {Unity Gain} 1740 -950 0 0 0.4 0.4 {}
N 740 -330 740 -290 {lab=GND}
N 740 -470 740 -390 {lab=net2}
N 710 -360 740 -360 {lab=GND}
N 700 -500 740 -500 {lab=GND}
N 740 -560 740 -530 {lab=Vbn}
N 740 -740 740 -700 {lab=net1}
N 740 -860 740 -800 {lab=VDD}
N 790 -500 810 -500 {lab=Vbn}
N 790 -560 790 -500 {lab=Vbn}
N 780 -500 790 -500 {lab=Vbn}
N 740 -560 790 -560 {lab=Vbn}
N 430 -860 430 -800 {lab=VDD}
N 430 -610 430 -560 {lab=Vbp}
N 1130 -360 1160 -360 {lab=DN}
N 1200 -330 1200 -290 {lab=GND}
N 1200 -470 1200 -390 {lab=#net3}
N 1200 -360 1230 -360 {lab=GND}
N 1200 -500 1240 -500 {lab=GND}
N 1200 -740 1200 -700 {lab=#net4}
N 1200 -860 1200 -800 {lab=VDD}
N 1130 -500 1160 -500 {lab=Vbn}
N 1120 -670 1160 -670 {lab=Vbp}
N 1130 -770 1160 -770 {lab=UP}
N 1580 -590 1790 -590 {lab=CTRL}
N 1200 -590 1200 -530 {lab=#net5}
N 470 -770 510 -770 {lab=GND}
N 390 -770 430 -770 {lab=VDD}
N 390 -670 430 -670 {lab=VDD}
N 1200 -770 1240 -770 {lab=VDD}
N 1200 -670 1240 -670 {lab=VDD}
N 690 -770 740 -770 {lab=VDD}
N 690 -670 740 -670 {lab=VDD}
N 780 -770 820 -770 {lab=GND}
N 430 -740 430 -700 {lab=#net6}
N 490 -670 510 -670 {lab=Vbp}
N 1580 -390 1580 -290 {lab=GND}
N 1580 -590 1580 -450 {lab=CTRL}
N 780 -360 820 -360 {lab=VDD}
N 780 -670 820 -670 {lab=Vbp}
N 490 -670 490 -610 {lab=Vbp}
N 470 -670 490 -670 {lab=Vbp}
N 430 -610 490 -610 {lab=Vbp}
N 430 -640 430 -610 {lab=Vbp}
N 740 -640 740 -560 {lab=Vbn}
N 430 -500 430 -450 {lab=Ibias}
N 1550 -590 1580 -590 {lab=CTRL}
N 1430 -590 1490 -590 {lab=#net5}
N 1200 -640 1200 -590 {lab=#net5}
N 1330 -390 1330 -290 {lab=GND}
N 1330 -590 1330 -450 {lab=#net5}
N 1200 -590 1330 -590 {lab=#net5}
N 1430 -590 1430 -560 {lab=#net5}
N 1330 -590 1430 -590 {lab=#net5}
N 1430 -500 1430 -450 {lab=#net7}
N 1430 -390 1430 -290 {lab=GND}
C {opin.sym} 180 -210 0 0 {name=p4 lab=CTRL}
C {ipin.sym} 110 -220 0 0 {name=p12 lab=UP}
C {ipin.sym} 110 -250 0 0 {name=p1 lab=VDD}
C {ipin.sym} 110 -160 0 0 {name=p5 lab=Ibias}
C {ipin.sym} 110 -190 0 0 {name=p20 lab=DN}
C {title.sym} 160 -30 0 0 {name=l1 author="Rajinthan R"}
C {lab_pin.sym} 810 -500 0 1 {name=p14 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 710 -360 0 0 {name=p2 sig_type=std_logic lab=GND}
C {lab_pin.sym} 700 -500 0 0 {name=p8 sig_type=std_logic lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 760 -500 0 1 {name=M2
l=\{CP_N_L\}
w=\{CP_N_W\}
ng=1
m=\{CP_N_M\}
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 760 -360 0 1 {name=M1
l=\{CP_N_L\}
w=\{CP_N_W\}
ng=1
m=\{CP_N_M\}
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 760 -670 0 1 {name=M3
l=\{CP_P_L\}
w=\{CP_P_W\}
ng=1
m=\{CP_P_M\}
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 760 -770 0 1 {name=M4
l=\{CP_P_L\}
w=\{CP_P_W\}
ng=1
m=\{CP_P_M\}
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 430 -450 0 1 {name=p18 sig_type=std_logic lab=Ibias}
C {sg13g2_pr/sg13_lv_pmos.sym} 450 -670 0 1 {name=M7
l=\{CP_P_L\}
w=\{CP_P_W\}
ng=1
m=\{CP_P_M\}
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 450 -770 0 1 {name=M8
l=\{CP_P_L\}
w=\{CP_P_W\}
ng=1
m=\{CP_P_M\}
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 510 -670 0 1 {name=p19 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} 1130 -500 0 0 {name=p11 sig_type=std_logic lab=Vbn}
C {lab_pin.sym} 1230 -360 0 1 {name=p13 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1130 -360 0 0 {name=p17 sig_type=std_logic lab=DN}
C {lab_pin.sym} 1240 -500 0 1 {name=p21 sig_type=std_logic lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1180 -500 0 0 {name=M5
l=\{CP_N_L\}
w=\{CP_N_W\}
ng=1
m=\{CP_N_M\}
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 1180 -360 0 0 {name=M6
l=\{CP_N_L\}
w=\{CP_N_W\}
ng=1
m=\{CP_N_M\}
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1180 -670 0 0 {name=M9
l=\{CP_P_L\}
w=\{CP_P_W\}
ng=1
m=\{CP_P_M\}
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1180 -770 0 0 {name=M10
l=\{CP_P_L\}
w=\{CP_P_W\}
ng=1
m=\{CP_P_M\}
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 1120 -670 0 0 {name=p23 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} 1790 -590 0 1 {name=p25 sig_type=std_logic lab=CTRL}
C {lab_pin.sym} 510 -770 0 1 {name=p26 sig_type=std_logic lab=GND}
C {lab_pin.sym} 390 -770 0 0 {name=p27 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 390 -670 0 0 {name=p28 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 700 -770 0 0 {name=p29 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 700 -670 0 0 {name=p30 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1240 -770 0 1 {name=p31 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1240 -670 0 1 {name=p32 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 820 -770 0 1 {name=p33 sig_type=std_logic lab=GND}
C {ipin.sym} 110 -130 0 0 {name=p3 lab=GND}
C {sg13g2_pr/cap_cpara.sym} 1580 -420 0 0 {name=C1 model=cparasitic C='C_CP'  spiceprefix=X}
C {lab_pin.sym} 820 -360 0 1 {name=p7 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 820 -670 0 1 {name=p10 sig_type=std_logic lab=Vbp}
C {lab_pin.sym} 1130 -770 0 0 {name=p24 sig_type=std_logic lab=UP}
C {lab_pin.sym} 740 -720 0 1 {name=p35 sig_type=std_logic lab=net1}
C {lab_pin.sym} 740 -440 0 1 {name=p36 sig_type=std_logic lab=net2}
C {sg13g2_pr/annotate_fet_params.sym} 890 -940 0 0 {name=annot1 ref=M3}
C {sg13g2_pr/annotate_fet_params.sym} 900 -380 0 0 {name=annot2 ref=M2}
C {sg13g2_pr/rsil.sym} 430 -530 0 0 {name=R1
w=0.5e-6
l=0.5e-6
model=rsil
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/annotate_fet_params.sym} 1590 -942.105189945283 0 0 {name=annot3 ref=M9}
C {sg13g2_pr/annotate_fet_params.sym} 1662.208120310291 -392.105189945283 0 0 {name=annot4 ref=M6}
C {sg13g2_pr/rsil.sym} 1520 -590 1 0 {name=R3
w=0.5e-6
l=1e-5
model=rsil
body=sub!
spiceprefix=X
b=0
m=1
}
C {gnd.sym} 1580 -290 0 0 {name=l2 lab=GND}
C {gnd.sym} 1200 -290 0 0 {name=l3 lab=GND}
C {gnd.sym} 740 -290 0 0 {name=l5 lab=GND}
C {devices/vdd.sym} 430 -860 0 0 {name=l12 lab=VDD}
C {devices/vdd.sym} 740 -860 0 0 {name=l6 lab=VDD}
C {devices/vdd.sym} 1200 -860 0 0 {name=l7 lab=VDD}
C {sg13g2_pr/cap_cpara.sym} 1430 -420 0 0 {name=C2 model=cparasitic C='C_CP'  spiceprefix=X}
C {sg13g2_pr/rsil.sym} 1430 -530 2 0 {name=R2
w=0.5e-6
l=1e-5
model=rsil
body=sub!
spiceprefix=X
b=0
m=1
}
C {gnd.sym} 1430 -290 0 0 {name=l4 lab=GND}
C {sg13g2_pr/cap_cpara.sym} 1330 -420 0 0 {name=C3 model=cparasitic C='C_CP'  spiceprefix=X}
C {gnd.sym} 1330 -290 0 0 {name=l8 lab=GND}

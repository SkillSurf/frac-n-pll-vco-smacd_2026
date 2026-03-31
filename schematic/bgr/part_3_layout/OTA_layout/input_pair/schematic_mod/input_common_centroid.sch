v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 610 -485 610 -385 {
lab=dn3}
N 610 -565 610 -545 {
lab=dn2}
N 820 -565 820 -545 {
lab=dn2}
N 720 -565 820 -565 {
lab=dn2}
N 540 -515 570 -515 {
lab=v-}
N 860 -515 890 -515 {
lab=v+}
N 720 -585 720 -565 {
lab=dn2}
N 610 -565 720 -565 {
lab=dn2}
N 820 -485 820 -390 {
lab=dn4}
N 250 -335 250 -305 {
lab=vdd}
N 290 -275 290 -255 {
lab=dn4}
N 55 -335 55 -305 {
lab=vdd}
N 95 -275 95 -255 {
lab=dn3}
N 250 -335 290 -335 {
lab=vdd}
N 55 -335 95 -335 {
lab=vdd}
N 250 -445 250 -415 {
lab=vdd}
N 290 -385 290 -365 {
lab=dn2}
N 55 -445 55 -415 {
lab=vdd}
N 95 -385 95 -365 {
lab=dn2}
N 250 -445 290 -445 {
lab=vdd}
N 55 -445 95 -445 {
lab=vdd}
N 650 -215 650 -175 {
lab=vdd}
N 95 -305 200 -305 {
lab=bulk}
N 95 -415 200 -415 {
lab=bulk}
N 610 -515 820 -515 {
lab=bulk}
N 290 -415 395 -415 {
lab=bulk}
N 290 -305 395 -305 {
lab=bulk}
N 650 -295 650 -270 {
lab=bulk}
C {sg13g2_pr/sg13_lv_pmos.sym} 590 -515 0 0 {name=M1
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 840 -515 0 1 {name=M2
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 540 -515 0 1 {name=p10 lab=v-}
C {iopin.sym} 890 -515 0 0 {name=p11 lab=v+}
C {iopin.sym} 735 -285 2 1 {name=p1 lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 270 -305 0 0 {name=M8
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 250 -335 0 0 {name=p15 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 75 -305 0 0 {name=M10
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 55 -335 0 0 {name=p17 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 720 -575 0 1 {name=p40 sig_type=std_logic lab=dn2}
C {lab_pin.sym} 95 -255 0 0 {name=p43 sig_type=std_logic lab=dn3}
C {lab_pin.sym} 290 -255 0 0 {name=p18 sig_type=std_logic lab=dn4}
C {sg13g2_pr/sg13_lv_pmos.sym} 270 -415 0 0 {name=M15
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 250 -445 0 0 {name=p49 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 75 -415 0 0 {name=M16
l=3.7u
w=3.64u
ng=1
m=2
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 55 -445 0 0 {name=p50 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 95 -365 0 0 {name=p53 sig_type=std_logic lab=dn2}
C {lab_pin.sym} 290 -365 0 0 {name=p54 sig_type=std_logic lab=dn2}
C {sg13g2_pr/ntap1.sym} 650 -240 2 0 {name=R1
model=ntap1
spiceprefix=X
w=13e-6
l=34e-6
}
C {iopin.sym} 610 -385 2 1 {name=p3 lab=dn3}
C {iopin.sym} 820 -395 2 1 {name=p4 lab=dn4}
C {lab_pin.sym} 650 -175 0 0 {name=p13 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 395 -415 0 1 {name=p2 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 200 -415 0 1 {name=p5 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 200 -305 0 1 {name=p6 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 395 -305 0 1 {name=p7 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 650 -295 0 1 {name=p8 sig_type=std_logic lab=bulk}
C {lab_pin.sym} 720 -515 1 1 {name=p9 sig_type=std_logic lab=bulk}

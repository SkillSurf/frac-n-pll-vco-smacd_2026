v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
P 4 2 1525 -150 1525 -150 {}
N 655 -315 655 -275 {
lab=dn3}
N 655 -315 765 -315 {
lab=dn3}
N 765 -245 825 -245 {
lab=dn3}
N 765 -315 765 -245 {
lab=dn3}
N 695 -245 765 -245 {
lab=dn3}
N 655 -375 655 -315 {
lab=dn3}
N 595 -530 725 -530 {
lab=iout}
N 765 -500 765 -455 {
lab=dn2}
N 865 -375 865 -275 {
lab=dn4}
N 655 -185 865 -185 {
lab=vss}
N 265 -295 265 -260 {
lab=vss}
N 265 -380 265 -355 {
lab=sub!}
N 865 -245 955 -245 {
lab=sub!}
N 655 -215 655 -185 {
lab=vss}
N 560 -245 655 -245 {
lab=sub!}
N 865 -215 865 -185 {
lab=vss}
N 425 -290 425 -255 {
lab=vdd}
N 425 -375 425 -350 {
lab=bulk1}
N 765 -580 765 -560 {
lab=vdd}
N 765 -530 845 -530 {
lab=bulk1}
C {sg13g2_pr/sg13_lv_pmos.sym} 745 -530 0 0 {name=M7
l=1.95u
w=5.3u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 765 -185 1 1 {name=p16 lab=vss}
C {iopin.sym} 765 -580 1 1 {name=p19 lab=vdd}
C {lab_pin.sym} 955 -245 0 1 {name=p1 sig_type=std_logic lab=sub!}
C {sg13g2_pr/ptap1.sym} 265 -325 2 0 {name=R2
model=ptap1
spiceprefix=X
w=10e-6
l=1.0e-6
}
C {lab_pin.sym} 265 -260 0 0 {name=p4 sig_type=std_logic lab=vss}
C {lab_pin.sym} 265 -380 0 1 {name=p9 sig_type=std_logic lab=sub!}
C {iopin.sym} 865 -375 2 1 {name=p2 lab=dn4}
C {iopin.sym} 655 -375 2 1 {name=p5 lab=dn3}
C {iopin.sym} 765 -455 2 1 {name=p6 lab=dn2}
C {iopin.sym} 595 -530 2 0 {name=p7 lab=iout}
C {lab_pin.sym} 425 -255 0 0 {name=p8 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 425 -375 0 1 {name=p10 sig_type=std_logic lab=bulk1}
C {sg13g2_pr/ntap1.sym} 425 -320 2 0 {name=R3
model=ntap1
spiceprefix=X
w=0.78e-6
l=0.78e-6
}
C {lab_pin.sym} 845 -530 0 1 {name=p11 sig_type=std_logic lab=bulk1}
C {sg13g2_pr/sg13_lv_nmos.sym} 675 -245 2 0 {name=M1
l=9.75u
w=720n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 845 -245 2 1 {name=M2
l=9.75u
w=720n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {lab_pin.sym} 565 -245 0 0 {name=p12 sig_type=std_logic lab=sub!}

v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 660 -305 860 -305 {
lab=vss}
N 570 -575 570 -555 {
lab=iout}
N 570 -575 620 -575 {
lab=iout}
N 620 -625 640 -625 {
lab=iout}
N 570 -595 570 -575 {
lab=iout}
N 620 -625 620 -575 {
lab=iout}
N 610 -625 620 -625 {
lab=iout}
N 800 -625 820 -625 {
lab=iout}
N 860 -525 900 -525 {
lab=vout}
N 860 -595 860 -525 {
lab=vout}
N 760 -400 820 -400 {
lab=dn4}
N 760 -460 760 -400 {
lab=dn4}
N 660 -400 760 -400 {
lab=dn4}
N 860 -460 860 -430 {
lab=vout}
N 820 -460 860 -460 {
lab=vout}
N 860 -525 860 -460 {
lab=vout}
N 860 -375 860 -305 {
lab=vss}
N 1265 -385 1265 -355 {
lab=sub!}
N 1265 -295 1265 -255 {
lab=vss}
N 860 -400 940 -400 {
lab=sub!}
N 860 -675 860 -655 {
lab=vdd}
N 570 -675 570 -655 {
lab=vdd}
N 505 -625 570 -625 {
lab=bulk4}
N 860 -625 930 -625 {
lab=bulk4}
N 1455 -385 1455 -355 {
lab=bulk4}
N 1455 -295 1455 -255 {
lab=vdd}
N 570 -675 860 -675 {
lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} 840 -625 0 0 {name=M7
l=2.08u
w=75u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 840 -400 2 1 {name=M6
l=9.75u
w=28.8u
ng=4
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 855 -675 1 1 {name=p1 lab=vdd}
C {iopin.sym} 570 -555 0 1 {name=p3 lab=iout}
C {iopin.sym} 900 -525 0 0 {name=p8 lab=vout}
C {lab_pin.sym} 640 -625 0 1 {name=p7 sig_type=std_logic lab=iout}
C {lab_pin.sym} 800 -625 0 0 {name=p6 sig_type=std_logic lab=iout}
C {sg13g2_pr/sg13_lv_pmos.sym} 590 -625 0 1 {name=M9
l=2.08u
w=75u
ng=8
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/cap_cmim.sym} 790 -460 3 0 {name=C2
model=cap_cmim
w=22.295e-6
l=22.295e-6
m=1
spiceprefix=X}
C {lab_pin.sym} 1265 -385 0 0 {name=p23 sig_type=std_logic lab=sub!
}
C {lab_pin.sym} 1265 -255 2 0 {name=p24 sig_type=std_logic lab=vss}
C {lab_pin.sym} 940 -400 0 1 {name=p27 sig_type=std_logic lab=sub!}
C {sg13g2_pr/ptap1.sym} 1265 -325 2 0 {name=R2
model=ptap1
spiceprefix=X
R=262.847.0
Imax=0.3e-6
}
C {lab_pin.sym} 505 -625 0 0 {name=p36 sig_type=std_logic lab=bulk4}
C {lab_pin.sym} 930 -625 2 0 {name=p37 sig_type=std_logic lab=bulk4}
C {lab_pin.sym} 1455 -385 0 0 {name=p38 sig_type=std_logic lab=bulk4}
C {lab_pin.sym} 1455 -255 0 0 {name=p39 sig_type=std_logic lab=vdd}
C {sg13g2_pr/ntap1.sym} 1455 -325 2 0 {name=R5
model=ntap1
spiceprefix=X
R=262.847.0
Imax=0.3e-6
}
C {iopin.sym} 660 -305 0 1 {name=p2 lab=vss}
C {iopin.sym} 675 -400 1 1 {name=p4 lab=dn4}

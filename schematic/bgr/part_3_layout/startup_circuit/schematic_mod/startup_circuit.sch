v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 485 -725 485 -670 {
lab=#net1}
N 630 -855 720 -855 {
lab=vdd}
N 560 -805 590 -805 {
lab=#net1}
N 485 -725 560 -725 {
lab=#net1}
N 485 -775 485 -725 {
lab=#net1}
N 560 -805 560 -725 {
lab=#net1}
N 525 -805 560 -805 {
lab=#net1}
N 630 -725 630 -670 {
lab=#net2}
N 485 -585 630 -585 {
lab=vss}
N 630 -610 630 -585 {
lab=vss}
N 525 -640 720 -640 {
lab=v-}
N 630 -725 680 -725 {
lab=#net2}
N 630 -775 630 -725 {
lab=#net2}
N 720 -640 720 -525 {
lab=v-}
N 720 -695 720 -640 {
lab=v-}
N 720 -525 795 -525 {
lab=v-}
N 425 -805 485 -805 {
lab=bulk6}
N 630 -805 675 -805 {
lab=bulk6}
N 630 -855 630 -835 {
lab=vdd}
N 485 -855 630 -855 {
lab=vdd}
N 485 -855 485 -835 {
lab=vdd}
N 575 -670 630 -670 {
lab=#net2}
N 575 -610 630 -610 {
lab=vss}
N 485 -610 485 -585 {
lab=vss}
N 420 -640 485 -640 {
lab=sub!}
N 720 -855 720 -755 {
lab=vdd}
N 720 -725 785 -725 {
lab=bulk5}
N 915 -570 915 -535 {
lab=vss}
N 915 -655 915 -630 {
lab=sub!}
N 915 -495 915 -465 {
lab=bulk6}
N 915 -405 915 -365 {
lab=vdd}
N 995 -495 995 -465 {
lab=bulk6}
N 995 -405 995 -365 {
lab=vdd}
C {sg13g2_pr/sg13_lv_nmos.sym} 505 -640 2 0 {name=M8
l=10u
w=150n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 505 -805 0 1 {name=M6
l=1u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 610 -805 0 0 {name=M7
l=1u
w=1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 700 -725 0 0 {name=M9
l=4u
w=200n
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 720 -855 0 1 {name=p5 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 675 -805 0 1 {name=p4 sig_type=std_logic lab=bulk6}
C {lab_pin.sym} 425 -805 0 0 {name=p17 sig_type=std_logic lab=bulk6}
C {sg13g2_pr/cap_cmim.sym} 575 -640 0 0 {name=C1
model=cap_cmim
w=18.195e-6
l=18.195e-6
m=1
spiceprefix=X}
C {lab_pin.sym} 795 -525 3 0 {name=p1 sig_type=std_logic lab=v-}
C {lab_pin.sym} 505 -585 3 0 {name=p62 sig_type=std_logic lab=vss}
C {lab_pin.sym} 420 -640 0 0 {name=p63 sig_type=std_logic lab=sub!}
C {lab_pin.sym} 785 -725 0 1 {name=p64 sig_type=std_logic lab=bulk5}
C {sg13g2_pr/ptap1.sym} 915 -600 0 0 {name=R5
model=ptap1
spiceprefix=X
w=10e-6
l=1.0e-6
}
C {lab_pin.sym} 915 -535 0 0 {name=p33 sig_type=std_logic lab=vss}
C {lab_pin.sym} 915 -655 0 1 {name=p34 sig_type=std_logic lab=sub!}
C {lab_pin.sym} 915 -495 0 1 {name=p7 sig_type=std_logic lab=bulk6}
C {lab_pin.sym} 915 -365 0 0 {name=p16 sig_type=std_logic lab=vdd}
C {sg13g2_pr/ntap1.sym} 915 -435 0 0 {name=R9
model=ntap1
spiceprefix=X
R=8.463
Imax=0.3e-6
}
C {lab_pin.sym} 995 -495 0 1 {name=p2 sig_type=std_logic lab=bulk5}
C {lab_pin.sym} 995 -365 0 0 {name=p3 sig_type=std_logic lab=bulk5}
C {sg13g2_pr/ntap1.sym} 995 -435 0 0 {name=R1
model=ntap1
spiceprefix=X
R=8.463
Imax=0.3e-6
lab=bulk5}

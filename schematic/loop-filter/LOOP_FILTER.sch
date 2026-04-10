v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 180 200 180 240 {lab=GND}
N -80 0 -80 40 {lab=IN}
N -80 100 -80 140 {lab=#net1}
N -80 200 -80 240 {lab=GND}
N 180 0 180 70 {lab=OUT}
N -80 -0 20 -0 {lab=IN}
N 80 0 180 0 {lab=OUT}
N 180 -0 300 -0 {lab=OUT}
N -260 -0 -80 0 {lab=IN}
N 180 200 220 200 {lab=GND}
N 180 130 180 200 {lab=GND}
C {opin.sym} 300 0 0 0 {name=p4 lab=OUT}
C {gnd.sym} -80 240 0 0 {name=l4 lab=GND}
C {sg13g2_pr/cap_cmim.sym} 180 100 0 1 {name=C2
model=cap_cmim
w=18.63e-6
l=18.63e-6
m=4
spiceprefix=X}
C {sg13g2_pr/cap_cmim.sym} -80 170 0 0 {name=C1
model=cap_cmim
w=48.34e-6
l=48.34e-6
m=16
spiceprefix=X}
C {iopin.sym} 220 200 2 1 {name=p3 lab=GND}
C {ipin.sym} -260 0 0 0 {name=p1 lab=IN}
C {sg13g2_pr/rppd.sym} 50 0 1 1 {name=R2
w=2e-6
l=407.22e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {sg13g2_pr/rppd.sym} -80 70 2 0 {name=R1
w=2e-6
l=407.22e-6
model=rppd
body=sub!
spiceprefix=X
b=0
m=1
}
C {gnd.sym} 180 240 0 0 {name=l1 lab=GND}

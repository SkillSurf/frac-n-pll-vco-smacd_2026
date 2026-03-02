v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 2100 -730 2900 -330 {flags=graph
y1=-0.64649061
y2=1.4429022
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=5e-13
x2=5e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
color="5 4"
node="Out;outp
F_DIV"
hilight_wave=-1}
B 2 500 -1520 1300 -1120 {flags=graph
y1=-0.38082238
y2=1.8658542
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=5e-13
x2=5e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color="7 8"
node="f_ref
f_vco
"
hilight_wave=-1}
B 2 2100 -1120 2900 -720 {flags=graph
y1=1.0513866
y2=1.2807101
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=5e-13
x2=5e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color="11 7"
node="vdd
outp"}
B 2 1300 -1520 2100 -1120 {flags=graph
y1=-212.99966
y2=30.440979
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=5e-13
x2=5e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
sim_type=sp
color="5 4"
node="Out;outp db20()
F_DIV;f_div db20()"
hilight_wave=-1}
B 2 2100 -1520 2900 -1120 {flags=graph
y1=0.00046
y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=5e-13
x2=5e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color="9 10 12"
node="UP;VDD up -
dn
CTRL"
hilight_wave=-1
hcursor1_y=0.68567067
hcursor2_y=0.47137288}
P 4 1 2810 -1370 {}
P 4 1 1130 -970 {}
N 580 -600 580 -540 {lab=VDD}
N 580 -480 580 -440 {lab=GND}
N 1200 -890 1280 -890 {lab=IbiasVCO}
N 1530 -940 1580 -940 {lab=OUTn}
N 1280 -940 1320 -940 {lab=IbiasVCO}
N 1420 -1060 1420 -1040 {lab=VDD}
N 860 -970 940 -970 {lab=UP}
N 850 -930 860 -930 {lab=DN}
N 860 -950 860 -930 {lab=DN}
N 860 -950 940 -950 {lab=DN}
N 1210 -960 1320 -960 {lab=CTRL}
N 1210 -1000 1210 -960 {lab=CTRL}
N 1110 -960 1210 -960 {lab=CTRL}
N 860 -1020 860 -970 {lab=UP}
N 820 -970 860 -970 {lab=UP}
N 850 -930 850 -870 {lab=DN}
N 820 -930 850 -930 {lab=DN}
N 670 -1060 670 -1010 {lab=VDD}
N 1010 -1060 1010 -1020 {lab=VDD}
N 500 -960 640 -960 {lab=F_REF}
N 920 -930 920 -870 {lab=Ibias}
N 920 -930 940 -930 {lab=Ibias}
N 1280 -940 1280 -890 {lab=IbiasVCO}
N 670 -890 670 -850 {lab=GND}
N 1010 -900 1010 -860 {lab=GND}
N 1420 -860 1420 -810 {lab=GND}
N 1660 -1020 1660 -960 {lab=OUTp}
N 1610 -960 1660 -960 {lab=OUTp}
N 1660 -960 1660 -700 {lab=OUTp}
N 1410 -700 1660 -700 {lab=OUTp}
N 1150 -700 1230 -700 {lab=F_DIV}
N 1150 -760 1150 -700 {lab=F_DIV}
N 1040 -700 1150 -700 {lab=F_DIV}
N 600 -700 980 -700 {lab=F_VCO}
N 600 -940 600 -700 {lab=F_VCO}
N 600 -940 640 -940 {lab=F_VCO}
N 500 -730 500 -690 {lab=GND}
N 500 -960 500 -790 {lab=F_REF}
C {vsource.sym} 580 -510 0 0 {name=V1 value=1.2 savecurrent=false}
C {gnd.sym} 580 -440 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 580 -600 0 0 {name=l5 lab=VDD}
C {devices/isource.sym} 1170 -890 3 0 {name=I0 value=50u}
C {devices/vdd.sym} 1140 -890 3 0 {name=l12 lab=VDD}
C {vsource.sym} 500 -760 0 1 {name=Vfref value="0 pulse(0 1.2 0n 0.1n 0.1n 5n 10n)" savecurrent=false}
C {lab_pin.sym} 500 -950 0 1 {name=p11 sig_type=std_logic lab=F_REF}
C {gnd.sym} 500 -690 0 0 {name=l10 lab=GND}
C {launcher.sym} 1880 -800 0 0 {name=h1
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_pll_freq_div.raw tran
"
}
C {launcher.sym} 1880 -760 0 0 {name=h4
descr=SimulateNGSPICE
tclcommand="
xschem netlist; 
xschem simulate; 
xschem raw_read $netlist_dir/tb_COMB.raw tran; 
xschem redraw
"}
C {lab_pin.sym} 920 -870 0 1 {name=p12 sig_type=std_logic lab=Ibias}
C {gnd.sym} 920 -810 0 0 {name=l11 lab=GND}
C {isource.sym} 920 -840 0 0 {name=I1 value=10m}
C {lab_pin.sym} 920 -910 0 0 {name=p13 sig_type=std_logic lab=Ibias}
C {lab_pin.sym} 860 -1020 0 1 {name=p16 lab=UP}
C {lab_pin.sym} 600 -880 0 0 {name=p18 lab=F_VCO}
C {lab_pin.sym} 850 -870 0 1 {name=p19 lab=DN}
C {opin.sym} 1580 -940 0 0 {name=p24 lab=OUTn
}
C {lab_pin.sym} 1660 -1020 0 1 {name=p23 lab=OUTp}
C {lab_pin.sym} 1150 -760 0 1 {name=p29 lab=F_DIV}
C {devices/res.sym} 1010 -700 3 0 {name=R1
value=4
footprint=1206
device=resistor
m=1}
C {sg13g2_stdcells/sg13g2_inv_2.sym} 1570 -960 0 0 {name=x5 VDD=VDD VSS=GND prefix=sg13g2_ }
C {lab_pin.sym} 1210 -1000 0 1 {name=p10 lab=CTRL}
C {vdd.sym} 670 -1060 0 0 {name=l6 lab=VDD}
C {vdd.sym} 1010 -1060 0 0 {name=l2 lab=VDD}
C {vdd.sym} 1420 -1060 0 0 {name=l4 lab=VDD}
C {lab_pin.sym} 1280 -920 0 0 {name=p1 sig_type=std_logic lab=IbiasVCO
}
C {gnd.sym} 670 -850 0 0 {name=l3 lab=GND}
C {gnd.sym} 1010 -860 0 0 {name=l7 lab=GND}
C {gnd.sym} 1420 -810 0 0 {name=l8 lab=GND}
C {simulator_commands_shown.sym} 720 -590 0 0 {
name=Libs_Ngspice1
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ_stat
.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
.global VDD GND


.param CP_N_L = 0.5u
.param CP_N_W = 60u
.param CP_P_M = 1
.param CP_P_L = 0.5u
.param CP_P_W = 200u
.param CP_N_M = 1
.param C_CP = 700p
"}
C {FD/Freq_Div_std.sym} 1330 -700 0 1 {name=x4}
C {simulator_commands.sym} 1670 -550 0 0 {name=SimulatorNGSPICE
simulator=ngspice
only_toplevel=false 
value="
.model freq_div freq_div
.include ./IHP_4nH_Inductor.spice
.option temp = 27
.param VDD = 1.2
.ic v(OUTp)=0.6

.control
.options maxstep=100P reltol=1e-3 abstol=1e-6
pre_osdi ./freq_div.osdi
save v(CTRL) v(OUTp) v(F_REF) v(F_DIV) v(UP) v(DN) v(F_VCO) 

tran 50p 5u uic
write tb_pll_freq_div.raw
*quit 0
.endc
"}
C {lc-vco/LC_VCO.sym} 1420 -950 0 0 {name=x3}
C {charge-pump/CP.sym} 1010 -960 0 0 {name=x1}
C {phase-freq-detector/PFD_std.sym} 670 -950 0 0 {name=x2}

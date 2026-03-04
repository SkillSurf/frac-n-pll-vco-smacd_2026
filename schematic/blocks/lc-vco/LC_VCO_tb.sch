v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 850 -1220 1650 -820 {flags=graph
y1=0.094
y2=1.1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=3e-13
x2=1e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/LC_VCO_tb.raw
autoload=1
sim_type=tran
color=5
node=outp}
B 2 50 -1220 850 -820 {flags=graph
y1=4.7e-08
y2=0.61
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=3e+9
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/LC_VCO_tb.raw
autoload=1
sim_type=sp
color=5
node=outp}
N 200 -430 200 -390 {lab=GND}
N 140 -570 140 -490 {lab=VDD}
N 140 -430 140 -390 {lab=GND}
N 200 -570 200 -490 {lab=VCTRL}
N 650 -450 730 -450 {lab=OUTp}
N 650 -430 730 -430 {lab=OUTn}
N 370 -450 440 -450 {lab=VCTRL}
N 540 -350 540 -340 {lab=GND}
N 80 -510 80 -490 {lab=Ibias}
N 370 -430 440 -430 {lab=Ibias}
N 540 -540 540 -530 {lab=VDD}
C {vsource.sym} 140 -460 0 0 {name=V1 value=1.2 savecurrent=false}
C {vsource.sym} 200 -460 0 0 {name=V2 value=1 savecurrent=false}
C {gnd.sym} 140 -390 0 0 {name=l1 lab=GND}
C {gnd.sym} 200 -390 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 140 -570 0 0 {name=l5 lab=VDD}
C {devices/vdd.sym} 200 -570 0 0 {name=l8 lab=VCTRL}
C {launcher.sym} 720 -790 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/LC_VCO_tb.raw"
}
C {devices/isource.sym} 80 -540 0 0 {name=I0 value=50u}
C {devices/vdd.sym} 80 -570 0 0 {name=l12 lab=VDD}
C {devices/vdd.sym} 80 -490 2 0 {name=l3 lab=Ibias}
C {devices/code_shown.sym} 860 -720 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ_stat
"}
C {devices/code_shown.sym} 860 -630 0 0 {name=NGSPICE1 only_toplevel=true 
value="
.include ./IHP_4nH_Inductor.spice
.param temp=27

.control
.ic v(OUTp)=0.6
write LC_VCO_tb.raw
set appendwrite

.options maxstep=10n reltol=1e-3 abstol=1e-6
save v(OUTp) V(CTRL)
tran 30p 100n UIC

* Save transient waveform to raw file
write LC_VCO_tb.raw

* Perform FFT on output
fft v(OUTp)

* Convert FFT magnitude to dB
let vmag = db(mag(v(OUTp)))

write LC_VCO_tb.raw

.endc
"}
C {/foss/designs/iic_osic_tools/frac-n-pll-vco-unic_cass/schematic/blocks/lc-vco/LC_VCO.sym} 540 -440 0 0 {name=x2}
C {title.sym} 160 -30 0 0 {name=l4 author="Skill Surf"}
C {gnd.sym} 540 -340 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 370 -450 0 0 {name=p3 sig_type=std_logic lab=VCTRL}
C {lab_pin.sym} 370 -430 0 0 {name=p7 sig_type=std_logic lab=Ibias}
C {devices/vdd.sym} 540 -540 0 0 {name=l7 lab=VDD}
C {lab_pin.sym} 730 -450 0 1 {name=p1 sig_type=std_logic lab=OUTp}
C {lab_pin.sym} 730 -430 0 1 {name=p2 sig_type=std_logic lab=OUTn}

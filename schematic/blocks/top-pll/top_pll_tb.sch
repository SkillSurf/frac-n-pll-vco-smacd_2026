v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1600 -800 2400 -400 {flags=graph
y1=-0.023
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-2.4999034e-06
x2=2.5000964e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=-1
color=4
node=clk_out}
B 2 0 -1200 800 -800 {flags=graph
y1=-0.38082238
y2=1.8658542
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=2e-13
x2=5e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
autoload=0
sim_type=tran
color="4 4"
node="clk_in
clk_out"}
B 2 800 -1200 1600 -800 {flags=graph
y1=-0.025
y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-2.4999034e-06
x2=2.5000964e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 1600 -1200 2400 -800 {flags=graph
y1=-0.016
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-2.4999034e-06
x2=2.5000964e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
hcursor1_y=0.68567067
hcursor2_y=0.47137288
color="4 7"
node="x1.dn
x1.up"}
B 2 440 -400 1600 -190 {flags=graph
y1=0
y2=3
ypos1=0
ypos2=3
divy=5
subdivy=1
unity=1
x1=-2.4999034e-06
x2=2.5000964e-06

subdivx=4
xlabmag=1.2
ylabmag=1.0

dataset=-1
unitx=1
logx=0
logy=0
digital=1
divx=4
legend=1
color="7 12 11 10 4"
node="rst
sclk
sdata
f_vco
vco_out"}
B 2 1600 -400 2400 0 {flags=graph
y1=-0.023
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-2.4999034e-06
x2=2.5000964e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
hilight_wave=-1
color="5 12"
node="vco_out
f_vco"}
P 4 1 2340 -1060 {}
N 140 -720 140 -620 {lab=VDD}
N 140 -560 140 -510 {lab=GND}
N 620 -550 620 -510 {lab=GND}
N 620 -720 620 -690 {lab=VDD}
N 410 -650 410 -640 {lab=#net1}
N 410 -640 510 -640 {lab=#net1}
N 410 -620 410 -610 {lab=CLK_IN}
N 410 -620 510 -620 {lab=CLK_IN}
N 410 -550 410 -510 {lab=GND}
N 470 -600 470 -580 {lab=#net2}
N 470 -600 510 -600 {lab=#net2}
N 730 -630 760 -630 {lab=CLK_OUT}
N 730 -610 760 -610 {lab=OUTn}
N 410 -720 410 -710 {lab=VDD}
N 470 -520 470 -510 {lab=GND}
C {vsource.sym} 140 -590 0 0 {name=V1 value=1.2 savecurrent=false}
C {gnd.sym} 140 -510 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 140 -720 0 0 {name=l5 lab=VDD}
C {devices/isource.sym} 410 -680 0 0 {name=I0 value=50u}
C {devices/vdd.sym} 410 -720 0 0 {name=l12 lab=VDD}
C {vsource.sym} 410 -580 0 1 {name=Vfref value="0 pulse(0 1.2 0n 0.1n 0.1n 5n 10n)" savecurrent=false}
C {gnd.sym} 410 -510 0 0 {name=l10 lab=GND}
C {launcher.sym} 1360 -660 0 0 {name=h1
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/pll_top.raw tran
"
}
C {launcher.sym} 1360 -620 0 0 {name=h4
descr=SimulateNGSPICE
tclcommand="
xschem netlist; 
xschem simulate; 
xschem raw_read $netlist_dir/tb_COMB.raw tran; 
xschem redraw
"}
C {gnd.sym} 470 -510 0 0 {name=l11 lab=GND}
C {isource.sym} 470 -550 0 0 {name=I1 value=10m}
C {gnd.sym} 620 -510 0 0 {name=l7 lab=GND}
C {vdd.sym} 620 -720 0 0 {name=l3 lab=VDD}
C {simulator_commands.sym} 1110 -660 0 0 {name=SimulatorNGSPICE
vhdl_ignore=1
spice_ignore="tcleval([regexp -nocase \{xyce\} $sim(spice,$sim(spice,default),name)])"
simulator=ngspice
only_toplevel=false 
value="
*****************************************************
* PLL + DSM Frequency Divider Testbench
*****************************************************

.option temp = 27
.param VDD = 1.2

* ==============================
* Include Models
* ==============================

* Inductor / analog models
.include ./IHP_4nH_Inductor.spice

.control
  save x2.up x2.dn x2.vctrl x2.clk_in x2.clk_out x2.dsm_out clk_in clk_out outn
  *save v(sdata) v(sclk) v(rst) v(en) v(UP) v(DN) v(VCTRL) v(CLK_IN) v(DSM_OUT) v(CLK_OUT) 
  * Simulation accuracy options
  .options maxstep=10p reltol=1e-4 abstol=1e-9

 * Run long enough for PLL lock
  tran 20p 1u uic
  remzerovec
  write pll_top.raw 
.endc
* to generate following file copy stimuli.test
* to the simulation directory and run simulation -> Utile Stimuli Editor (GUI), 
* and press 'Translate'
.include stimuli_test.cir
"}
C {simulator_commands.sym} 990 -660 0 0 {
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
.param CP_N_W = 10u
.param CP_P_M = 1
.param CP_P_L = 0.5u
.param CP_P_W = 30u
.param CP_N_M = 1
.param C_CP = 400p
"}
C {/foss/designs/iic_osic_tools/frac-n-pll-vco-unic_cass/schematic/blocks/top-pll/pll.sym} 660 -610 0 0 {name=x2}
C {lab_pin.sym} 760 -630 0 1 {name=p1 sig_type=std_logic lab=CLK_OUT}
C {lab_pin.sym} 760 -610 0 1 {name=p2 sig_type=std_logic lab=OUTn}
C {title.sym} 160 -30 0 0 {name=l2 author="Skill Surf"}
C {lab_pin.sym} 410 -620 0 0 {name=p3 sig_type=std_logic lab=CLK_IN}

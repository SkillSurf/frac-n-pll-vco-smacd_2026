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
x1=4.3397046e-06
x2=5.3397035e-06
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
x1=4.5709007e-06
x2=5.5708996e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color="4 5"
node="f_ref
f_vco"
hilight_wave=-1
autoload=0
sim_type=tran
rawfile=$netlist_dir/tb_pll_freq_div.raw}
B 2 2100 -1120 2900 -720 {flags=graph
y1=1.0513866
y2=1.2807101
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=4.3397046e-06
x2=5.3397035e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
color=11
node="vdd
"}
B 2 1300 -1520 2100 -1120 {flags=graph
y1=-212.99966
y2=30.440979
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-2.6061339e+09
x2=8.1388971e+08
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
F_DIV;F_DIV db20()"
hilight_wave=-1}
B 2 2100 -1520 2900 -1120 {flags=graph
y1=-0.016
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=4.3397046e-06
x2=5.3397035e-06
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
N 1210 -960 1320 -960 {lab=vctrl}
N 1210 -1000 1210 -960 {lab=vctrl}
N 1110 -960 1210 -960 {lab=vctrl}
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
N 1660 -1020 1660 -960 {lab=vco_out}
N 1610 -960 1660 -960 {lab=vco_out}
N 600 -940 600 -700 {lab=F_VCO}
N 600 -940 640 -940 {lab=F_VCO}
N 500 -730 500 -690 {lab=GND}
N 500 -960 500 -790 {lab=F_REF}
N 600 -700 1110 -700 {lab=F_VCO}
N 1480 -740 1660 -740 {lab=vco_out}
N 1660 -960 1660 -740 {lab=vco_out}
N 1480 -720 1530 -720 {lab=rst}
N 1480 -700 1530 -700 {lab=sclk}
N 1480 -680 1530 -680 {lab=sdata}
N 1480 -660 1530 -660 {lab=en}
N 1650 -660 1690 -660 {lab=en}
N 1650 -680 1690 -680 {lab=sdata}
N 1650 -700 1690 -700 {lab=sclk}
N 1650 -720 1690 -720 {lab=rst}
N 1360 -740 1420 -740 {lab=#net1}
N 1360 -720 1420 -720 {lab=#net2}
N 1360 -700 1420 -700 {lab=#net3}
N 1360 -680 1420 -680 {lab=#net4}
N 1360 -660 1420 -660 {lab=#net5}
N 1170 -700 1200 -700 {lab=#net6}
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
tclcommand="xschem raw_read $netlist_dir/pll_dsm_freq_div.raw tran
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
C {lab_pin.sym} 1660 -1020 0 1 {name=p23 lab=vco_out}
C {sg13g2_stdcells/sg13g2_inv_2.sym} 1570 -960 0 0 {name=x5 VDD=VDD VSS=GND prefix=sg13g2_ }
C {lab_pin.sym} 1210 -1000 0 1 {name=p10 lab=vctrl}
C {vdd.sym} 670 -1060 0 0 {name=l6 lab=VDD}
C {vdd.sym} 1010 -1060 0 0 {name=l2 lab=VDD}
C {vdd.sym} 1420 -1060 0 0 {name=l4 lab=VDD}
C {lab_pin.sym} 1280 -920 0 0 {name=p1 sig_type=std_logic lab=IbiasVCO
}
C {gnd.sym} 670 -850 0 0 {name=l3 lab=GND}
C {gnd.sym} 1010 -860 0 0 {name=l7 lab=GND}
C {gnd.sym} 1420 -810 0 0 {name=l8 lab=GND}
C {simulator_commands_shown.sym} 670 -530 0 0 {
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
C {lab_pin.sym} 1530 -660 0 1 {name=p2 sig_type=std_logic lab=en}
C {lab_pin.sym} 1530 -680 0 1 {name=p3 sig_type=std_logic lab=sdata}
C {lab_pin.sym} 1530 -700 0 1 {name=p4 sig_type=std_logic lab=sclk}
C {lab_pin.sym} 1530 -720 0 1 {name=p5 sig_type=std_logic lab=rst}
C {lab_pin.sym} 1650 -660 0 0 {name=p8 sig_type=std_logic lab=en}
C {lab_pin.sym} 1650 -680 0 0 {name=p9 sig_type=std_logic lab=sdata}
C {lab_pin.sym} 1650 -700 0 0 {name=p14 sig_type=std_logic lab=sclk}
C {lab_pin.sym} 1650 -720 0 0 {name=p15 sig_type=std_logic lab=rst}
C {noconn.sym} 1690 -720 2 0 {name=l9}
C {noconn.sym} 1690 -700 2 0 {name=l13}
C {noconn.sym} 1690 -680 2 0 {name=l14}
C {noconn.sym} 1690 -660 2 0 {name=l15}
C {simulator_commands.sym} 1700 -410 0 0 {name=SimulatorNGSPICE
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

* to generate following file copy stimuli.test
* to the simulation directory and run simulation -> Utile Stimuli Editor (GUI), 
* and press 'Translate'
.include stimuli_test.cir

.control

  * Simulation accuracy options
  .options maxstep=10p reltol=1e-4 abstol=1e-9

  * Save important PLL + DSM nodes
  save v(sdata) v(sclk) v(rst) v(dsm_clk) v(F_REF) v(F_VCO) v(vctrl) v(vco_out) v(UP) v(DN)
  set appendwrite

 * Run long enough for PLL lock
  tran 20p 5u uic

  remzerovec

  write pll_dsm_freq_div.raw
.endc
"}
C {lc-vco/LC_VCO.sym} 1420 -950 0 0 {name=x3}
C {charge-pump/CP.sym} 1010 -960 0 0 {name=x1}
C {phase-freq-detector/PFD_std.sym} 670 -950 0 0 {name=x2}
C {dsm/xschem/adc_bridge1.sym} 1450 -740 0 1 {name=A1
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.4
in_high=0.6
}
C {dsm/xschem/adc_bridge1.sym} 1450 -720 0 1 {name=A2
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.4
in_high=0.6
}
C {dsm/xschem/adc_bridge1.sym} 1450 -700 0 1 {name=A3
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.4
in_high=0.6
}
C {dsm/xschem/adc_bridge1.sym} 1450 -680 0 1 {name=A4
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.4
in_high=0.6
}
C {dsm/xschem/adc_bridge1.sym} 1450 -660 0 1 {name=A5
adc=adc1
adc_bridge_model=adc_bridge
in_low=0.4
in_high=0.6
}
C {dsm/xschem/dsm_and_freq_divider.sym} 1280 -700 0 1 {name=adut
dut=dut
d_cosim_model= d_cosim
model=./../dsm_and_freq_divider.so}
C {dsm/xschem/dac_bridge1.sym} 1140 -700 0 1 {name=A6
dac=dac1
dac_bridge_model=dac_bridge
out_low=0
out_high=1.2
}
C {simulator_commands.sym} 1910 -580 0 0 {name=SimulatorNGSPICE1
vhdl_ignore=1
spice_ignore="tcleval([regexp -nocase \{xyce\} $sim(spice,$sim(spice,default),name)])"
simulator=ngspice
only_toplevel=false 
value="
.include ./IHP_4nH_Inductor.spice
.param temp=27
.control
<<<<<<< HEAD
save V(VCTRL) V(OUTp) V(outd) V(sdata) V(sclk) V(en) V(rst) 
=======
save v(outd) v(OUTp) v(VCTRL) v(rst) v(sclk) v(sdata) v(en)
>>>>>>> db3dfc6e419474ed53387991c677ebd8f716422a
.options maxstep=50p reltol=1e-3 abstol=1e-6

*.ic v(OUTp)=0.6
tran 1p 400n
remzerovec

* Perform FFT on output
fft v(OUTp)
let vmag = db(mag(v(OUTp)))
plot vmag xlabel 'Frequency (Hz)' xlimit 0 5G

* Save transient waveform to raw file
write LCVCO_DSM.raw

*quit 0
.endc


* to generate following file copy stimuli.test
* to the simulation directory and run simulation -> Utile Stimuli Editor (GUI), 
* and press 'Translate'
.include stimuli_test.cir
"}

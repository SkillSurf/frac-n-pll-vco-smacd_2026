v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 120 -1050 920 -650 {flags=graph
y1=1.9479089e+09
y2=2.6927005e+09
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
autoload=1
sim_type=tran
color="4 7"
node="freq_vector
vctrl"
x2=1.59999e-07
hcursor2_y=2.5025565e+09
hcursor1_y=2.3542446e+09}
N 290 -320 290 -280 {lab=GND}
N 290 -460 290 -380 {lab=VCTRL}
N 850 -390 930 -390 {lab=OUTp}
N 850 -370 930 -370 {lab=OUTn}
N 570 -390 640 -390 {lab=VCTRL}
N 740 -290 740 -280 {lab=GND}
N 570 -370 640 -370 {lab=Ibias}
N 740 -480 740 -470 {lab=VDD}
N 230 -460 230 -380 {lab=VDD}
N 230 -320 230 -280 {lab=GND}
N 170 -400 170 -380 {lab=Ibias}
C {gnd.sym} 290 -280 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 290 -460 0 0 {name=l8 lab=VCTRL}
C {launcher.sym} 790 -630 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/tb_VCO.raw"
}
C {devices/code_shown.sym} 1030 -740 0 0 {name=NGSPICE only_toplevel=true 
value="
.include ./IHP_4nH_Inductor.spice
.param temp=27
.control
save all
*.ic v(OUTp)=0.6

tran 3p 160n UIC

linearize v(OUTp) v(Vctrl)

    let n_pts = length(time)
    let freq_vector = unitvec(n_pts) * 0
    
    * Advanced script to calculate instantaneous frequency
    let i = 1
    let last_cross = 0
    while i < length(time)
        if (v(OUTp)[i] >= 0.6) & (v(OUTp)[i-1] < 0.6)
            let current_cross = time[i]
            let period = current_cross - last_cross
            let inst_freq = 1 / period
            let freq_vector[i] = inst_freq
            let last_cross = current_cross
        else
            let freq_vector[i] = freq_vector[i-1]
        end
        let i = i + 1
    end

* Save transient waveform to raw file
write tb_VCO.raw

*quit 0
.endc
"}
C {vsource.sym} 290 -350 0 0 {name=V2 value="pulse(0.3 1.0 50n 100n 100n 200n)" savecurrent=false}
C {devices/code_shown.sym} 1020 -860 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ_stat
"}
C {/foss/designs/iic_osic_tools/frac-n-pll-vco-unic_cass/schematic/blocks/lc-vco/LC_VCO.sym} 740 -380 0 0 {name=x2}
C {gnd.sym} 740 -280 0 0 {name=l6 lab=GND}
C {lab_pin.sym} 570 -390 0 0 {name=p3 sig_type=std_logic lab=VCTRL}
C {lab_pin.sym} 570 -370 0 0 {name=p7 sig_type=std_logic lab=Ibias}
C {devices/vdd.sym} 740 -480 0 0 {name=l7 lab=VDD}
C {lab_pin.sym} 930 -390 0 1 {name=p1 sig_type=std_logic lab=OUTp}
C {lab_pin.sym} 930 -370 0 1 {name=p2 sig_type=std_logic lab=OUTn}
C {vsource.sym} 230 -350 0 0 {name=V1 value=1.2 savecurrent=false}
C {gnd.sym} 230 -280 0 0 {name=l1 lab=GND}
C {devices/vdd.sym} 230 -460 0 0 {name=l5 lab=VDD}
C {devices/isource.sym} 170 -430 0 0 {name=I0 value=50u}
C {devices/vdd.sym} 170 -460 0 0 {name=l12 lab=VDD}
C {devices/vdd.sym} 170 -380 2 0 {name=l3 lab=Ibias}
C {title.sym} 160 -40 0 0 {name=l4 author="Skill Surf"}

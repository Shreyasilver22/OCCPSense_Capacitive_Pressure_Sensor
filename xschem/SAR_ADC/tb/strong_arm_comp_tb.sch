v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
B 2 50 -450 850 -50 {flags=graph
y1=0
y2=3.6
ypos1=0
ypos2=3.6
divy=6
subdivy=1
unity=1
x1=0
x2=5e-09
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="v(clk) v(voutp) v(voutn)"
color="4 5 6"
dataset=-1
unitx=1
logx=0
logy=0
}
B 2 40 50 840 450 {flags=graph
y1=1.64
y2=1.66
ypos1=1.64
ypos2=1.66
divy=4
subdivy=1
unity=1
x1=0
x2=5e-09
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="v(vinp) v(vinn)"
color="4 5"
dataset=-1
unitx=1
logx=0
logy=0}
N -830 -350 -830 -320 {
lab=GND}
N -830 -320 -830 -220 {
lab=GND}
N -830 -660 -830 -630 {
lab=vdd}
N -830 -270 -780 -270 {
lab=GND}
N -720 -270 -690 -270 {
lab=Vinn}
N -720 -430 -690 -430 {
lab=Vinp}
N -830 -450 -830 -350 {
lab=GND}
N -830 -570 -830 -450 {
lab=GND}
N -950 -590 -950 -560 {
lab=vss}
N -950 -500 -950 -470 {
lab=GND}
N -950 -470 -830 -470 {
lab=GND}
N -950 -360 -950 -330 {
lab=CLK}
N -950 -450 -950 -420 {
lab=GND}
N -210 -100 -210 -60 {
lab=GND}
N -210 -180 -210 -160 {
lab=Voutp}
N -270 -180 -210 -180 {
lab=Voutp}
N -70 -100 -70 -60 {
lab=GND}
N -70 -180 -70 -160 {
lab=Voutn}
N -130 -180 -70 -180 {
lab=Voutn}
N -360 -480 -360 -450 {
lab=vdd}
N -210 -410 -180 -410 {
lab=Voutn}
N -210 -370 -180 -370 {
lab=Voutp}
N -550 -410 -510 -410 {
lab=Vinn}
N -550 -390 -510 -390 {
lab=Vinp}
N -550 -370 -510 -370 {
lab=CLK}
N -360 -330 -360 -300 {
lab=vss}
N -950 -470 -950 -450 {
lab=GND}
N -830 -430 -780 -430 {
lab=GND}
C {vsource.sym} -750 -270 1 0 {name=V_VIN value="dc \{VCM - VDIFF/2\}" savecurrent=false}
C {vsource.sym} -830 -600 0 0 {name=VDD_SRC value="dc \{VDD\}" savecurrent=false}
C {gnd.sym} -830 -220 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -830 -660 0 0 {name=p24 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -690 -270 2 0 {name=p25 sig_type=std_logic lab=Vinn}
C {vsource.sym} -750 -430 1 0 {name=V_VINP value="dc \{VCM + VDIFF/2\}" savecurrent=false}
C {lab_pin.sym} -690 -430 2 0 {name=p26 sig_type=std_logic lab=Vinp}
C {vsource.sym} -950 -530 0 0 {name=V_VSS value="dc 0" savecurrent=false}
C {lab_pin.sym} -950 -590 0 0 {name=p28 sig_type=std_logic lab=vss

}
C {vsource.sym} -950 -390 2 0 {name=V_CLK value="PULSE(0 \{VDD\} 1n 20p 20p 3n 6n)" savecurrent=false}
C {lab_pin.sym} -950 -330 3 0 {name=p29 sig_type=std_logic lab=CLK}
C {code_shown.sym} -1080 65 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice

.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice res_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice moscap_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice diode_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_typical

.include /foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice
"}
C {code.sym} -210 90 0 0 {name=s1
only_toplevel=true
value="

.param VDD=3.3
.param VCM=1.65
.param VREF=3.3
.param NBITS=10
.param VLSB=3.22265625e-3
.param VHLSB=1.611328125e-3
.param VDIFF=10e-3
.param CLOAD=20f

.options savecurrents
.options reltol=1e-4 abstol=1e-12 vntol=1e-6 method=gear

.save v(CLK) v(Vinp) v(Vinn) v(Voutp) v(Voutn)
.save v(x1.x) v(x1.y) v(x1.p) v(x1.q) v(x1.net1) v(x1.net2) v(x1.net3)
.save i(VDD_SRC)

.control
set filetype=binary

shell rm -f strongarm_results.txt
shell rm -f strongarm_tran_nominal.txt
shell rm -f strongarm_lsb_sweep.txt
shell rm -f strongarm_delay_sweep.txt
shell rm -f strongarm_vcm_sweep.txt
shell rm -f strongarm_vdd_sweep.txt

echo ============================================= > strongarm_results.txt
echo GF180MCU StrongARM comparator qualification >> strongarm_results.txt
echo For 10-bit SAR ADC check >> strongarm_results.txt
echo ============================================= >> strongarm_results.txt
echo . >> strongarm_results.txt
echo Assumed VREF = 3.3 V >> strongarm_results.txt
echo 10-bit LSB  = 3.22265625 mV >> strongarm_results.txt
echo 0.5 LSB     = 1.611328125 mV >> strongarm_results.txt
echo . >> strongarm_results.txt

****************************************************
* 1. Nominal transient at VDIFF = +10 mV
****************************************************

alterparam VDD=3.3
alterparam VCM=1.65
alterparam VDIFF=10e-3
reset

op
tran 1p 5n
write strong_arm_comp_tb.raw

meas tran voutp_samp FIND v(Voutp) AT=4n
meas tran voutn_samp FIND v(Voutn) AT=4n
meas tran x_samp     FIND v(x1.x)     AT=4n
meas tran y_samp     FIND v(x1.y)     AT=4n
meas tran p_samp     FIND v(x1.p)     AT=4n
meas tran q_samp     FIND v(x1.q)     AT=4n
meas tran net1_samp  FIND v(x1.net1)  AT=4n
meas tran net2_samp  FIND v(x1.net2)  AT=4n
meas tran net3_samp  FIND v(x1.net3)  AT=4n

meas tran idd_avg    AVG i(VDD_SRC) FROM=0n TO=5n
meas tran idd_eval   AVG i(VDD_SRC) FROM=1n TO=4n

let vod_samp = voutp_samp - voutn_samp
let pavg = -3.3*idd_avg
let peval = -3.3*idd_eval
let e_5ns = pavg*5n
let e_eval = peval*3n

meas tran t_clk_rise WHEN v(CLK)=1.65 RISE=1
meas tran t_voutn_fall WHEN v(Voutn)=1.65 FALL=1
let td_pos = t_voutn_fall - t_clk_rise

echo ---- Nominal transient result, VDIFF = +10 mV ---- >> strongarm_results.txt
echo Voutp_4ns          = $&voutp_samp V >> strongarm_results.txt
echo Voutn_4ns          = $&voutn_samp V >> strongarm_results.txt
echo Voutp_minus_Voutn  = $&vod_samp   V >> strongarm_results.txt
echo X_4ns              = $&x_samp     V >> strongarm_results.txt
echo Y_4ns              = $&y_samp     V >> strongarm_results.txt
echo P_4ns              = $&p_samp     V >> strongarm_results.txt
echo Q_4ns              = $&q_samp     V >> strongarm_results.txt
echo net1_4ns           = $&net1_samp  V >> strongarm_results.txt
echo net2_4ns           = $&net2_samp  V >> strongarm_results.txt
echo net3_4ns           = $&net3_samp  V >> strongarm_results.txt
echo IDD_avg_0_to_5ns   = $&idd_avg    A >> strongarm_results.txt
echo Pavg_0_to_5ns      = $&pavg       W >> strongarm_results.txt
echo E_0_to_5ns         = $&e_5ns      J >> strongarm_results.txt
echo IDD_eval_1_to_4ns  = $&idd_eval   A >> strongarm_results.txt
echo Peval_1_to_4ns     = $&peval      W >> strongarm_results.txt
echo Eeval_1_to_4ns     = $&e_eval     J >> strongarm_results.txt
echo t_clk_rise         = $&t_clk_rise     s >> strongarm_results.txt
echo t_voutn_fall       = $&t_voutn_fall   s >> strongarm_results.txt
echo td_pos             = $&td_pos         s >> strongarm_results.txt
echo . >> strongarm_results.txt

wrdata strongarm_tran_nominal.txt time v(CLK) v(Vinp) v(Vinn) v(Voutp) v(Voutn) v(x1.x) v(x1.y) v(x1.p) v(x1.q) v(x1.net1) v(x1.net2) v(x1.net3) i(VDD_SRC)
****************************************************
* 2. 10-bit LSB decision sweep
****************************************************

echo ============================================= > strongarm_lsb_sweep.txt
echo 10-bit SAR LSB decision sweep >> strongarm_lsb_sweep.txt
echo VREF = 3.3 V, LSB = 3.22265625 mV, 0.5LSB = 1.611328125 mV >> strongarm_lsb_sweep.txt
echo columns: VDIFF Voutp Voutn Vod X Y P Q net1 net2 net3 Pavg >> strongarm_lsb_sweep.txt
echo ============================================= >> strongarm_lsb_sweep.txt

foreach dv -10e-3 -5e-3 -3.22265625e-3 -1.611328125e-3 -1e-3 -500e-6 500e-6 1e-3 1.611328125e-3 3.22265625e-3 5e-3 10e-3
  alterparam VDD=3.3
  alterparam VCM=1.65
  alterparam VDIFF=$dv
  reset
  tran 1p 5n

  meas tran vop FIND v(Voutp) AT=4n
  meas tran von FIND v(Voutn) AT=4n
  meas tran vx  FIND v(x1.x)     AT=4n
meas tran vy  FIND v(x1.y)     AT=4n
meas tran vp  FIND v(x1.p)     AT=4n
meas tran vq  FIND v(x1.q)     AT=4n
meas tran vn1 FIND v(x1.net1)  AT=4n
meas tran vn2 FIND v(x1.net2)  AT=4n
meas tran vn3 FIND v(x1.net3)  AT=4n
  meas tran ia  AVG i(VDD_SRC) FROM=0n TO=5n

  let vod = vop - von
  let ppwr = -3.3*ia

  echo $dv $&vop $&von $&vod $&vx $&vy $&vp $&vq $&vn1 $&vn2 $&vn3 $&ppwr >> strongarm_lsb_sweep.txt
end

****************************************************
* 3. Delay versus positive VDIFF
****************************************************

echo ============================================= > strongarm_delay_sweep.txt
echo Delay versus positive VDIFF >> strongarm_delay_sweep.txt
echo columns: VDIFF tclk tout td Voutp4n Voutn4n Pavg >> strongarm_delay_sweep.txt
echo ============================================= >> strongarm_delay_sweep.txt

foreach dv 500e-6 1e-3 1.611328125e-3 3.22265625e-3 5e-3 10e-3 20e-3 50e-3
  alterparam VDD=3.3
  alterparam VCM=1.65
  alterparam VDIFF=$dv
  reset
  tran 1p 5n

  meas tran tclk WHEN v(CLK)=1.65 RISE=1
  meas tran tout WHEN v(Voutn)=1.65 FALL=1
  let td = tout - tclk

  meas tran vop4 FIND v(Voutp) AT=4n
  meas tran von4 FIND v(Voutn) AT=4n
  meas tran ia AVG i(VDD_SRC) FROM=0n TO=5n
  let ppwr = -3.3*ia

  echo $dv $&tclk $&tout $&td $&vop4 $&von4 $&ppwr >> strongarm_delay_sweep.txt
end

****************************************************
* 4. Input common-mode sweep at +0.5 LSB
****************************************************

echo ============================================= > strongarm_vcm_sweep.txt
echo VCM sweep at VDIFF = +0.5 LSB >> strongarm_vcm_sweep.txt
echo columns: VCM Voutp4n Voutn4n Vod4n td Pavg >> strongarm_vcm_sweep.txt
echo ============================================= >> strongarm_vcm_sweep.txt

foreach cm 0.8 1.0 1.2 1.4 1.65 1.8 2.0 2.2 2.4
  alterparam VDD=3.3
  alterparam VCM=$cm
  alterparam VDIFF=1.611328125e-3
  reset
  tran 1p 5n

  meas tran vop4 FIND v(Voutp) AT=4n
  meas tran von4 FIND v(Voutn) AT=4n
  let vod4 = vop4 - von4

  meas tran tclk WHEN v(CLK)=1.65 RISE=1
  meas tran tout WHEN v(Voutn)=1.65 FALL=1
  let td = tout - tclk

  meas tran ia AVG i(VDD_SRC) FROM=0n TO=5n
  let ppwr = -3.3*ia

  echo $cm $&vop4 $&von4 $&vod4 $&td $&ppwr >> strongarm_vcm_sweep.txt
end

****************************************************
* 5. Supply sweep at +0.5 LSB
****************************************************

echo ============================================= > strongarm_vdd_sweep.txt
echo VDD sweep at VCM=VDD/2 and VDIFF=+0.5LSB >> strongarm_vdd_sweep.txt
echo columns: VDD VCM Voutp4n Voutn4n Vod4n td Pavg >> strongarm_vdd_sweep.txt
echo ============================================= >> strongarm_vdd_sweep.txt

* VDD = 3.0 V, VCM = 1.5 V
alterparam VDD=3.0
alterparam VCM=1.5
alterparam VDIFF=1.611328125e-3
reset
tran 1p 5n
meas tran vop4 FIND v(Voutp) AT=4n
meas tran von4 FIND v(Voutn) AT=4n
let vod4 = vop4 - von4
meas tran tclk WHEN v(CLK)=1.5 RISE=1
meas tran tout WHEN v(Voutn)=1.5 FALL=1
let td = tout - tclk
meas tran ia AVG i(VDD_SRC) FROM=0n TO=5n
let ppwr = -3.0*ia
echo 3.0 1.5 $&vop4 $&von4 $&vod4 $&td $&ppwr >> strongarm_vdd_sweep.txt

* VDD = 3.15 V, VCM = 1.575 V
alterparam VDD=3.15
alterparam VCM=1.575
alterparam VDIFF=1.611328125e-3
reset
tran 1p 5n
meas tran vop4 FIND v(Voutp) AT=4n
meas tran von4 FIND v(Voutn) AT=4n
let vod4 = vop4 - von4
meas tran tclk WHEN v(CLK)=1.575 RISE=1
meas tran tout WHEN v(Voutn)=1.575 FALL=1
let td = tout - tclk
meas tran ia AVG i(VDD_SRC) FROM=0n TO=5n
let ppwr = -3.15*ia
echo 3.15 1.575 $&vop4 $&von4 $&vod4 $&td $&ppwr >> strongarm_vdd_sweep.txt

* VDD = 3.3 V, VCM = 1.65 V
alterparam VDD=3.3
alterparam VCM=1.65
alterparam VDIFF=1.611328125e-3
reset
tran 1p 5n
meas tran vop4 FIND v(Voutp) AT=4n
meas tran von4 FIND v(Voutn) AT=4n
let vod4 = vop4 - von4
meas tran tclk WHEN v(CLK)=1.65 RISE=1
meas tran tout WHEN v(Voutn)=1.65 FALL=1
let td = tout - tclk
meas tran ia AVG i(VDD_SRC) FROM=0n TO=5n
let ppwr = -3.3*ia
echo 3.3 1.65 $&vop4 $&von4 $&vod4 $&td $&ppwr >> strongarm_vdd_sweep.txt

* VDD = 3.45 V, VCM = 1.725 V
alterparam VDD=3.45
alterparam VCM=1.725
alterparam VDIFF=1.611328125e-3
reset
tran 1p 5n
meas tran vop4 FIND v(Voutp) AT=4n
meas tran von4 FIND v(Voutn) AT=4n
let vod4 = vop4 - von4
meas tran tclk WHEN v(CLK)=1.725 RISE=1
meas tran tout WHEN v(Voutn)=1.725 FALL=1
let td = tout - tclk
meas tran ia AVG i(VDD_SRC) FROM=0n TO=5n
let ppwr = -3.45*ia
echo 3.45 1.725 $&vop4 $&von4 $&vod4 $&td $&ppwr >> strongarm_vdd_sweep.txt

* VDD = 3.6 V, VCM = 1.8 V
alterparam VDD=3.6
alterparam VCM=1.8
alterparam VDIFF=1.611328125e-3
reset
tran 1p 5n
meas tran vop4 FIND v(Voutp) AT=4n
meas tran von4 FIND v(Voutn) AT=4n
let vod4 = vop4 - von4
meas tran tclk WHEN v(CLK)=1.8 RISE=1
meas tran tout WHEN v(Voutn)=1.8 FALL=1
let td = tout - tclk
meas tran ia AVG i(VDD_SRC) FROM=0n TO=5n
let ppwr = -3.6*ia
echo 3.6 1.8 $&vop4 $&von4 $&vod4 $&td $&ppwr >> strongarm_vdd_sweep.txt

echo . >> strongarm_results.txt
echo Additional files generated: >> strongarm_results.txt
echo strongarm_lsb_sweep.txt >> strongarm_results.txt
echo strongarm_delay_sweep.txt >> strongarm_results.txt
echo strongarm_vcm_sweep.txt >> strongarm_results.txt
echo strongarm_vdd_sweep.txt >> strongarm_results.txt

echo Simulation complete. 

.endc

"}
C {capa.sym} -210 -130 0 0 {name=COUT
m=1
value=\{CLOAD\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -210 -60 3 0 {name=p17 sig_type=std_logic lab=GND}
C {capa.sym} -70 -130 0 0 {name=COUT1
m=1
value=\{CLOAD\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -70 -60 3 0 {name=p27 sig_type=std_logic lab=GND}
C {lab_pin.sym} -270 -180 0 0 {name=p31 sig_type=std_logic lab=Voutp}
C {lab_pin.sym} -130 -180 0 0 {name=p32 sig_type=std_logic lab=Voutn}
C {strong_arm_comp.sym} -360 -390 0 0 {name=x1}
C {lab_pin.sym} -550 -390 0 0 {name=p1 sig_type=std_logic lab=Vinp}
C {lab_pin.sym} -550 -410 0 0 {name=p2 sig_type=std_logic lab=Vinn}
C {lab_pin.sym} -550 -370 0 0 {name=p3 sig_type=std_logic lab=CLK}
C {lab_pin.sym} -180 -370 2 0 {name=p4 sig_type=std_logic lab=Voutp}
C {lab_pin.sym} -180 -410 2 0 {name=p5 sig_type=std_logic lab=Voutn}
C {lab_pin.sym} -360 -480 0 0 {name=p6 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -360 -300 0 0 {name=p7 sig_type=std_logic lab=vss

}
C {launcher.sym} 180 -540 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/strong_arm_comp_tb.raw tran"
}

v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 170 -220 170 -190 {
lab=GND}
N 170 -190 170 -90 {
lab=GND}
N 170 -530 170 -500 {
lab=vdd}
N 170 -140 220 -140 {
lab=GND}
N 280 -140 310 -140 {
lab=Vinn}
N 280 -230 310 -230 {
lab=Vinp}
N 190 -230 220 -230 {
lab=GND}
N 170 -230 190 -230 {
lab=GND}
N 170 -320 170 -220 {
lab=GND}
N 170 -440 170 -320 {
lab=GND}
N 280 -420 310 -420 {
lab=Vbias}
N 190 -420 220 -420 {
lab=GND}
N 170 -420 190 -420 {
lab=GND}
N 50 -460 50 -430 {
lab=vss}
N 50 -370 50 -340 {
lab=GND}
N 50 -340 170 -340 {
lab=GND}
N 280 -330 310 -330 {
lab=Vbias_out}
N 190 -330 220 -330 {
lab=GND}
N 170 -330 190 -330 {
lab=GND}
N 520 -410 550 -410 {
lab=Vinn}
N 520 -390 550 -390 {
lab=Vinp}
N 520 -370 550 -370 {
lab=Vbias}
N 520 -350 550 -350 {
lab=Vbias_out}
N 700 -470 700 -440 {
lab=vdd}
N 700 -320 700 -290 {
lab=vss}
N 850 -380 880 -380 {
lab=vout}
N 940 -300 940 -260 {
lab=GND}
N 940 -380 940 -360 {
lab=vout}
N 880 -380 940 -380 {
lab=vout}
C {vsource.sym} 250 -140 1 0 {name=V_VIN value="dc \{VINN\} ac 0" savecurrent=false}
C {vsource.sym} 170 -470 0 0 {name=VDD_SRC value=\{VDD\} savecurrent=false}
C {gnd.sym} 170 -90 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 170 -530 0 0 {name=p10 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 310 -140 2 0 {name=p11 sig_type=std_logic lab=Vinn}
C {vsource.sym} 250 -230 1 0 {name=V_VINP value="dc \{VINP\} ac 1" savecurrent=false}
C {lab_pin.sym} 310 -230 2 0 {name=p18 sig_type=std_logic lab=Vinp}
C {vsource.sym} 250 -420 1 0 {name=V_VBIAS value=\{VBIAS\} savecurrent=false}
C {lab_pin.sym} 310 -420 2 0 {name=p12 sig_type=std_logic lab=Vbias}
C {vsource.sym} 50 -400 0 0 {name=V_VSS value=\{VSS\} savecurrent=false}
C {lab_pin.sym} 50 -460 0 0 {name=p9 sig_type=std_logic lab=vss

}
C {vsource.sym} 250 -330 1 0 {name=V_VBIAS_OUT value=\{VBIAS_OUT\} savecurrent=false}
C {lab_pin.sym} 310 -330 2 0 {name=p15 sig_type=std_logic lab=Vbias_out}
C {code_shown.sym} 60 55 0 0 {name=MODELS only_toplevel=true
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
C {code.sym} 930 80 0 0 {name=s1
only_toplevel=true
value="

.param VDD=3.3
.param VSS=0
.param VCM=1.65
.param VINP=\{VCM\}
.param VINN=\{VCM\}
.param VBIAS=0.70
.param VBIAS_OUT=0.6638

.options savecurrents
.options reltol=1e-4 abstol=1e-12 vntol=1e-6

.control
set filetype=ascii
shell rm -f opamp_final_results.txt opamp_ac.txt

op

echo ============================================= > opamp_final_results.txt
echo GF180MCU two-stage op-amp symbol testbench results >> opamp_final_results.txt
echo ============================================= >> opamp_final_results.txt

echo ---- DC operating point ---- >> opamp_final_results.txt

let idd = -i(VDD_SRC)
let iss = i(V_VSS)
let pdc = v(vdd)*idd

echo Vinp     = $&v(Vinp)      V >> opamp_final_results.txt
echo Vinn     = $&v(Vinn)      V >> opamp_final_results.txt
echo x1.net1  = $&v(x1.net1)   V >> opamp_final_results.txt
echo x1.net2  = $&v(x1.net2)   V >> opamp_final_results.txt
echo x1.Vx    = $&v(x1.Vx)     V >> opamp_final_results.txt
echo Vout     = $&v(vout)      V >> opamp_final_results.txt
echo IDD      = $&idd          A >> opamp_final_results.txt
echo ISS      = $&iss          A >> opamp_final_results.txt
echo PDC      = $&pdc          W >> opamp_final_results.txt
echo . >> opamp_final_results.txt

echo ---- MOS operating point data ---- >> opamp_final_results.txt
show m.x1.xm1.m0 >> opamp_final_results.txt
show m.x1.xm2.m0 >> opamp_final_results.txt
show m.x1.xm3.m0 >> opamp_final_results.txt
show m.x1.xm4.m0 >> opamp_final_results.txt
show m.x1.xm5.m0 >> opamp_final_results.txt
show m.x1.xm7.m0 >> opamp_final_results.txt
show m.x1.xm8.m0 >> opamp_final_results.txt

ac dec 100 1 1e9

meas ac av_1hz_db FIND vdb(vout) AT=1
meas ac ugf WHEN vdb(vout)=0 FALL=1
meas ac phase_rad FIND vp(vout) WHEN vdb(vout)=0 FALL=1

let phase_deg = phase_rad*180/pi
let phase_margin = 180 + phase_deg

echo . >> opamp_final_results.txt
echo ---- AC open-loop results ---- >> opamp_final_results.txt
echo DC_gain_approx_1Hz = $&av_1hz_db dB >> opamp_final_results.txt
echo UGF                = $&ugf Hz >> opamp_final_results.txt
echo Phase_at_UGF       = $&phase_deg deg >> opamp_final_results.txt
echo Phase_margin       = $&phase_margin deg >> opamp_final_results.txt
echo . >> opamp_final_results.txt

wrdata opamp_ac.txt frequency vdb(vout) vp(vout)

.endc
"}
C {/media/sf_LNA_chipathon/gf_180_test/schem/op-amp.sym} 700 -380 0 0 {name=x1}
C {lab_pin.sym} 520 -410 0 0 {name=p13 sig_type=std_logic lab=Vinn}
C {lab_pin.sym} 520 -390 0 0 {name=p1 sig_type=std_logic lab=Vinp}
C {lab_pin.sym} 520 -370 0 0 {name=p2 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 520 -350 0 0 {name=p3 sig_type=std_logic lab=Vbias_out}
C {lab_pin.sym} 700 -470 1 0 {name=p4 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 700 -290 3 0 {name=p5 sig_type=std_logic lab=vss}
C {lab_pin.sym} 880 -380 2 0 {name=p6 sig_type=std_logic lab=vout}
C {capa.sym} 940 -330 0 0 {name=COUT
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 940 -260 3 0 {name=p14 sig_type=std_logic lab=GND}

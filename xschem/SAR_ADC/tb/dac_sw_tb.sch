v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -230 -220 -230 -190 {
lab=GND}
N -230 -190 -230 -90 {
lab=GND}
N -230 -530 -230 -500 {
lab=vdd}
N -120 -300 -90 -300 {
lab=sel}
N -230 -320 -230 -220 {
lab=GND}
N -230 -440 -230 -320 {
lab=GND}
N -350 -460 -350 -430 {
lab=vss}
N -350 -370 -350 -340 {
lab=GND}
N -350 -340 -230 -340 {
lab=GND}
N -230 -300 -180 -300 {
lab=GND}
N 690 -190 690 -150 {
lab=GND}
N 690 -270 690 -250 {
lab=Voutp}
N 630 -270 690 -270 {
lab=Voutp}
N 250 -370 250 -340 {
lab=vdd}
N 60 -270 100 -270 {
lab=sel}
N 250 -200 250 -170 {
lab=vss}
N 400 -310 440 -310 {
lab=Voutp}
N 400 -280 440 -280 {
lab=vref}
N 400 -250 440 -250 {
lab=vcm}
C {dac_sw_2to1_tg.sym} 250 -270 0 0 {name=x1}
C {vsource.sym} -230 -470 0 0 {name=VDD_SRC value="dc \{VDD\}" savecurrent=false}
C {gnd.sym} -230 -90 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -230 -530 0 0 {name=p24 sig_type=std_logic lab=vdd

}
C {vsource.sym} -150 -300 1 0 {name=V_VINP value="PULSE(0 \{VDD\} 5n 20p 20p 40n 100n)" savecurrent=false}
C {lab_pin.sym} -90 -300 2 0 {name=p26 sig_type=std_logic lab=sel}
C {vsource.sym} -350 -400 0 0 {name=V_VSS value="dc 0" savecurrent=false}
C {lab_pin.sym} -350 -460 0 0 {name=p28 sig_type=std_logic lab=vss

}
C {code_shown.sym} 40 45 0 0 {name=MODELS only_toplevel=true
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
C {code.sym} 910 70 0 0 {name=s1
only_toplevel=true
value="

* ------------------------------------------------------------
* Parameters
* CLOAD = 25.6 pF approximates one MSB bottom-plate load:
* 512 * 50 fF = 25.6 pF
* ------------------------------------------------------------
.param VDD=3.3
.param VCM=1.65
.param VREF=3.3
.param VDIFF=0
.param CLOAD=25.6p

* ------------------------------------------------------------
* Local reference sources for this standalone testbench
* ------------------------------------------------------------
VREF_SRC vref GND dc \{VREF\}
VVCM_SRC vcm  GND dc \{VCM\}

* ------------------------------------------------------------
* Simulation options
* ------------------------------------------------------------
.options savecurrents
.options reltol=1e-4 abstol=1e-12 vntol=1e-6
.options method=gear maxord=2

* ------------------------------------------------------------
* Save useful nodes/currents
* ------------------------------------------------------------
.save v(sel)
.save v(Voutp)
.save v(vref)
.save v(vcm)
.save v(vdd)
.save v(vss)
.save i(VDD_SRC)
.save i(VREF_SRC)
.save i(VVCM_SRC)

.control

shell rm -f dac_sw_results.txt

echo ================================================== > dac_sw_results.txt
echo DAC SWITCH 2:1 TRANSMISSION-GATE VERIFICATION >> dac_sw_results.txt
echo ================================================== >> dac_sw_results.txt
echo Cell under test: dac_sw_2to1_tg >> dac_sw_results.txt
echo Expected function: sel=0 gives out=vcm, sel=1 gives out=vref >> dac_sw_results.txt
echo Selector source must be: PULSE\\(0 \{VDD\} 5n 20p 20p 40n 100n\\) >> dac_sw_results.txt
echo Load capacitance CLOAD = 25.6pF, approximately 512*50fF MSB CDAC load >> dac_sw_results.txt
echo Pass threshold for settled error = 5mV >> dac_sw_results.txt
echo ================================================== >> dac_sw_results.txt
echo columns: CASE vref_set sel_low out_low err_low sel_high out_high err_high sel_return out_return err_return t_sel_rise t_out_to_ref tpd_to_ref t_sel_fall t_out_to_vcm tpd_to_vcm ivdd_avg ivref_avg ivcm_avg pdd_avg pass_low pass_high pass_return >> dac_sw_results.txt
echo ================================================== >> dac_sw_results.txt


* ==================================================
* CASE A: vref = VDD = 3.3V
* Positive-side CDAC switch behavior
* sel=0 -> out=vcm=1.65V
* sel=1 -> out=vref=3.3V
* ==================================================

alterparam VREF = 3.3
reset
tran 2p 100n

meas tran sel_low_A    FIND v(sel)   AT=4n
meas tran out_low_A    FIND v(Voutp) AT=4n
meas tran vcm_A        FIND v(vcm)   AT=4n
let err_low_A = out_low_A - vcm_A

meas tran sel_high_A   FIND v(sel)   AT=20n
meas tran out_high_A   FIND v(Voutp) AT=20n
meas tran vref_A       FIND v(vref)  AT=20n
let err_high_A = out_high_A - vref_A

meas tran sel_ret_A    FIND v(sel)   AT=80n
meas tran out_ret_A    FIND v(Voutp) AT=80n
meas tran vcm_ret_A    FIND v(vcm)   AT=80n
let err_ret_A = out_ret_A - vcm_ret_A

* Rising select: output should rise from VCM to VREF.
* Midpoint = (1.65 + 3.3)/2 = 2.475V
meas tran t_sel_rise_A WHEN v(sel)=1.65 RISE=1
meas tran t_out_ref_A  WHEN v(Voutp)=2.475 RISE=1
let tpd_ref_A = t_out_ref_A - t_sel_rise_A

* Falling select: output should return from VREF to VCM.
meas tran t_sel_fall_A WHEN v(sel)=1.65 FALL=1
meas tran t_out_vcm_A  WHEN v(Voutp)=2.475 FALL=1
let tpd_vcm_A = t_out_vcm_A - t_sel_fall_A

meas tran ivdd_avg_A  AVG i(VDD_SRC)  FROM=0n TO=90n
meas tran ivref_avg_A AVG i(VREF_SRC) FROM=0n TO=90n
meas tran ivcm_avg_A  AVG i(VVCM_SRC) FROM=0n TO=90n
let pdd_avg_A = abs(3.3*ivdd_avg_A)

let pass_low_A = 0
if abs(err_low_A) < 5e-3
  let pass_low_A = 1
end

let pass_high_A = 0
if abs(err_high_A) < 5e-3
  let pass_high_A = 1
end

let pass_ret_A = 0
if abs(err_ret_A) < 5e-3
  let pass_ret_A = 1
end

echo REF_HIGH_3P3 $&vref_A $&sel_low_A $&out_low_A $&err_low_A $&sel_high_A $&out_high_A $&err_high_A $&sel_ret_A $&out_ret_A $&err_ret_A $&t_sel_rise_A $&t_out_ref_A $&tpd_ref_A $&t_sel_fall_A $&t_out_vcm_A $&tpd_vcm_A $&ivdd_avg_A $&ivref_avg_A $&ivcm_avg_A $&pdd_avg_A $&pass_low_A $&pass_high_A $&pass_ret_A >> dac_sw_results.txt


* ==================================================
* CASE B: vref = VSS = 0V
* Negative-side CDAC switch behavior
* sel=0 -> out=vcm=1.65V
* sel=1 -> out=vref=0V
* ==================================================

alterparam VREF = 0
reset
tran 2p 100n

meas tran sel_low_B    FIND v(sel)   AT=4n
meas tran out_low_B    FIND v(Voutp) AT=4n
meas tran vcm_B        FIND v(vcm)   AT=4n
let err_low_B = out_low_B - vcm_B

meas tran sel_high_B   FIND v(sel)   AT=20n
meas tran out_high_B   FIND v(Voutp) AT=20n
meas tran vref_B       FIND v(vref)  AT=20n
let err_high_B = out_high_B - vref_B

meas tran sel_ret_B    FIND v(sel)   AT=80n
meas tran out_ret_B    FIND v(Voutp) AT=80n
meas tran vcm_ret_B    FIND v(vcm)   AT=80n
let err_ret_B = out_ret_B - vcm_ret_B

* Rising select: output should fall from VCM to VREF=0.
* Midpoint = (1.65 + 0)/2 = 0.825V
meas tran t_sel_rise_B WHEN v(sel)=1.65 RISE=1
meas tran t_out_ref_B  WHEN v(Voutp)=0.825 FALL=1
let tpd_ref_B = t_out_ref_B - t_sel_rise_B

* Falling select: output should return from VREF=0 to VCM.
meas tran t_sel_fall_B WHEN v(sel)=1.65 FALL=1
meas tran t_out_vcm_B  WHEN v(Voutp)=0.825 RISE=1
let tpd_vcm_B = t_out_vcm_B - t_sel_fall_B

meas tran ivdd_avg_B  AVG i(VDD_SRC)  FROM=0n TO=90n
meas tran ivref_avg_B AVG i(VREF_SRC) FROM=0n TO=90n
meas tran ivcm_avg_B  AVG i(VVCM_SRC) FROM=0n TO=90n
let pdd_avg_B = abs(3.3*ivdd_avg_B)

let pass_low_B = 0
if abs(err_low_B) < 5e-3
  let pass_low_B = 1
end

let pass_high_B = 0
if abs(err_high_B) < 5e-3
  let pass_high_B = 1
end

let pass_ret_B = 0
if abs(err_ret_B) < 5e-3
  let pass_ret_B = 1
end

echo REF_LOW_0 $&vref_B $&sel_low_B $&out_low_B $&err_low_B $&sel_high_B $&out_high_B $&err_high_B $&sel_ret_B $&out_ret_B $&err_ret_B $&t_sel_rise_B $&t_out_ref_B $&tpd_ref_B $&t_sel_fall_B $&t_out_vcm_B $&tpd_vcm_B $&ivdd_avg_B $&ivref_avg_B $&ivcm_avg_B $&pdd_avg_B $&pass_low_B $&pass_high_B $&pass_ret_B >> dac_sw_results.txt


echo ================================================== >> dac_sw_results.txt
echo INTERPRETATION >> dac_sw_results.txt
echo pass_low=1 means sel=0 correctly connects out to VCM >> dac_sw_results.txt
echo pass_high=1 means sel=1 correctly connects out to VREF >> dac_sw_results.txt
echo pass_return=1 means falling sel correctly reconnects out to VCM >> dac_sw_results.txt
echo tpd_to_ref is delay from sel crossing 1.65V to output crossing midpoint toward VREF >> dac_sw_results.txt
echo tpd_to_vcm is delay from sel crossing 1.65V to output crossing midpoint toward VCM >> dac_sw_results.txt
echo REF_HIGH_3P3 validates positive CDAC bp switch behavior >> dac_sw_results.txt
echo REF_LOW_0 validates negative CDAC bn switch behavior >> dac_sw_results.txt
echo ================================================== >> dac_sw_results.txt

echo DAC switch test complete. Open dac_sw_results.txt.

write dac_sw_tb.raw

.endc
"}
C {capa.sym} 690 -220 0 0 {name=COUT
m=1
value=\{CLOAD\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 690 -150 3 0 {name=p17 sig_type=std_logic lab=GND}
C {lab_pin.sym} 630 -270 0 0 {name=p31 sig_type=std_logic lab=Voutp}
C {lab_pin.sym} 250 -370 0 0 {name=p1 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 250 -170 0 0 {name=p2 sig_type=std_logic lab=vss

}
C {lab_pin.sym} 60 -270 0 0 {name=p3 sig_type=std_logic lab=sel}
C {lab_pin.sym} 440 -310 2 0 {name=p4 sig_type=std_logic lab=Voutp}
C {lab_pin.sym} 440 -280 2 0 {name=p5 sig_type=std_logic lab=vref}
C {lab_pin.sym} 440 -250 2 0 {name=p6 sig_type=std_logic lab=vcm}
C {iopin.sym} 750 -340 0 0 {name=p18 lab=vref}
C {iopin.sym} 750 -300 0 0 {name=p7 lab=vcm}

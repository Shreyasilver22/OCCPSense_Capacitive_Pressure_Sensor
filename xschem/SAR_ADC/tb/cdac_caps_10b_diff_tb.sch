v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -220 -370 -220 -340 {
lab=GND}
N -220 -340 -220 -240 {
lab=GND}
N -220 -680 -220 -650 {
lab=vdd}
N -220 -290 -170 -290 {
lab=GND}
N -110 -290 -80 -290 {
lab=ainn}
N -110 -450 -80 -450 {
lab=ainp}
N -220 -470 -220 -370 {
lab=GND}
N -220 -590 -220 -470 {
lab=GND}
N -340 -610 -340 -580 {
lab=vss}
N -340 -520 -340 -490 {
lab=GND}
N -340 -490 -220 -490 {
lab=GND}
N -340 -380 -340 -350 {
lab=CLK}
N -340 -470 -340 -440 {
lab=GND}
N 1320 -480 1320 -440 {
lab=GND}
N 1320 -560 1320 -540 {
lab=Voutp}
N 1260 -560 1320 -560 {
lab=Voutp}
N 1460 -480 1460 -440 {
lab=GND}
N 1460 -560 1460 -540 {
lab=Voutn}
N 1400 -560 1460 -560 {
lab=Voutn}
N 1290 -850 1290 -820 {
lab=vdd}
N 1440 -780 1470 -780 {
lab=Voutn}
N 1440 -740 1470 -740 {
lab=Voutp}
N 1100 -780 1140 -780 {
lab=vcn}
N 1100 -760 1140 -760 {
lab=vcp}
N 1100 -740 1140 -740 {
lab=CLK}
N 1290 -700 1290 -670 {
lab=vss}
N -340 -490 -340 -470 {
lab=GND}
N -220 -450 -170 -450 {
lab=GND}
N 960 -910 1000 -910 {
lab=vcp}
N 960 -890 980 -890 {
lab=vcm}
N 980 -890 980 -690 {
lab=vcm}
N 960 -690 980 -690 {
lab=vcm}
N 960 -710 980 -710 {
lab=vcm}
N 960 -730 980 -730 {
lab=vcm}
N 960 -750 980 -750 {
lab=vcm}
N 960 -770 980 -770 {
lab=vcm}
N 960 -790 980 -790 {
lab=vcm}
N 960 -810 980 -810 {
lab=vcm}
N 960 -830 980 -830 {
lab=vcm}
N 960 -850 980 -850 {
lab=vcm}
N 960 -870 980 -870 {
lab=vcm}
N 960 -670 1000 -670 {
lab=vcn}
N 960 -650 980 -650 {
lab=vcm}
N 980 -650 980 -450 {
lab=vcm}
N 960 -450 980 -450 {
lab=vcm}
N 960 -470 980 -470 {
lab=vcm}
N 960 -490 980 -490 {
lab=vcm}
N 960 -510 980 -510 {
lab=vcm}
N 960 -530 980 -530 {
lab=vcm}
N 960 -550 980 -550 {
lab=vcm}
N 960 -570 980 -570 {
lab=vcm}
N 960 -590 980 -590 {
lab=vcm}
N 960 -610 980 -610 {
lab=vcm}
N 960 -630 980 -630 {
lab=vcm}
N 980 -530 1020 -530 {
lab=vcm}
N 980 -800 1000 -800 {
lab=vcm}
N 280 -920 280 -890 {
lab=vdd}
N 280 -770 280 -740 {
lab=vss}
N 430 -830 460 -830 {
lab=vcp}
N 100 -860 130 -860 {
lab=sample}
N 100 -840 130 -840 {
lab=sampleb}
N 100 -810 130 -810 {
lab=ainp}
N 280 -670 280 -640 {
lab=vdd}
N 280 -520 280 -490 {
lab=vss}
N 430 -580 460 -580 {
lab=vcn}
N 100 -610 130 -610 {
lab=sample}
N 100 -590 130 -590 {
lab=sampleb}
N 100 -560 130 -560 {
lab=ainn}
N -590 -380 -590 -350 {
lab=sample}
N -590 -600 -590 -570 {
lab=sampleb}
N -590 -510 -590 -440 {
lab=GND}
N -590 -490 -340 -490 {
lab=GND}
N -130 -550 -100 -550 {
lab=vcm}
N -220 -550 -190 -550 {
lab=GND}
C {vsource.sym} -140 -290 1 0 {name=V_VIN value="dc \{VCM - VDIFF/2\}" savecurrent=false}
C {vsource.sym} -220 -620 0 0 {name=VDD_SRC value="dc \{VDD\}" savecurrent=false}
C {gnd.sym} -220 -240 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -220 -680 0 0 {name=p24 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -80 -290 2 0 {name=p25 sig_type=std_logic lab=ainn}
C {vsource.sym} -140 -450 1 0 {name=V_VINP value="dc \{VCM + VDIFF/2\}" savecurrent=false}
C {lab_pin.sym} -80 -450 2 0 {name=p26 sig_type=std_logic lab=ainp}
C {vsource.sym} -340 -550 0 0 {name=V_VSS value="dc 0" savecurrent=false}
C {lab_pin.sym} -340 -610 0 0 {name=p28 sig_type=std_logic lab=vss

}
C {vsource.sym} -340 -410 2 0 {name=V_CLK value="PULSE(0 3.3 6n 20p 20p 4n 20n)" savecurrent=false}
C {lab_pin.sym} -340 -350 3 0 {name=p29 sig_type=std_logic lab=CLK}
C {code_shown.sym} 220 -315 0 0 {name=MODELS only_toplevel=true
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
C {code.sym} 1090 -290 0 0 {name=s1
only_toplevel=true
value="

.param VDD=3.3
.param VCM=1.65
.param VDIFF=10m
.param Cu=5f

* IMPORTANT:
* Your COUT/COUT1 use \{CLOAD\}, so this is comparator output load.
* CDAC input capacitance is set by Cu inside cdac_caps_10b_diff.
.param COUT_LOAD=20f

.options savecurrents
.options reltol=1e-4 abstol=1e-12 vntol=1e-6 method=gear

.save v(sample) v(sampleb) v(CLK)
.save v(ainp) v(ainn)
.save v(vcp) v(vcn)
.save v(Voutp) v(Voutn)
.save i(VDD_SRC)

.control

shell rm -f cdac_comp_review_results.txt

echo ================================================== > cdac_comp_review_results.txt
echo CDAC + TG sampler + StrongARM comparator review >> cdac_comp_review_results.txt
echo ================================================== >> cdac_comp_review_results.txt
echo VDD = 3.3 V >> cdac_comp_review_results.txt
echo VCM = 1.65 V >> cdac_comp_review_results.txt
echo Cu = 5 fF >> cdac_comp_review_results.txt
echo CDAC capacitance per side = 1024*Cu = 5.12 pF >> cdac_comp_review_results.txt
echo Comparator output load CLOAD = 20 fF >> cdac_comp_review_results.txt
echo TG NMOS = W 8u L 0.5u nf 1 m 4 total 32u >> cdac_comp_review_results.txt
echo TG PMOS = W 12u L 0.5u nf 1 m 8 total 96u >> cdac_comp_review_results.txt
echo SAMPLE = PULSE 3.3 to 0 at 5ns >> cdac_comp_review_results.txt
echo SAMPLEB = PULSE 0 to 3.3 at 5ns >> cdac_comp_review_results.txt
echo CLK = PULSE 0 to 3.3 at 6ns >> cdac_comp_review_results.txt
echo Track measured at 4.5ns sample ON >> cdac_comp_review_results.txt
echo Hold measured at 5.5ns sample OFF before comparator clock >> cdac_comp_review_results.txt
echo Output measured at 9ns after comparator decision >> cdac_comp_review_results.txt
echo PASS_SIGN: 1 correct polarity 0 wrong polarity 9 zero-diff not graded >> cdac_comp_review_results.txt
echo ================================================== >> cdac_comp_review_results.txt
echo columns: CASE VDIFF_SET EXP_SIGN sample_4p5 sample_5p5 clk_5p5 clk_6p5 ainp_4p5 ainn_4p5 vcp_4p5 vcn_4p5 track_err_p track_err_n vcp_5p5 vcn_5p5 vdiff_hold cm_hold voutp_9 voutn_9 outdiff_9 pass_sign iavg_0_9ns pavg_0_9ns >> cdac_comp_review_results.txt
echo ================================================== >> cdac_comp_review_results.txt

let vhigh = 2.5
let vlow  = 0.5

* ==================================================
* Test 1: +10 mV differential
* Expected: Voutp high, Voutn low
* ==================================================
alterparam VDIFF=10m
reset
tran 1p 12n

meas tran sample45 FIND v(sample) AT=4.5n
meas tran sample55 FIND v(sample) AT=5.5n
meas tran clk55 FIND v(CLK) AT=5.5n
meas tran clk65 FIND v(CLK) AT=6.5n

meas tran ainp45 FIND v(ainp) AT=4.5n
meas tran ainn45 FIND v(ainn) AT=4.5n
meas tran vcp45 FIND v(vcp) AT=4.5n
meas tran vcn45 FIND v(vcn) AT=4.5n

let track_err_p = abs(vcp45 - ainp45)
let track_err_n = abs(vcn45 - ainn45)

meas tran vcp55 FIND v(vcp) AT=5.5n
meas tran vcn55 FIND v(vcn) AT=5.5n

let vdiff_hold = vcp55 - vcn55
let cm_hold = 0.5*(vcp55 + vcn55)

meas tran voutp9 FIND v(Voutp) AT=9n
meas tran voutn9 FIND v(Voutn) AT=9n

let outdiff9 = voutp9 - voutn9
let pass_sign = 0
if outdiff9 > vhigh
  let pass_sign = 1
end

meas tran iavg AVG i(VDD_SRC) FROM=0n TO=9n
let pavg = abs(3.3*iavg)

echo POS10M 10m +1 $&sample45 $&sample55 $&clk55 $&clk65 $&ainp45 $&ainn45 $&vcp45 $&vcn45 $&track_err_p $&track_err_n $&vcp55 $&vcn55 $&vdiff_hold $&cm_hold $&voutp9 $&voutn9 $&outdiff9 $&pass_sign $&iavg $&pavg >> cdac_comp_review_results.txt


* ==================================================
* Test 2: -10 mV differential
* Expected: Voutp low, Voutn high
* ==================================================
alterparam VDIFF=-10m
reset
tran 1p 12n

meas tran sample45 FIND v(sample) AT=4.5n
meas tran sample55 FIND v(sample) AT=5.5n
meas tran clk55 FIND v(CLK) AT=5.5n
meas tran clk65 FIND v(CLK) AT=6.5n

meas tran ainp45 FIND v(ainp) AT=4.5n
meas tran ainn45 FIND v(ainn) AT=4.5n
meas tran vcp45 FIND v(vcp) AT=4.5n
meas tran vcn45 FIND v(vcn) AT=4.5n

let track_err_p = abs(vcp45 - ainp45)
let track_err_n = abs(vcn45 - ainn45)

meas tran vcp55 FIND v(vcp) AT=5.5n
meas tran vcn55 FIND v(vcn) AT=5.5n

let vdiff_hold = vcp55 - vcn55
let cm_hold = 0.5*(vcp55 + vcn55)

meas tran voutp9 FIND v(Voutp) AT=9n
meas tran voutn9 FIND v(Voutn) AT=9n

let outdiff9 = voutp9 - voutn9
let pass_sign = 0
if outdiff9 < -vhigh
  let pass_sign = 1
end

meas tran iavg AVG i(VDD_SRC) FROM=0n TO=9n
let pavg = abs(3.3*iavg)

echo NEG10M -10m -1 $&sample45 $&sample55 $&clk55 $&clk65 $&ainp45 $&ainn45 $&vcp45 $&vcn45 $&track_err_p $&track_err_n $&vcp55 $&vcn55 $&vdiff_hold $&cm_hold $&voutp9 $&voutn9 $&outdiff9 $&pass_sign $&iavg $&pavg >> cdac_comp_review_results.txt


* ==================================================
* Test 3: +0.5 LSB differential
* 0.5 LSB = 3.3/2048 = 1.611328125 mV
* Expected: Voutp high, Voutn low
* ==================================================
alterparam VDIFF=1.611328125m
reset
tran 1p 12n

meas tran sample45 FIND v(sample) AT=4.5n
meas tran sample55 FIND v(sample) AT=5.5n
meas tran clk55 FIND v(CLK) AT=5.5n
meas tran clk65 FIND v(CLK) AT=6.5n

meas tran ainp45 FIND v(ainp) AT=4.5n
meas tran ainn45 FIND v(ainn) AT=4.5n
meas tran vcp45 FIND v(vcp) AT=4.5n
meas tran vcn45 FIND v(vcn) AT=4.5n

let track_err_p = abs(vcp45 - ainp45)
let track_err_n = abs(vcn45 - ainn45)

meas tran vcp55 FIND v(vcp) AT=5.5n
meas tran vcn55 FIND v(vcn) AT=5.5n

let vdiff_hold = vcp55 - vcn55
let cm_hold = 0.5*(vcp55 + vcn55)

meas tran voutp9 FIND v(Voutp) AT=9n
meas tran voutn9 FIND v(Voutn) AT=9n

let outdiff9 = voutp9 - voutn9
let pass_sign = 0
if outdiff9 > vhigh
  let pass_sign = 1
end

meas tran iavg AVG i(VDD_SRC) FROM=0n TO=9n
let pavg = abs(3.3*iavg)

echo POS_HALF_LSB 1.611328125m +1 $&sample45 $&sample55 $&clk55 $&clk65 $&ainp45 $&ainn45 $&vcp45 $&vcn45 $&track_err_p $&track_err_n $&vcp55 $&vcn55 $&vdiff_hold $&cm_hold $&voutp9 $&voutn9 $&outdiff9 $&pass_sign $&iavg $&pavg >> cdac_comp_review_results.txt


* ==================================================
* Test 4: -0.5 LSB differential
* Expected: Voutp low, Voutn high
* ==================================================
alterparam VDIFF=-1.611328125m
reset
tran 1p 12n

meas tran sample45 FIND v(sample) AT=4.5n
meas tran sample55 FIND v(sample) AT=5.5n
meas tran clk55 FIND v(CLK) AT=5.5n
meas tran clk65 FIND v(CLK) AT=6.5n

meas tran ainp45 FIND v(ainp) AT=4.5n
meas tran ainn45 FIND v(ainn) AT=4.5n
meas tran vcp45 FIND v(vcp) AT=4.5n
meas tran vcn45 FIND v(vcn) AT=4.5n

let track_err_p = abs(vcp45 - ainp45)
let track_err_n = abs(vcn45 - ainn45)

meas tran vcp55 FIND v(vcp) AT=5.5n
meas tran vcn55 FIND v(vcn) AT=5.5n

let vdiff_hold = vcp55 - vcn55
let cm_hold = 0.5*(vcp55 + vcn55)

meas tran voutp9 FIND v(Voutp) AT=9n
meas tran voutn9 FIND v(Voutn) AT=9n

let outdiff9 = voutp9 - voutn9
let pass_sign = 0
if outdiff9 < -vhigh
  let pass_sign = 1
end

meas tran iavg AVG i(VDD_SRC) FROM=0n TO=9n
let pavg = abs(3.3*iavg)

echo NEG_HALF_LSB -1.611328125m -1 $&sample45 $&sample55 $&clk55 $&clk65 $&ainp45 $&ainn45 $&vcp45 $&vcn45 $&track_err_p $&track_err_n $&vcp55 $&vcn55 $&vdiff_hold $&cm_hold $&voutp9 $&voutn9 $&outdiff9 $&pass_sign $&iavg $&pavg >> cdac_comp_review_results.txt


* ==================================================
* Test 5: zero differential
* Not graded. Used to observe offset/metastability tendency.
* ==================================================
alterparam VDIFF=0
reset
tran 1p 12n

meas tran sample45 FIND v(sample) AT=4.5n
meas tran sample55 FIND v(sample) AT=5.5n
meas tran clk55 FIND v(CLK) AT=5.5n
meas tran clk65 FIND v(CLK) AT=6.5n

meas tran ainp45 FIND v(ainp) AT=4.5n
meas tran ainn45 FIND v(ainn) AT=4.5n
meas tran vcp45 FIND v(vcp) AT=4.5n
meas tran vcn45 FIND v(vcn) AT=4.5n

let track_err_p = abs(vcp45 - ainp45)
let track_err_n = abs(vcn45 - ainn45)

meas tran vcp55 FIND v(vcp) AT=5.5n
meas tran vcn55 FIND v(vcn) AT=5.5n

let vdiff_hold = vcp55 - vcn55
let cm_hold = 0.5*(vcp55 + vcn55)

meas tran voutp9 FIND v(Voutp) AT=9n
meas tran voutn9 FIND v(Voutn) AT=9n

let outdiff9 = voutp9 - voutn9
let pass_sign = 9

meas tran iavg AVG i(VDD_SRC) FROM=0n TO=9n
let pavg = abs(3.3*iavg)

echo ZERO 0 0 $&sample45 $&sample55 $&clk55 $&clk65 $&ainp45 $&ainn45 $&vcp45 $&vcn45 $&track_err_p $&track_err_n $&vcp55 $&vcn55 $&vdiff_hold $&cm_hold $&voutp9 $&voutn9 $&outdiff9 $&pass_sign $&iavg $&pavg >> cdac_comp_review_results.txt

echo ================================================== >> cdac_comp_review_results.txt
echo Review guide >> cdac_comp_review_results.txt
echo sample_4p5 should be near 3.3 and sample_5p5 should be near 0 >> cdac_comp_review_results.txt
echo clk_5p5 should be near 0 and clk_6p5 should be near 3.3 >> cdac_comp_review_results.txt
echo vcp_4p5 should track ainp_4p5 and vcn_4p5 should track ainn_4p5 >> cdac_comp_review_results.txt
echo vdiff_hold should have same sign as VDIFF_SET >> cdac_comp_review_results.txt
echo POS cases should have outdiff_9 positive and pass_sign 1 >> cdac_comp_review_results.txt
echo NEG cases should have outdiff_9 negative and pass_sign 1 >> cdac_comp_review_results.txt
echo ZERO case is not graded because real comparator offset/noise decides it >> cdac_comp_review_results.txt
echo ================================================== >> cdac_comp_review_results.txt

echo CDAC comparator review complete. Share cdac_comp_review_results.txt.
.endc

"}
C {capa.sym} 1320 -510 0 0 {name=COUT
m=1
value=\{COUT_LOAD\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 1320 -440 3 0 {name=p17 sig_type=std_logic lab=GND}
C {capa.sym} 1460 -510 0 0 {name=COUT1
m=1
value=\{COUT_LOAD\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 1460 -440 3 0 {name=p27 sig_type=std_logic lab=GND}
C {lab_pin.sym} 1260 -560 0 0 {name=p31 sig_type=std_logic lab=Voutp}
C {lab_pin.sym} 1400 -560 0 0 {name=p32 sig_type=std_logic lab=Voutn}
C {strong_arm_comp.sym} 1290 -760 0 0 {name=x1}
C {lab_pin.sym} 1100 -760 0 0 {name=p1 sig_type=std_logic lab=vcp}
C {lab_pin.sym} 1100 -780 0 0 {name=p2 sig_type=std_logic lab=vcn}
C {lab_pin.sym} 1100 -740 0 0 {name=p3 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 1470 -740 2 0 {name=p4 sig_type=std_logic lab=Voutp}
C {lab_pin.sym} 1470 -780 2 0 {name=p5 sig_type=std_logic lab=Voutn}
C {lab_pin.sym} 1290 -850 0 0 {name=p6 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 1290 -670 0 0 {name=p7 sig_type=std_logic lab=vss

}
C {cdac_caps_10b_diff.sym} 810 -680 0 0 {name=x2}
C {lab_pin.sym} 1020 -530 2 0 {name=p8 sig_type=std_logic lab=vcm


}
C {lab_pin.sym} 1000 -800 2 0 {name=p9 sig_type=std_logic lab=vcm


}
C {lab_pin.sym} 1000 -670 2 0 {name=p10 sig_type=std_logic lab=vcn


}
C {lab_pin.sym} 1000 -910 2 0 {name=p11 sig_type=std_logic lab=vcp


}
C {tg.sym} 280 -830 0 0 {name=x3}
C {lab_pin.sym} 280 -920 0 0 {name=p12 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 280 -740 0 0 {name=p13 sig_type=std_logic lab=vss

}
C {lab_pin.sym} 100 -860 0 0 {name=p14 sig_type=std_logic lab=sample}
C {lab_pin.sym} 100 -840 0 0 {name=p15 sig_type=std_logic lab=sampleb}
C {lab_pin.sym} 100 -810 0 0 {name=p16 sig_type=std_logic lab=ainp}
C {lab_pin.sym} 460 -830 2 0 {name=p18 sig_type=std_logic lab=vcp


}
C {tg.sym} 280 -580 0 0 {name=x4}
C {lab_pin.sym} 280 -670 0 0 {name=p19 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 280 -490 0 0 {name=p20 sig_type=std_logic lab=vss

}
C {lab_pin.sym} 100 -610 0 0 {name=p21 sig_type=std_logic lab=sample}
C {lab_pin.sym} 100 -590 0 0 {name=p22 sig_type=std_logic lab=sampleb}
C {lab_pin.sym} 100 -560 0 0 {name=p23 sig_type=std_logic lab=ainn}
C {lab_pin.sym} 460 -580 2 0 {name=p33 sig_type=std_logic lab=vcn


}
C {vsource.sym} -590 -410 2 0 {name=V_SAMPLE value="PULSE(3.3 0 5n 20p 20p 10n 20n)" savecurrent=false}
C {lab_pin.sym} -590 -350 3 0 {name=p30 sig_type=std_logic lab=sample}
C {vsource.sym} -590 -540 0 0 {name=V_SAMPLEB value="PULSE(0 3.3 5n 20p 20p 10n 20n)" savecurrent=false}
C {lab_pin.sym} -590 -600 1 0 {name=p34 sig_type=std_logic lab=sampleb}
C {vsource.sym} -160 -550 1 0 {name=V_VCM1 value="dc \{VCM\}" savecurrent=false}
C {lab_pin.sym} -100 -550 1 0 {name=V_VCM sig_type=std_logic lab=vcm

}

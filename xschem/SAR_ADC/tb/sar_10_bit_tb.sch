v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -310 -390 -310 -360 {
lab=GND}
N -310 -360 -310 -260 {
lab=GND}
N -310 -700 -310 -670 {
lab=vdd}
N -310 -310 -260 -310 {
lab=GND}
N -200 -310 -170 -310 {
lab=ainn}
N -200 -470 -170 -470 {
lab=ainp}
N -310 -490 -310 -390 {
lab=GND}
N -310 -610 -310 -490 {
lab=GND}
N -430 -630 -430 -600 {
lab=vss}
N -430 -540 -430 -510 {
lab=GND}
N -430 -510 -310 -510 {
lab=GND}
N -430 -400 -430 -370 {
lab=CLK}
N -430 -490 -430 -460 {
lab=GND}
N -430 -510 -430 -490 {
lab=GND}
N -310 -470 -260 -470 {
lab=GND}
N -220 -570 -190 -570 {
lab=vcm}
N -310 -570 -280 -570 {
lab=GND}
N -310 -260 -310 -40 {
lab=GND}
N -430 -130 -400 -130 {
lab=vrefp}
N -340 -130 -310 -130 {
lab=GND}
N -310 -155 -305 -155 {
lab=GND}
N -650 -510 -430 -510 {
lab=GND}
N -650 -420 -650 -390 {
lab=RSTN}
N -650 -510 -650 -480 {
lab=GND}
N -650 -620 -650 -590 {
lab=START}
N -650 -530 -650 -510 {
lab=GND}
N 240 -530 240 -500 {
lab=vdd}
N 60 -470 90 -470 {
lab=RSTN}
N 60 -430 90 -430 {
lab=START}
N 60 -390 90 -390 {
lab=vrefp}
N 60 -350 90 -350 {
lab=ainn}
N 60 -310 90 -310 {
lab=ainp}
N 60 -270 90 -270 {
lab=vcm}
N 60 -210 80 -210 {
lab=CLK}
N 80 -210 90 -210 {
lab=CLK}
N 240 -160 240 -140 {
lab=vss}
N 390 -470 420 -470 {
lab=busy}
N 390 -450 420 -450 {
lab=valid}
N 390 -430 420 -430 {
lab=C0}
N 390 -410 420 -410 {
lab=C1}
N 390 -390 420 -390 {
lab=C2}
N 390 -370 420 -370 {
lab=C3}
N 390 -350 420 -350 {
lab=C4}
N 390 -330 420 -330 {
lab=C5}
N 390 -310 420 -310 {
lab=C6}
N 390 -290 420 -290 {
lab=C7}
N 390 -270 420 -270 {
lab=C8}
N 390 -250 420 -250 {
lab=C9}
N 390 -210 420 -210 {
lab=Voutn}
C {sar_10_bit.sym} 240 -330 0 0 {name=x1}
C {vsource.sym} -230 -310 1 0 {name=V_VIN value="dc \{VCM - VDIFF/2\}" savecurrent=false}
C {vsource.sym} -310 -640 0 0 {name=VDD_SRC value="dc \{VDD\}" savecurrent=false}
C {gnd.sym} -310 -40 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -310 -700 0 0 {name=p24 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -170 -310 2 0 {name=p25 sig_type=std_logic lab=ainn}
C {vsource.sym} -230 -470 1 0 {name=V_VINP value="dc \{VCM + VDIFF/2\}" savecurrent=false}
C {lab_pin.sym} -170 -470 2 0 {name=p26 sig_type=std_logic lab=ainp}
C {vsource.sym} -430 -570 0 0 {name=V_VSS value="dc 0" savecurrent=false}
C {lab_pin.sym} -430 -630 0 0 {name=p28 sig_type=std_logic lab=vss

}
C {vsource.sym} -430 -430 2 0 {name=V_CLK value="PULSE(0 3.3 0n 20p 20p 10n 20n)" savecurrent=false}
C {lab_pin.sym} -430 -370 3 0 {name=p29 sig_type=std_logic lab=CLK}
C {vsource.sym} -250 -570 1 0 {name=V_VCM1 value="dc \{VCM\}" savecurrent=false}
C {lab_pin.sym} -190 -570 1 0 {name=V_VCM sig_type=std_logic lab=vcm

}
C {vsource.sym} -370 -130 3 0 {name=VREFP_SRC value="dc \{VDD\}" savecurrent=false}
C {lab_pin.sym} -430 -130 3 0 {name=V_VCM5 sig_type=std_logic lab=vrefp

}
C {vsource.sym} -650 -450 2 0 {name=V_RSTN value="PULSE(0 3.3 60n 20p 20p 10u 20u)" savecurrent=false}
C {lab_pin.sym} -650 -390 3 0 {name=p8 sig_type=std_logic lab=RSTN}
C {vsource.sym} -650 -560 0 0 {name=V_START value="PULSE(0 3.3 100n 20p 20p 20n 2u)" savecurrent=false}
C {lab_pin.sym} -650 -620 1 0 {name=p9 sig_type=std_logic lab=START}
C {code_shown.sym} 50 125 0 0 {name=MODELS only_toplevel=true
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
C {code.sym} 880 145 0 0 {name=s1
only_toplevel=true
value="
* ============================================================
* GF180 / SAR FSM + Comparator + CDAC mixed-signal testbench
* REAL DAC-switch version
* ============================================================

* Standard-cell SPICE and SAR FSM wrapper
.include /foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_sc_mcu7t5v0/spice/gf180mcu_fd_sc_mcu7t5v0.spice
.include /media/sf_LNA_chipathon/sar_adc_gf180/src/sar_fsm/sar_fsm_wrapper_fixed.spice

* ------------------------------------------------------------
* Main parameters
* ------------------------------------------------------------
.param VDD=3.3
.param VCM=1.65
.param VDIFF=0.001611328125



* ============================================================
* SAR ADC FULL-RANGE RAMP DEBUG THROUGH sar_10_bit SYMBOL
* Top ADC instance name: x1
*
* Top-level visible:
*   CLK RSTN START ainp ainn busy valid C9..C0 Voutn
*
* Internal to sar_10_bit:
*   x1.vcp, x1.vcn, x1.voutp
*   x1.sample, x1.sampleb, x1.comp_clk
*   x1.dbp9..x1.dbp0, x1.dbn9..x1.dbn0
*   x1.bp9..x1.bp0,   x1.bn9..x1.bn0
* ============================================================

.options reltol=1e-4 abstol=1e-12 vntol=1e-6
.options method=gear maxord=2
.options plotwinsize=0

* -----------------------------
* Save top-level nodes
* -----------------------------
.save v(CLK) v(RSTN) v(START)
.save v(ainp) v(ainn)
.save v(vrefp) v(vcm)
.save v(busy) v(valid)
.save v(Voutn)

.save v(C9) v(C8) v(C7) v(C6) v(C5)
.save v(C4) v(C3) v(C2) v(C1) v(C0)

* -----------------------------
* Save internal ADC debug nodes
* -----------------------------
.save v(x1.sample) v(x1.sampleb) v(x1.comp_clk)
.save v(x1.vcp) v(x1.vcn)
.save v(x1.voutp)

.save v(x1.dbp9) v(x1.dbp8) v(x1.dbp7) v(x1.dbp6) v(x1.dbp5)
.save v(x1.dbp4) v(x1.dbp3) v(x1.dbp2) v(x1.dbp1) v(x1.dbp0)

.save v(x1.dbn9) v(x1.dbn8) v(x1.dbn7) v(x1.dbn6) v(x1.dbn5)
.save v(x1.dbn4) v(x1.dbn3) v(x1.dbn2) v(x1.dbn1) v(x1.dbn0)

.save v(x1.bp9) v(x1.bp8) v(x1.bp7) v(x1.bp6) v(x1.bp5)
.save v(x1.bp4) v(x1.bp3) v(x1.bp2) v(x1.bp1) v(x1.bp0)

.save v(x1.bn9) v(x1.bn8) v(x1.bn7) v(x1.bn6) v(x1.bn5)
.save v(x1.bn4) v(x1.bn3) v(x1.bn2) v(x1.bn1) v(x1.bn0)


.control

set noaskquit

shell rm -f sar_fullrange_symbol_results.txt

let logic_th = 1.65
let prev_code = -1
let run_index = 0
let monotonic_fail_count = 0
let missing_jump_count = 0

echo VDIFF VIN_MEAS VALID_SEEN T_DEBUG CODE C9 C8 C7 C6 C5 C4 C3 C2 C1 C0 AINP AINN VCP VCN VCP_MINUS_VCN VOUTP VOUTN DBP9 DBP8 DBP7 DBP6 DBP5 DBP4 DBP3 DBP2 DBP1 DBP0 DBN9 DBN8 DBN7 DBN6 DBN5 DBN4 DBN3 DBN2 DBN1 DBN0 BP9 BP8 BP7 BP6 BP5 BP4 BP3 BP2 BP1 BP0 BN9 BN8 BN7 BN6 BN5 BN4 BN3 BN2 BN1 BN0 MONOTONIC_FAIL MISSING_JUMP > sar_fullrange_symbol_results.txt

* Full-range sanity sweep.
* LSB = 3.3/1024 = 3.22265625m
* 0.001611328125 = 0.5 LSB
* 0.00322265625  = 1 LSB
* 0.0064453125   = 2 LSB
foreach vdiff_val -1.6 -1.2 -0.8 -0.4 -0.1 -0.020 -0.010 -0.0064453125 -0.00322265625 -0.001611328125 0 0.001611328125 0.00322265625 0.0064453125 0.010 0.020 0.1 0.4 0.8 1.2 1.6

  alterparam VDIFF = $vdiff_val
  reset

  tran 20p 1.6u

  meas tran valid_max MAX v(valid) FROM=0n TO=1.6u

  let valid_seen = 0
  if valid_max > logic_th
    let valid_seen = 1
  end

  let t_debug = 1.55u
  if valid_seen > 0.5
    meas tran t_valid WHEN v(valid)=1.65 RISE=1
    let t_debug = t_valid + 5n
  end

  * -----------------------------
  * Top-level input check
  * -----------------------------
  meas tran ainpv FIND v(ainp) AT=$&t_debug
  meas tran ainnv FIND v(ainn) AT=$&t_debug
  let vin_meas = ainpv - ainnv

  * -----------------------------
  * Top-level code bits
  * -----------------------------
  meas tran c9v FIND v(C9) AT=$&t_debug
  meas tran c8v FIND v(C8) AT=$&t_debug
  meas tran c7v FIND v(C7) AT=$&t_debug
  meas tran c6v FIND v(C6) AT=$&t_debug
  meas tran c5v FIND v(C5) AT=$&t_debug
  meas tran c4v FIND v(C4) AT=$&t_debug
  meas tran c3v FIND v(C3) AT=$&t_debug
  meas tran c2v FIND v(C2) AT=$&t_debug
  meas tran c1v FIND v(C1) AT=$&t_debug
  meas tran c0v FIND v(C0) AT=$&t_debug

  let b9 = 0
  if c9v > logic_th
    let b9 = 1
  end

  let b8 = 0
  if c8v > logic_th
    let b8 = 1
  end

  let b7 = 0
  if c7v > logic_th
    let b7 = 1
  end

  let b6 = 0
  if c6v > logic_th
    let b6 = 1
  end

  let b5 = 0
  if c5v > logic_th
    let b5 = 1
  end

  let b4 = 0
  if c4v > logic_th
    let b4 = 1
  end

  let b3 = 0
  if c3v > logic_th
    let b3 = 1
  end

  let b2 = 0
  if c2v > logic_th
    let b2 = 1
  end

  let b1 = 0
  if c1v > logic_th
    let b1 = 1
  end

  let b0 = 0
  if c0v > logic_th
    let b0 = 1
  end

  let adc_code = 512*b9 + 256*b8 + 128*b7 + 64*b6 + 32*b5 + 16*b4 + 8*b3 + 4*b2 + 2*b1 + b0

  * -----------------------------
  * Internal ADC analog values
  * -----------------------------
  meas tran vcpv    FIND v(x1.vcp)    AT=$&t_debug
  meas tran vcnv    FIND v(x1.vcn)    AT=$&t_debug
  meas tran voutpv  FIND v(x1.voutp)  AT=$&t_debug
  meas tran voutnv  FIND v(Voutn)     AT=$&t_debug

  let vdiff_cdac = vcpv - vcnv

  * -----------------------------
  * Internal SAR DAC digital controls
  * -----------------------------
  meas tran dbp9v FIND v(x1.dbp9) AT=$&t_debug
  meas tran dbp8v FIND v(x1.dbp8) AT=$&t_debug
  meas tran dbp7v FIND v(x1.dbp7) AT=$&t_debug
  meas tran dbp6v FIND v(x1.dbp6) AT=$&t_debug
  meas tran dbp5v FIND v(x1.dbp5) AT=$&t_debug
  meas tran dbp4v FIND v(x1.dbp4) AT=$&t_debug
  meas tran dbp3v FIND v(x1.dbp3) AT=$&t_debug
  meas tran dbp2v FIND v(x1.dbp2) AT=$&t_debug
  meas tran dbp1v FIND v(x1.dbp1) AT=$&t_debug
  meas tran dbp0v FIND v(x1.dbp0) AT=$&t_debug

  meas tran dbn9v FIND v(x1.dbn9) AT=$&t_debug
  meas tran dbn8v FIND v(x1.dbn8) AT=$&t_debug
  meas tran dbn7v FIND v(x1.dbn7) AT=$&t_debug
  meas tran dbn6v FIND v(x1.dbn6) AT=$&t_debug
  meas tran dbn5v FIND v(x1.dbn5) AT=$&t_debug
  meas tran dbn4v FIND v(x1.dbn4) AT=$&t_debug
  meas tran dbn3v FIND v(x1.dbn3) AT=$&t_debug
  meas tran dbn2v FIND v(x1.dbn2) AT=$&t_debug
  meas tran dbn1v FIND v(x1.dbn1) AT=$&t_debug
  meas tran dbn0v FIND v(x1.dbn0) AT=$&t_debug

  * -----------------------------
  * Internal actual CDAC bottom plates
  * -----------------------------
  meas tran bp9v FIND v(x1.bp9) AT=$&t_debug
  meas tran bp8v FIND v(x1.bp8) AT=$&t_debug
  meas tran bp7v FIND v(x1.bp7) AT=$&t_debug
  meas tran bp6v FIND v(x1.bp6) AT=$&t_debug
  meas tran bp5v FIND v(x1.bp5) AT=$&t_debug
  meas tran bp4v FIND v(x1.bp4) AT=$&t_debug
  meas tran bp3v FIND v(x1.bp3) AT=$&t_debug
  meas tran bp2v FIND v(x1.bp2) AT=$&t_debug
  meas tran bp1v FIND v(x1.bp1) AT=$&t_debug
  meas tran bp0v FIND v(x1.bp0) AT=$&t_debug

  meas tran bn9v FIND v(x1.bn9) AT=$&t_debug
  meas tran bn8v FIND v(x1.bn8) AT=$&t_debug
  meas tran bn7v FIND v(x1.bn7) AT=$&t_debug
  meas tran bn6v FIND v(x1.bn6) AT=$&t_debug
  meas tran bn5v FIND v(x1.bn5) AT=$&t_debug
  meas tran bn4v FIND v(x1.bn4) AT=$&t_debug
  meas tran bn3v FIND v(x1.bn3) AT=$&t_debug
  meas tran bn2v FIND v(x1.bn2) AT=$&t_debug
  meas tran bn1v FIND v(x1.bn1) AT=$&t_debug
  meas tran bn0v FIND v(x1.bn0) AT=$&t_debug

  * -----------------------------
  * Checks
  * -----------------------------
  let monotonic_fail = 0
  let missing_jump = 0

  if run_index > 0
    if adc_code < prev_code
      let monotonic_fail = 1
      let monotonic_fail_count = monotonic_fail_count + 1
    end

    * This is only a coarse warning for this sparse sweep.
    * Large jumps are expected for large input steps, so only flag near-midscale small steps.
    if vdiff_val > -0.025
      if vdiff_val < 0.025
        if adc_code > prev_code + 4
          let missing_jump = 1
          let missing_jump_count = missing_jump_count + 1
        end
      end
    end
  end

  echo $vdiff_val $&vin_meas $&valid_seen $&t_debug $&adc_code $&b9 $&b8 $&b7 $&b6 $&b5 $&b4 $&b3 $&b2 $&b1 $&b0 $&ainpv $&ainnv $&vcpv $&vcnv $&vdiff_cdac $&voutpv $&voutnv $&dbp9v $&dbp8v $&dbp7v $&dbp6v $&dbp5v $&dbp4v $&dbp3v $&dbp2v $&dbp1v $&dbp0v $&dbn9v $&dbn8v $&dbn7v $&dbn6v $&dbn5v $&dbn4v $&dbn3v $&dbn2v $&dbn1v $&dbn0v $&bp9v $&bp8v $&bp7v $&bp6v $&bp5v $&bp4v $&bp3v $&bp2v $&bp1v $&bp0v $&bn9v $&bn8v $&bn7v $&bn6v $&bn5v $&bn4v $&bn3v $&bn2v $&bn1v $&bn0v $&monotonic_fail $&missing_jump >> sar_fullrange_symbol_results.txt

  let prev_code = adc_code
  let run_index = run_index + 1

end

echo ================================================== >> sar_fullrange_symbol_results.txt
echo RAMP_SUMMARY >> sar_fullrange_symbol_results.txt
echo number_of_points = $&run_index >> sar_fullrange_symbol_results.txt
echo monotonic_fail_count = $&monotonic_fail_count >> sar_fullrange_symbol_results.txt
echo missing_jump_count_sparse_near_midscale = $&missing_jump_count >> sar_fullrange_symbol_results.txt
echo Expected: code should move monotonically upward with VDIFF. >> sar_fullrange_symbol_results.txt
echo Expected: near VDIFF=0, code should be close to 511 or 512. >> sar_fullrange_symbol_results.txt
echo Expected: near VDIFF=-1.6, code should be close to low end. >> sar_fullrange_symbol_results.txt
echo Expected: near VDIFF=+1.6, code should be close to high end. >> sar_fullrange_symbol_results.txt
echo ================================================== >> sar_fullrange_symbol_results.txt

echo ==================================================
echo SAR full-range symbol-level ramp test complete.
echo Results written to sar_fullrange_symbol_results.txt
echo ==================================================

.endc

"}
C {lab_pin.sym} 60 -470 0 0 {name=p1 sig_type=std_logic lab=RSTN}
C {lab_pin.sym} 60 -430 0 0 {name=p2 sig_type=std_logic lab=START}
C {lab_pin.sym} 60 -390 0 0 {name=V_VCM2 sig_type=std_logic lab=vrefp

}
C {lab_pin.sym} 60 -350 0 0 {name=p3 sig_type=std_logic lab=ainn}
C {lab_pin.sym} 60 -310 0 0 {name=p4 sig_type=std_logic lab=ainp}
C {lab_pin.sym} 60 -270 0 0 {name=V_VCM3 sig_type=std_logic lab=vcm

}
C {lab_pin.sym} 60 -210 0 0 {name=p5 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 240 -530 0 0 {name=p6 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 240 -140 0 0 {name=p7 sig_type=std_logic lab=vss

}
C {opin.sym} 570 -445 0 0 {name=p125 lab=C1}
C {opin.sym} 570 -410 0 0 {name=p126 lab=C2}
C {opin.sym} 570 -370 0 0 {name=p127 lab=C3}
C {opin.sym} 570 -330 0 0 {name=p128 lab=C4}
C {opin.sym} 640 -445 0 0 {name=p129 lab=C5}
C {opin.sym} 640 -410 0 0 {name=p130 lab=C6}
C {opin.sym} 640 -370 0 0 {name=p131 lab=C7}
C {opin.sym} 640 -330 0 0 {name=p132 lab=C8}
C {opin.sym} 570 -480 0 0 {name=p133 lab=C0}
C {opin.sym} 640 -480 0 0 {name=p134 lab=C9}
C {opin.sym} 715 -480 0 0 {name=p135 lab=busy}
C {opin.sym} 715 -440 0 0 {name=p136 lab=valid}
C {lab_pin.sym} 420 -250 2 0 {name=p89 sig_type=std_logic lab=C9


}
C {lab_pin.sym} 420 -270 2 0 {name=p101 sig_type=std_logic lab=C8


}
C {lab_pin.sym} 420 -290 2 0 {name=p102 sig_type=std_logic lab=C7


}
C {lab_pin.sym} 420 -310 2 0 {name=p103 sig_type=std_logic lab=C6


}
C {lab_pin.sym} 420 -330 2 0 {name=p104 sig_type=std_logic lab=C5


}
C {lab_pin.sym} 420 -350 2 0 {name=p105 sig_type=std_logic lab=C4


}
C {lab_pin.sym} 420 -370 2 0 {name=p106 sig_type=std_logic lab=C3


}
C {lab_pin.sym} 420 -390 2 0 {name=p107 sig_type=std_logic lab=C2


}
C {lab_pin.sym} 420 -410 2 0 {name=p108 sig_type=std_logic lab=C1


}
C {lab_pin.sym} 420 -430 2 0 {name=p109 sig_type=std_logic lab=C0


}
C {iopin.sym} 585 -270 0 0 {name=p167 lab=Voutn}
C {lab_pin.sym} 420 -210 2 0 {name=p10 sig_type=std_logic lab=Voutn}
C {lab_pin.sym} 420 -470 2 0 {name=p115 sig_type=std_logic lab=busy
}
C {lab_pin.sym} 420 -450 2 0 {name=p116 sig_type=std_logic lab=valid}
C {title.sym} 160 0 0 0 {name=l1 author="Arjun Ananth"}

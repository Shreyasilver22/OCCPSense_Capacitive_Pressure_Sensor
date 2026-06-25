v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 30 -10 30 20 {
lab=GND}
N 30 20 30 120 {
lab=GND}
N 30 -320 30 -290 {
lab=vdd}
N 30 70 80 70 {
lab=GND}
N 140 70 170 70 {
lab=ng}
N 140 -20 170 -20 {
lab=pg}
N 50 -20 80 -20 {
lab=GND}
N 30 -20 50 -20 {
lab=GND}
N 30 -110 30 -10 {
lab=GND}
N 30 -230 30 -110 {
lab=GND}
N 210 -170 240 -170 {
lab=ng}
N 210 -150 240 -150 {
lab=pg}
N 210 -120 240 -120 {
lab=Va}
N 390 -220 390 -200 {
lab=vdd}
N 390 -80 390 -50 {
lab=vss}
N 540 -140 570 -140 {
lab=Voutp}
N -110 -180 -80 -180 {
lab=Va}
N -20 -180 10 -180 {
lab=GND}
N 10 -180 30 -180 {
lab=GND}
N -80 20 -80 50 {
lab=vss}
N -80 110 -80 120 {
lab=GND}
N -80 120 30 120 {
lab=GND}
N 720 -110 720 -70 {
lab=GND}
N 720 -190 720 -170 {
lab=Voutp}
N 660 -190 720 -190 {
lab=Voutp}
C {vsource.sym} 110 70 1 0 {name=VGN_SRC value=\{VGN\} savecurrent=false}
C {vsource.sym} 30 -260 0 0 {name=VDD_SRC value=\{VDD\} savecurrent=false}
C {gnd.sym} 30 120 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 30 -320 0 0 {name=p10 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 170 70 2 0 {name=p9 sig_type=std_logic lab=ng}
C {vsource.sym} 110 -20 1 0 {name=VGP_SRC value=\{VGP\} savecurrent=false}
C {lab_pin.sym} 170 -20 2 0 {name=p18 sig_type=std_logic lab=pg}
C {code.sym} 250 50 0 0 {name=s2 only_toplevel=false value="

.param VDD=3.3
.param VGN=3.3
.param VGP=0


.param N_WU=8u
.param P_WU=12u
.param N_L=0.5u
.param P_L=0.5u
.param N_NF=1
.param P_NF=1
.param nf=1

.param N_M=4
.param P_M=8

.param Cu=5f
.param CLOAD=5.12p

.options savecurrents
.options reltol=1e-4 abstol=1e-12 vntol=1e-6 method=gear

.save v(Va) v(Voutp) v(ng) v(pg) i(VDD_SRC)

.control

shell rm -f tg_final_bidirectional_results.txt
shell rm -f tg_final_candidates.txt

echo ================================================== > tg_final_bidirectional_results.txt
echo GF180MCU TG final bidirectional sizing sweep >> tg_final_bidirectional_results.txt
echo Purpose: SAR ADC CDAC sampling switch final sizing >> tg_final_bidirectional_results.txt
echo ================================================== >> tg_final_bidirectional_results.txt
echo VDD = 3.3 V >> tg_final_bidirectional_results.txt
echo Va source must be: PULSE(0 \{VDD\} 5n 20p 20p 7n 25n) >> tg_final_bidirectional_results.txt
echo Load = 5.12 pF >> tg_final_bidirectional_results.txt
echo Unit NMOS width = 8u, unit PMOS width = 12u, nf=1 >> tg_final_bidirectional_results.txt
echo Settling target = 0.5 LSB = 3.3/2048 = 1.611 mV >> tg_final_bidirectional_results.txt
echo Rising edge at 5 ns, falling edge at 12 ns >> tg_final_bidirectional_results.txt
echo . >> tg_final_bidirectional_results.txt
echo columns: N_M P_M N_Wtot_u P_Wtot_u Va_r4 Vout_r4 erise_4ns Va_f4 Vout_f4 efall_4ns pass_4ns Va_r5 Vout_r5 erise_5ns Va_f5 Vout_f5 efall_5ns pass_5ns >> tg_final_bidirectional_results.txt
echo ================================================== >> tg_final_bidirectional_results.txt

echo ================================================== > tg_final_candidates.txt
echo TG final candidates passing both rising and falling at 4 ns >> tg_final_candidates.txt
echo columns: N_M P_M N_Wtot_u P_Wtot_u erise_4ns efall_4ns erise_5ns efall_5ns >> tg_final_candidates.txt
echo ================================================== >> tg_final_candidates.txt

let err10 = 3.3/2048

alterparam N_WU=8u
alterparam P_WU=12u
alterparam N_L=0.5u
alterparam P_L=0.5u
alterparam N_NF=1
alterparam P_NF=1
alterparam VGN=3.3
alterparam VGP=0
alterparam VDD=3.3
alterparam CLOAD=5.12p

foreach nm 2 3 4 5 6

  foreach pm 6 7 8 9 10

    alterparam N_M=$nm
    alterparam P_M=$pm

    let nwtot_u = 8 * $nm
    let pwtot_u = 12 * $pm

    reset
    tran 2p 18n

    * Rising edge occurs at 5 ns.
    * Rising +4 ns = 9 ns.
    * Rising +5 ns = 10 ns.
    meas tran var4 FIND v(Va) AT=9n
    meas tran vor4 FIND v(Voutp) AT=9n
    meas tran var5 FIND v(Va) AT=10n
    meas tran vor5 FIND v(Voutp) AT=10n

    let er4 = abs(3.3 - vor4)
    let er5 = abs(3.3 - vor5)

    * Falling edge occurs at 12 ns.
    * Falling +4 ns = 16 ns.
    * Falling +5 ns = 17 ns.
    meas tran vaf4 FIND v(Va) AT=16n
    meas tran vof4 FIND v(Voutp) AT=16n
    meas tran vaf5 FIND v(Va) AT=17n
    meas tran vof5 FIND v(Voutp) AT=17n

    let ef4 = abs(vof4)
    let ef5 = abs(vof5)

    let pass4 = 0
    let pass5 = 0

    if er4 < err10
      if ef4 < err10
        let pass4 = 1
      end
    end

    if er5 < err10
      if ef5 < err10
        let pass5 = 1
      end
    end

    echo $nm $pm $&nwtot_u $&pwtot_u $&var4 $&vor4 $&er4 $&vaf4 $&vof4 $&ef4 $&pass4 $&var5 $&vor5 $&er5 $&vaf5 $&vof5 $&ef5 $&pass5 >> tg_final_bidirectional_results.txt

    if pass4 > 0.5
      echo $nm $pm $&nwtot_u $&pwtot_u $&er4 $&ef4 $&er5 $&ef5 >> tg_final_candidates.txt
    end

  end
end

echo TG final bidirectional sizing sweep complete.
.endc


"}
C {tg.sym} 390 -140 0 0 {name=x1}
C {lab_pin.sym} 210 -150 0 0 {name=p1 sig_type=std_logic lab=pg}
C {lab_pin.sym} 210 -170 0 0 {name=p2 sig_type=std_logic lab=ng}
C {vsource.sym} -50 -180 3 0 {name=V_a value="PULSE(0 \{VDD\} 5n 20p 20p 7n 25n)" savecurrent=false}
C {lab_pin.sym} -110 -180 0 0 {name=p19 sig_type=std_logic lab=Va}
C {lab_pin.sym} 210 -120 0 0 {name=p3 sig_type=std_logic lab=Va}
C {lab_pin.sym} 390 -220 0 0 {name=p4 sig_type=std_logic lab=vdd

}
C {vsource.sym} -80 80 0 0 {name=V_VSS value="dc 0" savecurrent=false}
C {lab_pin.sym} -80 20 0 0 {name=p28 sig_type=std_logic lab=vss

}
C {lab_pin.sym} 390 -50 0 0 {name=p5 sig_type=std_logic lab=vss

}
C {capa.sym} 720 -140 0 0 {name=COUT
m=1
value=\{CLOAD\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 720 -70 3 0 {name=p17 sig_type=std_logic lab=GND}
C {lab_pin.sym} 660 -190 0 0 {name=p31 sig_type=std_logic lab=Voutp}
C {lab_pin.sym} 570 -140 2 0 {name=p6 sig_type=std_logic lab=Voutp}
C {code_shown.sym} 530 95 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice

.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice res_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice moscap_typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice diode_typical

.include /foss/pdks/gf180mcuD/libs.ref/gf180mcu_fd_io/spice/gf180mcu_fd_io.spice
"}

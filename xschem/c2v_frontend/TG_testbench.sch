v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -180 90 -180 150 {lab=in}
N -180 90 130 90 {lab=in}
N 130 40 130 90 {lab=in}
N 120 170 180 170 {lab=vout}
N 180 -40 180 170 {lab=vout}
N 130 -40 180 -40 {lab=vout}
N -20 230 120 230 {lab=0}
N 120 190 120 230 {lab=0}
N -400 70 -400 230 {lab=0}
N -400 230 -350 230 {lab=0}
C {TG.sym} -20 0 0 0 {name=x1}
C {inverter.sym} -30 170 0 0 {name=x3}
C {vsource.sym} -350 200 0 0 {name=V1 value="PULSE( 0 3.3 0 1ns 1ns 2us 4us  ) " savecurrent=false}
C {vsource.sym} -260 140 0 0 {name=V2 value=3.3 savecurrent=false}
C {gnd.sym} -20 230 0 0 {name=l1 lab=0}
C {gnd.sym} -260 170 0 0 {name=l2 lab=0}
C {gnd.sym} -350 230 0 0 {name=l3 lab=0}
C {lab_pin.sym} -350 170 1 0 {name=p1 sig_type=std_logic lab=in
}
C {lab_pin.sym} -180 150 3 0 {name=p2 sig_type=std_logic lab=in
}
C {lab_pin.sym} -260 110 1 0 {name=p3 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 120 150 2 0 {name=p4 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 120 170 2 0 {name=p5 sig_type=std_logic lab=vout


}
C {lab_pin.sym} 130 -20 2 0 {name=p6 sig_type=std_logic lab=vdd

}
C {gnd.sym} 130 20 3 0 {name=l4 lab=0}
C {vsource.sym} -400 40 0 0 {name=V3 value=" PWL(0 0 10us 3.3)" savecurrent=false}
C {lab_pin.sym} -400 10 2 0 {name=p7 sig_type=std_logic lab=TGIN
}
C {lab_pin.sym} -170 -40 0 0 {name=p8 sig_type=std_logic lab=TGIN
}
C {lab_pin.sym} 130 0 2 0 {name=p9 sig_type=std_logic lab=TGOUT


}
C {code_shown.sym} 250 80 0 0 {name=models only_toplevel=false value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/smbb000149.ngspice typical
"}
C {code_shown.sym} 230 270 0 0 {name=sim only_toplevel=false value="
.temp 85
.control
save all
tran 10n 10u
write tb_trial.raw
plot TGIN TGOUT
.endc
.end
"}

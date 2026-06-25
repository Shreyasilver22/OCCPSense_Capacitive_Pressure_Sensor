v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 70 160 70 {lab=0}
N 160 30 160 70 {lab=0}
C {inverter.sym} 10 10 0 0 {name=x1}
C {vsource.sym} -310 40 0 0 {name=V1 value="PULSE( 0 3.3 0 0ns 0ns 50ns 100ns 1 ) " savecurrent=false}
C {vsource.sym} -220 -20 0 0 {name=V2 value=3.3 savecurrent=false}
C {gnd.sym} 20 70 0 0 {name=l1 lab=0}
C {gnd.sym} -220 10 0 0 {name=l2 lab=0}
C {gnd.sym} -310 70 0 0 {name=l3 lab=0}
C {lab_pin.sym} -310 10 1 0 {name=p1 sig_type=std_logic lab=in
}
C {lab_pin.sym} -140 -10 1 0 {name=p2 sig_type=std_logic lab=in
}
C {lab_pin.sym} -220 -50 1 0 {name=p3 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 160 -10 2 0 {name=p4 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 160 10 2 0 {name=p5 sig_type=std_logic lab=vout


}
C {code_shown.sym} 30 -320 0 0 {name=sim only_toplevel=false value="
.temp 85
.control
save all
tran 0.1n 100n
write inverter_trial.raw
plot in out
.endc
.end
"}
C {code_shown.sym} -730 -220 0 0 {name=models only_toplevel=false value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/smbb000149.ngspice typical
"}

v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 290 -465 290 -435 {
lab=vdd}
N 290 -315 290 -285 {
lab=vss}
N 440 -375 470 -375 {
lab=out}
N 110 -405 140 -405 {
lab=sel}
N 110 -385 140 -385 {
lab=selb}
N 110 -355 140 -355 {
lab=vref}
N 290 -245 290 -215 {
lab=vdd}
N 290 -95 290 -65 {
lab=vss}
N 440 -155 470 -155 {
lab=out}
N 110 -185 140 -185 {
lab=selb}
N 110 -165 140 -165 {
lab=sel}
N 110 -135 140 -135 {
lab=vcm}
N 520 -280 550 -280 {
lab=sel}
N 700 -350 700 -330 {
lab=vdd}
N 850 -280 880 -280 {
lab=selb}
N 700 -230 700 -200 {
lab=vss}
C {ipin.sym} 1020 -350 0 0 {name=p9 lab=sel
}
C {iopin.sym} 980 -240 0 0 {name=p11 lab=vdd}
C {iopin.sym} 980 -200 0 0 {name=p18 lab=vref}
C {iopin.sym} 980 -160 0 0 {name=p1 lab=vcm}
C {iopin.sym} 980 -280 0 0 {name=p3 lab=vss}
C {iopin.sym} 980 -310 0 0 {name=p2 lab=out}
C {tg.sym} 290 -375 0 0 {name=x3}
C {lab_pin.sym} 290 -465 0 0 {name=p12 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 290 -285 0 0 {name=p13 sig_type=std_logic lab=vss

}
C {lab_pin.sym} 110 -405 0 0 {name=p14 sig_type=std_logic lab=sel}
C {lab_pin.sym} 110 -385 0 0 {name=p15 sig_type=std_logic lab=selb}
C {lab_pin.sym} 110 -355 0 0 {name=p16 sig_type=std_logic lab=vref}
C {lab_pin.sym} 470 -375 2 0 {name=p4 sig_type=std_logic lab=out


}
C {tg.sym} 290 -155 0 0 {name=x1}
C {lab_pin.sym} 290 -245 0 0 {name=p5 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 290 -65 0 0 {name=p6 sig_type=std_logic lab=vss

}
C {lab_pin.sym} 110 -185 0 0 {name=p7 sig_type=std_logic lab=selb}
C {lab_pin.sym} 110 -165 0 0 {name=p8 sig_type=std_logic lab=sel}
C {lab_pin.sym} 110 -135 0 0 {name=p10 sig_type=std_logic lab=vcm}
C {lab_pin.sym} 470 -155 2 0 {name=p17 sig_type=std_logic lab=out


}
C {inverter.sym} 700 -280 0 0 {name=x2}
C {lab_pin.sym} 520 -280 0 0 {name=p19 sig_type=std_logic lab=sel}
C {lab_pin.sym} 880 -280 2 0 {name=p20 sig_type=std_logic lab=selb}
C {lab_pin.sym} 700 -350 0 0 {name=p21 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 700 -200 0 0 {name=p22 sig_type=std_logic lab=vss

}
C {title.sym} 160 0 0 0 {name=l1 author="Arjun Ananth"}

v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -690 -20 -630 -20 {lab=TGOUT}
N -630 -30 -630 -20 {lab=TGOUT}
N -1270 50 -1270 210 {lab=0}
N -1270 210 -1220 210 {lab=0}
N -480 -30 -480 10 {lab=#net1}
N -570 -30 -480 -30 {lab=#net1}
N -150 -40 -150 -30 {lab=#net2}
N -210 -30 -150 -30 {lab=#net2}
N -480 -30 -270 -30 {lab=#net1}
N -690 -20 -690 50 {lab=TGOUT}
N -740 -20 -690 -20 {lab=TGOUT}
N -500 10 -500 50 {lab=#net1}
N -500 10 -480 10 {lab=#net1}
N 80 -390 380 -390 {lab=CDOUT}
N 380 -390 380 10 {lab=CDOUT}
N 370 10 380 10 {lab=CDOUT}
N -150 -20 70 -20 {lab=#net2}
N -150 -30 -150 -20 {lab=#net2}
N -900 350 -730 350 {lab=#net3}
N -1220 410 -900 410 {lab=0}
N -1220 210 -1220 410 {lab=0}
N -530 425 -530 435 {lab=0}
N -540 350 -530 350 {lab=0}
N -535 505 -535 570 {lab=0}
N -535 425 -530 425 {lab=0}
N -530 350 -530 425 {lab=0}
N -670 505 -535 505 {lab=0}
N -535 425 -535 505 {lab=0}
N -675 570 -535 570 {lab=0}
N -1235 500 -1220 500 {lab=0}
N -1220 410 -1220 500 {lab=0}
N 370 10 370 40 {lab=CDOUT}
N -330 -390 -330 -330 {lab=#net4}
N -110 -390 20 -390 {lab=#net4}
N -110 -390 -110 -340 {lab=#net4}
N -330 -390 -110 -390 {lab=#net4}
C {/foss/pdks/gf180mcuD/libs.tech/xschem/symbols/cap_mim_1f0fF.sym} -600 -30 3 0 {name=C1
W=31.62u
L=31.62u
model=cap_mim_1f0fF
spiceprefix=X
m=1}
C {/foss/pdks/gf180mcuD/libs.tech/xschem/symbols/cap_mim_1f0fF.sym} 50 -390 1 0 {name=C2
W=22.36e-6
L=22.36e-6
model=cap_mim_1f0fF
spiceprefix=X
m=1}
C {TG.sym} -330 -180 3 0 {name=x2}
C {TG.sym} -500 200 3 0 {name=x3}
C {TG.sym} -890 -20 0 0 {name=x4}
C {inverter.sym} -880 -280 0 0 {name=x5}
C {vsource.sym} -1220 180 0 0 {name=V1 value="PULSE( 0 3.3 0 1ns 1ns 2us 5us  ) " savecurrent=false}
C {vsource.sym} -1130 120 0 0 {name=V2 value=3.3 savecurrent=false}
C {gnd.sym} -730 -260 0 0 {name=l1 lab=0}
C {gnd.sym} -1130 150 0 0 {name=l2 lab=0}
C {gnd.sym} -1220 210 0 0 {name=l3 lab=0}
C {lab_pin.sym} -1220 150 1 0 {name=p1 sig_type=std_logic lab=in
}
C {lab_pin.sym} -1030 -300 3 0 {name=p2 sig_type=std_logic lab=in
}
C {lab_pin.sym} -1130 90 1 0 {name=p3 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -730 -300 2 0 {name=p4 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -740 -40 2 0 {name=p6 sig_type=std_logic lab=vdd

}
C {gnd.sym} -740 0 3 0 {name=l4 lab=0}
C {vsource.sym} -1270 20 0 0 {name=V3 value=2.15 savecurrent=false}
C {lab_pin.sym} -1270 -10 2 0 {name=p7 sig_type=std_logic lab=TGIN
}
C {lab_pin.sym} -1040 -60 0 0 {name=p8 sig_type=std_logic lab=TGIN
}
C {lab_pin.sym} -740 -20 2 0 {name=p9 sig_type=std_logic lab=TGOUT


}
C {code_shown.sym} -1270 -430 0 0 {name=sim only_toplevel=false value="
.temp 85
.control
save all
tran 15n 25u
write cds_v1.raw
plot CDOUT
.endc
.end
"}
C {lab_pin.sym} -520 50 1 0 {name=p10 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -350 -330 1 0 {name=p11 sig_type=std_logic lab=vdd

}
C {gnd.sym} -310 -330 2 0 {name=l6 lab=0}
C {/foss/designs/OCCPSense_Capacitive_Pressure_Sensor/xschem/ota/2-stage-opamp/op-amp.sym} 220 10 0 0 {name=x1}
C {lab_pin.sym} -740 20 3 0 {name=p12 sig_type=std_logic lab=in
}
C {TG.sym} -110 -190 3 0 {name=x6}
C {/foss/pdks/gf180mcuD/libs.tech/xschem/symbols/cap_mim_1f0fF.sym} -240 -30 1 0 {name=C3
W=31.62u
L=31.62e-6
model=cap_mim_1f0fF
spiceprefix=X
m=1}
C {TG.sym} -690 200 3 0 {name=x7}
C {gnd.sym} -90 -340 2 0 {name=l5 lab=0}
C {lab_pin.sym} -130 -340 1 0 {name=p13 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -460 50 1 0 {name=p15 sig_type=std_logic lab=in
}
C {lab_pin.sym} -70 -340 1 0 {name=p14 sig_type=std_logic lab=in
}
C {lab_pin.sym} -710 50 1 0 {name=p16 sig_type=std_logic lab=vdd

}
C {gnd.sym} -670 50 2 0 {name=l7 lab=0}
C {gnd.sym} -480 50 2 0 {name=l8 lab=0}
C {gnd.sym} -540 350 0 0 {name=l9 lab=0}
C {lab_pin.sym} -650 50 1 0 {name=p20 sig_type=std_logic lab=phi2in


}
C {lab_pin.sym} -730 50 1 0 {name=p21 sig_type=std_logic lab=phi2barin

}
C {gnd.sym} 70 0 1 0 {name=l10 lab=0}
C {vsource.sym} -900 380 0 0 {name=V4 value=1.65 savecurrent=false}
C {lab_pin.sym} 70 20 0 0 {name=p24 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 70 40 0 0 {name=p25 sig_type=std_logic lab=Vbias_out}
C {vsource.sym} -500 435 1 0 {name=V_VBIAS value=0.7 savecurrent=false}
C {lab_pin.sym} -470 435 2 0 {name=p28 sig_type=std_logic lab=Vbias}
C {vsource.sym} -505 530 1 0 {name=V_VBIAS1 value=0.6638 savecurrent=false}
C {lab_pin.sym} -475 530 2 0 {name=p26 sig_type=std_logic lab=Vbias_out}
C {vsource.sym} -700 505 3 0 {name=Vdd value=3.3 savecurrent=false}
C {vsource.sym} -705 570 3 0 {name=Vss value=-3.3 savecurrent=false}
C {lab_pin.sym} 220 -50 1 0 {name=p27 sig_type=std_logic lab=Vdd}
C {lab_pin.sym} 220 70 3 0 {name=p29 sig_type=std_logic lab=Vss}
C {lab_pin.sym} -735 570 0 0 {name=p30 sig_type=std_logic lab=Vss}
C {lab_pin.sym} -730 505 0 0 {name=p31 sig_type=std_logic lab=Vdd}
C {vsource.sym} -1265 500 3 0 {name=V5 value="PULSE( 0 3.3 2.5us 1ns 1ns 2us 5us  ) " savecurrent=false}
C {lab_pin.sym} -290 -330 1 0 {name=p32 sig_type=std_logic lab=phi2in


}
C {lab_pin.sym} -370 -330 1 0 {name=p22 sig_type=std_logic lab=phi2barin

}
C {lab_pin.sym} -730 -430 2 0 {name=p23 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -1295 500 1 0 {name=p33 sig_type=std_logic lab=phi2in


}
C {inverter.sym} -880 -410 0 0 {name=x8}
C {lab_pin.sym} -1030 -430 1 0 {name=p34 sig_type=std_logic lab=phi2in


}
C {lab_pin.sym} -730 -410 2 0 {name=p35 sig_type=std_logic lab=phi2barin


}
C {gnd.sym} -730 -390 0 0 {name=l11 lab=0}
C {code_shown.sym} -190 180 0 0 {name=MODELS only_toplevel=true
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
C {lab_pin.sym} 370 40 2 0 {name=p36 sig_type=std_logic lab=CDOUT}
C {lab_pin.sym} -730 -280 2 0 {name=p5 sig_type=std_logic lab=Phi1bar}
C {lab_pin.sym} -150 -340 1 0 {name=p17 sig_type=std_logic lab=Phi1bar}
C {lab_pin.sym} -540 50 1 0 {name=p18 sig_type=std_logic lab=Phi1bar}
C {lab_pin.sym} -740 -60 2 0 {name=p19 sig_type=std_logic lab=Phi1bar}

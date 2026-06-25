v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -200 -230 -200 -200 {
lab=GND}
N -200 -200 -200 -100 {
lab=GND}
N -200 -540 -200 -510 {
lab=vdd}
N -200 -150 -150 -150 {
lab=GND}
N -90 -150 -60 -150 {
lab=Vinn}
N -200 -330 -200 -230 {
lab=GND}
N -200 -450 -200 -330 {
lab=GND}
N -320 -470 -320 -440 {
lab=vss}
N -320 -380 -320 -350 {
lab=GND}
N -320 -350 -200 -350 {
lab=GND}
N 670 -170 670 -130 {
lab=GND}
N 670 -250 670 -230 {
lab=Voutp}
N 610 -250 670 -250 {
lab=Voutp}
N 20 -280 50 -280 {
lab=Vinn}
N 200 -350 200 -330 {
lab=vdd}
N 350 -280 380 -280 {
lab=Voutp}
N 200 -230 200 -200 {
lab=#net1}
C {vsource.sym} -120 -150 1 0 {name=V_VIN value="dc \{VCM - VDIFF/2\}" savecurrent=false}
C {vsource.sym} -200 -480 0 0 {name=VDD_SRC value="dc \{VDD\}" savecurrent=false}
C {gnd.sym} -200 -100 0 0 {name=l3 lab=GND}
C {lab_pin.sym} -200 -540 0 0 {name=p24 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} -60 -150 2 0 {name=p25 sig_type=std_logic lab=Vinn}
C {vsource.sym} -320 -410 0 0 {name=V_VSS value="dc 0" savecurrent=false}
C {lab_pin.sym} -320 -470 0 0 {name=p28 sig_type=std_logic lab=vss

}
C {code_shown.sym} 20 55 0 0 {name=MODELS only_toplevel=true
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
C {code.sym} 890 80 0 0 {name=s1
only_toplevel=true
value="

"}
C {capa.sym} 670 -200 0 0 {name=COUT
m=1
value=\{CLOAD\}
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 670 -130 3 0 {name=p17 sig_type=std_logic lab=GND}
C {lab_pin.sym} 610 -250 0 0 {name=p31 sig_type=std_logic lab=Voutp}
C {inverter.sym} 200 -280 0 0 {name=x1}
C {lab_pin.sym} 20 -280 0 0 {name=p1 sig_type=std_logic lab=Vinn}
C {lab_pin.sym} 380 -280 2 0 {name=p2 sig_type=std_logic lab=Voutp}
C {lab_pin.sym} 200 -350 0 0 {name=p3 sig_type=std_logic lab=vdd

}
C {lab_pin.sym} 200 -200 0 0 {name=p4 sig_type=std_logic lab=vss

}

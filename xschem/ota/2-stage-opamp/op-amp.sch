v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 50 -220 80 -220 {
lab=Vinn}
N 320 -220 350 -220 {
lab=Vinp}
N 120 -190 120 -160 {
lab=#net1}
N 120 -160 280 -160 {
lab=#net1}
N 280 -190 280 -160 {
lab=#net1}
N 210 -160 210 -140 {
lab=#net1}
N 210 -80 210 -60 {
lab=vss}
N 120 -110 170 -110 {
lab=Vbias}
N 120 -350 120 -250 {
lab=#net2}
N 280 -350 280 -250 {
lab=Vx}
N 120 -440 120 -410 {
lab=vdd}
N 120 -440 280 -440 {
lab=vdd}
N 280 -440 280 -410 {
lab=vdd}
N 90 -380 120 -380 {
lab=vdd}
N 90 -420 90 -380 {
lab=vdd}
N 90 -420 120 -420 {
lab=vdd}
N 280 -380 300 -380 {
lab=vdd}
N 300 -420 300 -380 {
lab=vdd}
N 280 -420 300 -420 {
lab=vdd}
N 120 -220 280 -220 {
lab=vss}
N 160 -380 240 -380 {
lab=#net2}
N 200 -380 200 -340 {
lab=#net2}
N 120 -340 200 -340 {
lab=#net2}
N 280 -440 500 -440 {
lab=vdd}
N 660 -440 660 -350 {
lab=vdd}
N 660 -290 660 -140 {
lab=Vout}
N 280 -320 460 -320 {
lab=Vx}
N 660 -320 690 -320 {
lab=vdd}
N 690 -370 690 -320 {
lab=vdd}
N 660 -370 690 -370 {
lab=vdd}
N 660 -80 660 -60 {
lab=vss}
N 270 -60 500 -60 {
lab=vss}
N 260 -60 270 -60 {
lab=vss}
N 250 -60 260 -60 {
lab=vss}
N 210 -60 250 -60 {
lab=vss}
N 360 -60 360 -40 {
lab=vss}
N 570 -110 620 -110 {
lab=Vbias_out}
N 210 -110 240 -110 {
lab=vss}
N 240 -110 240 -60 {
lab=vss}
N 660 -110 690 -110 {
lab=vss}
N 690 -110 690 -60 {
lab=vss}
N 660 -60 690 -60 {
lab=vss}
N 500 -440 660 -440 {
lab=vdd}
N 500 -60 660 -60 {
lab=vss}
N 460 -320 620 -320 {
lab=Vx}
N 610 -210 660 -210 {
lab=Vout}
N 470 -230 470 -210 {
lab=#net3}
N 470 -210 550 -210 {
lab=#net3}
N 470 -320 470 -290 {
lab=Vx}
N 400 -260 450 -260 {
lab=vss}
C {symbols/nfet_03v3.sym} 100 -220 0 0 {name=M1
L=0.5u
W=20u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 190 -110 0 0 {name=M4
L=1u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 260 -380 0 0 {name=M5
L=0.5u
W=40u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 50 -220 0 0 {name=p13 sig_type=std_logic lab=Vinn}
C {lab_pin.sym} 350 -220 2 0 {name=p1 sig_type=std_logic lab=Vinp}
C {symbols/nfet_03v3.sym} 300 -220 0 1 {name=M3
L=0.5u
W=20u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 120 -110 0 0 {name=p2 sig_type=std_logic lab=Vbias}
C {lab_pin.sym} 360 -40 3 0 {name=p3 sig_type=std_logic lab=vss}
C {lab_pin.sym} 200 -440 1 0 {name=p4 sig_type=std_logic lab=vdd}
C {symbols/nfet_03v3.sym} 640 -110 0 0 {name=M7
L=1u
W=30u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 570 -110 0 0 {name=p5 sig_type=std_logic lab=Vbias_out}
C {lab_pin.sym} 200 -220 1 0 {name=p6 sig_type=std_logic lab=vss}
C {lab_pin.sym} 660 -250 2 0 {name=p7 sig_type=std_logic lab=Vout}
C {lab_pin.sym} 280 -280 2 0 {name=p8 sig_type=std_logic lab=Vx}
C {symbols/cap_mim_2f0fF.sym} 580 -210 3 0 {name=C2
W=24u
L=24u
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/pfet_03v3.sym} 140 -380 0 1 {name=M2
L=0.5u
W=40u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 640 -320 0 0 {name=M8
L=0.5u
W=40u
nf=1
m=3
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/ppolyf_u_1k.sym} 470 -260 0 0 {name=R2
W=1u
L=8.2u
model=ppolyf_u_1k
spiceprefix=X
m=1}
C {lab_pin.sym} 400 -260 0 0 {name=p16 sig_type=std_logic lab=vss}
C {ipin.sym} 900 -400 0 0 {name=p9 lab=Vinn}
C {opin.sym} 940 -400 0 0 {name=p10 lab=Vout}
C {iopin.sym} 940 -360 0 0 {name=p11 lab=vdd}
C {ipin.sym} 900 -360 0 0 {name=p12 lab=Vinp}
C {ipin.sym} 900 -320 0 0 {name=p15 lab=Vbias}
C {ipin.sym} 900 -280 0 0 {name=p17 lab=Vbias_out}
C {iopin.sym} 940 -320 0 0 {name=p18 lab=vss}

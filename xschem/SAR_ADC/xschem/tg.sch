v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 440 -210 480 -210 {
lab=b}
N 330 -310 380 -310 {
lab=b}
N 380 -310 380 -130 {
lab=b}
N 330 -130 380 -130 {
lab=b}
N 230 -130 270 -130 {
lab=a}
N 230 -310 230 -130 {
lab=a}
N 230 -310 270 -310 {
lab=a}
N 300 -90 300 -50 {
lab=pg}
N 300 -390 300 -350 {
lab=ng}
N 300 -170 300 -130 {
lab=vdd}
N 300 -310 300 -270 {
lab=vss}
N 210 -200 230 -200 {
lab=a}
N 380 -210 440 -210 {
lab=b}
N 140 -200 210 -200 {
lab=a}
C {lab_pin.sym} 480 -210 2 0 {name=p14 sig_type=std_logic lab=b}
C {symbols/pfet_03v3.sym} 300 -110 3 0 {name=M2
L=0.5u
W=12u
nf=1
m=8
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 300 -330 1 0 {name=M1
L=0.5u
W=8u
nf=1
m=4
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {lab_pin.sym} 300 -390 0 0 {name=p2 sig_type=std_logic lab=ng}
C {lab_pin.sym} 300 -50 0 0 {name=p15 sig_type=std_logic lab=pg
}
C {lab_pin.sym} 300 -170 0 0 {name=p16 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 300 -270 0 0 {name=p17 sig_type=std_logic lab=vss}
C {lab_pin.sym} 140 -200 0 0 {name=p4 sig_type=std_logic lab=a}
C {ipin.sym} 550 -370 0 0 {name=p9 lab=ng
}
C {iopin.sym} 590 -330 0 0 {name=p11 lab=vdd}
C {ipin.sym} 550 -330 0 0 {name=p12 lab=pg}
C {iopin.sym} 590 -290 0 0 {name=p18 lab=a}
C {iopin.sym} 590 -250 0 0 {name=p1 lab=b}
C {iopin.sym} 590 -370 0 0 {name=p3 lab=vss}
C {title.sym} 160 0 0 0 {name=l1 author="Arjun Ananth"}

v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 220 -310 220 -210 {
lab=Voutp}
N 220 -470 220 -370 {
lab=vdd}
N 220 -150 220 -70 {
lab=vss}
N 220 -180 250 -180 {
lab=vss}
N 150 -340 180 -340 {
lab=Vinn}
N 150 -340 150 -180 {
lab=Vinn}
N 150 -180 180 -180 {
lab=Vinn}
N 220 -340 250 -340 {
lab=vdd}
N 250 -390 250 -340 {
lab=vdd}
N 220 -390 250 -390 {
lab=vdd}
N 250 -180 250 -120 {
lab=vss}
N 220 -120 250 -120 {
lab=vss}
N 90 -260 150 -260 {
lab=Vinn}
N 220 -260 310 -260 {
lab=Voutp}
C {symbols/pfet_03v3.sym} 200 -340 0 0 {name=M12
L=0.5u
W=8u
nf=2
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
C {symbols/nfet_03v3.sym} 200 -180 0 0 {name=M13
L=0.5u
W=4u
nf=2
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
C {iopin.sym} 220 -470 3 0 {name=p11 lab=vdd}
C {iopin.sym} 220 -70 1 0 {name=p18 lab=vss}
C {ipin.sym} 90 -260 0 0 {name=p9 lab=Vinn}
C {opin.sym} 310 -260 0 0 {name=p30 lab=Voutp}
C {title.sym} 160 0 0 0 {name=l1 author="Arjun Ananth"}

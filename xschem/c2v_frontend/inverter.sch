v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -0 -40 0 -20 {lab=out}
N -100 -100 -40 -100 {lab=in}
N -100 -100 -100 10 {lab=in}
N -100 10 -40 10 {lab=in}
N -0 -40 120 -40 {lab=out}
N 0 -70 -0 -40 {lab=out}
N 0 -160 -0 -130 {lab=vdd}
N -0 -100 20 -100 {lab=vdd}
N 20 -160 20 -100 {lab=vdd}
N 0 -160 20 -160 {lab=vdd}
N -0 -180 0 -160 {lab=vdd}
N 0 60 0 90 {lab=gnd}
N -0 10 20 10 {lab=gnd}
N 20 10 20 60 {lab=gnd}
N 0 60 20 60 {lab=gnd}
N 0 40 0 60 {lab=gnd}
C {/foss/pdks/gf180mcuD/libs.tech/xschem/symbols/pfet_03v3.sym} -20 -100 0 0 {name=M1
L=0.28u
W=0.22u
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
C {/foss/pdks/gf180mcuD/libs.tech/xschem/symbols/nfet_03v3.sym} -20 10 0 0 {name=M2
L=0.28u
W=0.22u
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
C {iopin.sym} 0 -180 3 0 {name=p2 lab=vdd}
C {iopin.sym} 0 90 2 0 {name=p3 lab=gnd
}
C {ipin.sym} -100 -40 0 0 {name=p1 lab=in
}
C {opin.sym} 120 -40 0 0 {name=p4 lab=out
}

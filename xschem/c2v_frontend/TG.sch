v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -150 -60 -60 -60 {lab=In}
N -150 -60 -150 60 {lab=In}
N -150 60 -60 60 {lab=In}
N -0 -60 60 -60 {lab=Out}
N 60 -60 60 60 {lab=Out}
N 0 60 60 60 {lab=Out}
C {/foss/pdks/gf180mcuD/libs.tech/xschem/symbols/nfet_03v3.sym} -30 80 1 1 {name=M1
L=0.34u
W=2u
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
C {/foss/pdks/gf180mcuD/libs.tech/xschem/symbols/pfet_03v3.sym} -30 -80 3 1 {name=M2
L=0.34u
W=4u
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
C {ipin.sym} -150 -5 0 0 {name=p1 lab=In}
C {opin.sym} 60 0 0 0 {name=p2 lab=Out
}
C {iopin.sym} -30 100 1 0 {name=p3 lab=phi
}
C {iopin.sym} -30 -100 0 0 {name=p4 lab=phibar

}
C {iopin.sym} -30 -60 1 0 {name=p5 lab=Vdd}
C {iopin.sym} -30 60 3 0 {name=p6 lab=Gnd}

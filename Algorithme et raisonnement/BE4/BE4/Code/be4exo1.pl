%-------------Transport

transport(L,Cout_total) :-

L=[U1M1,U1M2,U1M3,U1M4,
U2M1,U2M2,U2M3,U2M4,
U3M1,U3M2,U3M3,U3M4],

V=[7,8,5,19,
3,7,2,11,
9,5,10,18],

L::0..20,

U1M1+U2M1+U3M1#=2,
U1M2+U2M2+U3M2#=2,
U1M3+U2M3+U3M3#=6,
U1M4+U2M4+U3M4#=3,

U1M1+U1M2+U1M3+U1M4#=4,
U2M1+U2M2+U2M3+U2M4#=6,
U3M1+U3M2+U3M3+U3M4#=3,

calcul_cout(L,V,Cout_total),
minof(labeling(L),Cout_total), !.

calcul_cout([],[],0).
calcul_cout([0|R],[T|Q],C) :- calcul_cout(R,Q,C).
calcul_cout([A|R],[T|Q],C) :- C1#=C-A*T, calcul_cout(R,Q,C1).
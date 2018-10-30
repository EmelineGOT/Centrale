
%-----------Entrepots

entrepots(C,Cout_total,F):-

C=[C11,C12,C13,
C21,C22,C23,
C31,C32,C33,
C41,C42,C43,
C51,C52,C53],

E=[18,10,28],

M=[5,4,0,0,3,
7,0,2,0,0,
0,5,5,4,8],

C::0..1,

C11+C12+C13#=1, 
C21+C22+C23#=1,
C31+C32+C33#=1,
C41+C42+C43#=1,
C51+C52+C53#=1,


F1#=C11+C21+C31+C41+C51,
F2#=C12+C22+C32+C42+C52,
F3#=C13+C23+C33+C43+C53,

F=[F1,F2,F3],

calcul_cout_transport(C,M,Cout_transport),
calcul_cout_fixe(E,F,Cout_fixe),
Cout_total#=Cout_fixe+Cout_transport,
Cout_total#=<60,

minof(labeling(C),Cout_total), !.


calcul_cout_transport([],[],0).
calcul_cout_transport([0|R],[T|Q],C):- calcul_cout_transport(R,Q,C).
calcul_cout_transport([A|R],[T|Q],C):- T#>0, C1#=C-T, calcul_cout_transport(R,Q,C1).

calcul_cout_fixe([],[],0).
calcul_cout_fixe([A|R],[0|Q],C):- calcul_cout_fixe(R,Q,C).
calcul_cout_fixe([A|R],[T|Q],C):- C1#=C-A, calcul_cout_fixe(R,Q,C1).











%exercice 9

%sans prise en compte du budget
maison([Dmaco,Dchar,Dplom,Dplaf,Dtoit,Dfene,Dfaca,Djard,Dpein,Demme]):-
[Dmaco,Dchar,Dplom,Dplaf,Dtoit,Dfene,Dfaca,Djard,Dpein,Demme]::0..30,
Lmaco#=7,Lchar#=3,Lplom#=8,Lplaf#=3,Ltoit#=1,
Lfene#=1,Lfaca#=2,Ljard#=1,Lpein#=2,Lemme#=1,
Fmaco#=Dmaco+Lmaco,Fchar#=Dchar+Lchar,Fplom#=Lplom+Dplom,Fplaf#=Dplaf+Lplaf,
Ftoit#=Dtoit+Ltoit,Ffene#=Dfene+Lfene,Ffaca#=Dfaca+Lfaca,Fjard#=Djard+Ljard,
Fpein#=Dpein+Lpein,Femme#=Demme+Lemme,
Dchar#>=Fmaco,Dplom#>=Fmaco,Dplaf#>=Fmaco,
Dtoit#>=Fchar,Dfene#>=Ftoit,Dfaca#>=Ftoit,Dfaca#>=Fplom,Djard#>=Ftoit,Djard#>=Fplom,
Dpein#>=Fplaf,
Demme#>=Ffene,Demme#>=Ffaca,Demme#>=Fjard,Demme#>=Fpein,
minof(labeling([Dmaco,Dchar,Dplom,Dplaf,Dtoit,Dfene,Dfaca,Djard,Dpein,Demme]),Femme).

%prise en compte du budget
maison2([Dmaco,Dchar,Dplom,Dplaf,Dtoit,Dfene,Dfaca,Djard,Dpein,Demme]):-
[Dmaco,Dchar,Dplom,Dplaf,Dtoit,Dfene,Dfaca,Djard,Dpein,Demme]::0..30,
Lmaco#=7,Lchar#=3,Lplom#=8,Lplaf#=3,Ltoit#=1,
Lfene#=1,Lfaca#=2,Ljard#=1,Lpein#=2,Lemme#=1,
Fmaco#=Dmaco+Lmaco,Fchar#=Dchar+Lchar,Fplom#=Lplom+Dplom,Fplaf#=Dplaf+Lplaf,
Ftoit#=Dtoit+Ltoit,Ffene#=Dfene+Lfene,Ffaca#=Dfaca+Lfaca,Fjard#=Djard+Ljard,
Fpein#=Dpein+Lpein,Femme#=Demme+Lemme,
Dchar#>=Fmaco,Dplom#>=Fmaco,Dplaf#>=Fmaco,
Dtoit#>=Fchar,Dfene#>=Ftoit,Dfaca#>=Ftoit,Dfaca#>=Fplom,Djard#>=Ftoit,Djard#>=Fplom,
Dpein#>=Fplaf,
Demme#>=Ffene,Demme#>=Ffaca,Demme#>=Fjard,Demme#>=Fpein,
calculbudget15([[Dmaco,Fmaco],[Dchar,Fchar],[Dplom,Fplom],[Dplaf,Fplaf],[Dtoit,Ftoit],
[Dfene,Ffene],[Dfaca,Ffaca],[Djard,Fjard],[Dpein,Fpein],[Demme,Femme]],0,Budget15),
Budget15#=20000,  %on impose le bodget des 15 premiers jours 
minof(labeling([Dmaco,Dchar,Dplom,Dplaf,Dtoit,Dfene,Dfaca,Djard,Dpein,Demme]),Demme),!.

calculbudget15([],Budget15,Budget15).
calculbudget15([[Xd,Xf]|Q],Acc,Budget15):- 15#>Xf,Acc1#=Acc+1000*(Xf-Xd),calculbudget15(Q,Acc1,Budget15).
calculbudget15([[Xd,Xf]|Q],Acc,Budget15):- Xf#>=15,Xd#<15,Acc1#=Acc+1000*(15-Xd),calculbudget15(Q,Acc1,Budget15).
calculbudget15([[Xd,Xf]|Q],Acc,Budget15):- Xf#>=15,Xd#>=15,calculbudget15(Q,Acc,Budget15).
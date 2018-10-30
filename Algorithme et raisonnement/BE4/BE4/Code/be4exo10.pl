whohaswon([Jean,Pierre,Paul,Andre,Roland]):-

%expliciter les variables
Jean=[Jbles,Jspor,Jbois,Jposi,Jmeda],
Pierre=[Pibles,Pispor,Pibois,Piposi,Pimeda],
Paul=[Pables,Paspor,Pabois,Paposi,Pameda],
Andre=[Ables,Aspor,Abois,Aposi,Ameda],
Roland=[Rbles,Rspor,Rbois,Rposi,Rmeda],

% definition de ce que l on sait deja
Pibles#=bras_casse,Paspor#=equitation,Abois#=the,

% definition des valeurs possibles
blessure(Jbles),blessure(Pables),blessure(Ables),blessure(Rbles),
sport(Jspor),sport(Pispor),sport(Aspor),sport(Rspor),
boisson(Jbois),boisson(Pibois),boisson(Pabois),boisson(Rbois),
position(Jposi),position(Piposi),position(Paposi),position(Aposi),position(Rposi),
medaille(Jmeda),medaille(Pimeda),medaille(Pameda),medaille(Ameda),medaille(Rmeda),

% deux a deux differents
different(Jean,[Pierre,Paul,Andre,Roland],[Pierre,Paul,Andre,Roland]),

% Paul a droite de Roland
Paposi#=Rposi+1,

% conditions imposees par l ennonce
deuxiemecondition([Jean,Pierre,Paul,Andre,Roland]),
quatriemecondition([Jean,Pierre,Paul,Andre,Roland]),
cinquiemecondition([Jean,Pierre,Paul,Andre,Roland]),
sixiemecondition([Jean,Pierre,Paul,Andre,Roland]),
huitiemecondition([Jean,Pierre,Paul,Andre,Roland]),
dixiemecondition([Jean,Pierre,Paul,Andre,Roland]),
onziemecondition([Jean,Pierre,Paul,Andre,Roland]),
douziemecondition(Jean,[Pierre,Paul,Andre,Roland],[Pierre,Paul,Andre,Roland]),
treiziemecondition(Jean,[Pierre,Paul,Andre,Roland],[Pierre,Paul,Andre,Roland]),
quatorziemecondition(Jean,[Pierre,Paul,Andre,Roland]).

% deux sportifs ont necessairement des attributs differents
different(_X,[],[]).
different(_X,[Xs|Qs],[]):-different(Xs,Qs,Qs).
different([Bles1,Spor1,Bois1,Posi1,Meda1],L,[[Bles2,Spor2,Bois2,Posi2,Meda2]|Q]):-
Bles1#\=Bles2,Spor1#\=Spor2,Bois1#\=Bois2,Posi1#\=Posi2,Meda1#\=Meda2,
different([Bles1,Spor1,Bois1,Posi1,Meda1],L,Q).

% celui qui s est fait une entorse a du abandoner
deuxiemecondition([[Bles,_Spor,_Bois,_Posi,Meda]|_Q]):-
Bles#=entorse,Meda#=abandon.
deuxiemecondition([_X|Q]):-deuxiemecondition(Q).

% le perchiste bois du cafe
quatriemecondition([[_Bles,Spor,Bois,_Posi,_Meda]|_Q]):-
Spor#=saut_a_la_perche,Bois#=cafe.
quatriemecondition([_X|Q]):-quatriemecondition(Q).

% celui qui boit du jus de fruit a fait une insolation
cinquiemecondition([[Bles,_Spor,Bois,_Posi,_Meda]|_Q]):-
Bois#=jus_de_fruit,Bles#=insolation.
cinquiemecondition([_X|Q]):-cinquiemecondition(Q).

% le decathlonien a un rhume
sixiemecondition([[Bles,Spor,_Bois,_Posi,_Meda]|_Q]):-
Spor#=decathlon,Bles#=rhume.
sixiemecondition([_X|Q]):-sixiemecondition(Q).

%celui qui bois de l eau a gagne la medaille d or
huitiemecondition([[_Bles,_Spor,Bois,_Posi,Meda]|_Q]):-
Bois#=eau,Meda#=or.
huitiemecondition([_X|Q]):-huitiemecondition(Q).

%celui du milieu fait de l escrime
dixiemecondition([[_Bles,Spor,_Bois,Posi,_Meda]|_Q]):-
Posi#=3,Spor#=escrime.
dixiemecondition([_X|Q]):-dixiemecondition(Q).

% le premier a gauche a une cocarde a l oeil
onziemecondition([[Bles,_Spor,_Bois,Posi,_Meda]|_Q]):-
Posi#=1,Bles#=cocarde.
onziemecondition([_X|Q]):-onziemecondition(Q).

%buveur de lait a cote de celui qui finit 4eme
douziemecondition(_X,[Xs|Qs],[]):-douziemeconditiont(Xs,Qs,Qs).
douziemecondition([_Bles1,_Spor1,Bois1,Posi1,Meda1],_L,[[_Bles2,_Spor2,Bois2,Posi2,Meda2]|_Q]):- 
(Bois1#=lait,Meda2#=quatrieme,(Posi2#=Posi1+1;Posi1#=Posi2+1));(Bois2#=lait,Meda1#=quatrieme,(Posi2#=Posi1+1;Posi1#=Posi2+1)).
douziemecondition([Bles1,Spor1,Bois1,Posi1,Meda1],L,[_X|Q]):-
douziemecondition([Bles1,Spor1,Bois1,Posi1,Meda1],L,Q).

%buveur de the a cote de celui qui a eu une medaille de bronze
treiziemecondition(_X,[Xs|Qs],[]):-treiziemecondition(Xs,Qs,Qs).
treiziemecondition([_Bles1,_Spor1,Bois1,Posi1,Meda1],_L,[[_Bles2,_Spor2,Bois2,Posi2,Meda2]|_Q]):- 
(Bois1#=the,Meda2#=bronze,(Posi2#=Posi1+1;Posi1#=Posi2+1));(Bois2#=the,Meda1#=bronze,(Posi2#=Posi1+1;Posi1#=Posi2+1)).
treiziemecondition([Bles1,Spor1,Bois1,Posi1,Meda1],L,[_X|Q]):-
treiziemecondition([Bles1,Spor1,Bois1,Posi1,Meda1],L,Q).

% celui qui a la cocarde a l oeil est a cote de Jean
quatorziemecondition([_Jbles,_Jspor,_Jbois,Jposi,_Jmeda],[[Bles,_Spor,_Bois,Posi,_Meda]|_Q]):-
Bles#=cocarde,(Jposi#=Posi+1;Posi#=Jposi+1).
quatorziemecondition(Jean,[_X|Q]):-quatorziemecondition(Jean,Q).

blessure(entorse).
blessure(insolation).
blessure(rhume).
blessure(cocarde).

sport(saut_a_la_perche).
sport(decathlon).
sport(escrime).
sport(boxe).

boisson(cafe).
boisson(jus_de_fruit).
boisson(eau).
boisson(lait).

position(1).
position(2).
position(3).
position(4).
position(5).

medaille(or).
medaille(argent).
medaille(bronze).
medaille(quatrieme).
medaille(abandon).


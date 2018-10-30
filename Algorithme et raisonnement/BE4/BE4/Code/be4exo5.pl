%exercice 5
machine(1,1). %(tache,machine)
machine(2,1).
machine(3,2).
machine(4,2).
machine(5,1).
machine(6,2).
machine(7,1).
machine(8,2).
duree(1,2). %(machine duree)
duree(2,3).
duree(3,1).
duree(4,2).
duree(5,3).
duree(6,4).
duree(7,2).
duree(8,3).

jobshop([De1,De2,De3,De4,De5,De6,De7,De8]):- % Dei contient la date de début de la tache i
[De1,De2,De3,De4,De5,De6,De7,De8]::0..12,
Ld=[De2,De3,De4,De5,De6,De7,De8],
Lt=[2,3,4,5,6,7,8],
respecte_duree(De1,1,Ld,Ld,Lt,Lt),
labeling([De1,De2,De3,De4,De5,De6,De7,De8]),!. % On se contente d une solution

respecte_duree(_Dei,_Ti,[],[],[],[]).
respecte_duree(_Dei,_Ti,[Dej|Qd],[],[Tj|Qt],[]):-respecte_duree(Dej,Tj,Qd,Qd,Qt,Qt).
respecte_duree(Dei,Ti,Ld,[Dej|Qd],Lt,[Tj|Qt]):-
(machine(Ti,M),machine(Tj,M),duree(Ti,Dui),duree(Tj,Duj),(Dej#>=Dei+Dui;Dei#>=Dej+Duj),respecte_duree(Dei,Ti,Ld,Qd,Lt,Qt))
;(machine(Ti,Mi),machine(Tj,Mj),Mi\=Mj,respecte_duree(Dei,Ti,Ld,Qd,Lt,Qt)).
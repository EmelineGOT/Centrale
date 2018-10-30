%exercice 6

benefice(1,5). % (pruduit,benefice)
benefice(2,3).
benefice(3,2).
duree(1,1,2). % (produit,tache,duree)
duree(1,2,4).
duree(1,3,3).
duree(2,1,3).
duree(2,2,2).
duree(3,1,1).
duree(3,2,3).
machine(1,1,2). % (produit,tache,machine)
machine(1,2,4).
machine(1,3,3).
machine(2,1,3).
machine(2,2,2).
machine(3,1,1).
machine(3,2,3).

% question 1

jobshopbenef([Duree,De11,De12,De13,De21,De22,De31,De32]):- % Deij contient la date de début de la tache j du produit i
[De11,De12,De13,De21,De22,De31,De32]::0..12,
De12#>=De11+2,De13#>=De12+4,De22#>=De21+3,De32#>=De31+1,  % les taches doivent se faire dans l ordre pour un produit donne
(De12#>=De21+3;De21#>=De12+4), % on n utilise pas la machine 1 pour deux taches en meme temps
(De12#>=De32+3;De32#>=De12+4), % on n utilise pas la machine 1 pour deux taches en meme temps
(De32#>=De21+3;De21#>=De32+3), % on n utilise pas la machine 1 pour deux taches en meme temps
(De13#>=De22+2;De22#>=De13+3), % on n utilise pas la machine 2 pour deux taches en meme temps
(De11#>=De31+1;De31#>=De11+2), % on n utilise pas la machine 3 pour deux taches en meme temps
F11#=De11+2,
F12#=De12+4,
F13#=De13+3,
F21#=De21+3,
F22#=De22+2,
F31#=De31+1,
F32#=De32+3,
max([F11,F12,F13,F21,F22,F31,F32],Duree).

% il faut ensuite ecrire 
% minof(jobshopbenef([Duree,De11,De12,De13,De21,De22,De31,De32]),Duree)
% afin de minimiser la durée 

max([],R,R).
max([T|Q],M,R):- R#>=T,M#>=T,max(Q,M,R).
max([T|Q],M,R):- R#>=T,T#>M,max(Q,T,R).
max([T|Q],R):- max(Q,T,R),R#>=T.

% question 2 













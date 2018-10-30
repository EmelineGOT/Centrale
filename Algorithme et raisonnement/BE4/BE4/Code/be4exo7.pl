%exercice7

%question1

congres([A,B,C,D,E,F,G,H,I,J,K]):-
[A,B,C,D,E,F,G,H,I,J,K]::1..4 % selon une des 4 demis journee
,A#\=J, J#\=I, I#\=E, E#\=C, C#\=F, F#\=G, D#\=H, B#\=D, K#\=E, 
B#\=I, H#\=G, B#\=H, B#\=G, I#\=H, I#\=G,
A#\=G, A#\=E, G#\=E,
B#\=H, B#\=K, H#\=K,
A#\=B, A#\=C ,A#\=H, B#\=C, B#\=H, C#\=H,
D#\=F, F#\=J, D#\=J,
J#>E, K#>D, K#>F,
salle_dispo([A,B,C,D,E,F,G,H,I,J,K],1), % Pas plus de 3 creneaux dans la premiere demi-journee
salle_dispo([A,B,C,D,E,F,G,H,I,J,K],2), % Pas plus de 3 creneaux dans la deuxième demi-journee
salle_dispo([A,B,C,D,E,F,G,H,I,J,K],3), % Pas plus de 3 creneaux dans la troisieme demi-journee
salle_dispo([A,B,C,D,E,F,G,H,I,J,K],4)  % Pas plus de 3 creneaux dans la derniere demi-journee
,labeling([A,B,C,D,E,F,G,H,I,J,K]),!. % on se contente dune seule solution

salle_dispo([],_X,C):- C#<3.
salle_dispo([X|Q],X,C):- C1 is (C+1),salle_dispo(Q,X,C1).
salle_dispo([_T|Q],X,C):- salle_dispo(Q,X,C).
salle_dispo(L,X):-salle_dispo(L,X,0).

%question 2
congres2([LA,LB,LC,LD,LE,LF,LG,LH,LI,LJ,LK]):- % Li=[numero de demie journee,numero de salle]
	[A,B,C,D,E,F,G,H,I,J,K]::1..4,
	salle_dispo([A,B,C,D,E,F,G,H,I,J,K],1), % Pas plus de 3 creneaux dans la premiere demi-journee
	salle_dispo([A,B,C,D,E,F,G,H,I,J,K],2), % Pas plus de 3 creneaux dans la deuxième demi-journee
	salle_dispo([A,B,C,D,E,F,G,H,I,J,K],3), % Pas plus de 3 creneaux dans la troisieme demi-journee
	salle_dispo([A,B,C,D,E,F,G,H,I,J,K],4), % Pas plus de 3 creneaux dans la derniere demi-journee
	dif(A,J),dif(J,I),dif(J,E),dif(E,C),dif(C,F),
	dif(F,G),dif(D,H),dif(B,D),dif(K,E),dif(B,I),
	dif(B,H),dif(B,G),dif(I,H),dif(I,G),dif(H,G),
	dif(A,G),dif(A,E),dif(G,E),
	dif(B,H),dif(B,K),dif(H,K),
	dif(A,B),dif(A,C),dif(A,H),dif(B,C),dif(B,H),dif(C,H),
	dif(D,F),dif(D,J),dif(F,J),
	E#<J,D#<K,F#<K,
	affectsalles([A,B,C,D,E,F,G,H,I,J,K],[LA,LB,LC,LD,LE,LF,LG,LH,LI,LJ,LK]), % affectation des salles
	labeling([LA,LB,LC,LD,LE,LF,LG,LH,LI,LJ,LK]),!. % on se contente d une seule solution qui marche


salle(a). % definition des 3 salles 
salle(b).
salle(c).

affectsalles(L,Ls):-
	affectsalle(L,Ls), % affectation aleatoire de salles sans contraintes
	verif(Ls). % verification que la meme salle nest pas utilisee sur deux conferences ayant lieu en meme temps
	

affectsalle([],[]).
affectsalle([X|L],[[X,Xs]|L2]):- % on range le numero de demi journee et une salle au hasard dans la deuxieme liste
	salle(Xs),
	affectsalle(L,L2).

% verifie si X est membre de la liste L
membre(X,[X|_]). 
membre(X,[_|L]):- 
	membre(X,L).

verif([]).
verif([X|L]):-
	not(membre(X,L)), % verification qu'on ait pas deux fois le meme couple demi journee salle
	verif(L).
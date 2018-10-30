%Ensemble N énumérable avec la constante 0 et l opérateur succ. 
entier(0).
entier(succ(N)) :- entier(N).

/* Les variables sont les lettres en majuscule
Les predicats (les fonctions) sont en minuscule */


%Les hommes sont mortels
homme(jean).
homme(pierre).
homme(paul).
mortel(X) :- homme(X).

%Une famille formidable : 
pere(jean,pierre).
pere(jean,marie).
pere(pierre,paul).
pere(jacques,jean).

mere(kate,marie).
mere(anne,jean).
mere(helene,paul).

frere_ou_soeur(X,Y) :- pere(Z,X), pere(Z,Y), X\=Y. 
%La virgule est le 'et' logique

%un OU (disjonction) : 
%"X est parents de Y si X est le pere de Y ou X est la mere de Y"

parents(X,Y) :- pere(X,Y).
parents(X,Y) :- mere(X,Y).

%Il y a aussi une disjonction dans le prédicat "ancetre/2"
ancetre(A,P) :- parents(A,P).
ancetre(A,P) :- parents(A,Par),ancetre(Par,P).


%Qui est mortel ? mortel(X).
%Qui est frere_ou_soeur de Marie ? frere_ou_soeur(marie,X) -> pierre
%Jean est l'ancêtre de qui ? pierre, marie, paul
%Qui est ancêtre de qui ? ancetre(X,Y)
%Requête mere(X,Y),frere_ou_soeur(Y,Z) : cherche la mère de deux enfants -> kate mère de marie et pierre

%Si il n'y a pas de retour 0 automatique, taper get0(X)


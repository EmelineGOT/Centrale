/* Programme menu.pl : MENU au restaurant */

entree(salade).
entree(oeufs).
entree(pate).
entree(melon).

plat(poisson).
plat(poulet).
plat(viande).

dessert(glace).
dessert(pomme).
dessert(raisin). 
dessert(gateau). 
dessert(fromage).

valeur(salade,100).
valeur(oeufs,200).
valeur(pate,300).
valeur(poisson,400).
valeur(poulet,500).
valeur(viande,800).
valeur(glace,300). 
valeur(fromage,320).
valeur(gateau,400).
valeur(raisin,250).
valeur(pomme,250).

repas(X,Y,Z,V) :- entree(X),plat(Y),dessert(Z),valeur(X,A),valeur(Y,B),valeur(Z,C),V#=A+B+C.

repas_leger(X,Y,Z,V) :- repas(X,Y,Z,V),V>800,V<1000.

repas2(X,Y,Z,V):- entree(X),entree(Y),plat(Z),valeur(X,A),valeur(Y,B),valeur(Z,C),V#=A+B+C.


/* Exercice 2 */ 

livre(auteur(eugene, delonay), titre('pendule de foucault'), prix(125)).
livre(auteur(victor, hugo), titre('fantasia chez les ploucs'), prix(200)).
livre(auteur(eugene, chang), titre('le silence'), prix(180)).
livre(auteur(umberto, ecco), titre('le nom de la rose'), prix(185)).
livre(auteur(umberto, ecco), titre('pendule de foucault'), prix(195)).
livre(auteur(victor, hugo), titre('les misérables'), prix(300)).
livre(auteur(fredric, dard), titre('l"espion'), prix(45)).











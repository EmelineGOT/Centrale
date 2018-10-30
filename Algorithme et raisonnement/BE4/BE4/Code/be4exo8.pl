%exercice 8

disponible(jean,[[540,600],[810,855],[2115,2145],[2340,2460],[3360,3495],[5040,5070],[6460,6435]]).
disponible(marie,[[600,630],[750,795],[2175,2265],[2340,2460],[3420,3495],[4800,5130]]).
disponible(pierre,[[540,690],[750,900],[1980,2100],[2160,2520],[3480,3555],[4800,4920],[5520,5610],[6300,6555]]).
disponible(jacques,[[630,900],[1920,2040],[1920,2040],[2280,2400],[3360,3540],[3720,3825],[4905,4995]]).
disponible(salle,[[480,720],[2280,2400],[3360,3420],[5040,5160],[6240,6360]]).

reunion(Date):-
	Date::0..7200, % domaine qui couvre les 5 jours LMMJV
	convient(jean,Date),
	convient(marie,Date),
	convient(pierre,Date),
	convient(jacques,Date),
	convient(salle,Date),
	labeling(Date),!. % on cherche une date qui marche

convient(X,Date):-disponible(X,L),contenue(Date,L).
	
contenue(Date,[[Debut,Fin]|_Q]):-Date#>=Debut,Date+45#=<Fin.
contenue(Date,[_C|Q]):-contenue(Date,Q).
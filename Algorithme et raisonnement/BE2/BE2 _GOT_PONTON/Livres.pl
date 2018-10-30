livres(auteur('Victor', 'Hugo'), [('Juliette Drouet', 32), ('Notre Dame de Paris', 45), ('Les Misérables', 35),
('Quatre Vingt Treize', 24), ('Feuilles d automne', 30), ('Les Contemplations', 25)]). 
livres(auteur('Léo', 'Ferré'), [('Testament Phonographe', 25), ('La méthode', 25), ('Benoit Misère', 30)]). 
livres(auteur('Max', 'Weber'), [('Economie et Société', 24), ('Le savant et le Politique', 29),
('Théorie de la science', 34), ('La bourse', 25)]).
livres(auteur('Blaise', 'Pascal'), [('Pensées', 25), ('De l esprit Géométrique', 45)]). 
livres(auteur('Confucius', 'Confucius'), [('Confucius', 35), ('La morale', 30), ('Les entretiens', 25)]). 
livres(auteur('Jacques', 'Lacan'), [('D un autre à l autre', 30), ('Mon enseignement', 50)]). 
livres(auteur('Sigmund', 'Freud'), [('Sur le rêve', 30), ('Totem et Tabou', 25), ('Métapsychologie', 40)]). 
livres(auteur('Michel', 'Foucault'), [('Surveiller et punir', 34), ('Histoire de la folie', 25),
('L ordre du discours', 35)]).
livres(auteur('Jacques', 'Derrida'), [('Feu la cendre', 30), ('Mémoire d aveugle' , 20), ('Voiles', 25 ) ,
('Demeure' , 35), ('Position', 20) ]).
livres(auteur('Michel', 'Serres'), [('Atlas, Philosophie des réseaux', 30), ('Tiers Instruit', 25)]).


somme(X,Y):- livres(auteur(X,Y),L),somme(X,Y,L,0).
somme(X,Y,[],S):- write(S).
somme(X,Y,[(T,P)|Q],S):- S1#=S+P,somme(X,Y,Q,S1).


nb_livres(X,Y):- livres(auteur(X,Y),L), nb_livres(X,Y,L,0).
nb_livres(X,Y,[],N):- write(N).
nb_livres(X,Y,[T|Q],N):- N1#=N+1, nb_livres(X,Y,Q,N1).

prix_max(X,Y):- livres(auteur(X,Y),L), prix_max(X,Y,L,0).
prix_max(X,Y,[],M):- write(M).
prix_max(X,Y,[(T,P)|Q],M):- P#>M, prix_max(X,Y,Q,P).
prix_max(X,Y,[(T,P)|Q],M):- prix_max(X,Y,Q,M).



inf_prix(X,Y,R):- livres(auteur(X,Y),L), inf_prix(X,Y,L,R,[]).
inf_prix(X,Y,[],R,L):- write(L).
inf_prix(X,Y,[(T,P)|Q],R,L):- P#<R, inf_prix(X,Y,Q,R,[T|L]).
inf_prix(X,Y,[T|Q],R,L):- inf_prix(X,Y,Q,R,L).

egal_prix(X,Y,R):- livres(auteur(X,Y),L), egal_prix(X,Y,L,R,[]).
egal_prix(X,Y,[],R,L):- write(L).
egal_prix(X,Y,[(T,P)|Q],R,L):- P#=R, egal_prix(X,Y,Q,R,[T|L]).
egal_prix(X,Y,[T|Q],R,L):- egal_prix(X,Y,Q,R,L).







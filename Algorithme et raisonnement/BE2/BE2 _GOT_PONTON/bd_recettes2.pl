% Base de données pour les recettes.
% Mars 2015

%predicat disponible(ingrédient, quantité en litre/Kilo/mètres selon l ingérdient)
disponible(eau,50).
disponible(sucre,100).
disponible(sel,50).
disponible(vinaigre,4).
disponible(huile,3).
disponible(beurre,8).
disponible(sachet_de_the,5).
disponible(cafe,10).
disponible(chocolat,23).
disponible(lait,6).
disponible(farine,300).
disponible(oeufs,12).
disponible(pate_a_crepes,300).
disponible(pates_nouilles,300).
disponible(laitue,2).
disponible(pommes_dt,10).
disponible(oignon,10).
disponible(tomates,40).
disponible(lardons,50). 	% pour tester pates_a_la_carbonara
disponible(creme,4).
disponible(fromage,10).	% toutes sortes. Pour une fondue, pour une tartiflette, raclette...

%prédicat recette(mets, liste des ingrédients + la quantité nécessaire)
recette(expresso, [(cafe,3),(eau,10), (sucre,1)]).
recette(gateau, [(lait,5), (farine,100),  (oeufs,6), (sucre,30), (beurre, 2)]).
recette(the, [(sachet_de_the,1), (eau,10), (sucre,1)]).
recette(crepes, [(pate_a_crepes,20), (sucre,33), (beurre,2)]).
recette(salade, [(laitue,1), (vinaigre,3), (huile, 2), (oignon,1)]).
recette(puree, [(lait,2), (pommes_dt,5), (beurre, 2), (sel,1)]).
recette(frites, [(pommes_dt,5), (huile, 3), (sel,2)]).
recette(pates_a_la_carbonara, [(pates_nouilles, 40), (oeufs, 5), (lardons, 5),(sel,3), (oignon,2)]).
recette(carbona, [(pates_nouilles, 40), (oeufs, 5), (lardons, 5),(sel,3), (oignon,2)]).
recette(pitza, [(farine, 40), (oeufs, 5), (lardons, 5),(sel,3), (oignon,2), (tomates,5)]).
recette(tartiflette, [(pommes_dt,5),  (lardons,5),  (sel,2), (fromage,3)]).
recette(rien,[(eau,2),(lait,5)]).



%----------peut_preparer

%peut_preparer(R):- recette(R,L),tous_disponibles(L).
%tous_disponibles([]).
%tous_disponibles([(T,S)|Q]):- disponible(T,X),X#>S,tous_disponibles(Q).

%----------a_besoin_de

membre([],_):-fail.
membre([A|R],A).
membre([T|R],A):- membre(R,A).

a_besoin_de(R,I):- recette(R,L),membre(L,I).


%-----------avec quantités

qte_restantes([(eau,50),(sucre,100),(sel,50),(vinaigre,4),(huile,3),(beurre,8),(sachet_de_the,5),(cafe,10),(chocolat,23),(lait,5),(farine,300),(oeufs,12),(pate_a_crepes,300),(pates_nouilles,300),(laitue,2),(pommes_dt,10),(oignon,10),(tomates,40),(lardons,50),(creme,4),(fromage,10)]).

peut_preparer(R):-recette(R,L),qte_restantes(Q),tous_disponibles(L,Q,0).
tous_disponibles([],_,_).
tous_disponibles([(T,S)|R],[(T,B)|C],_):- S#=<B, X#=B-S, tous_disponibles(R,[(T,X)|C],0), qte_restantes([(T,X)|C]).
tous_disponibles(L,[T|Q],N):- N1#=N+1, length([T|Q],N2), N1 #=< N2, tous_disponibles(L,R,N1).















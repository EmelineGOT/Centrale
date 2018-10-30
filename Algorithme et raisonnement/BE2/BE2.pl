affiche_liste([]).
affiche_liste([T|R],A):- write(A),writeln(T),A1 is A+1, affiche_liste(R,A1).
affiche_liste(L):- affiche_liste(L,1).


dernier([],_):-fail.
dernier([D],D).
dernier([T|R],D):- dernier(R,D).


taille([],0).
taille([T|R],Taille):- taille(R,Taille2), Taille is Taille2 + 1.


membre([],_):-fail.
membre([A],A).
membre([T|R],A):- T#=A.
membre([T|R],A):- membre(R,A).


membre_ord([],_) :- fail.
membre_ord([A],A).
membre_ord([T|R],A) :- T#=A.
membre_ord([T|R],A) :- A#<T, membre_ord(R,A).


concat([],L,L).
concat([T|R],L,[T|L2]):- concat(R,L,L2).


%----------------------------Exercices à rendre


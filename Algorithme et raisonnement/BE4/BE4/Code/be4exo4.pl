pert(Debut):-

Debut=[A,B,C,D,E,F,G,H,I,J],
Debut::0..100,

A+5#=<B, A+5#=<C, A+5#=<D, %Contraintes pour A
B+4#=<E, %Contrainte pour B
C+3#=<F, C+3#=<G, %Contraintes pour C
D+2#=<F, %Contrainte pour D
E+1#=<H, %Contrainte pour E
F+5#=<I, %Contrainte pour F
G+4#=<I, %Contrainte pour G
H+3#=<J, %Contrainte pour H
I+2#=<J, %Contrainte pour I

pasenmemetemps(E,1,F,5),
pasenmemetemps(E,1,G,4),
pasenmemetemps(F,5,G,4),

minof(labeling(Debut),J),!.

pasenmemetemps(A,LA,B,LB):-
(A#>=B+LB);(B#>=A+LA).
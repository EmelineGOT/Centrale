/*-------------------------------------------------------------------------*/
/* Benchmark (Boolean)                                                     */
/*                                                                         */
/* Name           : bschur.pl                                              */
/* Title          : Schur's lemma                                          */
/* Original Source: Giovanna Dore - Italy                                  */
/* Adapted by     : Daniel Diaz for GNU Prolog                             */
/* Date           : January 1993                                           */
/* Adapted to B-Prolog by Neng-Fa Zhou, 2010                               */
/* Color the integers 1,2...,N with 3 colors so that there is no monochrome*/
/* triplets (x,y,z) where x+y=z. Solution iff N<=13.                       */
/* The solution is a list [ [Int11,Int12,Int13],..., [IntN1,IntN2,IntN3] ] */
/* where Intij is 1 if the integer i is colored with the color j.          */
/*                                                                         */
/* Solution:                                                               */
/* N=4  [[0,0,1],[0,1,0],[0,0,1],[1,0,0]]                                  */
/*      [[0,0,1],[0,1,0],[0,1,0],[0,0,1]]                                  */
/*        ...                                                              */
/* N=13 [[0,0,1],[0,1,0],[0,1,0],[0,0,1],[1,0,0],[1,0,0],[0,0,1],[1,0,0],  */
/*       [1,0,0],[0,0,1],[0,1,0],[0,1,0],[0,0,1]] (first solution)         */
/*-------------------------------------------------------------------------*/
go:-	
    statistics(runtime,_),
    schur(13),
    statistics(runtime,[_,Y]),
    write('time : '), write(Y), nl.

schur(N):-
     new_array(A,[N,3]),
     Vars @= [A[I,J] : I in 1..N, J in 1..3],
     Vars :: 0..1,
     foreach(I in 1..N, sum([A[I,J] : J in 1..3]) #= 1),
     Rows @= [Row : I in 1..N, [Row], (Row @= [A[I,J] : J in 1..3])],
     pair_constraints(Rows,Rows),
     labeling(Vars),
     writeln(Rows).

pair_constraints([],_):-!.
pair_constraints([_],_):-!.
pair_constraints([_,[K1,K2,K3]|A2],[[I1,I2,I3]|A1]):-
	#\ (I1 #/\ K1),
	#\ (I2 #/\ K2),
	#\ (I3 #/\ K3),
	triplet_constraints(A2,A1,[I1,I2,I3]),
	pair_constraints(A2,A1).

triplet_constraints([],_,_).
triplet_constraints([[K1,K2,K3]|A2],[[J1,J2,J3]|A1],[I1,I2,I3]):-
	#\ (I1 #/\ J1 #/\ K1),
	#\ (I2 #/\ J2 #/\ K2),
	#\ (I3 #/\ J3 #/\ K3),
	triplet_constraints(A2,A1,[I1,I2,I3]).


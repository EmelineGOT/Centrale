%:-module queens.
%:-public queens/2.
draw(M,N):-
        global_get(board,Qb),
	javaMethod(Qb,putSquare(M,N)).
draw(M,N):-
        global_get(board,Qb),
	javaMethod(Qb,clearSquare(M,N)),
	fail.

callQueens(Q,Qb):-
	cputime(Start),
	queens(Q,Qb),
	cputime(End),
	T is End-Start,
        write(executionTime(T)),nl,
        statistics.

queens(Q,Qb):-
	javaMethod(Qb,sleep(500)),
        global_set(board,Qb),
        put(Q,[],R),write(R),nl,
	javaMethod(Qb,sleep(1000)),
	fail.
queens(Q,Qb):-
	global_set(board,[]). % Qb is not valid after return to Java

put([Q1|Qs],Board,Result):-!,
	sel([Q1|Qs],Q,Rs),
	safe(Board,Q,Q),
	length(Qs,L),N is 1+L,
	draw(Q,N),
	put(Rs,[Q|Board],Result).
put([],Result,Result).

safe([Q|Rs],P,M):-!,
  PP is P+1,
  Q\==PP,
  MM is M-1, 
  Q\==MM,
  safe(Rs,PP,MM).
safe([],P,M).

sel([X|Y],X,Y).
sel([X|Y],Z,[X|W]):-sel(Y,Z,W).


%   File   : queens.pl
%   Author : Neng-Fa ZHOU
%   Date   : 1992
%   Purpose: solve N-queens problem with CLP(FD)

queens(N,Obj):-
    write(queens(N,Obj)),nl,
    statistics(runtime,[Start|_]),
    once(N,Queens),
    statistics(runtime,[End|_]),
    T is End-Start,
    write(Queens),nl,
    write('%execution time ='), write(T), write(' milliseconds'),nl,
    javaMethod(Obj,drawQueens(Queens)).

once(N,List):-
    length(List,N),
    List in 1..N,
    constrain_queens(List),
    labeling_ff(List).

constrain_queens([]).
constrain_queens([X|Y]):-
    safe(X,Y,1),
    constrain_queens(Y).

safe(_,[],_).
safe(X,[Y|T],K):-
    noattack(X,Y,K),
    K1 is K+1,
    safe(X,T,K1).

noattack(X,Y,K):-
    X #\= Y,
    X+K #\= Y,
    X-K #\= Y.


/*  Taken from "Simplifying Dynamic Programming via Mode-directed Tabling"
    Software Practice and Experience, 38(1): 75-94, 2008, by Hai-Feng Guo, Gopal Gupta */

% longest common subsequence

:- table lcs(+,+,max).

lcs(L1, L2, 0) :- emptyOr(L1, L2).
lcs([F|L1], [F|L2], N) :-
   lcs(L1, L2, N1),
   N is N1 + 1.
lcs([F1|L1], [F2|L2], N) :-
   F1 =\= F2,
   lcs(L1, [F2|L2], N).
lcs([F1|L1], [F2|L2], N) :-
   F1 =\= F2,
   lcs([F1|L1], L2, N).

emptyOr([], _).
emptyOr(_, []).


go :-
   statistics(_, _),
   lcs([50, 10, 400, 30, 30, 20, 10, 5, 30, 20,
       6, 20, 20, 30, 9, 30, 20, 500, 20, 40,
      30, 8, 3, 5, 9, 200, 10, 400, 20, 30,
      50, 10, 400, 30, 30, 20, 10, 5, 30, 20,
       7, 3, 60, 38, 20, 39, 83, 92, 30, 19,
       6, 20, 20, 30, 9, 30, 20, 20, 30, 9, 
       30, 20, 500, 20, 40, 4, 92, 30, 92, 20,
       6, 20, 20, 30, 9, 30, 20, 500, 20, 40,
      30, 8, 3, 5, 9, 200, 10, 400, 20, 30,
       30, 20, 500, 20, 40, 4, 92, 30, 92, 20,
      50, 10, 400, 30, 30, 20, 10, 5, 30, 20,
       6, 20, 20, 30, 9, 30, 20, 500, 20, 40,
      30, 8, 3, 5, 9, 200, 10, 400, 20, 30], 
     [ 7, 20, 25, 30, 9, 35, 20, 500, 20, 40,
      30, 8, 3, 5, 9, 200, 10, 400, 20, 30,
      50, 10, 405, 30, 35, 20, 10, 5, 30, 20,
      30, 8, 3, 5, 9, 200, 10, 400, 20, 30,
      50, 10, 405, 30, 35, 20, 10, 5, 30, 20,
      30, 8, 3, 5, 9, 200, 10, 400, 20, 30,
      30, 8, 3, 5, 9, 200, 10, 400, 20, 30,
      50, 10, 403, 30, 30, 20, 10, 5, 30, 20,
       6, 20, 20, 30, 9, 37, 20, 500, 20, 40,
     50, 10, 400, 30, 30, 20, 10, 5, 30, 20,
       6, 20, 20, 30, 9, 39, 20, 500, 20, 40,
       6, 20, 20, 30, 19, 30, 20, 500, 20, 40,
      30, 8, 3, 5, 9, 210, 10, 400, 22, 30
     ],  V),
   statistics(_, [_, B]),
   write('The length of the longest common subsequence is '), write(V), nl,
   write('execution time = '), write(B), write(' ms'), nl.




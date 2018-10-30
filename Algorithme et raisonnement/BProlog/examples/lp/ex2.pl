go:-
    Vars=[X1,X2,X3,X4],
    X1   + 2*X3    $=< 740,
    2*X2   - 7*X4 $=< 0,
    X2 - X3 + 2*X4 $>= 0.5,
    X1 + X2 + X3 + X4 $= 9,
    Cost=X1 + X2 + 3*X3 - 0.5*X4,
    lp_solve(Vars,max(Cost)),
    format("sol(~w,~f)~n",[Vars,Cost]).




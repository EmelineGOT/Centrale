/*
Four roommates are subscribing to four newspapers. The following gives the amounts of time each person spend on each newspaper:

Person/Newspaper/Minutes
=============================================
Person || Asahi  | Nishi | Orient | Sankei
Akiko  ||    60  |   30  |      2 |  5
Bobby  ||    75  |    3  |     15 | 10
Cho    ||     5  |   15  |     10 | 30
Dola   ||    90  |    1  |      1 |  1

Akiko gets up at 7:00, Bobby gets up at 7:15, Cho gets up at 7:15, and Dola gets up at 8:00. Nobody can read more than one newspaper at a time and at any time a newspaper can be read by only one person. Schedule the newspapers such that the four persons finish the newspapers at an earliest possible time.
*/
go:-
    Vars = [A_Asahi,A_Nishi,A_Orient,A_Sankei,
	    B_Asahi,B_Nishi,B_Orient,B_Sankei,
	    C_Asahi,C_Nishi,C_Orient,C_Sankei,
	    D_Asahi,D_Nishi,D_Orient,D_Sankei],

    Up is 12*60,
    Vars :: 0..Up,

    A_Asahi #>=7*60, A_Nishi #>= 7*60, A_Orient #>= 7*60, A_Sankei #>= 7*60,
    B_Asahi #>=7*60+15, B_Nishi #>= 7*60+15, B_Orient #>= 7*60+15, B_Sankei #>= 7*60+15,
    C_Asahi #>=7*60+15, C_Nishi #>= 7*60+15, C_Orient #>= 7*60+15, C_Sankei #>= 7*60+15,
    D_Asahi #>=8*60, D_Nishi #>= 8*60, D_Orient #>= 8*60, D_Sankei #>= 8*60,

    cumulative([A_Asahi,A_Nishi,A_Orient,A_Sankei],[60,30,2,5],[1,1,1,1],1),
    cumulative([B_Asahi,B_Nishi,B_Orient,B_Sankei],[75,3,15,10],[1,1,1,1],1),
    cumulative([C_Asahi,C_Nishi,C_Orient,C_Sankei],[5,15,10,13],[1,1,1,1],1),
    cumulative([D_Asahi,D_Nishi,D_Orient,D_Sankei],[90,1,1,1],[1,1,1,1],1),

    cumulative([A_Asahi,B_Asahi,C_Asahi,D_Asahi],[60,75,5,90],[1,1,1,1],1),
    cumulative([A_Nishi,B_Nishi,C_Nishi,D_Nishi],[30,3,15,1],[1,1,1,1],1),
    cumulative([A_Orient,B_Orient,C_Orient,D_Orient],[2,15,10,1],[1,1,1,1],1),
    cumulative([A_Sankei,B_Sankei,C_Sankei,D_Sankei],[5,10,13,1],[1,1,1,1],1),
    
    EA_Asahi #= A_Asahi+60, 
    EA_Nishi #= A_Nishi+30, 
    EA_Orient #= A_Orient+2, 
    EA_Sankei #= A_Sankei+5,

    EB_Asahi #= B_Asahi+75, 
    EB_Nishi #= B_Nishi+3, 
    EB_Orient #= B_Orient+15, 
    EB_Sankei #= B_Sankei+10,

    EC_Asahi #= C_Asahi+5, 
    EC_Nishi #= C_Nishi+15, 
    EC_Orient #= C_Orient+10, 
    EC_Sankei #= C_Sankei+13,

    ED_Asahi #= D_Asahi+90, 
    ED_Nishi #= D_Nishi+1, 
    ED_Orient #= D_Orient+1, 
    ED_Sankei #= D_Sankei+1,
    
    max([EA_Asahi,EA_Nishi,EA_Orient,EA_Sankei,
	 EB_Asahi,EB_Nishi,EB_Orient,EB_Sankei,
	 EC_Asahi,EC_Nishi,EC_Orient,EC_Sankei,
	 ED_Asahi,ED_Nishi,ED_Orient,ED_Sankei]) #= Max,

    minof(labeling(Vars),Max),
    writeln(Vars),
    H is Max//60,M is Max mod 60,
    writeln(max(H,M)).

    

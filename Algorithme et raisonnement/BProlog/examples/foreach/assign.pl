/*  by Neng-Fa Zhou, Dec. 15, 2009, for B-Prolog 7.4 & up.
    based on a solution written by Markus Triska for SWI-Prolog, 
    which was based a solution by Mats Carlsson for SICStus.
*/
go:-
    time((solve(Groups,Cost),labeling([Cost|Groups]))),
    writeln((Cost,Groups)).

solve(Groups,TotalCost) :-
    data(NGroups,NSlots,Prefs,Capac,Compon),

    % use a variable for each group which takes on a slot
    length(Groups,NGroups),

    % The capacity of each slot cannot be exceeded
    foreach(T in 1..NSlots,
       sum([(Groups[G]#=T)*Compon[G] : G in 1..NGroups]) #=< Capac[T]),

    % The same slot is used for each group in the 
    % capacity constraint and the cost function
    transpose(Prefs,Matrix),
    Vs @= [I : I in 1..NSlots],
    Costs @= [Cost : (Slot,Row) in (Groups,Matrix),
	              [I,Cost],   % I and Cost are local
	              (element(I,Vs,Slot),element(I,Row,Cost))],
    sum(Costs) #= TotalCost.

transpose(Matrix,TMatrix):-
    N is Matrix^length,
    M is Matrix[1]^length,
    TMatrix @= [Mji : J in 1..M,[Mji],  % Mji is local
                (Mji @= [Matrix[I,J] : I in 1..N])].
    			  
data(Groups,Slots,Prefs,Capac,Compon) :-
    Groups = 26,
    Slots = 6,
    Prefs = [
	     [1,2,6,5,6,6,3,4,4,1,2,4,4,3,1,5,1,4,5,6,5,2,5,5,3,2],
	     [2,3,3,2,1,4,4,2,2,6,3,1,5,5,5,6,4,2,6,4,4,5,6,2,2,1],
	     [5,1,1,6,3,5,5,3,6,5,5,3,6,2,4,1,6,3,2,5,1,1,2,6,4,3],
	     [3,6,5,3,5,3,2,1,3,3,4,2,1,1,6,2,3,5,1,3,6,3,4,3,6,5],
	     [4,4,4,4,2,2,1,6,1,4,6,5,2,4,2,3,5,6,4,2,3,6,1,1,1,6],
	     [6,5,2,1,4,1,6,5,5,2,1,6,3,6,3,4,2,1,3,1,2,4,3,4,5,4]
	     ],
    Capac = [18,18,18,18,18,18],
    Compon = [5,4,4,4,3,3,3,3,3,4,4,5,5,2,5,3,4,4,3,3,3,5,2,4,4,5]. 

/*epouse(sylvie,jean).
epouse(marie,paul).
epouse(helene,jacques).
epouse(bernadette,jose).
epouse(valentine,loic).

enfant(jacques,jean).
enfant(pierre,jean).
enfant(marie,jean).
enfant(eric,pierre).
enfant(thomas,pierre). 
enfant(vincent,jacques).
enfant(loic,jacques).
enfant(michele,jacques).
enfant(valentin,jose).
enfant(olivier,jose).
enfant(mark,marie).
enfant(laure,marie).
enfant(sophie,sylvie).
enfant(alex,sylvie).
enfant(david,thomas).
enfant(christine,thomas).
enfant(serge,laure).
enfant(juliette,laure).

homme(jean).
homme(paul).
homme(jacques).
homme(jose).
homme(loic).
homme(pierre).
homme(thomas).
homme(valentin).
homme(alex).
homme(david).
homme(serge).
homme(olivier).
homme(mark).
homme(eric).
homme(vincent).*/


femme(X) :- nonvar(X), \+ homme(X). 


epoux(H,F) :- epouse(F,H).
pere(Dad,Enf) :- enfant(Enf,Dad),homme(Dad).
mere(Mam,Enf) :- enfant(Enf,Mam),femme(Mam).
parent(Par,Enf) :- pere(Par,Enf).
parent(Par,Enf) :- mere(Par,Enf).
fils(Enf,Par) :- enfant(Enf,Par),homme(Enf).
fille(Enf,Par) :- enfant(Enf,Par),femme(Enf).

frere(Enf1,Enf2) :- parent(Par,Enf1),parent(Par,Enf2),homme(Enf1).
soeur(Enf1,Enf2) :- parent(Par,Enf1),parent(Par,Enf2),femme(Enf1).

grand_pere(Gp,Enf) :- parent(Gp,Par),parent(Par,Enf),homme(Gp).
grand_mere(Gm,Enf) :- parent(Gm,Par),parent(Par,Enf),femme(Gm).

oncle(Tonton,Enf) :- parent(Par,Enf),frere(Tonton,Par).
tante(Tata,Enf) :- parent(Par,Enf),soeur(Tata,Par).

ancetre(Pers1,Anc) :- parent(Anc,Pers1).
ancetre(Pers1,Anc) :- parent(Par,Pers1),parent(Anc,Par).


%Le frère du fils du mari de la mère du père de la soeur du fils de ma mère
%Cest mon oncle sil y a les bons frères et soeurs, pas équivalent au prédicat oncle

qui_est(X,M) :- frere(X,Y),fils(Y,Z),epoux(Z,A),mere(A,B),pere(B,C),soeur(C,D),fils(D,E),mere(E,M).

epouse(marie,jean).
enfant(pierre,marie).
enfant(pierre,jean).
enfant(jean,paul).

fille(helene,marie).
epouse(helene,paul).
enfant(jacques,paul).
enfant(jacques,helene).











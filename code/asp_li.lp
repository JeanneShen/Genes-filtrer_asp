%% Anran et Li 10/02/2023

#include "dataB.lp".
#const k = 3.

%1. select k genes
k{selgens(V):atom(E,V,S,C)}k.
aff(E,V,S,C) :- selgens(V),atom(E,V,S,C).

%2.1. chercher des cells dans different class et avec same expression sur k gene
egaleclass(I,J,V) :- aff(I,V,S1,C1),aff(J,V,S2,C2),C1 == C2,I!=J, S1==S2.
0{affiniteClass(I,J)}1 :- 10 = {egaleclass(I,J,_)},aff(I,_,_,C1),aff(J,_,_,C2),C1 == C2.

%2.1bis
egale2(I1,I2) :- affinite(I1,J),affinite(I2,J),I1 != I2.
egale2(J1,J2) :- affinite(I,J1),affinite(I,J2),J1 != J2.

%2.2. 
egale(I,J,V) :- aff(I,V,S1,C1),aff(J,V,S2,C2),C1 != C2, S1==S2,I < J,score(I,Q1),score(J,Q2).
0{affinite(I,J)}1 :- k={egale(I,J,_)},aff(I,_,_,_),aff(J,_,_,_).

%2.3
:- affinite(I,J1), affinite(I,J2), J1!=J2.
:- affinite(I1,J), affinite(I2,J), I1!=I2.

:- affinite(I,_), affinite(J,_), affiniteClass(I,J).
:- affinite(_,J1), affinite(_,J2), affiniteClass(J1,J2).

:- affinite(I,_), affinite(J,_), egale2(I,J).
:- affinite(_,J1), affinite(_,J2), egale2(J1,J2).

%2.4 score
score(E,Q) :- Q = #sum{S: aff(E,_,S,_)},aff(E,_,_,_).  % Q est la somme des valeurs de expression
:- score(E,Q),Q=0.

%3. maximize
#maximize {1,I:affinite(I,_)}.

#show selgens/1.
#show affinite/2.
#include "data_B.lp".

%1. select k genes
5{selgens(V):atom(E,V,S,C)}5.
aff(E,V,S,C) :- selgens(V),atom(E,V,S,C).

%2.1. chercher des cells dans meme class et avec same expression sur k gene
egaleClass(I,J,V) :- aff(I,V,S1,C1),aff(J,V,S2,C2),I < J,C1 == C2, S1==S2.
countegaleClass(I,J,M) :- M = {egaleClass(I,J,_)},aff(I,_,_,C1),aff(J,_,_,C2),C1 == C2.
affiniteClass(I,J) :- countegaleClass(I,J,10),aff(I,_,_,C1),aff(J,_,_,C2),C1 == C2.

%2.2. the same pert but in different class
egale(I,J,V) :- aff(I,V,S1,C1),aff(J,V,S2,C2),C1 != C2, S1==S2,I < J,score(I,Q1),score(J,Q2).
countegale(I,J,M) :- M = {egale(I,J,_)},aff(I,_,_,_),aff(J,_,_,_).
0{affinite(I,J)}1 :- countegale(I,J,5),aff(I,_,_,_),aff(J,_,_,_).
:- affinite(I,J1),affinite(I,J2),J1 != J2.
:- affinite(I1,J),affinite(I2,J),I1 != I2.
:- affinite(I,_),affinite(J,_),affiniteClass(I,J).
:- affinite(_,I),affinite(_,J),affiniteClass(I,J).

%2.3. les k genes ne sont pas tous 0 dans les cells choisis
score(E,Q) :- Q = #sum{S: aff(E,_,S,_)},aff(E,_,_,_).  % Q est la somme des valeurs de expression
:- score(E,Q),Q=0.



%3. maximize
#maximize {1,I:affinite(I,_)}.

#show selgens/1.
#show affinite/2.

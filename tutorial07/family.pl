
/** Mother relation **/
mother(edith, john).
mother(mary, aj).
mother(mary, amber).
mother(mary, rachel).
mother(tuhi, lance).
mother(tuhi, mary).

/** Father relation. **/
father(john, aj).
father(john, amber).
father(john, rachel).

/** X is Y's parent if they are the mother or father of Y. **/
parent(X, Y) :- mother(X, Y) ; father(X, Y).

/** X is Y's grandmother if they are the mother of a parent of Y. **/
grandmother(X, Z) :- mother(X, Y), parent(Y, Z).

/** X and Y are siblings if they share a parent.
    X and Y must be distinct. **/
sibling(X, Y) :- parent(M, X), parent(M, Y), X \= Y.



% How would you do uncle? Cousin?
% Might need to introduce extra relations which capture a person's sex.


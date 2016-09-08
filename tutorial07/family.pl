mother(mary, amber).
mother(mary, rachel).
mother(mary, aj).
mother(tuhi, mary).
grandmother(X, Z) :- mother(X, Y), mother(Y, Z).

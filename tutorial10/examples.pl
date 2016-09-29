
% NDFA WITH CUTS

edge(1, a, 2).
edge(1, b, 2).
edge(2, b, 3).
edge(2, c, 3).

% Check if the machine is non-deterministic.
ndfa :-
   edge(Start, Event, End1),
   edge(Start, Event, End2),
   End1 \= End2, !.

dfa :- not(ndfa).
% dfa :- \+ ndfa.




% FAMILY TREE EXAMPLE

father(john, aj).
mother(edith, john).
mother(mary, aj).
mother(tuhi, mary).


% GOOD VERSION: Prolog tries both cases of grandma and finds both solutions.
% grandma(G, X) :- mother(G, M), mother(M, X).
% grandma(G, X) :- mother(G, F), father(F, X).

% BAD VERSION: cuts prevent Prolog from trying both cases of grandma.
grandma(G, X) :- mother(G, M), mother(M, X), !.
grandma(G, X) :- mother(G, F), father(F, X), !.





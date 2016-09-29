

edge(1, event, 2).
edge(1, event, 2).
edge(1, event, 4).

% Count number of occurrences of an item in a list.
count(_, [], 0) :- !.

count(X, [X|L], Sum) :-
   count(X, L, SubSum),
   Sum is 1 + SubSum, !.

count(X, [Y|L], Sum) :-
   X \= Y,
   count(X, L, Sum), !.

% Gather all the edges in the machine.
edges(List) :- findall( edge(A, E, B), edge(A, E, B), List).

% Holds if the machine has a parallel edge.
parallel(E) :-
   edges(Edges),
   member(E, Edges),
   count(E, Edges, Count),
   Count > 1.

% Robust version to check if the machine is non-deterministic.
ndfa :- parallel(_), !.

ndfa :-
   edge(Start, Event, End1),
   edge(Start, Event, End2),
   End1 \= End2, !.



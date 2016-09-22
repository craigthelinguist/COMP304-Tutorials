
start(1).
finish(3).

transition(1, a, 2).
transition(1, b, 2).
transition(1, c, 3).
transition(2, c, 3).

% This makes it non-deterministic.
transition(1, a, 3).

% This makes the language an infinite set.
transition(2, d, 2).


accept(String) :-
    start(State),
    acceptingPath(State, String).

acceptingPath(State, []) :- finish(State).

acceptingPath(State1, [NextEvent | RestOfEvents]) :-
    transition(State1, NextEvent, State2),
    acceptingPath(State2, RestOfEvents).

language(L) :-
    findall(String, accept(String), L).


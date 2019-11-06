% author Jeffery Russell
% 11-5-19
% PLC-assignment 3




% path(a, b, d)
% a is the starting point of the path
% b is the endoing point of the path
% d is the distance of the path

path(a, b, 10).
path(b, c, 15).
path(d, c, 5).
path(d, b, 10).


% makes paths bi-directional
biPath(A, B, Y) :- path(A, B, Y).
biPath(A, B, Y) :- path(B, A, Y).

% X is starting point
% Y is ending point
% P is a list of the points on the final path if one exists
% N is the distance between X and Y if one exists

% rule for terminal
solveV(X, X, [], 0, []).

% rule for one away
solveV(A, B, [A|B], N, []) :- biPath(A, B, C), N is C. 


solveV(A, B, [A|PP], N, V) :- biPath(A, C, F), solveV(C, B, PP, U, []), 
    N is F + U.

% more than one away
%solveV(A, C, P, N, V) :- biPath(A, B, T),
%    \+member(B, V),
%    solveV(B, C, [A|B], U, [B|V]) ,
%    N is T + U,
%    P is [P|B].


solve(A, B, P, N) :- solveV(A, B, P, N, []).
%solve(X, Y, P, N) :- path()


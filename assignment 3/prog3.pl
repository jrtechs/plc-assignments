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
path(d, e, 45).


% makes paths bi-directional
biPath(A, B, Y) :- path(A, B, Y).
biPath(A, B, Y) :- path(B, A, Y).

% X is starting point
% Y is ending point
% P is a list of the points on the final path if one exists
% N is the distance between X and Y if one exists

% rule for terminal
solveV(X, X, [X], 0, V).

% rule for one away
solveV(A, B, [A, B], N, V) :- biPath(A, B, C), \+member(B, V), N is C. 


%solveV(A, B, [A, C, B], N, V) :- biPath(A, C, CC),
%                                biPath(C, B, CCC), 
%                                N is CC + CCC.

solveV(A, B, [A|P], N, V) :- biPath(A, C, CC),
                             \+member(C, V),
                             solveV(C, B, P, CCC, [C|V]),
                             N is CC + CCC.

solve(A, B, P, N) :- solveV(A, B, P, N, [A]).
%solve(X, Y, P, N) :- path()


% author Jeffery Russell
% 11-5-19
% PLC-assignment 3

% path(a, b, d)
% a is the starting point of the path
% b is the endoing point of the path
% d is the distance of the path

%ex:
%              h
%              -
%              -
%  a---b---f---g
%     -        -
%   -  -       -
%  c---d-------e
%path(a, b, 10).
%path(b, c, 15).
%path(d, c, 5).
%path(d, b, 10).
%path(d, e, 45).
%path(b, f, 6).
%path(g, f, 3).
%path(e, g, 2).
%path(h, g, 4).

% ex test runs in interpreter
% solve(h, c, P, N).
% solve(a, e, P, N).
% solve(g, c, P, N).
% solve(a, a, P, N).
% solve(g, h, P, N).

% makes paths bi-directional
biPath(A, B, Y) :- path(A, B, Y).
biPath(A, B, Y) :- path(B, A, Y).

% X is starting point
% Y is ending point
% P is a list of the points on the final path if one exists
% N is the distance between X and Y if one exists

% rule for terminal
solveV(X, X, [X], 0, V).

% recursively build out path
solveV(A, B, [A|P], N, V) :- biPath(A, C, CC),
                             \+member(C, V),
                             solveV(C, B, P, CCC, [C|V]),
                             N is CC + CCC.

% expand given definition to helper function
solve(A, B, P, N) :- solveV(A, B, P, N, [A]).

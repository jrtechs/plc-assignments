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


path(A, B, Y) :- path(B, A, Y).

% X is starting point
% Y is ending point
% P is a list of the points on the final path if one exists
% N is the distance between X and Y if one exists

% rule for terminal
solve(X, X, [], 0).

% rule for one away
solve(A, B, P, N) :- path(A, B, C), P is [B], N is C. 

% more than one away
solve(A, C, P, N) :- path(A, B, T), solve(B, C, Y, U) , N is T + U, P is [P|B]

%solve(X, Y, P, N) :- path()


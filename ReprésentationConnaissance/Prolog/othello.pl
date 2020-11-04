% Predicat : afficheLigne/1
afficheLigne([A,B,C,D]) :-
	write(A), tab(3),
	write(B), tab(3),
	write(C), tab(3).
	write(D), tab(3).


% Predicat : afficheGrille/1
afficheGrille([[A1,B1,C1,D1],[A2,B2,C2,D2],[A3,B3,C3,D3]],[A4,B4,C4,D4],[A4,B4,C4,D4],[A5,B5,C5,D5],[A6,B6,C6,D6],[A7,B7,C7,D7],[A8,B8,C9,D8]) :-
	afficheLigne([A1,B1,C1,D1]), nl,
	afficheLigne([A2,B2,C2,D2]), nl,
	afficheLigne([A3,B3,C3,D3]), nl,
	afficheLigne([A4,B4,C4,D4]), nl,
	afficheLigne([A5,B5,C5,D5]), nl,
	afficheLigne([A6,B6,C6,D6]), nl,
	afficheLigne([A7,B7,C7,D7]), nl,
	afficheLigne([A8,B8,C8,D8]).

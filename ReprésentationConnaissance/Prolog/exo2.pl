/*afficher tous les él*/
afficher_Liste([X|L]) :- writeln(X),afficher_Liste(L).
appartien(X,[X|_]).
appartien(X,[_|L]) :- appartien(X,L).
ajout([],X,X).  %Unification
ajout([X|L1],L2,[X|L3]) :- ajout(L1,L2,L3).

dernier(X,[X]).
dernier(X,[_|L]) :- dernier(X,L).

affiche([]).
affiche([X|L]):- write(X),nl,affiche(L).
revers(L1,L2):- revers(L1,L2,[]).
revers([],X,X).
revers([X|L],Z,L3) :- revers(L,Z,[X|L3]).

conc([],L,L).
conc([X|L1],L2,[X|L3]):- conc(L1,L2,L3).

mini(L1,L2,V):- conc(L1,L2,L3),mini(L3,V).

mini([V],V).
mini([V|R],V):- mini(R,Min), V=<Min.
mini([V|R],Min):- mini(R,Min), V>Min.

joue(mozart, piano).
joue(tim, guitare).
joue(zoe, guitare).
joue(zoe, piano).
joue(nina, basse).
chante(tim).
%base des règles
choriste(X):- chante(X),joue(X,_). %X est choriste si X est chanteur et X joue de n'importe qu'el instruement
polyvalent(X):- joue(X,piano),joue(X,guitare).
polyvalent(X):- joue(X,piano),joue(X,basse).
polyvalent(X):- joue(X,guitare),joue(X,basse).
duo(X,Y):- joue(X,I),joue(Y,I),X\=Y.
batteur(X):-joue(X,basse).
somme(X,Y,Z):- Z is X +Y.
age(tim, 22).
age(zoe, 23).
age(nina, 18).
plusjeune(X,Y):- age(X,A), age(Y,B), A<B.

sup(X,Y):- X>Y.
inf(X,Y):-  not(sup(X,Y)),X\=Y.
dif(X,Y,Z):- Z is X-Y.
abs(X,Y):- Y is X*(-1),X<0.
abs(X,X):- X>0.
difb(X,Y,A):- dif(X,Y,Z),abs(Z,A).
carre(X,A):- A is X*X.
puis(X,1,X).
puis(X,Y,A):- K is Y- 1, puis(X,K,A1), A is A1 * X.
sum(0,0).
sum(X,S):- X1 is X-1, sum(X1,S1),S is S1+X.
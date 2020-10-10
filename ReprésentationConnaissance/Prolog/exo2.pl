non(0,1).  
non(1,0).

nand(X,Y,1):-  X =\= Y.
nand(_,_,0).

xor(X,Y):- non(X,Y).

circuit(X,Y,Z):-  



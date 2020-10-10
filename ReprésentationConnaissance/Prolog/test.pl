/*Alibi mardi de x par y*/
alibi(mardi,luc,bernard).
alibi(mardi,paul,bernard).
alibi(mardi,louis,luc).
alibi(jeudi,alain,luc).

/*personne douteuse*/
douteux(alain).

/*x veut se venger de y*/
vengeance(paul,jean).
vengeance(luc,jean).

/* x est héritier de y*/
heritier(bernard,jean).
heritier(jean,louis).

/*dette de x à y*/
dette(louis,jean).
dette(luc,jean).

/* armé */
arme(luc).
arme(louis).
marme(alain).

/* commettre crime */
crime(jean,alain).

/* désirer tuer quelqu'n x tueur , y victime*/
desireTuer(X,Y):- vengeance(X,Y);interet(X,Y).

/*interet*/
interet(X,Y):- heritier(X,Y);dette(X,Y);crime(Y,X).

/* alibi accepté*/
alibiAccepté(X):- alibi(_,X,Y),not(douteux(Y)).

/*assassin*/
assassin(X,Y) :- desireTuer(X,Y),arme(Y),not(alibiAccepté(Y)).
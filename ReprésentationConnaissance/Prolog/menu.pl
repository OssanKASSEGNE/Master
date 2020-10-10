/* les entrées */
entree(crudites).
entree(terrine).
entree(melon).
/* les viandes (avec légumes associés) */
viande(steack).
viande(poulet).
viande(gigot).
/* les poissons (avec légumes associés) */
poisson(bar).
poisson(saumon).
/* les desserts */
dessert(sorbet).
dessert(creme).
dessert(tarte).
/* composition d'un menu simple : une entréRee ET un plat ET un dessert */ menu_simple(E, P, D) :- entree(E), plat(P), dessert(D).
/* le plat de résistance : viande OU poisson */ plat(P) :- viande(P).
plat(P) :- poisson(P).
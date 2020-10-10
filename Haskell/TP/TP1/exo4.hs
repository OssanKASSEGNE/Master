----------------------------------------------------------------
-- Exo 4 : Dominos
----------------------------------------------------------------

type Domino = (Int,Int) -- On crée un type Domino qui est une paire d'entiers

-- Prend deux dominos en paramètres et retourne True s'ils forment une chaîne linéaire
compareDomino :: Domino -> Domino -> Bool 

-- Ici je peux remplacer domino par (x,y)
compareDomino domino1 domino2 = if ((fst domino1 ) == (fst domino2)) || ((snd domino1 ) == (fst domino2)) || ((fst domino1 ) == (snd domino2)) || ((snd domino1 ) == (snd domino2)) -- on compare les cases des dominos
                                then True
                                else False


creerNouveauDomino :: Domino -> Domino -> Domino                 --Prend deux dominos et retourne une combinaison s'ils sont linéarisables sinon retourne le domino1
creerNouveauDomino (x1, y1) (x2, y2)  | x1 == x2       = (y1,y2)
                                      | y1 == x2       = (x1,y2)
                                      | x1 == y2       =  (y1,x2)
                                      | y1 == y2       = (x1,x2)
                                      | otherwise      = (x1,y1)


-- Prend 3 dominos et vérifie la faisabilité de la linéarité
compareDomino3 :: Domino -> Domino -> Domino -> Bool 

compareDomino3 domino1 domino2 domino3 = if (compareDomino domino1 domino2)    -- Compare deux dominos 
                                         then compareDomino (creerNouveauDomino domino1 domino2) domino3 --Créer un nouveau domino à partir des deux qui sont linéarisables et on le compare au 3ème
                                         else if (compareDomino domino1 domino3)
                                               then compareDomino (creerNouveauDomino domino1 domino3) domino2 
                                               else if (compareDomino domino2 domino3)
                                               then compareDomino (creerNouveauDomino domino2 domino3) domino1 
                                               else False

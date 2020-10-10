----------------------------------------------------------------
-- Exo 2 : Fonction Qsort Diapo 8 du cours
----------------------------------------------------------------

qsort :: Ord a => [a] -> [a] -- Prend une liste de type a et retourne une liste de type a
qsort [] = []                        -- 1ère équation : retourne liste vide si appliquée sur une liste                          

qsort (x : xs) = qsort smaller ++ [x] ++ qsort larger
 where smaller = [a | a <- xs, a <= x]
       larger   = [a | a <- xs, a > x]

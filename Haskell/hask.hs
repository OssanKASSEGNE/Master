-- a drop supprime n éléments d'un tableau
drop' :: Int -> [a] -> [a]
drop' 0 liste = liste
drop' nombre [] = []
drop' nombre (premier:reste) =  drop' (nombre-1) reste 

-- take '
take' :: Int -> [a] -> [a]
take' 0 liste = []
take' nombre [] = []
take' nombre (premier:reste) = premier : take' (nombre-1) reste

--fonction halve
halve' :: [a] -> ([a],[a])
halve' liste = ( take' n liste, drop' n liste) where 
       n = div (length liste) 2
      
--merge fusion
merge' :: (Ord a) => [a] -> [a] -> [a] 
merge' liste1 liste2 = liste1 ++ liste2

--msort tri par fusion

msort' :: (Ord a) => [a] -> [a]
msort' [] = []

-- Exercice 2 
l = [1..6]
-- a Parité : 

paire :: Integer -> Bool 
paire 0 = True
paire x = impaire (x - 1)

impaire :: Integer -> Bool
impaire 0 = False 
impaire x = paire (x - 1)

-- b drop supprime n premiers éléments

drop' :: Int -> [a] -> [a]
drop' 0 liste = liste
drop' _ [] = []
drop' n (x:xs) = drop' (n-1) xs

--c take 

take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

-- halve

halve' liste = (take' n liste , drop' n liste)
    where n = length liste `div` 2
 
--merge'
merge' :: (Ord a) => [a] -> [a] -> [a]
merge' [] liste2 = liste2
merge' liste1 [] = liste1
merge' (x1:xs1) (x2:xs2)
    | x1 <= x2         =    x1 : merge' xs1 (x2:xs2)
    | otherwise        =    x2 : merge' (x1:xs1) xs2

--msort'
msort' :: (Ord a) => [a] -> [a]
msort' [x] = [x]
msort' liste = merge' (msort' premier) (msort' second)
   where
   premier = fst (halve' liste)
   second =  snd (halve' liste)



import Prelude hiding ( product, length,init, (++) )

--Exercice 1

liste = [1..4]

--product' calcul le produit

product :: [Integer] -> Integer 
product [] = 1
product (x:xs) = x * product xs 

-- length longeur de liste

length :: [Integer] -> Integer
length [] = 0
length (x:xs) = 1 + length (xs)

--init' liste sans le dernier élément

init :: [a] -> [a]
init [x] = []  -- quand il reste un seule élément dans la liste, je la ferme
init (x:xs) = x:init(xs)

--Concatnation de liste
(++) :: [a] -> [a] -> [a]
(++) liste [] = liste
(++) [] liste = liste
(++) (x:xs) liste = x : (++) xs liste

--Insertion 
insert :: (Ord a) => a -> [a] -> [a]
insert x [] = [x]
insert v (x:xs) 
    | v <= x  =   v : x : xs
    | otherwise    = x : insert v xs

-- isort 
isort' :: (Ord a) => [a] -> [a]
isort' [] = []
isort' (premier:reste) = insert premier $ isort' reste
-- solution : insert x [insert y [insert z []]
-- il va commencer par insérer à la fin dans une liste vide.

 



	
	
	





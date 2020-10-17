ajoute1 :: [Int] -> [Int]
ajoute1 [] = []
ajoute1 (x:xs) =   f x : ajoute1 xs
    where 
        f x = x + 1

tra :: (a->b) ->[a]->[b]
tra f [] = []
tra f (x:xs) = f x : tra f xs
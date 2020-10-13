inverse :: [a] -> [a]
inverse [] = []
inverse (x:xs) = inverse xs ++ [x] 

isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs | 1 >= length xs = False
                | otherwise = xs == inverse xs

doPalindrome :: [a] -> [a]
doPalindrome xs = init xs ++ inverse xs


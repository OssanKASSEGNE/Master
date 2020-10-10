----------------------------------------------------------------
-- Exo 7  : Palindrome
----------------------------------------------------------------

--a. Fonction inverse

inverse :: [x] -> [x]
inverse [] = []
inverse (x:xs) = inverse xs ++ [x]

--b. isPalindrome

isPalindrome :: Eq x => [x] -> Bool
isPalindrome xs | length xs <= 1    = False
isPalindrome xs = xs == inverse xs

dopalindrome :: [a] -> [a]
dopalindrome xs = init x ++ inverse xs

              


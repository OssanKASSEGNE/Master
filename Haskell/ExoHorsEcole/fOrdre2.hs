appli = ($ 3) sqrt
-- ($) sqrt 3
-- ($ 3) ^2   =>  ($) (^) 2 3
-- (x#) = \x  -> x#y
-- (#y) = \y -> x#y

{- Composée de fonction-}
test = [1,3,4,2,5]
comp :: (Num a) => [a] -> [a]
comp liste = map (\x -> negate $ abs x) liste

comp' :: (Num a) => [a] -> [a]
comp' liste = map (negate.abs) liste
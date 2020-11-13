

data Op =  Add | Sub | Mul | Div deriving (Eq)

data Expr = Val Int | App Op Expr Expr 

ops :: [Op]
ops = [Add, Sub, Mul, Div]

-- a --
instance Show Op where
    show Add = " + "
    show Sub = " - "
    show Mul = " * "
    show Div = " / "

-- b --
valid :: Op -> Int -> Int -> Bool
valid Mul a b = (a > 0) && (b > 0)
valid Add a b = (a > 0) && (b > 0)
valid Div a b = (a >= b) && (a > 0) && (b > 0)  -- 
valid Sub a b = (a > b) && (a > 0) && (b > 0)   -- valide si a > à b

-- c --
apply :: Op -> Int -> Int -> Int
apply Add a b = a + b
apply Mul a b = a * b
apply Div a b = div a b
apply Sub a b =   a - b
-- d --
instance Show Expr where
    show (Val x) = show x
    show (App op exp1 exp2) | op == Add || op == Sub = (show exp1) ++ (show op) ++ (show exp2)
                            | otherwise = "("++(show exp1) ++ (show op) ++ (show exp2)++")"

-- e --
values :: Expr -> [Int]
values (Val a) = [a]
values (App _ expr1 expr2) = values expr1 ++ values expr2

-- f --
eval:: Expr -> [Int]
eval (Val x) =[x | x > 0]
eval (App op exp1 exp2) = [apply op x y | x <- eval exp1, y <- eval exp2, valid op x y]

-- g --
subs :: [a] -> [[a]]
subs [] = [[]]
subs (x:xs) = map (x:) (subs xs) ++ subs xs
--subs prend une liste d'éléments , retourne la liste des combinaisons qu'on peut obtenir à partir des éléments

-- h --
interleave :: a -> [a] -> [[a]]
interleave val liste = [ take i liste ++ [val] ++ drop (i) liste | i <- [0..fin]]
    where
        fin = length liste 

-- i --
perms :: [a] -> [[a]]
perms [] = [[]]
perms (x:xs) = concat [interleave x ys | ys <- perms xs]

-- j --
choices :: [a] -> [[a]] 
choices liste = concatMap perms (subs liste)

-- k --
solution :: Expr -> [Int] -> Int -> Bool
solution expr liste res = (values expr `elem` choices liste) && (eval expr == [res])

-- l --
split :: [a] -> [([a],[a])]
split liste = [ (take i liste, drop i liste) | i <- [1..(length liste-1)]]

-- m -- 
combine :: Expr -> Expr -> [Expr]
combine expr1 expr2 =  [ App op expr1 expr2 | op <- ops]

-- n --
exprs :: [Int] -> [Expr]
exprs [] = []
exprs [n] = [Val n]
exprs ns = [ e | (ls, rs) <- split ns ,
        l <- exprs ls ,
        r <- exprs rs ,
        e <- combine l r ]

solutions :: [Int] -> Int -> [Expr]
solutions liste res = [ l | l <- expr, eval l == [res]]
    where 
        expr = concatMap exprs (choices liste)
    
solutions'  ::  [Int] ->  Int ->  [Expr]
solutions' xs x = [exp1 | xs' <- choices xs, exp1 <- exprs xs', eval exp1 == [x]]
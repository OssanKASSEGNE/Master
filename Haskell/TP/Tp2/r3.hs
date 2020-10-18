import Prelude hiding (and)
data Prop = Const Bool
    | Not Prop
    | Var Char
    | Imply Prop Prop
    | And Prop Prop

type Assoc k v = [(k, v)]
type Subst = Assoc Char Bool

find :: Eq k => k -> Assoc k v -> v
find v tab = head [y | (x,y)<- tab,x==v]

p1 :: Prop
p1 = And (Var 'A') (Not (Var 'A'))
p2 :: Prop
p2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')
p3 :: Prop
p3 = Imply (Var 'A') (And (Var 'A') (Var 'B'))
p4 :: Prop
p4 = Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')

imply ::Bool -> Bool -> Bool
imply x y 
    | x = y 
    |otherwise = not(x)

eval :: Subst -> Prop -> Bool
eval _ (Const a) = a
eval sub (Var carac) = find carac sub
eval sub (Not prop)  = not (eval sub prop)
eval sub (And prop1 prop2) =  (eval sub prop1) && (eval sub prop2)
eval sub (Imply prop1 prop2) = imply (eval sub prop1) (eval sub prop2)

a = [('B',True),('A',False)]

vars2 :: Prop -> [Char]
vars2 (Var var) = [var]
vars2 (Const _) = []
vars2 (Not prop) = vars2 prop
vars2  (And prop1 prop2) = vars2 prop1 ++ (vars2 prop2)
vars2 (Imply prop1 prop2) = vars2 prop1 ++ (vars2 prop2)

rmdups :: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/= x) (rmdups xs)
vars :: Prop -> [Char]
vars p = rmdups (vars2 p)

bools :: Int -> [[Bool]]
bools 0 = [[]]
bools n = createFalseSide ++ createTrueSide
    where
        createFalseSide = map (False :) (bools (n-1))
        createTrueSide = map (True :) (bools (n-1))

substs :: Prop -> [Subst]
substs p = map (zip vs) (bools (length vs))
        where vs = vars p

        
and :: [Bool] -> Bool
and [] = True
and (x:xs) = x && (and xs)

isTaut :: Prop -> Bool
isTaut p = and ( map (`eval` p) tableauDeSubsts )
    where 
        tableauDeSubsts = substs p


resultatFinale = map isTaut [p1,p2,p3,p4]
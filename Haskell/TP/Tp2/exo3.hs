import Prelude hiding (find)

l= ('A',True)
m= ('A',False)
n= ('B',True)
o = ('B', False)
a = Var 'A'
b = Var 'B'

data Prop = Const Bool | Var Char
 | Not Prop
 | And Prop Prop
 | Imply Prop Prop deriving (Show, Eq)
 
type Assoc k v = [(k, v)]
type Subst = Assoc Char Bool
 
p1 :: Prop
p1 = And (Var 'A') (Not (Var 'A'))
p2 :: Prop
p2 = Imply (And (Var 'A') (Var 'B')) (Var 'A')
p3 :: Prop
p3 = Imply (Var 'A') (And (Var 'A') (Var 'B'))
p4 :: Prop
p4 = Imply (And (Var 'A') (Imply (Var 'A') (Var 'B'))) (Var 'B')

-- find
find :: (Eq k) => k -> Assoc k v -> v
find nombre liste =  head [ v | (k,v) <- liste , k == nombre]

--imply 
imply :: Bool -> Bool -> Bool
imply False _ = True
imply True v = v


-- eval
eval :: Subst -> Prop -> Bool
eval _ (Const x) = x
eval liste (Var x )  = find x liste
eval liste (And x y) =  (eval liste x) && (eval liste y)
eval liste (Not x) = not (eval liste x) 
eval liste (Imply x y ) = imply (eval liste x) (eval liste y)

-- c ) 
vars2 :: Prop -> [Char]
vars2 (Const _) = []
vars2 (Var x) = [x]
vars2 (Not x) = vars2 x
vars2 (And x y) = (vars2 x) ++ (vars2 y)
vars2 (Imply x y) = (vars2 x) ++ (vars2 y)

rmdups:: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x: filter (/=x) (rmdups xs)
vars:: Prop -> [Char]
vars p = rmdups (vars2 p)

--d
bools:: Int -> [[Bool]]
bools 0 = [[]]
bools n = map (False:) bss ++ map (True:)bss
    where bss = bools (n-1)

--e 

substs:: Prop -> [Subst]
substs p = map (zip vs) (bools (length vs))
    where vs = vars p

--f 
isTaut::  Prop ->  Bool
isTaut p = and [ eval s p | s <- substs p]	




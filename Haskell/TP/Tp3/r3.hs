type Matf = Int -> Int -> (Bool,Int)

exemple :: Matf
exemple i j
    | (1<=i)&&(i<=6)&&(1<=j)&&(j<=5)  = (True, 2*i + j)
    | otherwise = (False,0)

identite4x4 :: Matf
identite4x4 i j
    | (1<=i)&&(i<=4)&&(1<=j)&&(j<=4)&&(i==j)  = (True, 1)
    | (1<=i)&&(i<=4)&&(1<=j)&&(j<=4)&&(i/=j)  = (True, 0)
    | otherwise = (False,0)

identite6x5 :: Matf
identite6x5 i j
    | (1<=i)&&(i<=6)&&(1<=j)&&(j<=5)&&(i==j)  = (True, 1)
    | (1<=i)&&(i<=6)&&(1<=j)&&(j<=5)&&(i/=j)  = (True, 0)
    | otherwise = (False,0)

nbLines :: Matf -> Int
nbLines f = nbl f 1 1

nbl :: Matf -> Int -> Int -> Int
nbl f i j 
    | f i 1 /= (False,0) = nbl f (i+1) 1
    | otherwise  = (i-1)

nbCols :: Matf -> Int
nbCols f = (head[j | j <- [1..] , f 1 j == (False,0) ]) -1

dims :: Matf -> (Int,Int)
dims f = (nbLines f , nbCols f)

cmpDims :: Matf -> Matf -> Bool
cmpDims f1 f2 = (dims f1) == (dims f2)

add :: Matf -> Matf -> Matf
add f1 f2 
    | (cmpDims f1 f2) = (\i j -> if (fst (f1 i j) && fst (f2 i j)) then ((True,snd( f1 i j) + snd( f2 i j))) else (False,0))
    | otherwise = error " Dimensions différentes"

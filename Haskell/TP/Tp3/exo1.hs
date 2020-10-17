
type Matf = Int -> Int -> (Bool, Int)

exemple :: Matf
exemple i j | (1 <= i) && (i<= 6) && (1<= j) && (j<= 5) = (True, 2*i+j)
            | otherwise = (False, 0)

identique4x4 :: Matf
identique4x4 i j | (1 <= i) &&  (i<= 4) && (1<= j) && (j<= 4) && i == j = (True,1)
                  | (1 <= i) &&  (i<= 4) && (1<= j) && (j<= 4) && i /= j = (True,0)
                  | otherwise = (False, 0)
ident :: Matf
ident i j | (1 <= i) &&  (i<= 6) && (1<= j) && (j<= 5) && i == j = (True,1)
                  | (1 <= i) &&  (i<= 6) && (1<= j) && (j<= 5) && i /= j = (True,0)
                  | otherwise = (False, 0)

inter ::  Matf -> Int -> Int
inter f i               -- i sera renseigné après  
    | f i 1 /= (False,0)   = inter f (i+1)   
    | otherwise = i-1 

inter2 ::  Matf -> Int -> Int
inter2 f j               -- i sera renseigné après  
    | f 1 j /= (False,0)   = inter f (j+1)   
    | otherwise = j-1 


nbLines :: Matf -> Int
nbLines f = inter f 1
 
nbCol :: Matf -> Int
--nbCol f = inter2 f 1

nbCol f =  head [j-1|j<-[1..],((f 1 j) ==(False,0))]
dims:: Matf ->(Int,Int)
dims m = (nbLines m, nbCol m)

cmpDims :: Matf -> Matf -> Bool
cmpDims m n = dims m == dims n

add :: Matf -> Matf -> Matf     --RETOURNER UNE FONCTION, C'EST RETOURNE UN LAMBDA

add m n 
    | not (cmpDims m n) = error "pas les mêmes dimensions"
    |otherwise = (\i j -> (if ((i>=1)&&(i<=l)&&(j>=1)&&(j<=c)) then (True,snd(m i j)+snd(n i j)) else (False,0)))
    where
        (l,c) = dims m
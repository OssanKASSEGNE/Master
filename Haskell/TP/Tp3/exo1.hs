--L = ligne et C = colonne--
type Matf = [[(Bool,Int)]]

matrice :: Int -> Int -> (Int -> Int-> (Bool,Int)) -> [[(Bool,Int)]]
matrice l c f = [ [ f i j|j<-[1..c]] | i <-[1..l]]

exemple :: Int -> Int -> [[(Bool,Int)]]
exemple l c = matrice l c (\i j -> if (i<= l && i>= 1 && j>=1 && j<= c) then (True,2*i+j) else (False,0))


identite4x4 :: Int -> Int -> [[(Bool,Int)]]
identite4x4 l c = matrice l c (\i j -> if (i== j) then (True,1) else (False,0))

nbLines :: Matf -> Int
nbLines matrice = length matrice

nbCols :: Matf -> Int
nbCols matrice = length $ head matrice

dims :: Matf -> (Int, Int)
dims matrice = (nbLines matrice, nbCols matrice)

cmpDims :: Matf -> Matf -> Bool 
cmpDims matrice1 matrice2 = dims matrice1 ==  dims matrice2

addLine :: [(Bool,Int)] -> [(Bool,Int)] ->[(Bool,Int)]
addLine [] [] = []
addLine ((_,valeur):xs) ((_,valeur2):xs2)
    | res /=0  = (True, res):(addLine xs xs2)
    | otherwise  = (False, res):(addLine xs xs2)
    where res = valeur + valeur2

add :: Matf -> Matf -> Matf  -- vérifier les dimensions
add [] [] = []
add a b
    | cmpDims a b  = (addLine x1 x2) : (add rest1 rest2)
    | otherwise = error "Les deux matrices n'ont pas même dimension"
    where 
        (x1:rest1) = a
        (x2:rest2) = b

      
           
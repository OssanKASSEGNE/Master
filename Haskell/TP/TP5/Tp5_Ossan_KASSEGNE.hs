import Data.Char
import Data.List
import System.IO()

size :: Int
size = 3 -- Taille de la grille

type Grid = [[Player]] -- La grille est une liste de lignes

data Player = O | X | B
              deriving (Eq, Ord)

-- a --
instance Show Player where
    show O = " O "
    show X = " X "
    show B = " B "

-- b --
next :: Player -> Player  -- Joueur suivant
next X = O
next O = X
next B = B

-- c -- 
empty :: Grid                   -- donne la grille vide
empty = replicate size line
    where line = replicate size B

-- d --
full :: Grid -> Bool                -- teste si la grille est pleine
full grille = B `notElem` concat grille

-- e --
diagN :: Grid ->Int -> [Player]  
diagN [] _ = []
diagN (x:xs) n = (x !! n) : diagN xs (n+1)

diag :: Grid -> [Player]
diag grille = diagN grille 0

-- f --
test :: Player -> [Player] -> Bool  -- teste l'égalité entre 3 players
test pion  = all (==pion) 

winsLignes ::  Player -> Grid -> Bool  -- teste si on a un vainqueur sur ligne
winsLignes pion grille =  foldr1 (||) (map (test pion) grille)

winsColonnes ::  Player -> Grid -> Bool  -- teste si on a un vainqueur sur colonne
winsColonnes pion grille = winsLignes pion (transpose grille)

winsDiag1 :: Player -> Grid -> Bool  -- teste si on a un vainqueur sur la diagonale1
winsDiag1 pion grille = test pion (diag grille)

winsDiag2 ::  Player -> Grid -> Bool  -- teste si on a un vainqueur sur la diagonale2
winsDiag2 pion grille = winsDiag1 pion (map reverse grille)

wins :: Player -> Grid -> Bool --teste si un pion est vainqueur
wins pion grille = winsLignes pion grille || winsColonnes pion grille || winsDiag1 pion grille || winsDiag2 pion grille

-- g --
won :: Grid -> Bool  --teste si la grille est gagnante pour un des deux
won grille = wins X grille || wins O grille

-- h --
insVert :: [String] -> [String]
insVert [a] = [a]
insVert (x:xs) = x:"|":xs

-- i --
showRow :: [Player] -> [String]
showRow [pion] = [show pion]
showRow (x:xs) = show x : "|" : showRow xs

-- j --
insHoriz :: [String]
insHoriz = replicate size "---" ++ replicate (size-1) "-"

-- k --
showGrid :: Grid -> IO ()
showGrid [] = putStr []
showGrid [x] = do
    putStrLn $ concat $ showRow x
showGrid (x:xs) = do
    putStrLn $ concat $ showRow x
    putStrLn $ concat insHoriz
    showGrid xs

-- m --
valid :: Grid -> Int -> Bool 
valid grille val = val `elem` cases && (grillePlate !! val) == B
    where 
        cases = [0..((size*size)-1)]
        grillePlate = concat grille

-- n --
cut :: Int -> [a] -> [[a]]
cut _ [] = []
cut n x = take n x : cut n (drop n x)

-- o --
move :: Grid -> Int -> Player -> [Grid]
move grille val pion
    | not(valid grille val) = [] 
    | otherwise = [cut size ( partie1 ++ (drop (val+1) grillePlate) ) ]
    where
        grillePlate = concat grille
        partie1 = (take (val) grillePlate)  ++ [pion]

cls :: IO ()
cls = putStr "\ESC[2J"

goto :: (Int, Int) -> IO ()

goto (x,y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")
 
run :: Grid -> Player -> IO ()
run g p = do 
     cls -- clear screen
     goto (1,1) -- go to the upper left position
     showGrid g
     run' g p

getNat :: String -> IO Int
getNat message = do 
    putStr message
    xs <- getLine
    if xs /= [] && all isDigit xs
       then return (read xs)
    else do putStrLn "Error: invalid number"
            getNat message

tictactoe :: IO ()
tictactoe = run empty O

prompt :: Player -> String
prompt p = "Player " ++ show p ++ ", enter your move: "

run' :: Grid -> Player -> IO ()
run' g p | wins O g = putStrLn "Player O wins!\n"
         | wins X g = putStrLn "Player X wins!\n"
         | full g = putStrLn "It's a draw!\n"
         | otherwise = do 
             i <- getNat (prompt p)
             case move g i p of
                 [] -> do putStrLn "Error: invalid move"
                          run' g p
                 [g'] ->  run g' (next p)
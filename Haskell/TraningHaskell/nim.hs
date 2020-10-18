type Board = [Int]
initial :: Board
initial = [5,4,3,2,1]
finished :: Board -> Bool
finished = all (== 0)

valide :: Int -> Int -> Board-> Bool  --valide si la ligne existe et quelle n'est pas vide
valide l nombre board
    | (ligne<=4) && (ligne >= 0) && ((contenu - nombre )>= 0) = True
    | otherwise = False
    where 
        ligne = l-1
        contenu = board !! ligne

move :: Int -> Int  -> Board -> Board
move ligne nombre board = [ update l | l <-[0..4]]
    where update l =  if (ligne ==(l+1)) then ((board !! (l )) - nombre) else (board !! (l))

suivant :: Char -> Char
suivant 'A' = 'B'
suivant 'B' = 'A'

afficher :: Board -> IO()
afficher board = do
    sequence [putStrLn $ (show (i+1)) ++ ": " ++ concat(replicate (board !! i) "* ") | i<- [0..4]]
    return ()

play :: Char -> Board -> IO() 
play joueur board = do
    afficher board
    putStrLn $ "Tour du Joueur " ++ (show joueur)
    putStrLn "Saisir ligne"
    ligne <- getLine
    let l = read ligne ::Int
    putStrLn "Saisir nombre"
    num <- getLine
    let n = read num ::Int
    if (not (valide l n board)) then do
        putStrLn "Saisie invalide, réessayez"
        play joueur board
    else do
        let b = move l n board
        if (not (finished b)) 
            then play (suivant joueur) b
            else do
                putStrLn  ("Le Joueur " ++ (show joueur) ++ " a gagné")
                afficher b

main = do
    putStrLn "**Welcome to Nim**\nLe joueur A commence"
    play 'A' initial
    



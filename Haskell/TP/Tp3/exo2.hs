import System.IO
getCh :: IO Char
getCh = do
    hSetEcho stdin False
    c <- getChar
    hSetEcho stdin True
    return c

remplace :: String -> String
remplace liste = replicate (length liste) '-'

sgetLine :: IO String
sgetLine = do
    hSetEcho stdin False
    chaine <- getLine
    hSetEcho stdin True
    let decoy = remplace chaine
    putStrLn decoy
    return (chaine)

sgetLine' :: IO String
sgetLine' = do
    c <- getCh
    if (c == '\n')
        then do
            return []
        else do
            putChar '-'
            xs <- sgetLine'  -- il va aller jusqu'à la fin avant de recommencer à les rappeler
            return (c:xs)

match :: String -> String -> String
match [] _ = []
match (x:xs) ys = case (elem x ys) of
    True -> x:(match xs ys)
    False -> '-':(match xs ys)

save :: String -> String -> String
save [] val = val
save _ [] = []
save (x:xs) (y:ys)
    | (x/='-') = x : save xs ys
    | (y/='-') = y : save xs ys
    | otherwise = '-' : save xs ys

play' :: String -> String -> IO ()
play' x y = do 
    putStr "? "
    l <- getLine 
    if (l == x)
        then do
            putStrLn "You got it"
        else do
            let val = match x l
            let a = save y val
            putStrLn a
            play' x a

play :: String -> IO ()
play x = play' x []

hangman :: IO()
hangman = do
    putStrLn "Think of a word:"
    word <- sgetLine
    putStrLn "Try to guess it:"
    play word

main = do
    putStrLn "Welcome to HangMan"
    hangman
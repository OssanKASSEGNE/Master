-- Fonction qui prend deux strings et réalise une série d'actions
fonction :: String -> String -> IO()
fonction var1 var2 = do
    putStrLn $ var1 ++ "beau"
    putStrLn $ var2 ++ "moche"

mesInfos :: IO()
mesInfos = do
    putStrLn "**Entrez votre nom**"
    nom <- getLine
    putStrLn $ "Votre nom est " ++ nom

retourneur :: IO()
retourneur = do 
    putStrLn "** Entrez le mot à retourner **"
    mot <- getLine
    putStrLn $ "Le mot est " ++ mot
    let retourne = reverse mot
    putStrLn $ "Le mot retourné est " ++ retourne

motSecret x = do
    putStrLn "Entrez le mot secret"
    m <- getLine
    if x == m 
        then do 
         putStrLn "Vous avez trouvé !"
         return True
        else do 
         putStrLn "Non"
         return False

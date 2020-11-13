data Parser a = P (String -> [(a, String)])

-- a --
item :: Parser Char
item = P (\s -> case s of
    [] -> []
    (x:xs) -> [(x,xs)])

-- b --
parse :: Parser a -> String -> [(a, String)]
parse (P p)  = p 

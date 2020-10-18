evalElem ::(Num a, Read a) => [a] -> String -> [a]
evalElem [] s = [read s]
evalElem (x1:x2:xs) "+" = ((x1+x2):xs)
evalElem (x1:x2:xs) "-" = ((x1-x2):xs)
evalElem (x1:x2:xs) "*" = ((x1*x2):xs)
evalElem liste s = (read s) : liste
 

evalNPI :: (Num a, Read a) =>  String -> a
evalNPI l = head (foldl evalElem [] (words l))
 

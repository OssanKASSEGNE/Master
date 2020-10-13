----------------------------------------------------------------
-- Exo 5 : Liste par compréhension
----------------------------------------------------------------

-- a. Fonction summcarre qui fait la somme des 100 premiers carrés entiers, utilisés sum :: [a]

sumcarre :: Int -- sumcarre prend une liste d'entiers et retourne un entier
sumcarre = sum [x*x | x <- [1..100]]

--b. Fonction replic qui retourne une liste contenant n répliques de x

replic :: x -> Int -> [x]  -- Prend x (char ou entier) et un entier et retourne x entier fois


replic valeur nombre =  [valeur | y <- [1..nombre]]  -- Je parcours ma liste y nombre fois et à chaque fois, j'incrémente
			
--c. Fonction pyths qui retourne la liste des triangles rectangles dont au moins un coté est de taille n donné

pyths :: Int -> [(Int, Int, Int)]
pyths n = [ (a, b, c) | c <- [1..n] , b <- [1..n] , a <- [1..n] ,
			c == n && a^2 + b^2 == c^2 ||
                        b == n && a^2 + c^2 == b^2 ||
                        a == n && c^2 + b^2 == a^2  ]  
		                                   



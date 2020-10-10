-- Exo 3 : Fonction qui prend 4 nombres et renvoie true s'ils sont tous égaux et false sinon

compareNombre :: Int -> Int -> Int -> Int -> Bool

compareNombre a b c d = if (a==b)&&(b==c)&&(c==d)
			then True
                        else False

--------------------------------------------------------------------------------------------
--1. Déclaration de la première fonction
--------------------------------------------------------------------------------------------

doubleMe x = x + x -- Prend en paramètre x de type Int ou Float et retourne le double
		   -- Car + fonctionne sur les Int et les Float

--------------------------------------------------------------------------------------------
--2. Associer des fonctions simples pour créer des fonctions complexes
--------------------------------------------------------------------------------------------

doubleUs x y = doubleMe x + doubleMe y -- Prend deux nombres et retourne la somme de leur double

--------------------------------------------------------------------------------------------
--3 Doubler le x s'il est inférieur à 100, sinon retourner x
--------------------------------------------------------------------------------------------

doubleSmallNumber x = if x < 100	
			then x*2
			else x		--else est obligatoire en Haskell

-- if est une expression, on peut rajouter des choses

--doublePlus y = (if (y%5) == 0 then y else 1)+1 -- si y est divisible par 5 je retourn y +1 sinon, 1+1

--------------------------------------------------------------------------------------------
--4 cons pour placer quelque chose au début d'une liste, éviter de mettre à la fin
--------------------------------------------------------------------------------------------

phrase = 'u':"ne phrase"
liste = [1,2,4]
suite = 1:liste

--------------------------------------------------------------------------------------------
--4 Ajouter élément à la fin d'une liste, mettre entre crochets
--------------------------------------------------------------------------------------------

liste2 = [1,2,4]
suite2 = liste2 ++ [1]

--------------------------------------------------------------------------------------------
--5 Alphabet et range de nombre
--------------------------------------------------------------------------------------------

alphabet = ['a'..'z']
liste3 = [0.1, 0.3 .. 1]
liste4 = ['K'..'z']

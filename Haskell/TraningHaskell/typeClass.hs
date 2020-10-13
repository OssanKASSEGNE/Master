data Feux = Jaune | Rouge | Vert 

--Créons une instance de Eq Feux sans passer par deriviing (Eq)--
instance Eq Feux where
    Jaune == Jaune = True
    Rouge == Rouge = True
    Vert == Vert = True
    _ == _ = False

--Intance Show de Faux--
instance Show Feux where
    show Jaune = "Jaune Allumé"
    show Rouge = "Rouge Allumé"
    show Vert = "Vert Allumé"
    
a = Jaune
b = Rouge
c = Vert
t = [a,a,c]
--Type de class YesNo, contient fonction yesno qui attent un truc et retourne Bool

class YesNo a where  -- YesNo marche pour n'importe quel type
    yesno :: a -> Bool

instance YesNo Integer where  --Vrai pour 0 et faux pour tout le reste
    yesno 0 = True
    yesno _ = False

instance YesNo [a] where 
    yesno [] = False
    yesno _ = True

instance YesNo Bool where -- retourne lui même
    yesno = id -- pas besoin de mettre la valeur avec id

instance YesNo (Maybe a) where 
    yesno (Just _) = True
    yesno Nothing = False

instance YesNo Feux where --Si rouge, on s'arrête, si autre, on avance
    yesno Rouge = False
    yesno _ = True

--fonction yesnoif qui copie le comportement de if 
yesnoif :: (YesNo y) => y->a->a->a
yesnoif y vrai faux = if (yesno y) then vrai else faux


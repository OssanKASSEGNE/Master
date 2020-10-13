----------------------------------------------------------------
-- Exo 6  : type de données algébriques simple
----------------------------------------------------------------

data Parfum = Chocolat | Vanille | Framboise

prixParfum :: Parfum -> Float -- prend un parfum et retourne son prix
prixParfum Chocolat   = 1.5
prixParfum Vanille    = 1.2
prixParfum Framboise  = 1.4

data Glace = UneBoule Parfum
            | DeuxBoules Parfum Parfum
            | TroisBoules Parfum Parfum Parfum
         deriving show

prixGlace :: Glase -> Double
prixGlace (UneBoule x) = 0.1 + prixParfum x
prixGlace (DeuxBoules x y) = sum 0.15 : map prixParfum (x:y:[])))
prixGlace (TroisBoules x y Z) = sum 0.20 : map prixParfum (x:y:z:[])))





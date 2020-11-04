(deffacts faits-initiaux
    (ronronne Tim)
    (familier Tim)
    (vit-maison Tim))

(defrule r1
    ?p <- (ronronne ?x)
    =>
    (retract ?p)
    (assert (est-un-chat ?x)))
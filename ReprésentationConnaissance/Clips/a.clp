(deffacts faits-initiaux
  (listePere)
 (propriete pere  Martine Albert)
 (propriete pere  Christiane Albert)
 (propriete pere  Daniel Albert))


 (defrule regle-liste-pere
  ?f1 <- (propriete pere ? ?y)
  ?f2 <- (listePere $?x)
  (test (neq ?y $?x))
  =>
  (retract ?f1 ?f2 )
  (printout t $?x crlf)
  (assert ( listePere ?x ?y)))
; On a 123 relations à la question 5
(deffacts faits-initiaux
 (listeOncle)
 (listePere)
 (listeMere)
 (listeGpere)
 (listeGmere)
 (listeFrere)
 (listeSoeur)
 (listeTante)
 (listeCousin)
 (listeCousine)
 (personne Albert 1 M)              ; Identification de la personne par une clé et son sexe
 (personne  Eugénie 2 F) 
 (personne Christiane 3 F)
 (personne Daniel 4 M)
 (personne  Martine 5 F)
 (personne Hervé 6 M)
 (personne Laurent 7 M)
 (personne Nicolas 8 M)
 (personne Stéphanie 9 F)
 (personne Thierry 10 M)
 (personne Sylvain 11 M)
 (personne Phillipe 12 M)
 (personne Eric 13 M)
 (propriete pere  Martine Albert)
 (propriete pere  Christiane Albert)
 (propriete pere  Daniel Albert)
 (propriete mere  Martine Eugénie)
 (propriete mere  Christiane Eugénie)
 (propriete mere  Daniel Eugénie)
 (propriete mere  Hervé Martine)
 (propriete mere  Laurent Martine)
 (propriete mere  Nicolas Martine)
 (propriete mere  Stéphanie Christiane)
 (propriete mere  Thierry Christiane)
 (propriete mere  Sylvain Christiane)
 (propriete pere  Phillipe Daniel)
 (propriete pere Eric Daniel)
 (text mere " est mère de ")
 (text pere " est père de ")
 (text frere " est frère de ")
 (texte soeur " est soeur de ")
 (texte grandmere " est grand-mère de ")
 (texte grandpere " est grand-père de ")
 (texte oncle " est oncle de ")
 (texte tante " est tante de ")
 (texte cousin " est cousin de ")
 (texte cousine " est cousine de "))

(defrule afficher
 (propriete ?statut ?enfant ?nomParent)
 (text ?statut ?zoneTexte)
  =>
  (printout t ?nomParent ?zoneTexte ?enfant crlf))

(defrule regle-parents                          
 (or (propriete pere ?enfant ?nomParent) (propriete mere  ?enfant ?nomParent) )
  =>
  (assert( parent ?enfant ?nomParent )))

(defrule regle-frere
 (parent ?tester ?nomParent)
 (parent ?personne ?nomParent)
 (personne ?personne ?p1 M)
 (personne ?tester ?p2 ?)
 (test (neq ?p1 ?p2))
  =>
   (assert (propriete frere ?tester ?personne)))

(defrule regle-soeur
 (parent ?tester ?nomParent)
 (parent ?personne ?nomParent)
 (personne ?personne ?p1 F)
 (personne ?tester ?p2 ?)
 (test (neq ?p1 ?p2))
  =>
   (assert (propriete soeur ?tester ?personne)))

(defrule regle-grand-pere 
 (parent  ?enfant ?parent)
 (propriete pere ?parent ?grandpere)
  =>
 (assert( propriete grandpere ?enfant ?grandpere)))

 (defrule regle-grand-mere 
 (parent  ?enfant ?parent)
 (propriete mere ?parent ?grandpere)
  =>
 (assert( propriete grandmere ?enfant ?grandpere)))

(defrule regle-oncle
  (parent  ?enfant ?parent)
  (propriete frere ?parent ?oncle)
  =>
  (assert (propriete oncle ?enfant ?oncle)))

(defrule regle-tante
  (parent  ?enfant ?parent)
  (propriete soeur ?parent ?tante)
  =>
  (assert (propriete tante ?enfant ?tante)))

(defrule regle-cousin
 (parent ?p1 ?parent)
 (or (propriete oncle ?p2 ?parent) (propriete tante ?p2 ?parent) )
 (personne ?p2 ? M)
  =>
  (assert (propriete cousin ?p1 ?p2)))

(defrule regle-cousine
 (parent ?p1 ?parent)
 (or (propriete oncle ?p2 ?parent) (propriete tante ?p2 ?parent) )
 (personne ?p2 ? F)
  =>
(assert (propriete cousine ?p1 ?p2)))

(defrule regle-liste-pere
  (declare (salience -1))
  ?f1 <- (propriete pere ? ?y)
  ?f2 <- (listePere $?x)
  (test (not (member ?y $?x)))   ;On vérifie que le pére n'existe pas déjà
  =>
  (retract ?f1 ?f2 )
  (assert ( listePere ?x ?y)))

(defrule regle-liste-mere
  (declare (salience -2))
  ?f1 <- (propriete mere ? ?y)
  ?f2 <- (listeMere $?x)
  (test (not (member ?y $?x)))    
  =>
  (retract ?f1 ?f2 )
  (assert ( listeMere ?x ?y)))

(defrule regle-liste-frere
  (declare (salience -3))
  ?f1 <- (propriete frere ? ?y)
  ?f2 <- (listeFrere $?x)
  (test (not (member ?y $?x)))    
  =>
  (retract ?f1 ?f2 )
  (assert ( listeFrere ?x ?y)))

(defrule regle-liste-soeur
  (declare (salience -4))
  ?f1 <- (propriete soeur ? ?y)
  ?f2 <- (listeSoeur $?x)
  (test (not (member ?y $?x)))    
  =>
  (retract ?f1 ?f2 )
  (assert ( listeSoeur ?x ?y)))

(defrule regle-liste-gpere
  (declare (salience -5))
  ?f1 <- (propriete grandpere ? ?y)
  ?f2 <- (listeGpere $?x)
  (test (not (member ?y $?x)))    
  =>
  (retract ?f1 ?f2 )
  (assert ( listeGpere ?x ?y)))

(defrule regle-liste-gmere
  (declare (salience -6))
  ?f1 <- (propriete grandmere ? ?y)
  ?f2 <- (listeGmere $?x)
  (test (not (member ?y $?x)))    
  =>
  (retract ?f1 ?f2 )
  (assert ( listeGmere ?x ?y)))

(defrule regle-liste-oncle
  (declare (salience -7))
  ?f1 <- (propriete oncle ? ?y)
  ?f2 <- (listeOncle $?x)
  (test (not (member ?y $?x)))
  =>
  (retract ?f1 ?f2 )
  (assert ( listeOncle ?x ?y)))

(defrule regle-liste-tante
  (declare (salience -8))
  ?f1 <- (propriete tante ? ?y)
  ?f2 <- (listeTante $?x)
  (test (not (member ?y $?x)))    
  =>
  (retract ?f1 ?f2 )
  (assert ( listeTante ?x ?y)))

(defrule regle-liste-cousin
  (declare (salience -9))
  ?f1 <- (propriete cousin ? ?y)
  ?f2 <- (listeCousin $?x)
  (test (not (member ?y $?x)))    
  =>
  (retract ?f1 ?f2 )
  (assert ( listeCousin ?x ?y)))

(defrule regle-liste-cousine
  (declare (salience -10))
  ?f1 <- (propriete cousine ? ?y)
  ?f2 <- (listeCousine $?x)
  (test (not (member ?y $?x)))    
  =>
  (retract ?f1 ?f2 )
  (assert ( listeCousine ?x ?y)))
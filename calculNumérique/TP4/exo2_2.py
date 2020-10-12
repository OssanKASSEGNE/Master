#Exercice2

import numpy.random as rdm

nombre = rdm.random_integers(1,100)
print("valeur : ")
proposition = int(input())
while ( proposition != nombre) :
	if(proposition > nombre) :
		print ("Trop grand")
	if(proposition < nombre) :
		print ("Trop petit")
	print("valeur : ")
	proposition = int(input())

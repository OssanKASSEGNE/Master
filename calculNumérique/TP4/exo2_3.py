#Exercice2

import numpy.random as rdm
mini = 1
maxi = 100
nombre = rdm.random_integers(mini,maxi)
propAleatoire = int(rdm.uniform(mini,maxi))
propAleatoire2 = int((maxi + mini)/2)

while ( propAleatoire != nombre) :
	if(propAleatoire > nombre) :
		print ("Trop grand : ","[",mini,"-",maxi,"]")
		maxi = propAleatoire
		propAleatoire = int(rdm.uniform(mini,maxi))
	if(propAleatoire < nombre) :
		print ("Trop petit : ","[",mini,"-",maxi,"]")
		mini = propAleatoire
		propAleatoire =int(rdm.uniform(mini,maxi))
print("nombre = ",nombre)
print("proposition = ",propAleatoire)

while ( propAleatoire2 != nombre) :
	if(propAleatoire2 > nombre) :
		print ("Trop grand : ","[",mini,"-",maxi,"]")
		maxi = propAleatoire2
		propAleatoire2 = int((maxi + mini)/2)
	if(propAleatoire2 < nombre) :
		print ("Trop petit : ","[",mini,"-",maxi,"]")
		mini = propAleatoire2
		propAleatoire2 = int((maxi + mini)/2)
print("nombre = ",nombre)
print("proposition = ",propAleatoire2)

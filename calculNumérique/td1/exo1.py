import numpy as np 
import matplotlib.pyplot as plt

# création d'un array de x
x = np.arange(3,13,1)
print(x)
# création d'un array de y
y = np.array([96,104.8,110.3,115.3,121.9,127.4,130.8,136,139.7,144.5])
print(y)
# representation de y en fonction de x
plt.xlabel("axe de X")
plt.ylabel("axe de Y")
plt.plot(x,y,"o")
#plt.show()
#On peut utiliser une regression car le modèle ici sera une fonction qui utilise des réels
#On remarque que quand Y augmente X augmente, il existe donc une correlation entre les deux variables
#Finalement on a une relation forte entre X et Y, les valeurs voisines de X ont de valeurs voisines sur Y
# Il existe donc une dépendance linéaire entre X et U

# variance de x
varX = np.var(x)
print ("varX = ",varX)

#Covariance de X, Y, formule non maitrisé
meanX = np.mean(x)
meanY = np.mean(y)
partieX = (x-meanX)
partieY = (y-meanY)
partieXxY = partieX*partieY
print(partieXxY)
n = len(x) #taille de x
print("n = ",n)

#Calcul de B1 et covariance
cov = (1/n)* np.sum (partieXxY)
B1 = cov/varX
print("B1 = ",B1)

#Calcul de Bo
Bo = meanY - B1*meanX
print("Bo = ",Bo)

#plot de la droite de régression
yn = B1*x + Bo
print ("yn = ",yn)
plt.plot(x,yn)
#plt.show()

#Calcul de R2
#Cherchons SCE
SCE = np.sum((yn-meanY)**2)

#Cherchons SCT
SCT = np.sum((y-meanY)**2)

R2 = SCE/SCT

print("SCE = ",SCE)

#R2 est très proche de 1, le pouvoir prédictif du modèle est très fort.
print(np.cov(x,y))
print(np.var(x))
print(np.cov(x,y,ddof=0))
print(cov)
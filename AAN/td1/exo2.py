import numpy as np
import matplotlib.pyplot as plt
from numpy.linalg import inv

###############################################################

#Création de x
x = np.array([-1,0,1,2,5])
print("x = ",x)

#Création de y
y = np.array([-1,3,2.5,5,2])
print("y = ",y)

#Calcul de beta0 et beta1
matriceCov = np.cov(x,y,ddof=0)
print("COV = ",matriceCov)
varX = matriceCov.item(0,0)
covXY = matriceCov.item(0,1)
print("varX = ",varX," covXY = ",covXY)
beta1 = covXY / varX
beta0 = np.mean(y) - beta1*np.mean(x)
print("b1 = ",beta1," b = ",beta0)
ye = beta0 + x*beta1
print("y estimé = ",ye)

#Régression polynomiale
M = np.array([ x**2,
                x,
                np.ones(x.size)])   # vecteur de 1 de même taille que x
print("M = ", M)

A = M.dot( np.transpose(M) ) # matrice A de B = Ainv*X
X = M.dot(y)
B = (inv(A)).dot(X)
print("B = ",B)
ye2 = B[0]*(x**2) + B[1]*x + B[2]
print("y estimé 2 = ",ye2)

#Calcul de erreur quadratique moyenne du modèle
n = x.size # nombre d'élémentts du vecteur
erreurM1 = (1/n) * (sum( (y - ye)**2 ))
erreurM2 = (1/n) * (sum( (y - ye2)**2 ))

print("erreur modèle 1 = ",erreurM1," erreur modèle 2 = ",erreurM2)   # baisse de l'erreur le modèle 2 est meilleur

#Représentation
normal, = plt.plot(x,y,"ro")
estimé1, = plt.plot(x,ye,"--")
estimé2, = plt.plot(x,ye2,"k")
plt.legend([normal, estimé1, estimé2], ['valeurs normales', 'ordre1','ordre2'])
plt.xlabel("axe des x")
plt.ylabel("axe des y")

plt.show()
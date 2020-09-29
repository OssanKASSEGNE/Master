import numpy as np
import matplotlib.pyplot as plt

#création de x 
x = np.array([17.3,7.7,10.4,5.1,5.0,56.9,79.7,3.5,57.8,124,15.1,4.3,39.0,8.7,6.9,57.7,252.7])
print("taille de x = ",x.size)

#création de y
y = np.array([327.4,179.5,279.4,139.1,92.5,926.7,2186.3,96.8,523.9,935.9,444.2,119.7,300.7,201.9,194.7,1592.9,5142.2])
print("taille de y = ",y.size)

#Détermination modèle d'ordre 1 
matriceCov = np.cov(x,y,ddof=0)
beta1 = matriceCov[0,1]/matriceCov[0,0]
beta0 = np.mean(y) - beta1 * np.mean(x)
print("b0 = ",beta0," b1 = ",beta1)
ye = beta0 + beta1*x # y estimé

#Les résidus
erreur = y-ye
print("erreur = ",erreur)
print("Sigma e = ", sum(erreur))  # la somme des erreurs est sensiblement égale à 0

#3 R2 ou autre chose
ybar = np.mean(y)           #moyenne de y
sCE =  sum((ye - ybar)**2)
sCT =  sum((y - ybar)**2)
print("sCE = ",sCE," sCT = ",sCT," R2% = ", 100*sCE/sCT,"%")

#Représentation
plt.xlabel = "X"
plt.ylabel = "Y"
normale, = plt.plot(x,y,"o")
estimé, = plt.plot(x,ye,"--")
plt.legend([normale,estimé],["valeurs départs","Ordre1"])
plt.show()
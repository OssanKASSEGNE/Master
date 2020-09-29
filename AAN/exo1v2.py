import numpy as np

#Création d'un array x
x = np.arange(3,13,1)
print(x)
# création d'un array de y
y = np.array([96,104.8,110.3,115.3,121.9,127.4,130.8,136,139.7,144.5])
print(y)

#Calcul de beta1 et beta1
matriceCovariance = np.cov(x,y,ddof=0)  # matrice de covariance matrice (2,2) qui contient la variance de x, y et deux fois la covariance de xy
                                        #Ajouter ddof = 0, sinon calcul fait en fonction d'une population
print("matrice de covariance = ",matriceCovariance)
varX = matriceCovariance[0,0]
covXY = matriceCovariance[0,1]
print("varX = ",varX," CovXY = ",covXY)
beta1 = covXY / varX
print("beta1 = ",beta1)
beta0 = np.mean(y) - np.mean(x)*beta1    
print("beta0 = ",beta0)

#Calcul de ye estimée
ye = beta0 + x*beta1  # On est en numpy.array, il a création d'un vecteur ye en fonction du vecteur x
print("y estime = ",ye)

#Calcul de R2
sCE = sum ( (ye - np.mean(y))**2 )
sCT = sum ( (y - np.mean(y))**2 )
print("sCE = ",sCE," sCT = ",sCT," R2 = ",sCE/sCT)
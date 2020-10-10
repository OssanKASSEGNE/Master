import numpy as np
import matplotlib.pyplot as plt

#1 on choisit bénéfices comme variable endogène car on veut le bénéfice en fonction du budget et pas le contraire. le budget est une variable indépendante

#création de x
x = np.array([15,8,36,41,16,8,21,21,53,10,32,17,58,6,20])

#création de y
y = np.array([48,43,77,89,50,40,56,62,100,47,71,58,102,35,60])

#Détermination modèle d'ordre 1 
matriceCov = np.cov(x,y,ddof=0)
beta1 = matriceCov[0,1]/matriceCov[0,0]
beta0 = np.mean(y) - beta1 * np.mean(x)
print("b0 = ",beta0," b1 = ",beta1)
ye = beta0 + beta1*x # y estimé

#Equation d'analyse de variance sCT = sCE + sCR

#3 R2 
ybar = np.mean(y)           #moyenne de y
sCE =  sum((ye - ybar)**2)
sCT =  sum((y - ybar)**2)
print("sCE = ",sCE," sCT = ",sCT," R2 = ", sCE/sCT)

#Représentation
plt.xlabel = "X"
plt.ylabel = "Y"
normale, = plt.plot(x,y,"o")
estimé, = plt.plot(x,ye,"--")
plt.legend([normale,estimé],["valeurs départs","Ordre1"])
plt.show()
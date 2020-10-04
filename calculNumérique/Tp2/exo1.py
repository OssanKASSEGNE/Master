import numpy as np
import matplotlib.pyplot as plt
from numpy import pi , sin 
fe = 100
te  = 1/ fe

## 1 --
t = np.arange(0,1+te,te)  # arange n'affiche pas le dernier élement mais prend steps
t1 = np.linspace(0,1,fe+1) # linspace prend le nombre d'éléments
#Avec linespace, faire fe+1
# la durée est 0.01, la fréquence d'échantillonnage
#le vecteur contiendra fe+1 élements
print (t)
print (t1)
print (len (t))

## 2 --
valeur = np.where (t == 0.5)
print ("valeur = ", valeur[0][0])

## 3 --
a = 1.5
ph = 0
fo = 10

signal = a * sin ( 2*pi*fo*t)
print ("signal = ",signal)

##4 --
plt.grid(True)
plt.title ("Signal sinusoïdale")
plt.plot (t,signal, label = "signal")
plt.xlabel ("Temps $t$")
plt.ylabel ("signal $x(t)$")
plt.show()
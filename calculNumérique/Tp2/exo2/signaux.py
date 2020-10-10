import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile

# La période Te est 1/Fe = 1/100
Fe = 100
Te = 1/Fe

# On peut faire un linspace de 0 à 1 pour la fréquence de 100hz

#temps = np.linspace(0,1,101) ne donne pas les bonnes valeurs  permet de mettre le nombre valeurs mettre 101 valeurs
temps = np.arange (0,1,Te)        # permet de mettre le pas 
#Le vecteur contient 100 valeurs

# Trouve l'index de 50ms = 0.005
print (temps)
value = np.where(temps == 0.05)   # where temps >= 0.05 et temps <=0.06



# Générer signal sinusoïdale
tmax = 2
a = 1.5
phase = 0
fo = 10


plt.xlabel('temps (s)')
plt.ylabel('amplitude (UA)')

#x=[a*np.sin(2*np.pi*fo*temps+phase) for temps in temps]



# On récupère une zone de temps
#on prend dabor les indices 
indices = np.where( (temps >=0.05 ) & (temps <= 0.15))[0]
temps2 = temps[indices]
print(temps2)

x2=[a*np.sin(2*np.pi*fo*temps2+phase) for temps2 in temps2]

plt.plot(temps2,x2)


#Pourquoi on observe des lignes brisées, on  a moins de points 

plt.stem(temps2,x2)


# Quand N augmente, la courbe est plus réaliste, c'est échantillonné
# On augmente la réquence 'échantillonnage 
Fe *=2
temps = np.arange (0,1,Te) 
indices = np.where( (temps >=0.05 ) & (temps <= 0.15))[0]
temps2 = temps[indices]
print(temps2) 
x2=[a*np.sin(2*np.pi*fo*temps2+phase) for temps2 in temps2]

#plt.stem(temps2,x2)
#plt.show()

#8 


Fe = 1000
temps = np.arange (0,1,1/Fe) 
x3=a*np.sin(2*np.pi*300*temps+phase) 
wavfile.write("este.wav",Fe,x3)
plt.stem(temps,x3)
plt.show()



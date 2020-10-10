#Exercice 2
import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile
# Signal Carré, sachant que le signal est échantillonné sur 8000hz
# Pour fo = 10 et fo=1000
fo = 10
Fe = 8000
t = np.linspace(0,1,Fe+1) # (0,1,N) N = Fe * Tmax 
x=1*np.sin(2*np.pi*fo*t)+(1/3)*np.sin(2*np.pi*3*fo*t) +(1/5)*np.sin(2*np.pi*5*fo*t) +(1/7)*np.sin(2*np.pi*7*fo*t) +(1/9)*np.sin(2*np.pi*9*fo*t)  

plt.xlabel('temps (s)')
plt.ylabel('amplitude (UA)')
plt.plot(t,x)
plt.show()
# plus on augmene k, plus le signal est carré
# Signal Triangle, sachant que le signal est échantillonné sur 8000hz
# Pour fo = 10 et fo=1000


# Signal triangle
bT = [1,0,-1/9,0,1/25,0,-1/49,0,1/81]
S =[]
for k in range(1,9) :
	print(k)
	S.append(bT[k-1]*np.sin(2*np.pi*k*fo*t))

triangle = np.sum(S, axis = 0)

plt.plot(t,triangle)
plt.show()



# Signal dent de scie
bD = [1   ,-1/2 , 1/3,  -1/4,  1/5,   -1/6,  1/7,    -1/8,  1/9]
S =[]
for k in range(1,9) :
	print(k)
	S.append(bD[k-1]*np.sin(2*np.pi*k*fo*t))

dent = np.sum(S, axis = 0)

plt.plot(t,dent)
plt.show()

#fichier wave
#carré
wavfile.write("carré.wav",Fe,triangle)

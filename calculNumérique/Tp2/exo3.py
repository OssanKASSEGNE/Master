import numpy as np
import matplotlib.pyplot as plt
from numpy import pi , sin 
from numpy.fft import fft
from scipy.signal import square



##1 --
fo = 120
fe = 8000

t = np.linspace(0,1,fe+1)
signal = sin(2*pi*fo*t) + (1/3)* sin(2*pi*fo*t*3) + (1/5)*sin(2*pi*fo*t*5) + (1/7)*sin(2*pi*fo*t*7) + (1/9)*sin(2*pi*fo*t*9)    
signal2 = square ( 2*pi*fo*t)      
plt.grid(True)
plt.title("Signal Carré")
plt.plot (t,signal2 ,label = "signal")
plt.xlabel ("Temps $t$")
plt.ylabel ("signal $x(t)$")


#É -- fft
X =fft(signal2)

print (X)  # Ce sont des valeurs complexes
#Exercice2
import numpy as np
import numpy.random as rdm
def f(x) :
	return float(np.log(x) + x**2)

a = 0
b = 1 
res = 100000000000
iteration = 0
while (res !=0 ) :
	iteration = iteration + 1
	n = (a + b)/2
	res = int (f(n)*1000)/1000
	if(res*f(b) <= 0) :
		a = n
		print ("entre : ","]",a,"-",b,"[")
	if(f(a)*res <= 0) :
		b = n
		print ("entre : ","]",a,"-",b,"[")



print("iteration = " , iteration)

#Exercice3
import numpy as np
import numpy.random as rdm
import matplotlib.pyplot as plt

def contour(Xn):
	x = np.linspace(-2, 2, 100)
	y = np.linspace(-5, 7, 100)
	x,y = np.meshgrid(x, y)
	z = x**2 + np.sin(y)
	fig = plt.figure()
	axes = fig.gca()
	axes.contour(x,y,z, 21)
	axes.plot(Xn,'-+r')
	axes.set_title('z = x^2 + sin(y)')
	plt.show()

def f(x,y):
	 return np.sin(y) +x**2


def gradx(x,y,e):
	return (f(x+e,y) - f(x-e,y))/(2*e)
def grady(x,y,k):
	return (f(x,y+k) - f(x,y-k))/(2*k)
def grad(x,y,e):
	return np.array([gradx(x,y,e),grady(x,y,e)])

Xo = np.array([1.5,2])
Xn = Xo
niter = 10000
tol = 0.00001
a = 0.1

while (niter > 0 or  np.linalg.norm(Xn) < tol):
	niter -= 1	
	Xn = Xn - a*(grad(Xn[0],Xn[1],0.000001))
	print (Xn)
	






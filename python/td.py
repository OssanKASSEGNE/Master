import matplotlib.pyplot as plt
import numpy as np
x= np.array([-1,0,1,2,5])
y=np.array([-1,3,2.5,5,2])



xb = np.mean(x)
yb = np.mean(y)

xy = x*y

xyb = np.mean(xy)

xc = x*x

b = (xyb - xb*yb)/ np.var(x)
bo = yb - b*xb
print(b,bo)

j = np.empty(5)

for xo in range (-1,6):
	np.append(j,-0.43*xo**2+2.17*xo+1.93)

print(j)

plt.plot(x,j)
plt.plot(x,y,'o')
plt.show()

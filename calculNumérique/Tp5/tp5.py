import numpy as np
import matplotlib.pyplot as plt
from sklearn import datasets

#affichage du nuage de points en 2D
def nuage(x1, x2, y, dim1='dim1', dim2='dim2'):
    plt.scatter(x1, x2, c=y)
    plt.title('nuage de points')
    plt.xlabel(dim1)
    plt.ylabel(dim2)
    plt.show()

#recuperer le jeu de données iris qui contient plusieurs types d’iris (label) représenté chacu
iris = datasets.load_iris()
X = iris.data
label = iris.target
dim = ['Sepal length', 'Sepal width', 'Petal length', 'Petal width']
#nuage(X[:,0], X[:,2], label, dim[0], dim[2])

#2 petal length et sepal length on voit que les fleurs disctinctement, en changeant les dimensions, on a de meilleurs affichages

#3 moyenne et écart-type de chaque 
m_s_l = np.mean(X[:,0])
m_s_w = np.mean(X[:,1])
m_p_l = np.mean(X[:,2])
m_p_w = np.mean(X[:,3])

print(m_s_l,m_s_w,m_p_l,m_p_w)

def ecart(x):
    return np.sqrt(np.var(x))

e_s_l = ecart(X[:,0])
e_s_w = ecart(X[:,1])
e_p_l = ecart(X[:,2])
e_p_w = ecart(X[:,3])

print(e_s_l,e_s_w,e_p_l,e_p_w)

mat_cov = np.cov(np.transpose(X),ddof=0)

print(mat_cov)

#Suite
print(np.var(np.transpose(X),axis =1,ddof=0))
print(np.corrcoef(X))

def distance (xi, xj):
    carre = (xi-xj)**2
    return np.sum(carre)

print(distance(X[0],X[1]))

res = []
for i in range(0,150):
    ligne = []
    for j in range (0,150):
        ligne.append(distance(X[i],X[j]))
    res.append(ligne)

print (res[0])
#gravité
N,Cols = X.shape

I = (1/N)*(np.sum(distance(X,0))) 

Xcol0 = (X[:,0] - m_s_l)/e_s_l
Xcol1 = (X[:,1] - m_s_w)/e_s_w
Xcol2 = (X[:,2] - m_p_l)/e_p_l
Xcol3 = (X[:,3] - m_p_w)/e_s_w

Xc0 = Xcol0.tolist()
Xc1 = Xcol1.tolist()
Xc2 = Xcol2.tolist()
Xc3 = Xcol3.tolist()
Xn = np.transpose(np.array([Xc0,Xc1,Xc2,Xc3]))


rep = []
for i in range(0,4):
    rep.append(distance(X[i],np.mean(X[i])))
XX = np.array(rep)
print((1/4)*(np.sum(XX)))
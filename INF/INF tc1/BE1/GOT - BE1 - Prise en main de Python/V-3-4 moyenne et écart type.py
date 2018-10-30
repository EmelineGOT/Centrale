import random;
from math import sqrt;

def moyenne(a,b):       #moyenne calcule la moyenne de deux entiers
    return (a+b)/2

echantillon=[random.gauss(16,2) for n in range(100)]

m=(echantillon[0]-16)**2 #On initialise m par le premier élément du tableau - mu au carré
for i in range(1,100):
   m=moyenne(m,(echantillon[i]-16)**2)  #On utilise la fonction moyenne pour calculer à chaque itération la moyenne de m et de l'élément i du tableau - mu au carré
print(math.sqrt(m))     #A la fin de la boucle, m contient la valeur de la variance. On prend la racine carrée de ce nombre pour obtenir l'écart-type


carre=[i**2 for i in echantillon] #On crée une liste contenant les xi^2 

m2=carre[0]-16**2 #Cette fois, on considère les xi^2 - mu^2
for i in range(1,100):
   m2=moyenne(m2,carre[i]-16**2) #On calcule la variance de la même manière
print(math.sqrt(m2))  #On obtient l'écart-type avec la racine carrée
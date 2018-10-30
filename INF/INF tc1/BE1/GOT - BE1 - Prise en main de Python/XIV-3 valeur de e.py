import math;

def factorielle(i):
    if i==0:  #On sépare le cas i=0 pour lequel factorielle renvoie 1
        return(1)
    else:
        m=1
        for k in range(1,i+1):  #Sinon on effectue une boucle qui multiplie le résultat du tour de boucle précédent par la valeur de l'indice de boucle k
            m=m*k
        return(m)

def e(i):
    e=0
    for k in range(i+1):
        e+=1./factorielle(k)   #On somme les 1/k! pour k allant de 1 à i 
    return(e)

for i in range(1,21):
    print('{0:3d} {1:7f} {2:7f}'.format(i,e(i),math.exp(1)))  #On imprime les résultats de l'approximation et de la valeur réelle pour chaque indice 




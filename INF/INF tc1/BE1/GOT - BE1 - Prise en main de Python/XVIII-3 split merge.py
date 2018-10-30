def my_split(L):
    L1=[L[0]]
    L2=[]
    n=len(L)
    cas=0 #cas est une variable qui va déterminer si l'on remplit L1 ou L2
    i=1
    while i<n:
        if cas==0:  #Le cas 0
            if L[i]>=L1[-1]:  #On remplit L1 tant que les éléments sont croissants
                L1.append(L[i])
            else:
                L2.append(L[i]) #Sinon, on remplit L2
                cas=1   #On passe dans le cas 1
        elif cas==1: #Le cas 1, les rôles sont inversés
            if L[i]>=L2[-1]:
                L2.append(L[i])
            else:
                L1.append(L[i])
                cas=0
        i+=1
    return(L1,L2)
    

def merge(L1,L2):
    n1=len(L1)
    n2=len(L2)
    i=0 #indice qui va parcourir L1
    j=0 #indice qui va parcourir L2
    fusion=[]  #La liste fusionnée
    while i<n1 and j<n2 : #Tant qu'une des deux listes n'est pas vidée, on cherche le petit des éléments de chaque liste pour le mettre dans la liste fusionnée
        if L1[i]<=L2[j]:
            fusion.append(L1[i]) 
            i+=1
        else:
            fusion.append(L2[j])
            j+=1
    if i==n1: #On cherche quelle liste on a vidé pour vider les éléments restants de l'autre dans fusion
        for k in range(j,n2):
            fusion.append(L2[k])
    else:
        for k in range(i,n1):
            fusion.append(L1[k])
    return(fusion)
            
        
def mergeandsplit(L):
    L1,L2=my_split(L)
    while L2!=[]: #Tant que la liste L2 n'est pas vide, on fusionne puis on sépare
        fusion=merge(L1,L2)
        L1,L2=my_split(fusion)
    return(fusion)
        
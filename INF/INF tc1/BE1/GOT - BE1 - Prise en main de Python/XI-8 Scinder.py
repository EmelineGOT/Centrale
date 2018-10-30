def scinder(l):
    L1=l        #On initialise la liste L1 à l 
    L2=[]       #Et la liste L2 à la liste vide
    n=len(l)
    if l[0]>l[1]:       #On sépare le cas du premier élément. On vérifie que la liste est croissante
        L2.append(l[0]) #Sinon, on enlève le premier élément de L1 et on le met dans L2
        L1.pop(0)
    for i in range(1,n-2):      #Pour les éléments suivants
        if l[i]>l[i+1] and l[i]<l[i-1]: #Si l'élément considéré est plus grand que le suivant et plus petit que celui d'avant, la sous-séquence n'est pas croissante
            L2.append(l[i])     #On enlève cet élément de L1 pour le mettre dans L2
            L1.pop(i)
    if l[-1]<l[-2]:  #On sépare le cas du dernier élément. On vérifie qu'il est plus petit que son précedent
        L2.append(l[-1])  #Sinon on l'enlève de L1 pour le mettre dans L2
        L1.pop(-1)
    return(L1,L2)   #On renvoie les deux listes ainsi formées
    
    
def dichotomie(L,val):
    N=len(L)
    if L==[]: #Initialisation
        return(False)
    elif val==L[N//2]: #Si la valeur est celle du milieu alors on a trouvé
        return(True)
    elif val > L[N//2]: #Si la valeur est supérieure à la moitié du tableau
        return(dichotomie(L[N//2+1:],val))  #On la cherche dans le tableau de droite
    else:
        return(dichotomie(L[:N//2],val))  #Sinon on la cherche dans le tableau de gauche


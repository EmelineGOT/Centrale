def triselect(v):
    n=len(v)
    for i in range(0,n-1):
        iMin = v.index(min(v[i:]))  #iMin est l'index du plus petit élément de la sous-liste traitée
        l=v[i]      #On stocke la valeur de v[i]
        v[i]=v[iMin]  #On remplace le premier élément de la sous-liste traitée par le plus petit élément de la sous-liste
        v[iMin]=l   #On remplace le plus petit élément par le premier élément. En fait, on échange les deux éléments dans la sous-liste
    return(v)   #On effectue ceci pour toutes les sous-listes de v commençant par le premier, le second, le troisième etc élément. A la fin, la liste est entièrement triée


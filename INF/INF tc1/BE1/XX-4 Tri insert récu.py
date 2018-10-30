def insere_a_sa_place(liste,val):
    lf=[]  #lf est la liste finale obtenue après insertion
    copie=liste[:]      #On fait une copie de la liste pour ne pas la modifier
    while copie!=[] and val>copie[0]:   #Tant que la copie n'est pas vide et que la valeur que l'on veut insérer est supérieure à la première valeur de la copie de la liste
        lf.append(copie[0])  #On ajoute la valeur inférieure à la liste finale
        copie.pop(0) #on l'enlève de copie
    lf.append(val)  #On sort de la boucle lorsque l'on est à la place pour insérer la valeur val
    if copie!=[]:  #S'il reste des éléments dans copie, on les ajoute à la suite de la liste finale lf
        for k in range(len(copie)):
            lf.append(copie[k])
    return(lf)  #On renvoie lf


def triinsert(l):
    if l==[]:
        return(l)
    else:
        var=l.pop()
        triinsert(l)
        insere_a_sa_place(l,var)
        return(l)
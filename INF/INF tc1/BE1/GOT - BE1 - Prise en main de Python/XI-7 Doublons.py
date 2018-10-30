def suppr(l):
    temp=[]   #On définit une liste locale qui contiendra les éléments de l sans doublons
    n=len(l)
    for i in range(n):
        if not(l[i] in temp):  #On vérifie que l'élément i de l n'est pas dans temp
            temp.append(l[i])  #Auquel cas on l'ajoute à temp. Autrement on l'ignore (c'est un doublon d'un élément déjà dans temp)
    return(temp)
    
    
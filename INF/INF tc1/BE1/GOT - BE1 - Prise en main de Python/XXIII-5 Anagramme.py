def anag(s1,s2):    
    if len(s1)!=len(s2): #Si les mots ne sont pas de la même longueur, ils ne peuvent pas être des anagrammes
        return(False)
    nb_lettres=[] #On crée une liste avec une seule occurence de chaque lettre de s1
    for k in s1:
        if nb_lettres.count(k)==0:  #Si la lettre n'est pas déjà présente dans nb_lettres, on l'ajoute
            nb_lettres.append(k)
    for c in nb_lettres:
        if s1.count(c)!=s2.count(c):  #On vérifie qu'il y autant de mêmes lettres dans s1 et dans s2
            return(False)   #Si ce n'est pas le cas, on renvoie False
    return(True)
        
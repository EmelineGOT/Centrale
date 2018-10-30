with open("test.txt") as f:
    s=f.readlines()
    mots=[]
    
    for i in range(len(s)):
        mots=mots+(s[i].split()) #On sépare les mots les uns des autres suivant les espaces
    
    nb_phrase=0
    for i in range(len(mots)):
        mots[i]=list(mots[i])  #On transforme les string en liste
        if mots[i][-1]=='.': #On cherche les mots terminant par un point
            del(mots[i][-1]) #On détache le point du mot
            nb_phrase+=1  #On compte le nombre de points
    print("Nombre de phrases :",nb_phrase)
    
    
    lettres=[]
    words=[]
    nombres=[]
    chiffres='0123456789' #On définit la liste des chiffres de base pour vérifier l'appartenance des caractères à cette liste
    for m in mots:
        if words.count(m)==0:
            words.append(m) #On ajoute à la liste words les mots avec une seule occurrence
        for i in range(len(m)):
            if lettres.count(m[i])==0 and not(m[i] in chiffres):
                lettres.append(m[i])  #On ajoute à la liste lettres les lettres avec une seule occurrence
            elif (m[i] in chiffres) and nombres.count(m[i])==0:
                nombres.append(m[i])    #On ajoute les chiffres à la liste nombre
     
    nb_lettres=len(lettres)
    nb_mots=len(words)  
    
    print("Nombres :",nombres)
    print("Fréquence des mots :",[(i,((mots.count(i))/nb_mots)) for i in words])  #On compte les occurences de chaque mot dans mots puis on divise par le nombre de mots total
    
    car=[]    
    for i in range(len(mots)):
        car+=mots[i]   #On concatène les mots pour avoir une liste de caractères
    print("Fréquence des lettres:",[(i,((car.count(i))/nb_lettres)) for i in lettres])
    
            
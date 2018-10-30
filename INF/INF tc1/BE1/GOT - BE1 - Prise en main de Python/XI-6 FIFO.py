def enfile(f,a):
    f.append(a) #L'élément empilé l'est à la fin de la file


def defile(f):
    try:
        f.pop(0)  #On essaye d'enlever le premier élément de la file (c'est celui qui est rentré en premier)
        return f
    except:
        print("La file est vide")  #S'il y a exception, cela veut dire qu'on ne peut pas enlever le premier élément donc que la file est vide
        return None


def top(f):
    try:
        return f[0]  #On renvoie le premier élément
    except:
        print("La file est vide")  #Il y a une exception s'il n'y a pas de premier élément donc dans le cas où la file est vide
        return None


def est_vide(f):
    return(f==[]) #On teste si la file est la liste vide. On renvoie un booléen





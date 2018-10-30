import math;

def lect(n):
    l=[] #l va être la liste d'entiers constituée par l'utilisateur
    for k in range(0,n):     #On va demander n entiers à l'utilisateur
        while True: 
            try:
                i=int(input("Donner un entier : "))  #On demande un entier
                l.append(i)  #Si c'est bien un entier, on l'ajoute à la liste l
                break
            except ValueError: #Si ce n'est pas un entier
                print("pas un entier !") #On renvoie un message d'erreur
                continue    #On redemande un entier
    S=0
    for i in range(0,n):
       S=S+l[i]    #On somme les entiers de la liste ainsi formée
    m=S/n #m est la moyenne
    v=0
    for i in range(0,n):
        v=v+(l[i]-m)**2 #On somme les écarts à la moyenne au carré
    v=v/n #v est la variance
    return(l,m,v)  #On renvoie la liste, sa moyenne et sa variance

 
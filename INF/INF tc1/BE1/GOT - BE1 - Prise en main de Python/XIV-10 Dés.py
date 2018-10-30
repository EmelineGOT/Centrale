import itertools;

def lancer():
    n=int(input( 'Donner un nombre entre 2 et 12'))
    l=[] #liste qui contient l'ensemble des combinaisons possibles
    for i in range(1,7): 
        for j in range(1,7): #On effectue une double boucle. Une sur le premier dé et une sur le deuxième
            if i+j==n: #On teste si la somme des deux indices fait le nombre demandé
                l.append((i,j))  #On ajoute la combinaison à la liste
    return(l,len(l)) #On renvoie la liste des combinaisons ainsi que leur nombre qui correspond à len(l)


def lancer3():  #Même principe mais cette fois-ci avec 3 boucles et trois indices
    n=int(input( 'Donner un nombre entre 3 et 18'))
    l=[]
    for i in range(1,7):
        for j in range(1,7):
            for k in range(1,7):
                if i+j+k==n:
                    l.append((i,j,k))
    return(l,len(l))


def lancerm(nbd,s):
    nb=0 #nb donne le nombre des façons de faire s avec nbd dés
    l=list(itertools.product([1,2,3,4,5,6],repeat=nbd))  #Donne la liste des résultats possibles obtenus pour un lancer de nbd dés  
    for i in range(len(l)):
        somme=0
        for k in range(nbd):  #Pour chacun des éléments de l, on somme l'ensemble des éléments du nbd-uplet
            somme+=l[i][k]
        if somme==s:    #Si la somme obtenue est égale à la somme souhaitée s
            nb+=1   #Le nombre des combinaisons possibles augemente
    return(nb) #On renvoie nbd
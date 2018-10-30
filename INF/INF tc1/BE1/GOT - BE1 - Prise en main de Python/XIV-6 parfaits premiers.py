def somDiv(n):
    l=[] #l est la liste des diviseurs propres
    for i in range(2,n):
        if n%i==0:
            l.append(i)
    S=0
    for i in l:
        S=S+i  #On calcule la somme des éléments de la liste
    return(S)       
   
     
def estParfait(n):
    return(n==somDiv(n))    #on teste si le nombre est égal à la somme de ses diviseurs propres


def estPremier(n):
    return(somDiv(n)==0)    #Si la somme est nul, le nombre est premier
    

def estChanceux(n):
    b=True
    i=1
    while i<(n-1) and b==True:      #La boucle while permet de sortir dès qu'un nombre n'est pas premier et de ne pas faire toutes les vérifications si le nombre n'est pas chanceux
        b=estPremier(n+i+i**2)      #On teste si les nombres (n+i+i^2) sont premiers pour i allant de 1 à n-1
        i=i+1
    return(b)

    

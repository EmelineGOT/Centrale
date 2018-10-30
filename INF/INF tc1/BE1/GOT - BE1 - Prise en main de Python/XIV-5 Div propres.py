def div(n):
    l=[]    #l est la liste des diviseurs de n différents de 1 et n 
    for i in range(2,n):
        if n%i==0:      #Si n est divisible par i pour i allant de 2 à n-1
            l.append(i)  #On ajoute i à l
    if len(l)==0:   #Si la liste l est vide alors l n'a pas d'autres diviseurs que 1 et lui-même 
        return(True)    #n est premier
    else:
        return(l,len(l)) #sinon l est la liste des diviseurs propres de l, len(l) son nombre
 
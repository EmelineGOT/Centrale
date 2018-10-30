def convertir(S):
    n=len(S)        #On note n la longueur de la chaine de caractères
    if S[0]=='-':   #Si la chaine commence par un -
        if S[1:n].isdigit(): #Si la suite de la chaine ne contient que des chiffres
            print(-int(S[1:n])) #Alors on renvoie - la chaine d'entiers convertie en entier
        else:
            print("Ceci n'est pas un entier") #Sinon on affiche une erreur
    elif S[0]=='+': #De même si la chaine commence par un +
        if S[1:n].isdigit():
            print(int(S[1:n]))
        else:
            print("Ceci n'est pas un entier")
    elif S.isdigit(): #Si la chaine ne commence ni par - ni par + mais qu'elle ne contient que des chiffres
        print(int(S)) #On convertit les entiers tels quels 
    else:
        print("Ceci n'est pas un entier") #Sinon en renvoie une erreur
        


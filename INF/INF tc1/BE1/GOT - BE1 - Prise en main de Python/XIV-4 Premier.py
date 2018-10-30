import math;

def prime(n):
    if n==1:
        return(False)       #1 n'est pas premier
    elif n==2:
        return(True)        #2 est premier 
    elif n%2!=0 and int(math.sqrt(n))!=math.sqrt(n) : #Si n n'est pas pair et la racine de n n'est pas entière
        b=True  #On initialise b à True
        i=3
        while i<=(math.sqrt(n)+1) and b==True: #On va vérifier que n n'est multiple d'aucun entiers entre 3 et sqrt(n)+1
            b=(n%i!=0)  #b prend la valeur n n'est pas multiple de k. Si c'est faux pour une valeur de k, on sort de la boucle
            i=i+1   
        return(b)	#b=False si on est sorti de la boucle; sinon b a toujours pris la valeur True et n est premier
    else :
        return(False)
        	
        		

import math;        #On utilise la fonction sqrt (racine carrée) de ce module

def quadratique(a,b,c):
 if (a == 0):       #Si a=0, on n'est pas dans le cas quadratique
    if ( b != 0) :
      print("Racine simple x = ",-c/b)  #Il y a une racine simple si b non nul
    else :
      print("c=0")     #Si b nul, l'équation n'a pas à être résolue
 else :
    delta=b*b-4*a*c       #Si a non nul, on résout avec le discriminant
    if (delta < 0) : 
        print ("Pas de racines réelles")
    else :
        if (delta>0):
         x1 = (-b+math.sqrt(delta))/(2*a) 
         x2 = (-b-math.sqrt(delta))/(2*a) 
         print("x1 = ",x1)
         print("x2 = ",x2)
        else:
         x1 = x2 = -b/(2*a)
         print("Racine double x1=x2=",x1)

#On demande les valeurs de a,b,c à l'utilisateur avant de résoudre l'équation à l'aide du programme précédent
a=int(input("Donner la valeur de a:"))
b=int(input("Donner la valeur de b:"))
c=int(input("Donner la valeur de c:"))
quadratique(a,b,c)


a=int(input('Donner un entier:'))	#On demande l'entier a
if (a%2==0):						#Si le reste de la division euclidienne de a par 2 est nul...
    print(a,"est pair.")			#...L'entier est pair
else:
    print(a,"est impair.")			#Sinon l'entier est impair





import math;

def quadratique(a,b,c):
 if (a == 0):
    if ( b != 0) :
      print("Racine simple x = ",-c/b)
    else :
      print("c=0")
 else :
    delta=b*b-4*a*c 
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


import random;

def moyenne(a,b):
    return (a+b)/2

echantillon=[random.gauss(16,2) for n in range(100)]

m=(echantillon[0]-16)**2
for i in range(1,100):
   m=moyenne(m,(echantillon[i]-16)**2)
print(math.sqrt(m))


carre=[i**2 for i in echantillon]

m2=carre[0]-16**2
for i in range(1,100):
   m2=moyenne(m2,carre[i]-16**2)
print(math.sqrt(m2))





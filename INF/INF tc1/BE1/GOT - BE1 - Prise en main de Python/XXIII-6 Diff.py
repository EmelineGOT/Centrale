N=10

from random import randint

L=[randint(0,3*N) for i in range(5)]

nb=[]
for i in L:
   if nb.count(i)==0:  #On ajoute à nb les éléments qui ne sont pas déjà présents dans nb
       nb.append(i)

print(nb==L,L)  #Si nb=L alors on a des éléments qui n'apparaissent qu'une seule fois
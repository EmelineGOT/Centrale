valeurs={1,2,3,4,5,6,7,8,9,10,'Valet','Dame','Roi'}
couleurs={'carreau','pique','coeur','trefle'}
toutes_cartes=[(str(v) , c) for v in valeurs for c in couleurs]


from random import * 


somme=0
for i in range(10000):
    a = choice(toutes_cartes) #On tire 4 cartes dans l'ensemble des cartes
    b = choice(toutes_cartes)
    c = choice(toutes_cartes)
    d = choice(toutes_cartes)
    l=[a[1],b[1],c[1],d[1]] #On crée la liste des couleurs des 4 cartes tirées
    if l.count('carreau')>=3 or l.count('coeur')>=3 or l.count('trefle')>=3 or l.count('pique')>=3 :
        somme+=1
print(somme/10000)


somme=0
for i in range(10000):
    a = choice(toutes_cartes)
    b = choice(toutes_cartes)
    c = choice(toutes_cartes)
    d = choice(toutes_cartes)
    e = choice(toutes_cartes)
    l=[a[0],b[0],c[0],d[0],e[0]]
    if l.count('1')>=3:
        somme+=1
print(somme/10000)


l=[i for i in range(1,7)]
alea=[]
for i in range(10000):
    alea.append(choice(l))
nb_num={i:0 for i in range(1,7)}
for num in alea:
    nb_num[num]+=1
print(nb_num)

    




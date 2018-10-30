liste=[17,38,10,25,72]

liste.sort()        #Trie la liste
print(liste)        #Affiche la liste

liste.append(12)    #Ajoute l'élément 12 à la liste
print(liste)        #Affiche la liste

liste.reverse()     #Renverse la liste
print(liste)    

print(liste.index(17))     #Affiche l'indice de l'élément 17 dans la liste

liste.remove(38)    #Enlève l'élément 38 de la liste
print(liste)

print(liste[1:3])   #Affiche la sous-liste du 2e au 3e élément

print(liste[:2])    #Affiche la sous-liste du 1er au 2e élément

print(liste[2:])    #Affiche la sous-liste du 3e au dernier élément

print(liste[:])     #Affiche la sous-liste complète de la liste

print(liste[-1])    #Affiche le dernier élément

print(liste[-2])    #Affiche l'avant-dernier élément

L=[i for i in range(6)]   #L est une liste d'entiers allant de 0 à 5
print(L)

print(L.index(3))   #Si 3 est dans la liste, on renvoie son indice, sinon on renvoie une erreur. Ici on renvoie 3
print(L.index(6))   #De même avec 6. Ici on renvoie une erreur 



#L'exécution donne les résultats suivants:
#[10, 17, 25, 38, 72]
#[10, 17, 25, 38, 72, 12]
#[12, 72, 38, 25, 17, 10]
#4
#[12, 72, 25, 17, 10]
#[72, 25]
#[12, 72]
#[25, 17, 10]
#[12, 72, 25, 17, 10]
#10
#17
#[0, 1, 2, 3, 4, 5]
#3
#Traceback (most recent call last):
#  File "/Users/Emy/Documents/Cours/Centrale 1A/Info/BE1/liste.py", line 33, in <module>
#    print(L.index(6))   #De même avec 6. Ici on renvoie une erreur
#ValueError: 6 is not in list

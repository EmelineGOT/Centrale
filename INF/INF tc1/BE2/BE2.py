# -*- coding: utf-8 -*-
"""
Created on Fri Feb 19 08:07:47 2016

@author: Emy
"""

from PIL import Image #Importation de la librairie d'image PIL

im = Image.open("Image10.bmp") #Ouverture du fichier d'image
px = im.load() #Importation des pixels de l'image

from math import sqrt #Importation de la fonction sqrt de la librairie math


w,h=im.size


def lecture(x,y):
    if x<=w and y<=h :
        return(px[x,y])
    else:
        print('Hors de l image')


def couleur(r,g,b,x,y):
    if x<=w and y<=h:
        px[x,y]=r,g,b
    else:
        print('Hors de l image')


def rect(x,y,lx,ly,r,g,b): #Rectangle basé en (x,y) de largeur lx,ly
    for i in range(x,x+lx):
        for j in range(y,y+ly):
            couleur(r,g,b,i,j)


def moyenne(x,y,lx,ly): #Calcul de la couleur moyenne sur le rectangle
    r=0
    g=0
    b=0
    aire=lx*ly
    for i in range(x,x+lx):
        for j in range(y,y+ly):
            p=px[i,j]
            r+=p[0]
            g+=p[1]
            b+=p[2]
    r=r/aire
    g=g/aire
    b=b/aire
    return(int(r),int(g),int(b))


def homogeneite(x,y,lx,ly,s):
    moy=moyenne(x,y,lx,ly)
    aire=lx*ly
    ecr=0
    ecg=0
    ecb=0       #Calcul des écarts-types
    for i in range(x,x+lx):
        for j in range(y,y+ly):
            p=px[i,j]
            ecr+=(p[0]-moy[0])**2
            ecg+=(p[1]-moy[1])**2
            ecb+=(p[2]-moy[2])**2
    ecr/=aire
    ecg/=aire
    ecb/=aire
    if (sqrt(ecr)+sqrt(ecg)+sqrt(ecb)) <s:
        return(True)
    else:
        return(False)


def algosplit(s):
    L=[]
    def split(x,y,lx,ly):
        if lx>1 and ly>1:
            if homogeneite(x,y,lx,ly,s):
                r,g,b=moyenne(x,y,lx,ly)
                rect(x,y,lx,ly,r,g,b)
                L.append([x,y,lx,ly,r,g,b])
            else:
                split(x,y,lx//2,ly//2)  #coin haut gauche
                split(x+lx//2,y,lx//2,ly//2)  #coin bas gauche
                split(x,y+ly//2,lx//2,ly//2)  #coin haut droite
                split(x+lx//2,y+ly//2,lx//2,ly//2)  #coin bas droite
        else:
            r,g,b=moyenne(x,y,lx,ly)
            couleur(r,g,b,x,y)
            L.append([x,y,lx,ly,r,g,b])
    split(0,0,w,h)
    return(L)


def adjacente1(i,j,L):
    if i==j:
        return(False)
    else:
        [x1,y1,lx1,ly1,r1,g1,b1]=L[i]
        [x2,y2,lx2,ly2,r2,g2,b2]=L[j]
        if (lx1/2+lx2/2)>=abs(x1+lx1/2-x2-lx2/2) and(ly1/2+ly2/2)>=abs(y1+ly1/2-y2-ly2/2): #On teste si les régions sont adjacentes en testant les écarts par rapport au centre
            return(True)
        else:
            return(False)
        
        
def adjacente(L):
    A=[]
    for i in range(len(L)):
        adj=[i]
        for j in range(len(L)):
            if adjacente1(i,j,L):
                adj.append(j)  #adj est la liste qui contient les adjacents de i
        A.append(adj)  #A est la liste de listes qui contient les adjacents de chaque rectangle
    return(A)


def fusion(i,j,t): #t est le seuil de la fusion
    [x1,y1,lx1,ly1,r1,g1,b1]=L[i]
    [x2,y2,lx2,ly2,r2,g2,b2]=L[j]
    return ((abs(r1-r2)+abs(g1-g2)+abs(b1-b2))<t)
        
    

def concat(L1,L2):
    L=L1
    for i in L2:
        if (i not in L):
            L.append(i)
    return(L)


def suppr(i,L):
    L1=[]
    for j in L:
        if j!=i:
            L1.append(j)
    return(L1)
        



def merge(t):
    L=algosplit(60)
    
    A=adjacente(L)  #A est le tableau des adjacents de chaque région homogène
    
    for i in range(len(A)):
        if A[i][0]!='T':
            copie=A[i][1:]
            A[i]=[i]
            [x,y,lx,ly,r,g,b]=L[i]
            while copie!=[]:
                r=copie[0]
                del(copie[0])
                if A[r][0]=='T':
                    if fusion(r,i,t):
                        A[r][0]='T'
                        A[i].append(r)
                    for j in range(1,len(A[r])):
                        if not (A[r][j] in copie):
                            copie.append(A[r][j])
                    [x,y,lx,ly,r,g,b]=L[r]
                    rect(x,y,lx,ly,r,g,b)
    im.show()         
                
                
                
            
 #   while i<len(A):
  #      if A[i][0]!='T':
   #         j=1
    #        n=len(A[i])
     ##          if A[j][0]!='T':
      #              suppr(j,A[i])
      #              j-=1
      #          else:
      ###              if fusion(L[i],L[j],t):
        #                A[i]=concat(A[i],A[j])
        #                A[j]=A[j].insert(0,'T')
        #            else:
        #                suppr(j,A[i])
 #                       j-=1
 #           j+=1
 #           n=len(A[i])
 #       i+=1
 #   
 #   return(A)
 #   
#    N=len(A)
#    for i in range(N):
#        if A[i][0]!='D':
#            [x,y,lx,ly,r,g,b]=L[A[i][0]]
#            for j in range(A[i]):
#                [x1,y1,lx1,ly1,r1,g1,b1]=L[j]
#                rect(x1,y1,lx1,ly1,r,g,b)
#    
#    im.show()
            
            
                        
                   
    
    
    
 #      si L1[i] n'est pas traité
 #           j=1
  #          t1=taille(L1[i])
   #         tant que j<=t1
    #            si L1[j] est traité
     #               supprimer j dans L1[i]
      #              j=j-1
       #             sinon 
        #                si L[i] et L[j] sont de couleurs proches
         #                   on fusionne les deux régions avec suppression des redondances
          #                  L1[j]='D'+L1[j]
           #             sinon 
            #                supprimer j dans L1[i]
             #               j=j-1
              #  sinon
               #     j=j+1
                #    t1=tailleL1[i]
                #i=i+1
    
    
    
    
#    for i in range(len(L)):
#        T=[]  #T va contenir les régions que l'on peut fusionner avec la région i
#        while A[i]!=[]:
#            k=A[i][0]  #on s'intéresse au premier élément de A 
#            if fusion(i,k,t):  #Si la fusion est possible
#                T.append(k) #On ajoute la région k au tableau T qui contient les régions que l'on peut fusionner avec i
#            del A[i][0] #On enlève les cas traités du tableau A[i]
#        
#        [x,y,lx,ly,r,g,b]=L[i]  #On récupère les données de la région i 
#        for j in A[i]:  #Pour tous les éléments que l'on peut fusionner avec i
#            [x1,y1,lx1,ly1,r1,g1,b1]=L[j]    
#            rect(x1,y1,lx1,ly1,r,g,b)   #On leur attribue la couleur de i
#    im.show()
           

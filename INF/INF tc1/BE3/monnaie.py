def monnaie(S,M):
    n=len(S)
    mat=[[0 for i in range(M+1)] for j in range(n)]
    for i in range(n):
        for m in range(M+1):
            if m==0:
                mat[i][m]=0
            elif i==0 :
                mat[i][m]=float("inf")
            else:
                if (m-S[i])>=0:
                    v1=1+mat[i][m-S[i]]
                else:
                    v1=float("inf")
                if i>=1:
                    v2=mat[i-1][m]
                else:
                    v2=float("inf")
                
                mat[i][m]=min(v1,v2)    
    R=mat[-1][-1]
    l=[]
    i=n-1
    j=M
    while R!=0:
        if mat[i][j]<mat[i-1][j]:
            R-=1
            j=j-S[i]
            l.append(S[i])
        else:
            i-=1
    return(mat[-1][-1],l)
            
     
      
def Monnaie_graphe(S,M):
    F=[M]
    arbre={M:{}}
    flag=False #indicateur de sortie de boucle
    
    while (not flag) and F!=[]:
        Mp=F.pop(0) #On enlève le premier élément de la file
        for i in range(len(S)):
            if S[i]<=Mp: #Si vi<=M'
                if Mp in arbre:
                    if Mp-S[i] in arbre:  #S'il existe un noeud de valeur M'-vi
                        arbre[Mp][Mp-S[i]]=S[i]  #On ajoute un arc de étiqueté par vi entre M' et M'-vi
                    else:
                        arbre[Mp][Mp-S[i]]=S[i]  #Sinon on crée ce noeud
                        F.append(Mp-S[i])  #On ajoute le noeud créé à la file des noeuds à traiter
                else:
                    arbre[Mp]={}
                    arbre[Mp][Mp-S[i]]=S[i]
        flag=(0 in F)  #On vérifie que l'on a pas atteint 0, sinon on sort de la boucle
    
    
    if F==[] and (not flag):
        print("Problème !")
    else:
        l={}
        res=0
        while res!=M:
            for noeud in arbre:
                if res in arbre[noeud]:
                    if arbre[noeud][res] in l:
                        l[arbre[noeud][res]]+=1
                    else:
                        l[arbre[noeud][res]]=1
                    res+=arbre[noeud][res]
    return(l)
                    
        
                    
                        
        
        
        
        
        
        
        
        
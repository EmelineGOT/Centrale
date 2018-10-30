l1=[i for i in range(6)]

#Construction classique
L=[]
for i in range(len(l1)):
    L.append(3+l1[i])
print(L)

#Liste en compréhension
L=[i+3 for i in l1]
print(L)

#--------------------------------


#Construction classique
L=[]
for i in range(len(l1)):
    if l1[i]>=2:
        L.append(3+l1[i])
    else:
        L.append(l1[i])
print(L)

#Liste en compréhension
L=[i+3*(i>=2) for i in l1]
print(L)


#--------------------------------


#Construction classique
str1="abc"
str2="de"

L=[]
for i in range(len(str1)):
    for j in range(len(str2)):
        L.append(''.join([str1[i],str2[j]]))
print(L)
    
#Liste en compréhension
L=[''.join([i,j]) for i in str1 for j in str2]
print(L)


#---------------------------------


#Construction classique
l2=[i for i in range(10)]

S=0
for i in range(len(l2)):
    S+=l2[i]
print(S)

#Liste en compréhension
S=sum([i for i in range(10)])
print(S)









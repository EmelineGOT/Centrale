# -*- coding: utf-8 -*-
"""
Created on Fri Feb 12 08:27:37 2016

@author: Emy
"""

def div(n):
    l=[]
    for i in range(2,n):
        if n%i==0:
            l.append(i)
    if len(l)==0:
        return(True)
    else:
        return(l,len(l))
        
def somDiv(n):
    l=[]
    for i in range(2,n):
        if n%i==0:
            l.append(i)
    S=0
    for i in l:
        S=S+i
    return(S)
   
     
def estParfait(n):
    return(n==somDiv(n))


def estPremier(n):
    return(somDiv(n)==0)
    

def estChanceux(n):
    b=True
    i=1
    while i<(n-1) and b==True:
        b=estPremier(n+i+i**2)
        i=i+1
    return(b)

    

# -*- coding: utf-8 -*-
"""
Created on Fri Feb 12 08:42:30 2016

@author: Emy
"""

def lancer():
    n=int(input( 'Donner un nombre entre 2 et 12'))
    l=[]
    for i in range(1,7):
        for j in range(1,7):
            if i+j==n:
                l.append((i,j))
    return(l)


def lancer3():
    n=int(input( 'Donner un nombre entre 3 et 18'))
    l=[]
    for i in range(1,7):
        for j in range(1,7):
            for k in range(1,7):
                if i+j+k==n:
                    l.append((i,j,k))
    return(l)


def lancerm(nbd,s):
    for i in range(1,nbd):
        for :
            
            
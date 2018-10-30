# -*- coding: utf-8 -*-
"""
Created on Fri Feb  5 09:35:28 2016

@author: Emy
"""

#PARTIE VIII

def convertir(S):
    if S[0]=='-':
        print(-int(S[1:len(S)]))
    elif S[0]=='+':
        print(int(S[1:len(S)]))
    else:
        print(int(S))
        

S=range(100)
x=3
print(x*sum(S) == sum(x*y for y in S))


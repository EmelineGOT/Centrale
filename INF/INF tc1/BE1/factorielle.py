# -*- coding: utf-8 -*-
"""
Created on Fri Feb  5 11:03:31 2016

@author: Emy
"""
import math;
def factorielle(i):
    if i==0:
        return(1)
    else:
        m=1
        for k in range(1,i+1):
            m=m*k
        return(m)

def e(i):
    e=0
    for k in range(i+1):
        e=e+(1/factorielle(k))
    return(e)

for i in range(1,21):
    print('{0:3d} {1:7f} {2:7f}'.format(i,e(i),math.exp(1)))





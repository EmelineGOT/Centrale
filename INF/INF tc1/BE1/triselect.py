# -*- coding: utf-8 -*-
"""
Created on Fri Feb 12 09:06:53 2016

@author: Emy
"""

def triselect(v):
    n=len(v)
    for i in range(0,n-1):
        iMin = v.index(min(v[i:]))
        l=v[i]
        v[i]=v[iMin]
        v[iMin]=l
    return(v)
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  5 11:49:30 2016

@author: Emy
"""

import math;

def prime(n):
    if n==1:
        return(True)
    elif n==2:
        return(True)
    elif n%2!=0 and int(math.sqrt(n))!=math.sqrt(n) :
        b=True
        i=3
        while i<=(math.sqrt(n)+1) and b==True:
            b=(math.sqrt(n)%i!=0)
            i=i+1
        return(b)	
    else :
        return(False)
        	
        		

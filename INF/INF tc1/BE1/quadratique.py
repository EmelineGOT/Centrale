# -*- coding: utf-8 -*-
"""
Created on Fri Feb  5 08:53:29 2016

@author: Emy
"""

def quadratique():
 a=int(input( 'Donner le coefficient a'))
 b=int(input('Donner le coefficient b'))
 c=int(input('Donner le coefficient c'))
 if (a == 0):
    if ( b != 0) :
      print("Racine simple x = ",-c/b)
    else :
      print("c=0")
 else :
    delta=b*b-4*a*c 
 if (delta < 0) : 
     print ("pas de racines réelles")
 else :
     if (delta>0):
         x1 = (-b+math.sqrt(delta))/(2*a) 
         x2 = (-b-math.sqrt(delta))/(2*a) 
         print("x1 = ",x1)
         print("x2 = ",x2)
     else:
         x1 = x2 = -b/(2*a)
         print("Racine double x1=x2=",x1)
# -*- coding: utf-8 -*-
"""
Created on Fri Jun 10 08:31:57 2016

@author: Usuario
"""

#Création de la base de données

import sqlite3
import http.server
import socketserver
import os
from server import generic 
from Mandelprot2 import tracer
import http.server
from urllib.parse import urlparse, parse_qs


def NewData(xrange,yrange,nom_iter):
    try:
        print(xrange,yrange,nom_iter)
        conn=sqlite3.connect('mandelbrot.sqlite')
        c = conn.cursor()
        c.execute('INSERT INTO fractalscrees VALUES (?, ?, ?)',(xrange,yrange,nom_iter))
        conn.commit()
    except:
        return False

def check(x,y,nb):
    """Cette fonction parcourt une base de donnée afin de savoir si une image est déjà créée ou non.
    Retourne True quand l'image issue des données x,y et nb est déjà créée."""
    conn=sqlite3.connect('mandelbrot.sqlite')
    c=conn.cursor()    
    tmp=False
    c.execute("SELECT * FROM fractalscrees WHERE xrange=? AND yrange=? AND nom_iter=?",(int(x),int(y),int(nb)))
    r=c.fetchall()
    if len(r)>=1:
        tmp=True
    return tmp

#----------------------- SERVEUR

# définition du nouveau handler
class RequestHandler(generic.RequestHandler):
  

  
  # on surcharge la méthode qui traite les requêtes GET
  def do_GET(self):

    # on initialise nos variables d'instance
    para=self.init_vars()

    # le chemin d'accès commence par /fractal
    if self.path_info[0] == '/fractal':
      self.send_fractal(para)
    
    # ou pas...
    else:
      self.send_static()
      
  # on surcharge la méthode qui traite les requêtes HEAD
  def do_HEAD(self):
    self.send_static()

  def do_POST(self):

    # on initialise nos variables d'instance
    para=self.init_vars()

    #if self.path_info[2] == '/fractal':
    self.send_fractal(para)
    #else:
    #  self.send_error(405)
  
  
  def send_fractal(self,para):
      if check(int(para['xR'][0]),int(para['yR'][0]),int(para['limit'][0])):
          
          return 0#nom de l'image!!!!!!!!!!!!!!
      else:
          tracer(int(para['xR'][0]),int(para['yR'][0]),int(para['limit'][0]))
          print('jesuisdanslelse')
          NewData(int(para['xR'][0]),int(para['yR'][0]),int(para['limit'][0]))
          return 0#nom de l'image!!!!!!!!!!!!!!
      

    
  
# instanciation et lancement du serveur
httpd = socketserver.TCPServer(("", 8080), RequestHandler)
httpd.serve_forever()

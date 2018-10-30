# -*- coding: utf-8 -*-
"""
Created on Fri May 27 22:10:03 2016

@author: depaquis
"""

# generic.py

import http.server

from urllib.parse import urlparse, parse_qs




#
# Définition du handler générique
#
class RequestHandler(http.server.SimpleHTTPRequestHandler):
  # sous-répertoire racine des documents statiques
  static_dir = '/client'

  # on utilise le nom de fichier pour identifier le serveur
  server_version = 'Mandelbrot'



  #
  # On initialise les variables d'instance
  #
 
  def init_vars(self):

    # analyse de l'adresse !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    info = urlparse(self.path)
    self.path_info = info.path.split('/')[1:]
    self.query_string = info.query
    self.params = parse_qs(info.query)

    # récupération du corps
    length = self.headers.get('Content-Length')
    if length:
      self.body = str(self.rfile.read(int(length)),'utf-8')
      self.params = parse_qs(self.body)
    print(self.params)
    return self.params
    

  #
  # On envoie le document statique demandé
  #
  def send_static(self):

    # on modifie le chemin d'accès en insérant un répertoire préfixe
    self.path = self.static_dir + self.path

    # on calcule le nom de la méthode parent à appeler (do_GET ou do_HEAD)
    # à partir du verbe HTTP (GET ou HEAD)
    method = 'do_{}'.format(self.command)
    
    # on traite la requête via la classe parent
    getattr(http.server.SimpleHTTPRequestHandler,method)(self)
    
    


  #
  # On envoie le corps fourni
  #
  def send(self,body):

    # on envoie la ligne de statut
    self.send_response(200)

    # on envoie les lignes d'entête par défaut et la ligne vide
    self.end_headers()

    # on encode la chaine de caractères à envoyer
    encoded = bytes(body, 'UTF-8')

    # on envoie le corps de la réponse
    self.wfile.write(encoded)
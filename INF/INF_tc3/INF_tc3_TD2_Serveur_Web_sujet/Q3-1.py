# -*- coding: utf-8 -*-
"""
Created on Fri May 20 11:08:45 2016

@author: Emy
"""

import http.server
import socketserver

PORT = 8080

# définition du nouveau handler
class RequestHandler(http.server.SimpleHTTPRequestHandler):
    static_dir = '/client'
    
    def do_GET(self):
        # on modifie le chemin d'accès en insérant un répertoire préfixe
        self.path = self.static_dir + self.path
        # on traite la requête via la classe parent
        http.server.SimpleHTTPRequestHandler.do_GET(self)
    
httpd = socketserver.TCPServer(("", PORT), RequestHandler)

httpd.serve_forever()


    
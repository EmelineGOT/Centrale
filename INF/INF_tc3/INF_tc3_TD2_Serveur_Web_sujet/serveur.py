# -*- coding: utf-8 -*-
"""
Created on Fri May 20 10:28:11 2016

@author: Emy
"""

import http.server
import socketserver

PORT = 8000

Handler = http.server.SimpleHTTPRequestHandler

httpd = socketserver.TCPServer(("", PORT), Handler)

pycat Q2-1.py
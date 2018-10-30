# -*- coding: utf-8 -*-
"""
Created on Fri Jun 10 09:15:22 2016

@author: Usuario
"""

import sqlite3
import http.server
import socketserver
import os
from server import generic 

conn = sqlite3.connect('mandelbrot.sqlite')
c = conn.cursor()
#c.execute("DROP TABLE IF EXISTS regularite_tgv")

#ne créer pas à chaque fois
c.execute("CREATE TABLE fractalscrees (xrange REAL, yrange REAL, nom_iter INTEGER)")

conn.commit()
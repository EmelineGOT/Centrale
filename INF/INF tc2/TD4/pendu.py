from tkinter import *

class ZoneAffichage(Canvas):
    def __init__(self,parent, w, h, c):
        Canvas.__init__(self, width = w, height = h, bg = c)

class MonBouton(Button):
    def __init__(self,frame,car,callback):
        Button.__init__(frame,text=car,command=self.cliquer(car))
        self.__lettre=car
        self.__traitement=callback
    
    def cliquer(self,car):
        self.config(state=DISABLED)
        self.__traitement=lettre
        

class FenPrincipale(Tk):
    def __init__(self):
        Tk.__init__(self)
        self.title('Pendu')
        
        
        
        #Boutons Nouveau et Quitter en haut de page
        f1 = Frame(self)
        f1.pack(side=TOP, padx=5, pady=5)
        self.__boutonNew = Button(f1, text ='Nouvelle partie', width=15, command = self.nouvellePartie).pack(side=LEFT, padx = 5,pady = 5)
        self.__boutonQuitter = Button(f1,text='Quitter',width=15,command=self.destroy).pack(side=LEFT,padx=5,pady=5)
        
        
        self.__zoneAffichage = ZoneAffichage(self,400,500,'white')
        
        
        #Barre d'affichage
        self.__lmot = Label(self)
        self.__lmot.pack(side=TOP)
        self.__lmot.config(text='blablabla')
        
        
        #Création  du clavier
        self.__f = Frame(self)
        
        for i in range(26):
            lettre=(chr(ord('A')+i))
            self.bouton=MonBouton(self.__f,lettre)
            bouton.grid(row=i//7,column=i%7)

        

        def chargeMots(self):
            f = open('mots.txt','r')
            s = f.read()
            mots = s.split('\n')
            f.close()
            return(mots)
        
        mots=chargeMots(self)
            
        
        def nouveauMot(self):
            from random import randint
            nb = randint(0,834)
            return(mots[nb])
        
        
        
        def nouvellePartie(self):
            pass 

""" self.__mot=nouveauMot()
            
            n=len(mot)
            chaine=str()
            for i in range(len(mot)):
                chaine+='*'
            self.__motAffiche=chaine
            
            self.__nbManques=0
            
            self.__zoneAffichage.delete(ALL)"""
            
"""l’activation de tous les boutons du clavier virtuel (valeur “normal” pour la propriété “state” du bouton, à modifier avec sa méthode “config”)"""


        #def finPartie(self):
            
       
# Création de la fenêtre principale
fen = FenPrincipale()
fen.mainloop()            
            
        
"""        def traitement(lettre):
            n=len(mot)
            for i in range(n):
                if lettre=mot[i]:
                    motAffiche[i]=lettre
                    self.__lmot.config(text='Mot : '+self.__motAffiche)
                else:
                    nbManques+=1
            if mot==motAffiche:
                finPartie=True
            elif nbManques=8: #Nombre d'éléments du pendu à déterminer
                finPartie=False
        """
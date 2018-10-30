class Ouvrage:
    
    def __init__(self,titre,nom_auteur):
        self.nom=nom_auteur
        self.titre=titre

    def get_nom_auteur(self):
        return(self.nom)
        
    def get_titre(self):
        return(self.titre)

class Livres(Ouvrage):
    
    def __init__(self,titre,nom_auteur,num,expl):
        Ouvrage.__init__(self,titre,nom_auteur)
        self.num=num
        self.expl=expl
        
    def get_num(self):
        return(self.num)
    
    def get_expl(self):
        return(self.expl)
    
    def __str__(self):
        model= '\n Nom de l Auteur {} \n Titre {} \n Numéro {} \n Nombre d exemplaires {}'
        return model.format(self.get_nom_auteur(),self.get_titre(),self.get_num(),self.get_expl())
    

class Personne:
    
    def __init__(self,nom,prenom,adresse):
        self.nom=nom
        self.prenom=prenom
        self.adresse=adresse
        
    def get_nom(self):
        return(self.nom)
    
    def get_prenom(self):
        return(self.prenom)
    
    def get_adresse(self):
        return(self.adresse)

class Lecteurs(Personne):
    
    def __init__(self,nom,prenom,adresse,num):
        Personne.__init__(self,nom,prenom,adresse)
        self.num=num

    def get_num_lect(self):
        return(self.num)
    
    def __str__(self):
        model= '\n Nom {} \n Prenom {} \n Adresse {} \n Numero {}'
        return model.format(self.get_nom(),self.get_prenom(),self.get_adresse(),self.get_num_lect())
        

class Emprunt:
    
    def __init__(self,lecteur):
        self.lecteur=lecteur
        self.emprunts=[]
        
    def get_num_lect(self):
        return Lecteurs.get_num_lect(self)
    
    def get_emprunts(self):
        return self.emprunts
    
    def emprunter(self,num_livre):
        for livre in Bibliotheque.livres:
            if livre.get_num()==num_livre:
                if livre.expl>=1:
                    (self.emprunts).append(num_livre)
                    livre.expl-=1
                else:
                    print("Pas de livre à emprunter")
    
    def rendre(self,livre):
        if livre.get_num() in self.emprunts:
            self.emprunts.remove(livre.get_num())
            livre.expl+=1
        else : 
            print("Ce livre n'a pas été emprunté")
    
    def __str__(self):
        model= '\n Le lecteur n° {} a emprunté les livres n° {}'
        return model.format(self.get_num_lect(self),self.emprunts(self))
    

class Bibliotheque:
    
    def __init__(self,nom):
        self.nom=nom
        self.lecteurs=[]
        self.livres=[]
        self.emprunts=[]
    
    def affiche_livres(self):
        for livre in self.livres:
            print(livre)
    
    def affiche_lecteurs(self):
        for lecteur in self.lecteurs:
            print(lecteur)
        
    def affiche_emprunts(self):
        for emprunt in self.emprunts:
            print(emprunt)

    def ajout_lecteur(self,n,p,a,num):
        lecteur=Lecteurs(n,p,a,num)
        (self.lecteurs).append(lecteur)

    
    def retrait_lecteur(self,lecteur):
        if self.lecteurs!=[]:
            if lecteur in self.lecteurs:
                (self.lecteurs).remove(lecteur)
            else:
                print("Ce lecteur n' est pas un lecteur de la bibliothèque")
        else:
            print("Il n'y a plus de lecteurs de cette bibliothèque")
    
    def chercher_lecteur_numero(self,num):       
        flag=True
        l=None
        for lect in self.lecteurs:
            if lect.get_num_lect()==num:
                flag=False
                l=lect
        if flag:
            return(False,None)
        else:
            return(True,l)
            
    def chercher_lecteur_nom(self,nom,prenom):
        flag=False
        for lect in self.lecteurs:
            if lect.get_nom()==nom and lect.get_prenom()==prenom:
                l=lect
                flag=True
        if flag:
            return(flag,l)
        else:
            return(flag,None)
               
    def ajout_livre(self,nom_auteur,titre,num,expl):
        livre=Livres(nom_auteur,titre,num,expl)
        if livre in self.livres:
            livre.expl+=1
        else:
            self.livres.append(livre)
    
    def retour_livre(self,livre,lecteur):
        for e in self.emprunts:
            if e.num_lect==lecteur.get_num_lect():
                e.rendre(livre)
        else:
            print("Ce livre n'a pas été emprunté")

    
    def rechercher_lect_numero(self,num_lect):
        for lecteur in self.lecteurs:
            if lecteur.get_num_lect()==num_lect:
                return(lecteur)
    
    def emprunt_livre(self,num_livre,num_lect):
        lecteur=self.rechercher_lect_numero(num_lect)
        if self.emprunts==[]:
            e=Emprunt(lecteur)
            e.emprunter(num_livre)
        else :
            for e in self.emprunts:
                if e.num_lect==lecteur.get_num_lect():
                    e.emprunter(num_livre)
    
    
    def chercher_livre_numero(self,num):
        flag=True
        l=None
        for livre in self.livres:
            if livre.get_num()==num:
                l=livre
                flag=False
        if flag:
            return(False,None)
        else:
            return(True,l)
    
    def chercher_livre_titre(self,t):
        flag=False
        for livre in self.livres:
            if livre.get_titre()==t:
                l=livre
                flag=True
        if flag:
            return(flag,l)
        else:
            return(flag,None)
    
    def retrait_livre(self,num):
        flag=True
        for livre in self.livres:
            if livre.get_num()==num:
                if livre.get_expl()!=0:
                    livre.expl-=1
                    flag=False
                else:
                    print("Il n'y a pas d'exemplaire à voler")
        if flag:
            print("Il n'y a pas ce livre à voler !")
    
    
                
#
# N.B. Le fonctionnement de ce programme de test est bien sûr conditionné par l'écriture
# préalable du code source de la classe Bibliotheque...
#


# Creation d'une bibliotheque
b = Bibliotheque('Bibliotheque ECL')

# Ajout de lecteurs
b.ajout_lecteur('Duval','Pierre','rue de la Paix',1)
b.ajout_lecteur('Dupond','Laurent','rue de la Gare',2)
b.ajout_lecteur('Martin','Marie','rue La Fayette',3)
b.ajout_lecteur('Dubois','Sophie','rue du Stade',4)

# Ajout de livres
b.ajout_livre('Le Pere Goriot','Honore de Balzac',101,2)
b.ajout_livre('Les Hauts de Hurlevent','Emilie Bronte',102,2)
b.ajout_livre('Le Petit Prince','Antoine de Saint Exupery',103,2)
b.ajout_livre('L\'Etranger','Albert Camus',104,2)

# Affichage des lecteurs et des livres
print('\n--- Liste des lecteurs :')
print('-------------------------------')
b.affiche_lecteurs()
print('\n--- Liste des livres :')
print('-------------------------------')
b.affiche_livres()

# Recherches de lecteurs par numero
print('\n--- Recherche de lecteurs :')
print('-------------------------------')
print('\n')
rep,lect = b.chercher_lecteur_numero(1)
if rep:
    print('Lecteur trouve:',lect)
else:
    print('Lecteur non trouve')

print('\n')

rep,lect = b.chercher_lecteur_numero(6)
if rep:
    print('Lecteur trouve:',lect)
else:
    print('Lecteur non trouve')

print('\n')

# Recherches de lecteurs par nom
rep,lect = b.chercher_lecteur_nom('Martin','Marie')
if rep:
    print('Lecteur trouve:',lect)
else:
    print('Lecteur non trouve')
    
print('\n')

rep,lect = b.chercher_lecteur_nom('Le Grand','Paul')
if rep:
    print('Lecteur trouve:',lect)
else:
    print('Lecteur non trouve')
    
print('\n')

# Recherches de livres par numero
print('\n--- Recherche de livres :')
print('-------------------------------')
print('\n')
rep,livre = b.chercher_livre_numero(101)
if rep:
    print('Livre trouve :',livre)
else:
    print('Livre non trouve')

print('\n')

rep,livre = b.chercher_livre_numero(106)
if rep:
    print('Livre trouve :',livre)
else:
    print('Livre non trouve')

print('\n')

# Recherches de livres par titre
rep,livre = b.chercher_livre_titre('Les Hauts de Hurlevent')
if rep:
    print('Livre trouve :',livre)
else:
    print('Livre non trouve')

print('\n')

rep,livre = b.chercher_livre_titre('Madame Bovarie')
if rep:
    print('Livre trouve :',livre)
else:
    print('Livre non trouve')

print('\n')

# Quelques emprunts
print('\n--- Quelques emprunts :')
print('-------------------------------')
b.emprunt_livre(1,101)
b.emprunt_livre(1,104)
b.emprunt_livre(2,101)
b.emprunt_livre(2,105)
b.emprunt_livre(3,101)
b.emprunt_livre(3,104)
b.emprunt_livre(4,102)
b.emprunt_livre(4,103)

# Affichage des emprunts, des lecteurs et des livres
print('\n--- Liste des emprunts :')
print('-------------------------------')
b.affiche_emprunts()
print('\n--- Liste des lecteurs :')
print('-------------------------------')
b.affiche_lecteurs()
print('\n--- Liste des livres :')
print('-------------------------------')
b.affiche_livres()

# Quelques retours de livres
print('\n--- Quelques retours de livres :')
print('-------------------------------')
b.retour_livre(1,101)
b.retour_livre(1,102)
b.retour_livre(3,104)
b.retour_livre(10,108)

# Affichage des emprunts, des lecteurs et des livres
print('\n--- Liste des emprunts :')
print('-------------------------------')
b.affiche_emprunts()
print('\n--- Liste des lecteurs :')
print('-------------------------------')
b.affiche_lecteurs()
print('\n--- Liste des livres :')
print('-------------------------------')
b.affiche_livres()

# Suppression de quelques livres
rep = b.retrait_livre(101)
if not rep:
    print('Retrait du livre impossible')
else:
    print('Retrait du livre effectue')

b.retour_livre(2,101)

rep = b.retrait_livre(101)
if not rep:
    print('Retrait du livre impossible')
else:
    print('Retrait du livre effectue')

# Suppression de quelques lecteurs
rep = b.retrait_lecteur(1)
if not rep:
    print('Retrait du lecteur impossible')
else:
    print('Retrait du lecteur effectue')

b.retour_livre(1,104)

rep = b.retrait_lecteur(1)
if not rep:
    print('Retrait du lecteur impossible')
else:
    print('Retrait du lecteur effectue')

# Affichage des emprunts, des lecteurs et des livres
print('\n--- Liste des emprunts :')
print('-------------------------------')
b.affiche_emprunts()
print('\n--- Liste des lecteurs :')
print('-------------------------------')
b.affiche_lecteurs()
print('\n--- Liste des livres :')
print('-------------------------------')
b.affiche_livres()

                
        
            
            
        
        
        
        
        
        
        
        
        
        
        

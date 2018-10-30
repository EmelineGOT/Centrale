mots = 'Le petit chien jaune et noir mange la soupe chaude'

def maj(L):
    [print(i.upper(),len(i)) for i in L]

maj(mots.split())



from PIL import Image, ImageDraw

def mandelbrot(c,lim) : 
    z=0
    compteur = 0
    while ( abs(z) <= 2.0 and compteur < lim ) :
        z = z**2 + c
        compteur = compteur + 1
    return compteur
    
def dessineMandelbrot(largeur,hauteur,lim) :
    im = Image.new("RGB", (largeur, hauteur))
    draw = ImageDraw.Draw(im)
    deltaR  = complex((zB.real - zA.real)/largeur, 0)
    deltaRi = complex(0, (zB.imag - zA.imag)/hauteur)
    for y in range (0, hauteur):
        for x in range (0, largeur):
            nb = int(255 - 2.55*mandelbrot(zA + x*deltaR + y*deltaRi, lim))
            draw.point((x, hauteur-1-y), (nb,nb,nb))
    im.show()
    
###  Programme principal  ###
zA = complex(-2.0,-2.0)
zB = complex( 2.0, 2.0)
largeur = 500
hauteur = 500
lim     = 100
dessineMandelbrot(largeur,hauteur,lim)
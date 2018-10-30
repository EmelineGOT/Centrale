
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimage
from math import *
from PIL import *
 
 
def Mandelbrot(c,lim):
    it=0
    z=0
    while sqrt(z.real**2 + z.imag**2)<=2 and it<=lim :
        z=z**2+c
        it+=1
    if it==lim+1:
        return(True)
    else:
        return(it) 

def tracer(x_range,y_range,lim):
    size=1024
    im=Image.new("RGB",(size,size))
    px=im.load()
    x_min=-x_range/2
    x_max=x_range/2
    y_min=-y_range/2
    y_max=y_range/2

    for i in range(size):
        for k in range(size):
            xi=x_min+i*x_range/size
            yk=y_max-k*y_range/size
            c=xi+1j*yk
            if int(Mandelbrot(c,lim)):
                p=Mandelbrot(c,lim)/lim
                if p>=3/4:
                    px[i,k]=(int((-4*p+4)*255),255,0)
                elif p>=2/4 and p<=3/4:
                    px[i,k]=(255,int((4*p-2)*255),0)
                elif p>=1/4 and p<=3/4:
                    px[i,k]=(255,0,int((-4*p+2)*255))
                elif p>=1/8 and p<=2/4:
                    px[i,k]=(int((8*p-1)*255),0,255)
                else:
                    px[i,k]=(0,0,255)
    
    im.show()
    
    im.save("client/image/Mandelbrot_"+str(x_range)+"_"+str(y_range)+"_"+str(lim)+".png", format="png")
    im.save("client/images/fig",format="png")
    return "Mandelbrot_"+str(x_range)+"_"+str(y_range)+"_"+str(lim)+".png"
                    
    
 
 
"""
lim=100
size=1024
max_color = 255.
x_min, x_max = -2, 2
y_min, y_max = -2, 2

x, y = np.meshgrid(np.linspace(x_min, x_max, size),np.linspace(y_min, y_max, size))

c = x + 1j * y
z = c.copy()

fractal = np.zeros(z.shape,dtype=np.uint8) + max_color

for n in range(lim):
    mask = np.abs(z) <= 4 
    z[mask] = z[mask] ** 2 +  c[mask]
    fractal[(fractal == max_color) &(-mask)] = (max_color - 1) * n / lim

plt.imshow(fractal)
plt.show()"""


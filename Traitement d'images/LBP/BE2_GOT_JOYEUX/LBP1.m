function [im2] = LBP1(im)

[a,b]=size(im);  %On récupère la taille de l'image
im2=zeros(a-2,b-2);  %On se place dans l'image réduite de son contour

for i=1:(a-2)
    for j=1:(b-2)
        s=0;
        for p=0:7
            [u,v]=voisin(i,j,p); %La fonction voisin donne les coordonnées des pixels voisins au pixel étudié
            if im(u,v)>=im(i+1,j+1)  %On vérifie si la valeur du pixel voisin est supérieure à celle du pixel étudié
               s=s+2^p; %Auquel cas, on modifie la valeur de s
            end
        end
        im2(i,j)=s; %On remplace la valeur du pixel étudié par s 
    end
end
        

end


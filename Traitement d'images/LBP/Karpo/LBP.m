% prend en entrée une image et sort l'image traitée selon le LBP 
function [im2] = LBP(im)
[a,b] = size(im);
im2=zeros(a-2,b-2);
for i=1:(a-2) % parcours de la nouvelle image
    for j=1:(b-2)
        s=0;
        for p=0:7
            [u,v]=voisin(i,j,p); % renvoie les coordonnees du pème voisin
            if im(u,v)>=im(i+1,j+1)
               s=s+2^p;
            end;
        end;
        im2(i,j)=s;
    end;
end;
end


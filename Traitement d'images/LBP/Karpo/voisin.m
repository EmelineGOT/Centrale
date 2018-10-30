% renvoie les voisins selon la manière de tourner de la methode LBP
function [u,v] = voisin(i,j,p)
if p==0
    u=i+1;
    v=j;
elseif p==1
    u=i+2;
    v=j;
elseif p==2
    u=i+2;
    v=j+1;
elseif p==3
    u=i+2;
    v=j+2;
elseif p==4
    u=i+1;
    v=j+2;
elseif p==5
    u=i;
    v=j+2;
elseif p==6
    u=i;
    v=j+1;
elseif p==7
    u=i;
    v=j;
end


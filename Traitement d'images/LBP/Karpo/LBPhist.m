% prend en argument un image et le nombre par lequel elle est divisée
% nbrDiv x nbrDiv et renvoie la liste des histogrammes correspondant
function [hist] = LBPhist(image,nbrDiv)
[a,b]=size(image);
hist=zeros(nbrDiv^2,256); % chaque ligne contient l'histogramme de la case associee
for i=1:nbrDiv % parcours les cases
    for j=1:nbrDiv 
        % on prend la sous-image qui correspond
        im=image(floor((i-1)*a/nbrDiv+1):floor(i*a/nbrDiv),floor((j-1)*b/nbrDiv+1):floor(j*b/nbrDiv));
        % on ajoute son histogramme
        hist((i-1)*nbrDiv+j,:)=histogramm(LBP(im));
    end;
end;      
end


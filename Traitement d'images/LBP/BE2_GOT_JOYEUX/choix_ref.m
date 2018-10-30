function [ L ] = choix_ref( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

L=[];

for i=1:40  %Pour chaque sujet
    n=1;
    while (n<5)  %On sélectionne 4 images
        k=floor(10*rand())+10*(i-1)+1;  %k est un nombre aléatoire correspondant à une des images du sujet i 
        if not(ismember(k,L))  %Si l'image n'est pas encore sélectionnée
            L((i-1)*4+n)=k; %On l'ajoute à la liste des images de référence
            n=n+1; %On continue tant que l'on a pas sélectionné les 4 images souhaitées
        end
    end
    

end
end


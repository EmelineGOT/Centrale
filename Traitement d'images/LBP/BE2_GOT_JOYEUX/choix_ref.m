function [ L ] = choix_ref( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

L=[];

for i=1:40  %Pour chaque sujet
    n=1;
    while (n<5)  %On s�lectionne 4 images
        k=floor(10*rand())+10*(i-1)+1;  %k est un nombre al�atoire correspondant � une des images du sujet i 
        if not(ismember(k,L))  %Si l'image n'est pas encore s�lectionn�e
            L((i-1)*4+n)=k; %On l'ajoute � la liste des images de r�f�rence
            n=n+1; %On continue tant que l'on a pas s�lectionn� les 4 images souhait�es
        end
    end
    

end
end


function [ Jocc ] = compute_hist_n(I,n)
 % est la taille de subdivision de l'image I
 [l,m] = size(I);
 Jocc = zeros(256,round(l/n)*round(m/n)); % l*m/n^2 vecteur de occurence
 %de l'histogramme.
 
 k = 1; % numéro de la zone extraite
 for i = 1:n:l-n+1 
     % suivant les colonnes puis les lignes (gauche droite puis haut bas)
     for j = 1:n:m-n+1
         Iextrait = I(i:i+n-1,j:j+n-1);
         Jocc(:,k) = compute_hist(Iextrait);
         %rectangle = int32([i,j,i+n-1,j+n-1]);
         %I = insertShape(I,'rectangle',rectangle,'Color','green','LineWidth', 1);
         k = k + 1;
     end
 end
 %imshow(I/256)
end


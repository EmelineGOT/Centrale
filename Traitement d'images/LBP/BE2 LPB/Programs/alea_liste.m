function [L] = alea_liste()
%renvoie une liste de taille 4 aléatoire contenant des éléments entre 0 et 9 tous
%différents.
L = [];
while length(L) < 4
    L = [L round(rand(1)*9)];
    L = unique(L);
end
end


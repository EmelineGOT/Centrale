function [L] = alea_liste()
%renvoie une liste de taille 4 al�atoire contenant des �l�ments entre 0 et 9 tous
%diff�rents.
L = [];
while length(L) < 4
    L = [L round(rand(1)*9)];
    L = unique(L);
end
end


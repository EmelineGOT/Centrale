function [ L ] = neighbour(i,j,a,b)
%Renvoie les voisins du pixel i,j dans une image de taille a,b.
%Evite les index out of range.
L = [[i,j-1];[i+1,j-1];[i+1,j];[i+1,j+1];[i,j+1];[i-1,j+1];[i-1,j];[i-1,j-1]];

end


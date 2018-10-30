% fonction qui gere le cas où l'image est divisée 1x1 ou 3x3 ou 5x5 ou 7x7
% elle prend en entrée 2 histogramme et la liste des poids
% elle donne en sortie l'indice de proximité correspondant
function [chi] = divided(w,liste1,liste2)
chi=0;
m=size(w,1);
for i=1:m
    for j=1:256
        if liste1(i,j)+liste2(i,j)~= 0
            chi=chi+w(i)*(liste1(i,j)-liste2(i,j))^2/(liste1(i,j)+liste2(i,j));
        end;
    end;
end;
end
% fonction qui prend en entrée une liste et qui en fabrique l'histogramme
% correspondant
function [liste] = histogramm(im)
a = size(im,1);
b = size(im,2);
liste=zeros(1,256);
for i=1:a
    for j=1:b
        liste(im(i,j)+1)= liste(im(i,j)+1)+1;
    end;
end;
end


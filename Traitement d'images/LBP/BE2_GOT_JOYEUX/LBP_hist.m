function [ hist ] = LBP_hist(I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

hist=zeros(1,256);
[a,b]=size(I);

J=LBP1(I); %On applique le LBP
for j=1:(a-2)
    for k=1:(b-2)
        hist(J(j,k)+1)=hist(J(j,k)+1)+1; %Pour chaque pixel de l'image, on augmente la valeur de l'histogramme correspondante
    end
end
    
end



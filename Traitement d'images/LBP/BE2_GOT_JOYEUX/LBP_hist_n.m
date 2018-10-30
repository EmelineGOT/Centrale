function [ hist ] = LBP_hist_n( I,n )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

hist=zeros(n^2,256);
[a,b]=size(I);

for i=1:n
    for j=1:n

        B=I(floor((i-1)*a/n+1):floor(i*a/n),floor((j-1)*b/n+1):floor(j*b/n)); %On sélectionne la zone de l'image souhaitée
        
        hist((i-1)*n+j,:)=LBP_hist(B);  %On applique l'histogramme à la zone sélectionnée et on le stocke dans la variable hist

    end
end

    
    
    



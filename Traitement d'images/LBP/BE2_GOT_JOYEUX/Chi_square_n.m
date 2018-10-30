function [ s ] = Chi_square_n(A,B,n)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

w=ones(n^2);
s=0;

if n==3 %Liste de poids pour une image 3x3
    w(5)=3; 
end

if n==5 %Liste de poids pour une image 5x5
    w(7)=5;
    w(8)=2;
    w(9)=5;
    w(12)=2;
    w(13)=5;
    w(14)=2;
    w(17)=2;
    w(18)=5;
    w(19)=2;
end

if n==7 %Liste de poids pour une image 7x7
    w(9:41)=2;
end


m=size(w);

for j=1:m
    for i=1:256
        if A(i)+B(i) ~=0
            s=s+w(j)*((A(i)-B(i))^2/(A(i)+B(i))); %On calcule la distance avec la formule prenant en compte les poids
        end
    end

end


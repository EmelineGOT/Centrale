function [ sortie ] = mask3( BW )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

[h,l]=size(BW);
sortie=BW;

[x,y]=find(BW);
n=size(x,1);

for i=1:n
    if y(i)<l
        if x(i)==1 %Pixel en haut à gauche du rectangle vaut 1
           if BW(x(i)+1,y(i)+1)==1 %Pixel en bas à droite du rectangle vaut 1
               sortie(x(i):x(i)+1,y(i):y(i)+1)=1; %On colorie le rectangle en blanc
           end
           
        elseif x(i)==h %Pixel en bas à gauche du rectangle
            if BW(x(i)-1,y(i)+1)==1 %Pixel en haut à droite du rectangle vaut 1
                sortie(x(i):x(i)-1,y(i):y(i)+1)=1; %On colorie le rectangle en blanc
            end
            
        else
            
            if BW(x(i)-1,y(i)+1)==1
                sortie(x(i)-1:x(i),y(i):y(i)+1)=1;
            end
            
            if BW(x(i)+1,y(i)+1)==1
                sortie(x(i):x(i)+1,y(i):y(i)+1)=1;
            end
        end
    end
end
       


end


function [ sortie ] = mask2( BW )

[h,l]=size(BW);
sortie=BW;

[x,y]=find(BW);
n=size(x,1);

for i=1:n
    if y(i)<(l-1)
        if x(i)==1 %Pixel en haut à gauche du rectangle vaut 1
           if BW(x(i)+1,y(i)+2)==1 %Pixel en bas à droite du rectangle vaut 1
               sortie(x(i):x(i)+1,y(i):y(i)+2)=1; %On colorie le rectangle en blanc
           end
           
        elseif x(i)==h %Pixel en bas à gauche du rectangle
            if BW(x(i)-1,y(i)+2)==1 %Pixel en haut à droite du rectangle vaut 1
                sortie(x(i):x(i)-1,y(i):y(i)+2)=1; %On colorie le rectangle en blanc
            end
            
        else
            
            if BW(x(i)-1,y(i)+2)==1
                sortie(x(i)-1:x(i),y(i):y(i)+2)=1;
            end
            
            if BW(x(i)+1,y(i)+2)==1
                sortie(x(i):x(i)+1,y(i):y(i)+2)=1;
            end
        end
    end
end
                
 

end


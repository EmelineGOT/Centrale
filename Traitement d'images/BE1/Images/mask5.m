function [ sortie ] = mask5( I )

sortie=I;
[x,y]=find(I);
[a,b]=size(I);
l=size(x,1);

for i=1:l
    if x(i)>1 && x(i)<a && y(i)>1 && y(i)<b
            if I(x(i)-1,y(i)-1)==0 && I(x(i)-1,y(i))==0 && I(x(i)+1,y(i)+1)==0 && I(x(i),y(i)-1)==0 && I(x(i),y(i)+1)==0 && I(x(i)+1,y(i)-1)==0 && I(x(i)+1,y(i))==0 && I(x(i)+1,y(i)+1)==0
                sortie(x(i),y(i))=0;
            end
    end
end
end


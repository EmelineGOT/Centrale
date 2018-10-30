function [ u,J ] = separation( I )

L=255;
H=imhist(I);
[h,l]=size(I);
seuil=round(0.02*h*l);
i=256;
Nb=0;

while Nb<seuil
    i=i-1;
    Nb=Nb+H(i);
end
u=i;

J=I;
for i=1:h
    for j=1:l
        if I(i,j)>=u-1
            J(i,j)=L;
        end
    end
end



end


function [ sortie ] = mask4( I )

sortie=I;
[x,y]=find(I);
[a,b]=size(I);
l=size(x,1);
for i=1:l
    last=find(x==x(i),1,'last'); %Recherche du dernier �l�ment qui vaut 1
    if (last-i)>(0.75*a*b)
        sortie(x(i),y(i):y(last))=0; %Recouvrement en blanc de la zone entre un �l�ment et le dernier qui vaut 1 sur cette ligne 
    else 
        sortie(x(i),y(i):y(last))=1;
    end
end

end


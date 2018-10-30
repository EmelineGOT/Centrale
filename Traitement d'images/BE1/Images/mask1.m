function [ sortie ] = mask1( BW )
sortie=BW;
[x,y]=find(BW);
l=size(x,1);
for i=1:l
    last=find(x==x(i),1,'last'); %Recherche du dernier élément qui vaut 1
    sortie(x(i),y(i):y(last))=1; %Recouvrement en blanc de la zone entre un élément et le dernier qui vaut 1 sur cette ligne 
end


end


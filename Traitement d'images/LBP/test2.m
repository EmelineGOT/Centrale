clear all
close all

k=1;
for i=1:40
    for j=1:10
        
        filename=sprintf('ORL/S%d/%d.bmp',i,j);
        A(:,:,k)=imread(filename);
        k=k+1;
    end
end

H=LBP_hist(A);

p=zeros(1,400);
for k=1:400
    
    
    L=choix_ref(A);
    i_test=floor(k/10)+1; % la personne sur l'image 
    
    if ~ismember(k,L) % image ne fait pas partie des references
        
        indice_min=inf; % la distance selon le chi
        i_min=inf; % indice de la personne sur l'image la plus proche
        
        for j=1:160
            
            indice=Chi_square(H(k,:),H(L(j),:));
            
            if indice<indice_min
                indice_min=indice;
                i_min=j;
            end;
        end;
        p(k)=i_min;
    end;
            
end
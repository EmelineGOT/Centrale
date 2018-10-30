 p=zeros(1,400);
for k=1:400 % parcours des 400 images
%         i_test=floor(k/10)+1; % la personne sur l'image 
%         j_test=mod(k,10); % le numero de l'image
%         if j_test==0 % cas le l'image numero 10
%             i_test=i_test-1;
%             j_test=10;
%         end;
        if ~ismember(k,L) % image ne fait pas partie des references
            % on recherche parmis les references celle qui est le plus
            % proche de celle de base
            indice_min=inf; % la distance selon le chi
            i_min=inf; % indice de la personne sur l'image la plus proche
            for i=1:160
                indice=divided(1,B(k,:),B(L(i),:));
                if indice<indice_min 
                    indice_min=indice;
                    i_min=L(i);
                end;
                p(k)=i_min;
            end;
            
        end
 end
 
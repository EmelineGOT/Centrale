

p=zeros(1,400);

for j=1:400
        if not(ismember(j,L))  %l'image j n'est pas une image ref
            kmin=inf;
            min=inf;
            for k=1:160  %Parcours de la liste des ref, L
                CS=Chi_square(H(j,:),H(L(k),:));
                if CS<min
                    min=CS;
                    kmin=L(k);
                end
                p(j)=kmin;
            end
            
        end
        
end


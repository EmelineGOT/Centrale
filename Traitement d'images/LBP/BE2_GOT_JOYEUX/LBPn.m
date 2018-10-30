n=7;

%---------------Importation des images de ORL
k=1;
for i=1:40
    for j=1:10
        
        filename=sprintf('ORL/S%d/%d.bmp',i,j);
        A(:,:,k)=imread(filename);
        k=k+1;
    end
end


%---------------Calcul de l'histogramme de chaque zone de l'image
H= zeros(400,n^2,256);  %Dans H, on stocke les histogrammes de chaque zone de l'image
for i=1:400
    hist_temp=LBP_hist_n(A(:,:,i),n);
    for z=1:(n^2)
        H(i,z,:)=hist_temp(z,:); 
    end
end




%---------------Cross-Validation
taux=[];

for i=1:10
    
    rate=0;
    L=choix_ref(A);
    
    
    for j=1:400
        
        if not(ismember(j,L))  
            
            min=inf;
            kmin=0;
            
            for k=1:160  
                CS=Chi_square_n(H(j,:),H(L(k),:),n); %On applique Chi_square_n qui prend en comtpe une liste de poids
                
                if CS<min
                    min=CS;
                    kmin=L(k);
                end
            end
            
            if (floor((j-1)/10))==(floor((kmin-1)/10)) 
                rate=rate+1; 
            end
            
        end
    end
    
    taux(i)=rate/240;
end
            
            







            
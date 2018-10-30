%---------------Importation des images de ORL
k=1;
for i=1:40
    for j=1:10
        
        filename=sprintf('ORL/S%d/%d.bmp',i,j);
        A(:,:,k)=imread(filename);
        k=k+1;
    end
end


%---------------Calcul de l'histogramme de chaque image
H= zeros(400,256);
for i=1:400
    H(i,:)=LBP_hist(A(:,:,i)); %La variable H contient tous les histogrammes 
end



%---------------Cross-Validation
taux=[];

for i=1:10  %On effectue 10 tests
    
    rate=0;  %Variable qui contient le nombre de succ�s
    L=choix_ref(A);  %L contient les indices des images de r�f�rence
    
    
    for j=1:400  %On teste les 400 images
        
        if not(ismember(j,L))  %Si l'image j n'est pas une image de r�f�rence
            
            min=inf; %La variable min contient la distance chi_square minimale
            kmin=0; %L'indice kmin correspond � l'image donnant la distance minimale
            
            for k=1:160  %On parcourt de la liste des images r�f�rences, L
                CS=Chi_square(H(j,:),H(L(k),:)); %On calcule la distance chi_square � partir des histogrammes
                
                if CS<min  %Si la distance est plus petite que le min actuel
                    min=CS;  %On remplace le min
                    kmin=L(k);  %On stocke l'indice de l'image
                end
            end
            
            if (floor((j-1)/10))==(floor((kmin-1)/10)) %Si les deux personnes sont les m�mes
                rate=rate+1; %C'est un succ�s 
            end
            
        end
    end
    
    taux(i)=rate/240; %On stocke dans le tableau taux les pourcentages de succ�s pour chaque essai
end
            
            





            
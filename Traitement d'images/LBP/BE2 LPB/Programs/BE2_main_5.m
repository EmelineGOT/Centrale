%% INITIALIZATION
% On importe les images dans la matrice A
clear all
A = zeros(112,92,400);
[l,m] = size(A(:,:,1)); % prise en compte de la taille des images.

n = 18; % 18 pixels pour diviser l'image en 5x5 régions. (92 ~= 18*5)

k = 1;
for i=1:40
    for j = 1:10
        filename=sprintf('ORL/s%d/%d.bmp',i,j);
        A(:,:,k)= imread(filename);
        k = k+1;
    end
end

%% PRE-PROCESSING
% On applique le masque LBP et on calcule l'histogramme pour chaque image.
H = zeros(256,round(l/n)*round(m/n),400);
for k=1:400
    H(:,:,k)= compute_hist_n(A(:,:,k),n);
    % compute_hist_n calcule l'histogramme pour toute l'image et
    % applique le masque LBP avant !
end


%% PROCESSING
% On teste les images avec les références L(i)
taux = zeros(1,10);% liste des taux de réussite.

for nb_itera = 1:10
L = alea_liste() % numéro des 4 images sélectionnées comme références.
[R,T] = reference_list(H,L);%extraction des références et des visages à tester.
sucess = 0; % nb d'images img bien identifiées.

for p_test = 1:40 % pour chaque personne test
    for i_test = 1:6 %pour chaqune des 6 images de la personne test
        
        chi_min = Inf;%la distance min est initialisée à l'infini.
        for p_ref = 1:40 % on compare aux 4 reférences de toutes les personnes.
            for i_ref = 1:4
                chi = chi_multiple_hist(R(:,:,p_ref,i_ref),T(:,:,p_test,i_test),n);
                % calcule de la distance sur l'image entière.
                if chi < chi_min % on séléctionne le chi qui est minimum.
                    p_trouve = p_ref;% on retient la personne associée.
                    chi_min = chi; %on change le chi.
                end
            end
        end
        
        if p_trouve == p_test % alors on a bien trouvé c'est un succès.
            sucess = sucess+1;
        end
    end
end
taux(nb_itera) = sucess / (40*6) % on actualise la liste des taux de réussite. 
%40*6 est le nb d'images à tester.
end
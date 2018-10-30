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



%% PLOT ROC CURVE
GalleryNum = 40;  %nombre de classes (ici des personnes)
ProbeNum   = 6*40;  % nombre de photos dans la base de donnée (visages)
%6 photos par classe.
Piecewise  = 1000;

MatchingScore = zeros(ProbeNum,GalleryNum);
% en ligne les images à tester; en colonne les classes
FaceClass = zeros(1,ProbeNum);


L = [1 2 3 4]; % numéro des 4 images sélectionnées comme références.
[R,T] = reference_list(H,L); %extraction des références et des visages à tester.
i = 1;
k = 1;

for p_test = 1:40 % pour chaque personne test
    for i_test = 1:6 %pour chaqune des 6 images de la personne test
        
        for p_ref = 1:40 % on compare aux 4 reférences de toutes les personnes.
            for i_ref = 1:4
                MatchingScore(i,p_ref) = MatchingScore(i,p_ref) - chi_multiple_hist(R(:,:,p_ref,i_ref),T(:,:,p_test,i_test),n);
                % calcul de la distance sur l'image entière.
            end
        end
        
    FaceClass(k) = p_test;
    k = k + 1;
    i = i + 1;
    end
end


% Max and min value of the matching scores
MaxValue = max(max(MatchingScore));
MinValue = min(min(MatchingScore));

ThresInterval = (MaxValue - MinValue)/Piecewise;



for k = 1:Piecewise
    TruePosNum = 0;
    FalsePosNum = 0;
    for i = 1:GalleryNum
        for j = 1:ProbeNum
            if (MatchingScore(j, i) > (MinValue+k*ThresInterval))&&(FaceClass(j) == i)
                TruePosNum = TruePosNum + 1;
            elseif (MatchingScore(j, i) > (MinValue+k*ThresInterval))&&(FaceClass(j) ~= i)
                FalsePosNum = FalsePosNum + 1;
            end
        end
    end
    VR(k) = TruePosNum/(ProbeNum);
    FAR(k) = FalsePosNum/((GalleryNum - 1)*ProbeNum);
end

plot(FAR, VR);
ylabel('True Positive Rate');
xlabel('False Positive Rate');
title('ROC Curve 5 Zones');
hold on
plot([0 1], [0 1],'--')%droite y = x
grid;
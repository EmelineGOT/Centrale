clear all
close all

% on range les images dans A
k=1;
for i=1:40
    for j=1:10
        filename=sprintf('ORL/S%d/%d.bmp',i,j);
        image=imread(filename);
        [a,b]=size(image);
        A(:,:,k)=imread(filename);
        k=k+1;
    end;
end


%remplissage de la matrice B qui contient les histogrammes de chaque image
B=zeros(400,49,256);
for i=1:400 
    histos=LBPhist(A(:,:,i),7);
    for sous_zone=1:49
        B(i,sous_zone,:)=histos(sous_zone,:);
    end;
end;

w=ones(49); % initialisation de la matrice des poids
w(9)=2; 
w(10)=2;
w(11)=2;
w(12)=2; 
w(13)=2;
w(16)=2;
w(17)=2; 
w(18)=2;
w(19)=2;
w(20)=2;
w(23)=2;
w(24)=2;
w(25)=2;
w(26)=2;
w(27)=2;
w(30)=2;
w(31)=2;
w(32)=2;
w(33)=2;
w(34)=2;
w(37)=2;
w(38)=2;
w(39)=2;
w(40)=2;
w(41)=2;




reussite=zeros(10); % pourcentage de reussite 
for p=1:10 % on fait 10 fois le test du nombre de succ�s
    sucess=0;
    references=random_reference(); % liste des 4 numeros d'images references
    for k=1:400 % parcours des 400 images
        i_test=floor(k/10)+1; % la personne sur l'image 
        j_test=mod(k,10); % le numero de l'image
        if j_test==0 % cas le l'image numero 10
            i_test=i_test-1;
            j_test=10;
        end;
        if ~ismember(j_test,references) % image ne fait pas partie des references
            % on recherche parmis les references celle qui est le plus
            % proche de celle de base
            indice_min=inf; % la distance selon le chi
            i_min=inf; % indice de la personne sur l'image la plus proche
            for i_ref=1:40 % parcours des references
                for j_ref=1:4
                    % calcul de la distance entre les deux images
                    C=zeros(49,256);
                    D=zeros(49,256);
                    for i=1:49
                        for j=1:256
                            C(i,j)=B(k,i,j);
                            D(i,j)=B((i_ref-1)*10+references(j_ref),i,j);
                        end;
                    end;
                    indice=divided(w,C,D);
                    if indice<indice_min 
                        % si la distance est plus petite que le min, la met
                        % a la place
                        indice_min=indice;
                        i_min=i_ref;
                    end;
                end;
            end;
            % si l'image la plus proche correspond � la bonne personne,
            % c'est un succes
            if i_min==i_test
                sucess=sucess+1;
            end;
        end; 
    end;
    reussite(p)=sucess/360; % on range le % de r�ussite dans ce vecteur
end;
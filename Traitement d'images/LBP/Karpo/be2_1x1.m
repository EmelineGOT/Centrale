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
end;
        
%im1=A(:,:,17);
%im2=A(:,:,18);
%imshow(im1);
%figure
%imshow(im2);

%h11=histogramm(LBP(im1));
%h21=histogramm(LBP(im2));
%indice1=non_divided(h11,h21);

%w3=ones(1,9);
%h13=LBPhist(im1,1);
%h23=LBPhist(im2,1);
%indice3=divided(1,h13,h23);

%w5=ones(1,25);
%h15=LBPhist(im1,5);
%h25=LBPhist(im2,5);
%indice5=divided(w5,h15,h25);

%w7=ones(1,49);
%h17=LBPhist(im1,7);
%h27=LBPhist(im2,7);
%indice7=divided(w7,h17,h27);


%remplissage de la matrice B qui contient les histogrammes de chaque image
B=zeros(400,256);
for i=1:400 
    B(i,:)=LBPhist(A(:,:,i),1);
end;

w=1; % initialisation de la matrice des poids
reussite=zeros(10); % pourcentage de reussite 
for p=1:10 % on fait 10 fois le test du nombre de succès
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
                    indice=Chi_square(B(k,:),B((i_ref-1)*10+references(j_ref),:));
                    if indice<indice_min 
                        % si la distance est plus petite que le min, la met
                        % a la place
                        indice_min=indice;
                        i_min=i_ref;
                    end;
                end;
            end;
            % si l'image la plus proche correspond à la bonne personne,
            % c'est un succes
            if i_min==i_test
                sucess=sucess+1;
            end;
        end; 
    end;
    reussite(p)=sucess/240; % on range le % de réussite dans ce vecteur
end;
                    

        
        
    
    
    



%clear all
close all

dos_max=40;
im_max=10;
m=3;
% hist=zeros(m^2,256,400);
% k=1;
% for i=1:dos_max
%     for j=1:im_max
%         filename=sprintf('ORL/S%d/%d.bmp',i,j);
%         A(:,:,k)=imread(filename);
%         if m==1
%             hist(:,:,k)=lbphistogram(A(:,:,k));
%         else
%             [l,p] = size(I);
%             pas_x = floor(l/m);
%             pas_y = floor(p/m);
%             for n=1:m-1
%                 for q=1:m-1
%                     hist((n-1)*m+q,:,k)=lbphistogram(A((n-1)*pas_x+1:n*pas_x+1,(q-1)*pas_y+1:q*pas_y+1),k);
%                 end
%             end
%         end
%         k=k+1;
%     end
% end
A=load('load_images.mat');
hist=load(sprintf('load_hist_m%d.mat',m));
hist=hist.(sprintf('hist%d',m));

imax=40;
jmax=4;
accuracy=zeros(40,6);
visage=ones(40,6);
reussite=0;
indice_ref=indices_test();
indice_comp=[];
for i=1:10
    if ~ismember(i,indice_ref)
        indice_comp=[indice_comp i];
    end
end

for l=1:40
    for k=1:6
        similar=zeros(imax,jmax);
%         filename=sprintf('ORL/S%d/%d.bmp',l,k);
%         P=imread(filename);
        randk=indice_comp(k);
        for i=1:imax
            for j=1:jmax
                randj=indice_ref(j);
                if m==1
                    similar(i,j)=similarity(hist(:,:,(i-1)*im_max+randj),hist(:,:,(l-1)*im_max+randk));
                else
                    similar(i,j)=similarity_part(hist(:,:,(i-1)*im_max+randj),hist(:,:,(l-1)*im_max+randk),m);
                end
            end
        end
        [M,I]=min(similar);
        [u,v]=min(M);
        if I(v)==l
            reussite=reussite+1;
        end
        
    end
end

reussite=reussite/(6*40)
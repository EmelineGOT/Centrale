function [A,hist]=chargement(m)
    dos_max=40;
    im_max=10;
    %m=1;
    hist=zeros(m^2,256,400);
    k=1;
    for i=1:dos_max
        for j=1:im_max
            filename=sprintf('ORL/S%d/%d.bmp',i,j);
            A(:,:,k)=imread(filename);
            if m==1
                hist(:,:,k)=lbphistogram(A(:,:,k));
            else
                [l,p] = size(A(:,:,k));
                pas_x = floor(l/m);
                pas_y = floor(p/m);
                for n=1:m-1
                    for q=1:m-1
                        hist((n-1)*m+q,:,k)=lbphistogram(A((n-1)*pas_x+1:n*pas_x+1,(q-1)*pas_y+1:q*pas_y+1,k));
                    end
                end
            end
            k=k+1;
        end
    end
end
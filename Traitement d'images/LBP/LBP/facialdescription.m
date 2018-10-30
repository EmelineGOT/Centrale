function hists=facialdescription(I,m)
    %I=imread('ORL/S1/1.bmp');
    [l,p]=size(I);
    %m=3;
    hists=zeros(m^2,256);
    pas_x=floor(l/(m+1));
    pas_y=floor(p/(m+1));

    for i=0:m-1
        for j=0:m-1
            image=I(pas_x*i+1:pas_x*(i+1)+1,pas_y*j+1:pas_y*(j+1)+1);
            figure
            subplot(1,2,1),imshow(image)
            hists(i*m+j+1,:)=lbphistogram(image);
            subplot(1,2,2),plot(0:255,hists(i*m+j+1,:),'p');
        end
    end
end

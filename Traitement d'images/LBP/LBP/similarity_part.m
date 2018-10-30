function chi=similarity_part(histI,histP,m)
%I=imread('ORL/S1/1.bmp');
%P=imread('ORL/S1/5.bmp');
% [l,p] = size(I);
% pas_x = floor(l/m);
% pas_y = floor(p/m);
% histI=zeros(m^2,256);
% histP=zeros(m^2,256);
% for i=1:m-1
%     for j=1:m-1
%         histI((i-1)*m+j,:)=lbphistogram(I((i-1)*pas_x+1:i*pas_x+1,(j-1)*pas_y+1:j*pas_y+1));
%         histP((i-1)*m+j,:)=lbphistogram(P((i-1)*pas_x+1:i*pas_x+1,(j-1)*pas_y+1:j*pas_y+1));
%     end
% end

chi=0;
w=ones(1,m^2);
if m==3
    w(1)=2;
    w(3)=2;
    w(5)=2;
    w(8)=2;
elseif m==5
    w(7)=2;
    w(9)=2;
    w(13)=2;
    w(17)=2;
    w(18)=2;
    w(19)=2;
elseif m==7
    w(11)=2;
    w(13)=2;
    w(16)=2;
    w(20)=2;
    w(24:26)=2;
    w(38:40)=2;
end

for j=1:m^2
    for i =1:256
        alphai=histI(j,i);
        betai=histP(j,i);
        if (alphai + betai)==0
            chi = chi + w(j)*(alphai - betai)^2 / (1);
        else
            chi = chi + w(j)*(alphai - betai)^2 / (alphai + betai);
        end
    end
end
end
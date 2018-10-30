function chi=similarity(histI,histP)
%I=imread('ORL/S1/1.bmp');
%P=imread('ORL/S1/5.bmp');
% histI=lbphistogram(I);
% histP=lbphistogram(P);
chi=0;
for i =1:256
    alphai=histI(i);
    betai=histP(i);
    if (alphai + betai)==0
        chi = chi + (alphai - betai)^2 / (1);
    else
        chi = chi + (alphai - betai)^2 / (alphai + betai);
    end
end
end

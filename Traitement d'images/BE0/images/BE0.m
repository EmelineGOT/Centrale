%----Laboratoire 1

A=ones(64,64);
A(22:42,17:47)=0;
%imshow(A)

I=imread('DOLLARD.TIF');
%imshow(I)
J=rgb2gray(I);
%imshow(J)
size(I)
whos I
R=J(end:-1:1,:);
%imshow(R)
S=J(1:2:end,1:2:end);
%imshow(S)

%----Laboratoire 2

load clown;
I=ind2gray(X,map);
%subplot(1,2,1), imshow(I)
%subplot(1,2,2), imhist(I)

max(imhist(I));

load spine; 
I=ind2gray(X,map);
%subplot(2,2,1),imshow(I)
%subplot(2,2,2),improfile(I,[7 156],[8 179])

load trees;
I=ind2gray(X,map);
J=im2uint8(I);
%subplot(2,2,1),imshow(floor (J/2)*2)
%subplot(2,2,2),imhist(floor (J/2)*2)
K=histeq(I,128);
%subplot(2,2,3),imhist(K)
%subplot(2,2,4),imshow(K)

load trees;
I=ind2gray(X,map);
BW=(I>0.5);
%subplot(1,2,1),imshow(X,map)
%subplot(1,2,2),imshow(BW)


J=imread('MONNAIE.TIF');
I=rgb2gray(J);
%imhist(I)
BW=(I>50 & I<130);
%imshow(BW)
%subplot(1,3,1),imshow(J)
%subplot(1,3,2),imhist(I)
%subplot(1,3,3),imshow(BW)

%M=roipoly(I);
%D=not(M);
%I(D)=0;
%imshow(I);

A=ones(64,64);
A(20:40,20:40)=0;
B=ones(64,64);
B(25:50,25:50)=0;
%imshow(A & not(B))


J=open('CLOWN.MAT');
h=ones(3);
%B=filter2(h,J);
%imshow(B)


I=imread('AUTUMN.TIF');
K=rgb2gray(I);
J=imnoise(K,'salt & pepper');
%F=medfilt2(K,[7,7]);
F=medfilt2(J,[3,3]);
imshow(F)






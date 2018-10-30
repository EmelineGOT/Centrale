%Digital image transformation

Ijpg=imread('9001.jpg','jpg');
imwrite(Ijpg,'9001.bmp','bmp');
I=imread('9001.bmp');
G=rgb2gray(I);
%G2=transpose(G);


%Enhancement of text region patterns

M=0.7;

J=imresize(G,0.125,'nearest');
BW=im2bw(J,M);
%imshow(BW)

%Potential text regions localization

%Mask1

K=mask1(mask5(BW));
%imshow(K)


%Mask 2 & 3

N=mask2(K);
while not(isequal(N,mask4(mask3(mask2(mask1(mask5(N)))))))
  N=mask4(mask3(mask2(mask1(mask5(N)))));
end




[u,O]=separation(G);
%imshow(O)


[h,l]=size(N);
for i=1:h
    for j=1:l
        if N(i,j)==1
            x=i;
            y=j;
            
            while x<h && N(x+1,j)==1
                x=x+1;
            end
            
            while y<l && N(x,y+1)==1
                y=y+1;
            end
            
            H=imhist(O(i/0.125:x/0.125,j/0.125:y/0.125));
            
            max=0;
            k1=0;
            k2=0;
            
            for n=1:256
                if H(n)>max
                    k1=n;
                    max=H(n);
                end
            end
            
            H(k1)=0;
            max=0;
            
            for n=1:256
                if H(n)>max 
                    k2=n;
                    max=H(n);
                end
            end
            
            threshold=0.15*256;
            if abs(k1-k2) < threshold
                N(i:x,j:y)=0;
            
            
            end
        end
   end
end



imshow(N)





        
            

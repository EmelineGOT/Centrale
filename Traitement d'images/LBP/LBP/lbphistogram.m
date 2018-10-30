function histogram=lbphistogram(I)
    %I=imread(chemin);
    [n,m]=size(I);
    LBP=zeros(n,m);
    for i=1:n
        for j=1:m
            gc=I(i,j);
            for p=0:7
                jp = -1*(p<3) + (p>3 && p<7)+j;
                ip = -1*(p==0 || p>5) + (p>1 && p<5) + i;
                if (ip<1 || ip >n || jp<1 || jp>m)
                    gp = 0;
                else
                    gp = I(ip,jp);
                end
                LBP(i,j)=LBP(i,j) + ((gc - gp)>0)*2^p;
            end
        end
    end
    histogram=imhist(LBP/255);
end
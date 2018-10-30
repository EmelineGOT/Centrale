function [ J ] = LBP_mask( I )
[a,b] = size(I);
J = zeros(a,b);
S = 0;
for i = 2:a-1
    for j = 2:b-1
        L = neighbour(i,j,a,b);
        for k = 1:8
            J(i,j) = J(i,j) + (I(L(k,1),L(k,2)) >= I(i,j))*2^(7-k+1);
        end
    end
end
end


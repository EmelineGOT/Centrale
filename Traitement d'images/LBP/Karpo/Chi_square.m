function [s] = Chi_square( A,B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


n=size(A,1);

s=0;
for i=1:1
    for j=1:256
        if A(i,j)+B(i,j) ~=0
            s=s+((A(i,j)-B(i,j))^2/(A(i,j)+B(i,j)));
        end
    end
end

end


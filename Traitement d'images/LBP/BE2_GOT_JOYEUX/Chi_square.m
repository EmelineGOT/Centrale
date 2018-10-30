function [s] = Chi_square( A,B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

s=0;

for i=1:256
    if A(i)+B(i) ~=0
        s=s+((A(i)-B(i))^2/(A(i)+B(i)));
    end
end

end


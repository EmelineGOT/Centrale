function [ occurence ] = compute_hist(I)
%Compute histogram of I matrix after LBP_mask
J = LBP_mask(I);
occurence = histc(J(:),0:255); % occurence(i) du nombre i 
end


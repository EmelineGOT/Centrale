function [ chi ] = chi_single_hist(Jocc1,Jocc2)
% compute the Chi square distance on two LBP histograms.
l = length(Jocc1);
chi = 0;
for i = 1:l
    if (Jocc1(i)+Jocc2(i)) ~= 0
        chi = chi + (Jocc1(i)-Jocc2(i))^2/(Jocc1(i)+Jocc2(i));
    end
end

end


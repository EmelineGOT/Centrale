function [ chi ] = chi_multiple_hist( Jocc1,Jocc2,n)
% compute the Chi square distance on two matrix of LBP histograms.
%n sert à adapter les wj aux zones d'interet de l'image : les yeux, le nez
%et la bouche.
%% Initialization
[~,m] = size(Jocc1);
w7 = ones(210,1);
w5 = ones(210,1);
w3 = ones(210,1);

%% Pour une image découpée en 7x7
w7(23:27) = 3*ones(5,1);% triple poids pour les yeux
w7(30:34) = 3*ones(5,1); % triple poids pour les yeux
w7(38:40) = 2*ones(3,1); % double poids pour  le nez
w7(45:47) = 2*ones(3,1); % double poids pour  la bouche
w7(52:54) = 2*ones(3,1); % double poids pour  la bouche

%% Pour une image découpée en 5x5
w5(12:14) = 2*ones(3,1);% triple poids pour les yeux
w5(16:20) = 2*ones(5,1); % triple poids pour les yeux
w5(22:24) = 1*ones(3,1); % double poids pour  le nez
w5(45:47) = 1*ones(3,1); % double poids pour  la bouche
w5(27:29) = 1*ones(3,1); % double poids pour  la bouche

%% Pour une image découpée en 3x3
w3(4:9) = 2*ones(6,1);

%% Compute Chi square

chi = 0;
if n == 13
    for j = 1:m
        chi = chi + w7(j)*chi_single_hist(Jocc1(:,j)',Jocc2(:,j)');
    end
elseif n == 18
    for j = 1:m
        chi = chi + w5(j)*chi_single_hist(Jocc1(:,j)',Jocc2(:,j)');
    end
elseif n == 31
    for j = 1:m
        chi = chi + w3(j)*chi_single_hist(Jocc1(:,j)',Jocc2(:,j)');
    end
else
    for j = 1:m
        chi = chi + chi_single_hist(Jocc1(:,j)',Jocc2(:,j)'); 
        % w = 1, on ne coeffisciente pas
    end
end


end


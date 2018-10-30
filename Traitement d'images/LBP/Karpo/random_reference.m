function [L] = random_reference() % renvoie les indices des 4 images qui seront les references
L=[];
while length(L)<4
    L=[L (floor(10*rand())+1)];
    L=unique(L);
end;
end


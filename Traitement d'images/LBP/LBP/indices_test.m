function L=indices_test()
    L=[];
    while size(L,2)<4
        L=[L randi(10)];
        L=unique(L);
    end
end
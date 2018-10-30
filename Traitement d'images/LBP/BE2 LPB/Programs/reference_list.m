function [R,T] = reference_list(H,L)
% R liste des r�f�rences.
% T listes de photos � tester.
[l,m] = size(H(:,:,1));
R = zeros(l,m,40,4);%(i,j,personne,photo n�)
r = 0;
T = zeros(l,m,40,6);%(i,j,personne,photo n�)
t = 0;
p = 1;
for k = 1:400
    if ismember(mod(k,10),L) % si le num fait partie de L
        R(:,:,p,mod(r,4)+1) = H(:,:,k); % on copie dans les images r�f�rences.
        r = r+1;
    else
        T(:,:,p,mod(t,6)+1) = H(:,:,k); % sinon ca fait partie des photos � tester.
        t = t+1;
    end
    if mod(k,10) == 0
        p = p+1;
    end
end

end


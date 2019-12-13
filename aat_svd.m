function [U, V, sigma ] = aat_svd(A)
    % A di rango massimo
    C = A*A';
    r = length(C); % r = min(m,n)
    V = zeros(r-1);
    [U, L] = eig(C);
    [L,p] = sort(diag(L),'descend');
    sigma = sqrt(L);
    U = U(:,p);

    inversa = pinv(A);
    for i=1:r-1
       
        V(:,i) = sigma(i)*inversa*U(:,i);   
        
    end

    sigma = diag(sigma);
end        
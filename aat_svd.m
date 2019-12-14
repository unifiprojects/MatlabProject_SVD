function [U, V, sigma] = aat_svd(A)
    num_colonne_A = size(A,2);
    C = A*A';   
    [U, sigma_quad] = eig(C);
    [sigma_quad,p] = sort(diag(sigma_quad),'descend');
    sigma = sqrt(sigma_quad);

    V = zeros(num_colonne_A);
    U = U(:,p);
    i=1;
    inversa = pinv(A);
    while i <= length(sigma) && sigma(i) ~= 0
        V(:,i) = sigma(i)*inversa*U(:,i); 
        i = i + 1;
    end
    
    % Creazione matrice sigma di dimensioni size(A)
    sigma_temp = zeros(size(A));
    for i = 1:i-1
        sigma_temp(i,i) = sigma(i);
    end
    sigma = sigma_temp;
end        


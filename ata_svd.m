function [U, V, sigma] = ata_svd(A)
    num_righe_A = size(A,1);
    C = A'*A;   
    [V, sigma_quad] = eig(C);
    [sigma_quad,p] = sort(diag(sigma_quad),'descend');
    sigma = sqrt(sigma_quad);

    U = zeros(num_righe_A);
    V = V(:,p);
    i=1;
    while i <= length(sigma) && sigma(i) ~= 0
        U(:,i) = (1/sigma(i))*A*(V(:,i));
        i = i + 1;
    end
    
    % Creazione matrice sigma di dimensioni size(A)
    sigma_temp = zeros(size(A));
    for i = 1:i-1
        sigma_temp(i,i) = sigma(i);
    end
    sigma = sigma_temp;
end        
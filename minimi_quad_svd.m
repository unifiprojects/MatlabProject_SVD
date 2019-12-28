function x = minimi_quad_svd(A, b)
    [U, S, V] = svd(A);
    % calcola rango della matrice
    i = 1;
    sigma = diag(S);
    while length(sigma) >= i && sigma(i) ~= 0
        i = i + 1;
    end
    rank = i - 1;
    %calcolo vettore soluzione di norma minima
    x = zeros(size(A,2),1);
    U_reduced = U(:, 1:rank);
    V_reduced = V(:, 1:rank);
    for i = 1:rank
        x = x + (U_reduced(:,i)'*b/sigma(i))*V_reduced(:,i);
    end
end
function [U, sigma, V] = aat_svd(A)
    % si costruisce la SVD di AtA usando direttamente gli autovalori ed
    % autovettori (calcolati per comodita' attraverso eig() )
    num_colonne_A = size(A,2);
    C = A*A';   
    [U, sigma_quad] = eig(C);
    [sigma_quad,p] = sort(diag(sigma_quad),'descend');
    sigma = sqrt(sigma_quad);

    V = zeros(num_colonne_A);
    U = U(:,p); %riordino le colonne di U, ovvero gli autovettori
    i=1;
    inversa = pinv(A);
    while i <= length(sigma) && sigma(i) ~= 0
        % avendo sigma e la matrice U, possiamo ottenere i vettori colonna
        % di V attraverso la relazione che sussiste A*vi = Sigma*ui, in
        % particolare utilizziamo la pseudoinversa di A calcolata con
        % pinv()
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


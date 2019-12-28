clc
clear
A = [1 1 1 1 
     8 4 2 1
     27 9 3 1
     64 16 4 1
     8 4 2 1
     -1 0 0 0];

[U, S, V] = ata_svd(A);
% calcolo il rango
% calcola rango della matrice
i = 1;
sigma = diag(S);
while length(sigma) >= i && sigma(i) ~= 0
    i = i + 1;
end
rank = i - 1;

% notare che per k = rank (nel ciclo qui escluso) la matrice Ak risulta
% uguale ad A originaria
for k = 1:rank-1
    Ak = zeros(size(A));
    for i = 1:k
        Ak = Ak + sigma(i)*U(:,i)*V(:,i)';
    end
    message = sprintf('------------------------\nMatrice A%d ovvero k = %d', k, k);
    disp(message)
    Ak
end


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

% -------------------- test con l'immagine -----------------------------------
figure;
pause(0.00001);
frame_h = get(handle(gcf),'JavaFrame');
set(frame_h,'Maximized',1);
mat = zeros(15,40);
mat(2:9, 2:3)=ones(8,2);
mat(5:6, 4:5)=ones(2);
mat(2:9, 6:7)=ones(8,2);
mat(3:10, 10:11)=ones(8,2);
mat([3:4, 6:7, 9:10], 12:15)=ones(6,4);
mat(4:11, 18:19)=ones(8,2);
mat(10:11, 20:23)=ones(2,4);
mat(5:12, 26:27)=ones(8,2);
mat(11:12, 28:31)=ones(2,4);
mat(6:13, [34:35, 38:39])=ones(8,4);
mat([6,7,12,13], 36:37)=ones(4,2);

[U, S, V] = ata_svd(mat);
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
    Ak = zeros(size(mat));
    for i = 1:k
        Ak = Ak + sigma(i)*U(:,i)*V(:,i)';
    end
    subplot(ceil(sqrt(rank)), ceil(sqrt(rank)), k)
    imshow(Ak, 'ciao')
end

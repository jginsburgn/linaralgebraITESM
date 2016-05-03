% Cargar los vectores con los pixeles
load('faces.mat');
figure(1);
mostrarCaras(X(4011:4050, :), 5, 8);

[P, V, eigenvalues] = pca(X, 100); % Hacer PCA
figure(2);
mostrarCaras(V(:, 1:40)', 5, 8);

R = P * V(:, 1:100)';
figure(3);
mostrarCaras(R(4011:4050, :), 5, 8);

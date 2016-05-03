% Cargar datos
Data = csvread('cancer.csv');
Y = Data(:,10) / 2;
X = Data(:,1:9);

% Centrar los datos para que la media sea 0
X = bsxfun(@minus, X, mean(X));
% X = bsxfun(@rdivide, X, std(X));

% Obtener la matriz de covarianza (S)
[m,n] = size(X);
S = (X' * X) / m;

% Obtener los eigenvectores de S y ordenarlos descendentemente
[V1, D] = eig(S);
[eigenvalues, indices] = sort(sum(D), 'descend');
V = V1(:, indices);

% Proyectar al espacio generado por los primeros k eigenvectores
K = 2;
P = X * V(:, 1:K);

% Graficar
palette = [1 0 0; 0 0 0];
C = palette(Y, :);
scatter(P(:,1), P(:,2), 6, C);

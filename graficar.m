% Nivel de vida por estado
X = csvread('estados.csv'); % Cargar datos
[P, V1, eigenvalues1] = pca(X, 2); % Hacer PCA

figure(1);
scatter(P(:,1), P(:,2)); % Graficar
title("Nivel de vida por estado de México");
labels = cellstr(num2str([1:32]'));
text(P(:,1) + 0.05, P(:,2) + 0.05, labels); % Colocar etiquetas a los puntos

% Cáncer de mama
X = csvread('cancer.csv');
Y = X(:,10) / 2; % Tumor benigno o maligno
X = X(:,1:9);

[P, V2, eigenvalues2] = pca(X, 2); % Hacer PCA

% Graficar
palette = [1 0 0; 0 0 0]; % Benigno = rojo, maligno = negro
C = palette(Y, :);
figure(2);
scatter(P(:,1), P(:,2), 6, C); % Graficar con colores
title("Cáncer de mama en Wisconsin");

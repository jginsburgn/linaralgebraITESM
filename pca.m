function [P, V, eigenvalues] = pca(X, K)
	% Normalizar datos
	X = bsxfun(@minus, X, mean(X));
	X = bsxfun(@rdivide, X, std(X));

	% Obtener la matriz de covarianza (S)
	[m,n] = size(X);
	S = (X' * X) / m;

	% Obtener los eigenvectores de S y ordenarlos descendentemente
	[V, D] = eig(S);
	[eigenvalues, indices] = sort(sum(D), 'descend');
	V = V(:, indices);

	% Proyectar al espacio generado por los primeros k eigenvectores
	P = X * V(:, 1:K);
end

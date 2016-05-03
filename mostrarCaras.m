function M = mostrarCaras(X, filas, columnas)
	colormap(gray); % Imagen en escala de grises
	tam = 32; % Imagenes de 32 x 32
	pad = 1;

	M = zeros(filas * (tam + pad) + pad, columnas * (tam + pad) + pad); % Matriz para colocar pixeles
	nCara = 1;
	for i = 1:filas
		for j = 1:columnas
			maximo = max(X(nCara, :)); % Dividir entre el máximo para tener el rango [-1, 1]
			M((i - 1) * (tam + pad) + (1:tam) + pad, (j - 1) * (tam + pad) + (1:tam) + pad) = reshape(X(nCara, :), tam, tam) / maximo; % Pasar de vectores a matrices de 32x32 y colocarlas en M
			nCara += 1;
		end
	end

	imagesc(M, [-1, 1]); % Mostrar la imagen con los colores dentro del rango [-1, 1]
	axis image off % No mostrar los ejes
end

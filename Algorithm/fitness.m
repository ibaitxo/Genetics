function [diagonales] = fitness(p)
    n = length(p);
    i = 1;
    %Inicializamos el contador de diagonales
    diagonales = 0;
    %Recorrido por el vector del cromosoma
    for i=1:n-1
        for j=i+1:n
            %Si se cumple la funcion fitness, aumentamos las diagonales
            if abs(i-j) == abs(p(i)-p(j))
                diagonales = diagonales + 1;
            end
        end
    end
end


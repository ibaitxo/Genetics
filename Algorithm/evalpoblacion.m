function [flag,fitness_indiv,index_solucion] = evalpoblacion(poblacion)
    %Recogemos los tamaños fila y columna de poblacion
    [pob, tablero] = size(poblacion);
    fitness_indiv = zeros(1,pob);
    index_solucion = 0;
    %Flag para salir del bucle
    flag = 0;
    for i=1:pob
        %Calculamos los fitness de la poblacion
        fitness_indiv(i) = fitness(poblacion(i,:));
        %Si el fitness es 0 tenemos solucion
        if(fitness_indiv(i) == 0)
            flag = 1;
            index_solucion = i;
            break;
        end
    end
end


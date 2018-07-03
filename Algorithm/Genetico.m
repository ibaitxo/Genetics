function [solucion,sol_cercana,generacion] = Genetico(poblacion,MAX_GEN,prob_mutar,seleccion,cruzamiento,mutacion)

generacion = 1;
sol_cercana = 0;

%%%% EVALUAMOS LA APTITUD DE CADA CROMOSOMA DE LA POBLACION %%%%
[flag,fitness_indiv,index_solucion] = evalpoblacion(poblacion);

fprintf("Procesando...\n");
%Como condiciones de parada tenemos:
    %Maximo de generaciones
    %Flag para indicar que se ha encontrado solucion
    while  flag == 0 && generacion < MAX_GEN

        %%%% APLICAMOS EL ALGORITMO DE SELECCION
        switch seleccion
            case char('torneo')
                index1 = seleccion_torneo(fitness_indiv);
                index2 = seleccion_torneo(fitness_indiv);z    
            case char('ruleta')
                index1 = seleccion_ruleta(fitness_indiv);
                index2 = seleccion_ruleta(fitness_indiv);    
        end
        %Escogemos los dos padres
        p1 = poblacion(index1,:);
        p2 = poblacion(index2,:);

        %%%% APLICAMOS EL ALGORITMO DE CRUZAMIENTO
        %Obtenemos dos hijos
        switch cruzamiento
            case char('mapeado')
                [h1,h2] = cruzamiento_mapeado(p1,p2);
            case char('ciclos')
                [h1,h2] = cruzamiento_mapeado(p1,p2);
            case char('orden')
                [h1,h2] = cruzamiento_orden(p1,p2);
        end
        %Los hijos pasan a formar parte en la poblacion, en lugar de sus padres
        poblacion(index1,:) = h1;
        poblacion(index2,:) = h2;

        %%%% APLICAMOS ALGORITMO DE MUTACION SI HAY PROBABILIDAD DE MUTAR
        [pob, ~] = size(poblacion);
        for i=1:pob
            %probabilidad de mutar
            random_mutar = rand(1);
            if random_mutar < prob_mutar
                %Aplicamos la mutacion
                switch mutacion
                    case char('sacudida')
                        poblacion(i,:) = mutacion_sacudida(poblacion(i,:));
                    case char('insercion')
                        poblacion(i,:) = mutacion_insercion(poblacion(i,:));
                    case char('inversion')
                        poblacion(i,:) = mutacion_inversion(poblacion(i,:));
                    case char('intercambio')
                        poblacion(i,:) = mutacion_intercambio(poblacion(i,:));
                end
            end
        end

        %%%% EVALUAMOS LA APTITUD DE CADA CROMOSOMA DE LA POBLACION %%%%
        [flag,fitness_indiv,index_solucion] = evalpoblacion(poblacion);

        % AVANCE DE POBLACION SI NO SE HA LLEGADO A SOLUCION
        generacion = generacion + 1;
    end
    if index_solucion ~= 0
        solucion = poblacion(index_solucion,:);
    else
        [~,sol_cercana] = min(fitness_indiv);
        solucion = 0;
    end
end



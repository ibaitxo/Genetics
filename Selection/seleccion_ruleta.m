function [index] = seleccion_ruleta(fitness_indiv)
    n = length(fitness_indiv);
    %Calculamos las probabilidades de cada fitness
    probabilidades = zeros(1,n);
    for i=1:n
        probabilidades(i) = fitness_indiv(i)/sum(fitness_indiv);
    end
    
    %Sacamos el valor y el indice al ordenarlos
    [valor, indices] = sort(probabilidades);
    %Escogemos un valor de probabilidad aleatorio entre la suma de las 
    %probabilidades por tanto de 0 a 1
    prob = rand(1);
    i = 1;
    %Inicializacion de la suma de probabilidades
    sum_prob = valor(1);
    while prob > sum_prob
        sum_prob = sum_prob + prob(i);
        i = i + 1;
    end
    index = indices(i);
end


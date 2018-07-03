function [index] = seleccion_torneo(fitness_indiv)
    n = length(fitness_indiv);
    % Cantidad aleatoria de participantes
    k = randi(length(fitness_indiv));
    elegidos  = zeros(2,k);
    %Elegimos a los k participantes aleatorios
    rand_index = randperm(n,k);
   
   for i=1:k
       elegidos(1,i) = fitness_indiv(rand_index(i));
       elegidos(2,i) = rand_index(i);
   end
   [~,ind] = min(elegidos(1,:));
   index = elegidos(2,ind);
end

function [elemento] = mutacion_intercambio(elemento)
    %Coger dos puntos random de 1 a size(elemento)
    pto1 = randi(length(elemento));
    pto2 = randi(length(elemento));
    
    %En esta mutacion no es necesario ordenar los puntos
    
    %Hacemos el intercambio de elementos
    aux = elemento(pto1);
    elemento(pto1) = elemento(pto2);
    elemento(pto2) = aux; 
end


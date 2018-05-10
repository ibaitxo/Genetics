function [elemento,pto1,pto2] = mutacion_insercion(elemento)

    %Coger dos puntos random de 1 a size(elemento)
    pto1 = randi(length(elemento));
    pto2 = randi(length(elemento));
    
    %Ordeno los puntos para operar mas facil
    ptos = sort([pto1 pto2]);
    pto1 = ptos(1);
    pto2 = ptos(2);
    
    %Bucle entre el segmento para realziar los intercambios
    for i=pto1+1:pto2-1
        aux = elemento(i);
        elemento(i) = elemento(pto2);
        elemento(pto2) = aux;
    end

end


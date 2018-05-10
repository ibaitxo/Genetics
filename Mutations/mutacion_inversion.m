function [elemento,pto1,pto2,segmento,invert] = mutacion_inversion(elemento)

    %Coger dos puntos random de 1 a size(elemento)
    pto1 = randi(length(elemento));
    pto2 = randi(length(elemento));
    
    %Ordeno los puntos para operar mas facil
    ptos = sort([pto1 pto2]);
    pto1 = ptos(1);
    pto2 = ptos(2);
    
    %Realizamos la inversion de los elementos localizados en el segmento
    elemento(pto1:pto2) = elemento(pto2:-1:pto1);
end


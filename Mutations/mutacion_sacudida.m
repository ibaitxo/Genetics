function [elemento] = mutacion_sacudida(elemento)
    %Coger dos puntos random de 1 a size(elemento)
    pto1 = randi(length(elemento));
    pto2 = randi(length(elemento));
    
    %Ordeno los puntos para operar mas facil
    ptos = sort([pto1 pto2]);
    pto1 = ptos(1);
    pto2 = ptos(2);
    
    %Sacamos el segmento a revolver
    segmento = elemento(pto1:pto2);
    segmento_new =  segmento(randperm(length(segmento)));
    elemento(pto1:pto2) = segmento_new;
end


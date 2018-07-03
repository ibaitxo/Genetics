function [h1,h2] = cruzamiento_mapeado(p1,p2)
    %Inicializamos los hijos
    h1 = zeros(size(p1));
    h2 = zeros(size(p2));

    %Coger dos puntos random de 1 a size(p)
    pto1 = 4;%randi(length(p1));
    pto2 = 7;%randi(length(p1));
    
    %Ordenamos los puntos aleatorios por si tenemos que pto1 > pto2
    aux = sort([pto1,pto2]);
    pto1 = aux(1);
    pto2 = aux(2);
    
    %Creamos los hijos
    h1 = p2;
    h2 = p1;
    
    %Copiamos en los hijos el segmento correspondiente de su padre,
    %obtenido mediante los puntos random
    h1(pto1:pto2) = p1(pto1:pto2);
    h2(pto1:pto2) = p2(pto1:pto2);
    
    %Recojo en dos variables diferentes el segmento, ya que debemos
    %recorrer
    seg1 = p1(pto1:pto2);
    seg2 = p2(pto1:pto2);
    % Sigo mientras haya elementos repetidos dentro del hijo1
    while(length(h1) ~= length(unique(h1)))
        %Recorremos el segmento
        for i = 1:length(pto1:pto2)
            %Recogemos el indice del valor que es igual al valor de la posicion 
            % i del segmento 1
            index = find(h1([1:pto1-1, pto2+1:end]) == seg1(i));
            %Si tenemos un valor index
            if (index)
                %Introducimos en h1 en la posicion index el valor de seg2(i)
                h = h1([1:pto1-1, pto2+1:end]);
                h(index) = seg2(i);
                h1([1:pto1-1, pto2+1:end]) = h;
            end
        end
    end
    
    % Sigo mientras haya elementos repetidos dentro del hijo2
    while(length(h2) ~= length(unique(h2)))
        %Recorremos el segmento
        for i = 1:length(pto1:pto2)
            %Recogemos el indice del valor que sea igual al valor de la posicion 
            % i del segmento 2
            index = find(h2([1:pto1-1, pto2+1:end]) == seg2(i));
            if (index)
                h = h2([1:pto1-1, pto2+1:end]);
                h(index) = seg1(i);
                h2([1:pto1-1, pto2+1:end]) = h;
            end
        end
    end        
end


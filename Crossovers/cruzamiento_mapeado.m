function [h1,h2] = cruzamiento_mapeado(p1,p2)
    %Inicializamos los hijos
    h1 = zeros(size(p1));
    h2 = zeros(size(p2));

    %Coger dos puntos random de 1 a size(p)
    pto1 = randi(length(p1));
    pto2 = randi(length(p1));
    
    %Ordenamos los puntos aleatorios por si tenemos que pto1 > pto2
    aux = sort([pto1,pto2]);
    pto1 = aux(1);
    pto2 = aux(2);
    
    %Copiamos en ambos hijos,las subcadenas obtenidas del segmento dado en
    %p1 y p2 por los puntos aleatorios.
    h1(pto1:pto2) = p1(pto1:pto2);
    h2(pto1:pto2) = p2(pto1:pto2);
    
    %Bucle para operar sobre el hijo1 recorriendo el segmento
    for i=pto1:pto2
        %Buscamos el indice del elemento de p1(i) en p2
        index = find(p1(i) == p2);
        %Guardamos el valor de p2(i)
        valor = p2(i);
        %Si el elemento no se encuentra en h1 y h1 esta vacio en x posicion
        %entonces metemos el valor en h1
        if ~any(p2(i) == h1) & (h1(index) == 0)
            h1(index) = valor;
        %En caso de que no suceda lo anterior
        else
            %Recorremos desde la posicion i hasta el final del segmento
            for j=i:pto2
                %Se comprueba si el elemento en p1(j) no esta en el
                %segmento, si se cumple:
                if ~any(p1(j) == p2(pto1:pto2))
                   %Recogemos el indice del elemento p1(j) en p2 y se
                   %guarda en k
                   k = find(p1(j) == p2);
                   %Si la h1(k) es igual a 0 (Esta vacío) metemos el
                   %elemento valor(p2(i))
                   if(h1(k) == 0)
                       h1(k) = valor;
                   end
                end
            end
        end
    end
    %Cogemos los indices de las posiciones de h1 que estan vacias
    restantes = find(h1 == 0);
    for i=1:length(restantes)
        %Rellenamos el h1 con los elementos de p2 restantes
        h1(restantes(i)) = p2(restantes(i));
    end
    
    %%Bucle para operar sobre el hijo2 recorriendo el segmento
    for i=pto1:pto2
        %Buscamos el indice del elemento de p2(i) en p1
        index = find(p2(i) == p1);
        %Guardamos el valor de p1(i)
        valor = p1(i);
        %Si el elemento no se encuentra en h2 y h2 esta vacio en x posicion
        %entonces metemos el valor en h2
        if ~any(p1(i) == h2) & (h2(index) == 0)
            h2(index) = valor;
        %En caso de que no suceda lo anterior
        else
            %Recorremos desde la posicion i hasta el final del segmento
            for j=i:pto2
                %Se comprueba si el elemento en p2(j) no esta en el
                %segmento, si se cumple:
                if ~any(p2(j) == p1(pto1:pto2))
                    %Recogemos el indice del elemento p2(j) en p1 y se
                   %guarda en k
                   k = find(p2(j) == p1);
                   %Si la h2(k) es igual a 0 (Esta vacío) metemos el
                   %elemento valor(p1(i))
                   if(h2(k) == 0)
                       h2(k) = valor;
                   end
                end
            end
        end
    end
    %Cogemos los indices de las posiciones de h2 que estan vacias
    restantes = find(h2 == 0);
    for i=1:length(restantes)
        %Rellenamos el h2 con los elementos de p1 restantes
        h2(restantes(i)) = p1(restantes(i));
    end
end


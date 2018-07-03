function [h1,h2] = cruzamiento_orden(p1,p2)

    %Inicializamos los hijos
    h1 = zeros(size(p1));
    h2 = zeros(size(p2));

    %Coger dos puntos random de 1 a size(p)
    pto1 = 4;%randi(length(p1));
    pto2 = 7;%randi(length(p1));
    
    %Ordenamos los puntos aleatorios por si pto1 > pto2
    aux = sort([pto1,pto2]);
    pto1 = aux(1);
    pto2 = aux(2);
    
    %Copiamos en ambos hijos,las subcadenas obtenidas del segmento dado en
    %p1 y p2 por los puntos aleatorios.
    h1(pto1:pto2) = p1(pto1:pto2);
    h2(pto1:pto2) = p2(pto1:pto2);
    
    %Bloque correspondiente para calculos del hijo1
    %Iniciamos variables
    j=1;
    i=pto2+1; 
    restantes = [];
    check = 1;
    %Bucle para recorrer todos los elementos
    while check == 1
        %En caso que lleguemos al final,volvemos a la primera posicion
        if i > length(p1)
            i = 1;
        end
        %Si el elemento p2(i) no se encuentra en el h1 lo metemos al vector
        %de elementos restantes
        if ~any(h1 == p2(i))
            restantes(j) = p2(i);
            j = j + 1;
        end
        i = i + 1;
        %En caso que i sea = pto2+1 hemos llegado al final, cambia el flag
        %para salir del bucle
        if i == pto2+1
            check = 0;
        end
    end
    %Acabamos de rellenar el h1 con el vector de restantes
    %Primero se meten desde pto2+1 hasta el final, con la misma cantidad de
    %elementos que encabecen el vector de restantes
    h1(pto2+1:length(p2)) = restantes(1:length(p2)-pto2);
    %Para finalizar los restantes elementos,se introducen en el hijo
    %comenzando desde el principio hasta llegar al pto1 no inclusive.
    h1(1:pto1-1) = restantes(length(p2)-pto2+1:end);
    
    %Bloque correspondiente para calculos del hijo2
    %Iniciamos variables
    j=1;
    i=pto2+1;
    check = 1;
    restantes = [];
    %Bucle para recorrer todos los elementos
    while check == 1
         %En caso que lleguemos al final,volvemos a la primera posicion
        if i > length(p2)
            i = 1;
        end
        %Si el elemento p1(i) no se encuentra en el h2 lo metemos al vector
        %de elementos restantes
        if ~any(h2 == p1(i))
            restantes(j) = p1(i);
            j = j + 1;
        end
        i = i + 1;
        %En caso que i sea = pto2+1 hemos llegado al final, cambia el flag
        %para salir del bucle
        if i == pto2+1
            check = 0;
        end
    end
    %Acabamos de rellenar el h2 con el vector de restantes
    %Primero se meten desde pto2+1 hasta el final, con la misma cantidad de
    %elementos que encabecen el vector de restantes
    h2(pto2+1:length(p1)) = restantes(1:length(p1)-pto2);
    %Para finalizar los restantes elementos,se introducen en el hijo
    %comenzando desde el principio hasta llegar al pto1 no inclusive.
    h2(1:pto1-1) = restantes(length(p1)-pto2+1:end);
end



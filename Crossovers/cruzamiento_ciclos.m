%Funcion de cruzamiento por ciclos
%Parametros de entrada: Padre1 y Padre2
%Salida: Hijo1 e Hijo2
function [h1,h2] = cruzamiento_ciclos(p1,p2)
    %Iniciamos a cero los vectores h1 y h2
    h1 = zeros(size(p1));
    h2 = zeros(size(p2));
    
    %Inicializacion de variables
    i = 1;
    index = 0;
    j = 1;
    %Bucle general, mientras existe un 0 en un hijo calcular ciclos
    while find(h1 == 0)
        %Bucle para ciclo, mientras index sea distinto a indice de inicio
        %cuando sea igual, sabemos que acaba un ciclo
        while index ~= i
            %Cogemos el valor en p2(j)
            aux = p2(j);
            
            %Se guardan en los hijos los valores correspondientes a la
            %posicion j en p1 y p2
            h1(j) = p1(j);
            h2(j) = p2(j);
            
            %Cogemos el indice del valor buscado en p1
            index = find(p1 == aux);
            
            %Se avanza la j con dicho indice
            j = index;
        end
        %Encontramos el primer cero que exista en h1
        [~,i] = min(h1);
        %Se le pasa a j el valor de i que indica el primer cero del h1 y
        %que nos dira donde comenzar el siguiente ciclo
        j = i;
        %Se intercambian los padres ya que el ciclo se repite con el otro
        %padre
        aux_p = p1;
        p1 = p2;
        p2 = aux_p;
    end
end


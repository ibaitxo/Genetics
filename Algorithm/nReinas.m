%Borrado de pantalla y variables
clear;
clc;

%%%% DEFINIMOS LOS PARAMETROS PRINCIPALES %%%%

%Definir el tamaño de tablero
n_tab = 1;
while n_tab <= 5
    n_tab = input('Introduzca el tamaño del tablero (n > 5)\n');
end
n_pob = input('Introduzca el tamaño de la poblacion: \n');

%Generar aleatoriamente una poblacion de n_pob cromosomas
poblacion = zeros(n_pob,n_tab);
for i=1:n_pob
    poblacion(i,:) = randperm(n_tab);
end

% Inicializacion de variables
generacion = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Configuracion del programa %
generacion_inicial = generacion;
fprintf("## NOMBRES EN MINUSCULAS ##\n");
fprintf("Metodos de seleccion: ruleta -  torneo\n");
seleccion = input('Introduzca seleccion: ','s');
fprintf("Metodos de cruzamiento: orden - mapeado - ciclos\n")
cruzamiento = input('Introduzca cruzamiento: ','s');
fprintf("Metodos de mutacion: inversion - sacudida - intercambio - insercion\n")
mutacion = input('Introduzca mutacion: ','s');
prob_mutar = input('Introduzca una probabilidad de mutar: ');
MAX_GEN = input('Introduzca un maximo de generaciones: ');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Comienzo del programa
tic;
[solucion,sol_cercana,generacion] = Genetico(poblacion,MAX_GEN,prob_mutar,seleccion,cruzamiento,mutacion);
toc;
% Final del programa 

%%%% BLOQUE DE RESULTADOS %%%%
%Informe de metodos
fprintf("Metodo seleccion: %s\n",seleccion);
fprintf("Metodo cruzamiento: %s\n",cruzamiento);
fprintf("Metodo mutacion: %s\n",mutacion);

%En caso de solucion encontrada
if solucion == 0
    fprintf("No se ha encontrado solucion\n");
    fprintf("La solución mas cercana es: ");
    disp(poblacion(sol_cercana,:));
    fprintf("Con un fitness de: %d\n",fitness(poblacion(sol_cercana,:)));
    fprintf("Iteraciones: %d\n",generacion);
    fprintf("Tiempo: ");
    
%En caso de no encontrar solucion
else
    fprintf("Solucion encontrada: \n");
    disp(solucion);
    fprintf("Iteraciones: %d\n",generacion);
    fprintf("Tiempo: ");
end


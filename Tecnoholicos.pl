% Asistentes a la reunión de tecnohólicos anónimos con sus resultados previos en el test
:- dynamic	asistente/2.
asistente(claudia,1).
asistente(juan,8).
asistente(ana,12).
asistente(pedro,13).

% Limpia la consola
limpiar :- write('\033[2J').

% Muestra por pantalla la puntuación de un asistente
puntuacion(Nombre,Resultado):-asistente(Nombre,Puntos),Resultado is Puntos.

% Lista de asistentes a la reunión
listar:-findall(Nom,asistente(Nom,_),Listado), presentar(Listado).

% Presentación de los asistentes a la reunión
presentar([]):-!.
presentar([H|Lista]):-format('~w~n',H),presentar(Lista).

% Dado un nombre y 3 respuestas identifica al asistente con la puntuación calculada
calcular(Nombre,A,B,C,D,E):- assert(asistente(Nombre,(A+B+C+D+E))).

% Comprueba la respuesta para salir o continuar en el bucle principal
comprobar(Opcion):-Opcion==2,format('Hasta pronto.~n'),fail;Opcion==1.

% Comprueba la respuesta para formar parte o no de la asociación
formarParte(Opcion, Nombre):-Opcion==2,retract(asistente(Nombre,_));Opcion==1.

% Imprime el resultado del test según la puntuación obtenida
imprimirResultado(Puntuacion):-(Puntuacion>=10)->format('El excesivo uso que le das a la tecnologia te esta causando problemas importantes.~nEs importante que tomes medidas para tratar de solucionar tu adiccion.~n');
(Puntuacion>=7)->format('Trata de reflexionar sobre el uso que le estas dando a la tecnologia.~nSeria conveniente controlar el tiempo que pasas utilizando estos dispositivos para evitar volverte dependiente.~n');
format('Enhorabuena. Estas haciendo un uso responsable a la tecnologia, te animamos a que no bajes la guardia.~n').


%Inicio de la reunión de tecnohólicos anónimos
bienvenida:-
limpiar,
format('Bienvenido/a a la reunion de tecnoholicos anonimos, nosotros somos:~n'),
listar,
format('Antes de nada por favor, dinos como te llamas (en minusculas):~n'),
read(Nombre_usuario),
limpiar,
format('Hola ~w, nos gustaria que respondieras a unas preguntas para poder ayudarte.~n',Nombre_usuario),
format('Con que frecuencia revisas tus aplicaciones de mensajeria, tu correo electronico y tus redes sociales cada dia?.~n'),
format('1. Raramente~n'),
format('2. En ocasiones~n'),
format('3. Continuamente~n'),
read(Resp1),
limpiar,
format('Dedicas mas horas del dia a chatear con la gente que a hablar en persona?.~n'),
format('1. Raramente~n'),
format('2. En ocasiones~n'),
format('3. Continuamente~n'),
read(Resp2),
limpiar,
format('Te ves incapaz de controlar el numero de horas que dedicas a videojuegos o redes sociales?.~n'),
format('1. Raramente~n'),
format('2. En ocasiones~n'),
format('3. Continuamente~n'),
read(Resp3),
limpiar,
format('Has escapado de alguna reunion social porque tu smartphone se haya quedado sin bateria?.~n'),
format('1. Raramente~n'),
format('2. En ocasiones~n'),
format('3. Continuamente~n'),
read(Resp4),
limpiar,
format('Sueles procrastinar en tu trabajo o estudios, navegando en Internet sin objetivo aparente?.~n'),
format('1. Raramente~n'),
format('2. En ocasiones~n'),
format('3. Continuamente~n'),
read(Resp5),
limpiar,
calcular(Nombre_usuario,Resp1,Resp2,Resp3,Resp4,Resp5),
puntuacion(Nombre_usuario,Total),
format('Tu puntuacion obtenida es de ~w puntos.~n',[Total]),
imprimirResultado(Total),
format('Ha sido un placer ayudarte, te gustaria formar parte de tecnoholicos anonimos?.~n'),
format('1. Si~n'),
format('2. No~n'),
read(Resp6),
formarParte(Resp6,Nombre_usuario),
limpiar,
format('Deseas presentarnos a algun conocido?~n'),
format('1. Si~n'),
format('2. No~n'),
read(Resp7),
comprobar(Resp7),
bienvenida.



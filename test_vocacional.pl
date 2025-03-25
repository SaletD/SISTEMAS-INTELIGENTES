:- dynamic respuesta/2.
:- dynamic puntaje/2.

% Carreras
carrera(ingenieria_sistemas).
carrera(medicina).
carrera(derecho).
carrera(arquitectura).
carrera(psicologia).
carrera(administracion_empresas).
carrera(ingenieria_civil).
carrera(ingenieria_industrial).
carrera(economia).
carrera(contabilidad).
carrera(diseño_grafico).
carrera(marketing).
carrera(biologia).
carrera(fisica).
carrera(quimica).
carrera(educacion).
carrera(turismo).
carrera(relaciones_internacionales).

requisito(ingenieria_sistemas, habilidad(matematicas)).
requisito(ingenieria_sistemas, interes(tecnologia)).
requisito(ingenieria_sistemas, personalidad(analitico)).

requisito(medicina, interes(salud)).
requisito(medicina, habilidad(biologia)).
requisito(medicina, personalidad(empatico)).

requisito(derecho, habilidad(argumentacion)).
requisito(derecho, interes(derecho)).
requisito(derecho, personalidad(pensamiento_critico)).

requisito(arquitectura, habilidad(creatividad)).
requisito(arquitectura, interes(diseño)).
requisito(arquitectura, personalidad(organizado)).

requisito(psicologia, interes(salud)).
requisito(psicologia, habilidad(empatizar)).
requisito(psicologia, personalidad(empatico)).

requisito(administracion_empresas, habilidad(liderazgo)).
requisito(administracion_empresas, interes(negocios)).
requisito(administracion_empresas, personalidad(organizativo)).

requisito(ingenieria_civil, habilidad(matematicas)).
requisito(ingenieria_civil, interes(construccion)).
requisito(ingenieria_civil, personalidad(detallista)).

requisito(ingenieria_industrial, habilidad(matematicas)).
requisito(ingenieria_industrial, interes(industria)).
requisito(ingenieria_industrial, personalidad(analitico)).

requisito(economia, habilidad(analisis)).
requisito(economia, interes(negocios)).
requisito(economia, personalidad(organizado)).

requisito(contabilidad, habilidad(matematicas)).
requisito(contabilidad, interes(finanzas)).
requisito(contabilidad, personalidad(detallista)).

requisito(diseño_grafico, habilidad(creatividad)).
requisito(diseño_grafico, interes(diseño)).
requisito(diseño_grafico, personalidad(organizado)).

requisito(marketing, habilidad(liderazgo)).
requisito(marketing, interes(publicidad)).
requisito(marketing, personalidad(extrovertido)).

requisito(biologia, habilidad(biologia)).
requisito(biologia, interes(salud)).
requisito(biologia, personalidad(paciente)).

requisito(fisica, habilidad(matematicas)).
requisito(fisica, interes(ciencia)).
requisito(fisica, personalidad(analitico)).

requisito(quimica, habilidad(matematicas)).
requisito(quimica, interes(ciencia)).
requisito(quimica, personalidad(preciso)).

requisito(educacion, habilidad(empatizar)).
requisito(educacion, interes(educacion)).
requisito(educacion, personalidad(paciente)).

requisito(turismo, habilidad(comunicacion)).
requisito(turismo, interes(viajes)).
requisito(turismo, personalidad(extrovertido)).

requisito(relaciones_internacionales, habilidad(negociacion)).
requisito(relaciones_internacionales, interes(relaciones_exteriores)).
requisito(relaciones_internacionales, personalidad(extrovertido)).

interactuar :-
    preguntar('¿Te gustan las matemáticas?'),
    preguntar('¿Te interesa la tecnología?'),
    preguntar('¿Te interesa el área de salud?'),
    preguntar('¿Te interesa el diseño y la creatividad?'),
    preguntar('¿Te interesa el análisis de negocios?'),
    preguntar('¿Te sientes cómodo trabajando en equipo?'),
    preguntar('¿Te interesa la construcción y la ingeniería civil?'),
    preguntar('¿Te interesa la investigación científica?'),
    preguntar('¿Te interesa la publicidad?'),
    preguntar('¿Te interesan las finanzas y las contabilidades?'),
    preguntar('¿Te interesa la enseñanza?'),
    preguntar('¿Te interesan las relaciones internacionales y la diplomacia?'),
    preguntar('¿Te consideras una persona creativa?'),
    preguntar('¿Te consideras una persona organizada?'),
    preguntar('¿Te consideras una persona analítica?'),
    preguntar('¿Te consideras una persona extrovertida?'),
    preguntar('¿Te consideras una persona empática?'),
    preguntar('¿Te consideras una persona paciente?'),
    preguntar('¿Te consideras una persona líder?'),
    preguntar('¿Te consideras una persona detallista?'),
    preguntar('¿Te consideras una persona independiente?').

sumar_puntaje(Carrera) :-
    puntaje(Carrera, Puntaje),
    NewPuntaje is Puntaje + 1,
    retract(puntaje(Carrera, Puntaje)),
    asserta(puntaje(Carrera, NewPuntaje)).

sumar_puntaje(Carrera) :-
    \+ puntaje(Carrera, _),
    asserta(puntaje(Carrera, 1)).

cumple_requisito(habilidad(Habilidad)) :-
    (respuesta('¿Te gustan las matemáticas?', si), Habilidad = matematicas;
     respuesta('¿Te consideras una persona creativa?', si), Habilidad = creatividad;
     respuesta('¿Te consideras una persona empática?', si), Habilidad = empatizar;
     respuesta('¿Te consideras una persona líder?', si), Habilidad = liderazgo;
     respuesta('¿Te consideras una persona detallista?', si), Habilidad = matematicas),
    sumar_puntaje(ingenieria_sistemas).

cumple_requisito(interes(Interes)) :-
    (respuesta('¿Te interesa la tecnología?', si), Interes = tecnologia;
     respuesta('¿Te interesa el área de salud?', si), Interes = salud;
     respuesta('¿Te interesa el diseño y la creatividad?', si), Interes = diseño),
    sumar_puntaje(arquitectura).

cumple_requisito(personalidad(Personalidad)) :-
    (respuesta('¿Te sientes cómodo trabajando en equipo?', si), Personalidad = organizativo;
     respuesta('¿Te consideras una persona analítica?', si), Personalidad = analitico;
     respuesta('¿Te consideras una persona extrovertida?', si), Personalidad = extrovertido),
    sumar_puntaje(derecho).

recomendar :-
    interactuar,
    forall(carrera(Carrera), (
        forall(requisito(Carrera, Requisito), cumple_requisito(Requisito))
    )),
    findall(C, puntaje(C, _), Carreras),
    find_max_puntaje(Carreras).

find_max_puntaje(Carreras) :-
    findall(Puntaje, (member(C, Carreras), puntaje(C, Puntaje)), Puntajes),
    max_list(Puntajes, MaxPuntaje),
    member(Carrera, Carreras),
    puntaje(Carrera, MaxPuntaje),
    write('Te recomendamos estudiar: '),
    write(Carrera).

preguntar(Pregunta) :-
    write(Pregunta), nl,
    read(Respuesta),
    asserta(respuesta(Pregunta, Respuesta)).

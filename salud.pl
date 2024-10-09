% SISTEMA DE SALUD: Ofrece consulta sobre una base de conocimiento de enfermedades.
% ========================================================================================================================
% Se solicitan síntomas al paciente. Se identifica enfermedad.
% * Grave:
%   + Se explica enfermedad y se recomienda visitar especialista.
% * No grave:
%   + Se solicitan padecimientos.
%   + Se da tratamiento con recomendaciones y medicamentos.
% ========================================================================================================================
:- discontiguous([sintoma/1, padecimiento/1]).
:- dynamic( known/3).


% Enfermedades: se diagnostica una enfermedad si el paciente presenta los síntomas indicados
% ------------------------------------------------------------------------------------------------------------------------
enfermedad(bronquitis) :- sintoma(tos), sintoma(fiebre), sintoma(expectoracion_mucosa).
enfermedad(colitis) :- sintoma(dolor_abdominal), sintoma(diarrea), sintoma(fiebre).
enfermedad(conjuntivitis) :- sintoma(ojos_rojos), sintoma(picazon_ojos), sintoma(lagrimeo).
enfermedad(diarrea) :- sintoma(diarrea), sintoma(vomito), sintoma(dolor_abdominal).
enfermedad(gastroenteritis) :- sintoma(diarrea), sintoma(vomito), sintoma(fiebre).
enfermedad(laringitis) :- sintoma(dolor_garganta), sintoma(ronquera), sintoma(dificultad_hablar).
enfermedad(resfriado) :- sintoma(secrecion_nasal), sintoma(dolor_garganta), sintoma(tos).
enfermedad(tos_ferina) :- sintoma(tos), sintoma(vomito), sintoma(fiebre).

enfermedad(cancer_de_pulmon) :- sintoma(tos), sintoma(dolor_en_el_pecho), sintoma(dificultad_para_respirar), sintoma(sibilancias).
enfermedad(diabetes_tipo_2) :- sintoma(fatiga), sintoma(miccion_frecuente), sintoma(glucosa_alta), sintoma(perdida_de_vision).
enfermedad(enfermedad_cardiovascular) :- sintoma(fatiga), sintoma(mareos), sintoma(dificultad_para_respirar), sintoma(dolor_de_pecho).
enfermedad(hipertension) :- sintoma(dolor_de_cabeza), sintoma(vision_borrosa), sintoma(migrana), sintoma(convulsiones).


% Gravedad: Clasifica la gravedad de las enfermedades
% ------------------------------------------------------------------------------------------------------------------------
gravedad(Enfermedad, Gravedad) :-
        member(Enfermedad, [cancer_de_pulmon, diabetes_tipo_2, enfermedad_cardiovascular, hipertension]) -> Gravedad = grave; 
        Gravedad = no_grave.


% Tratamientos: para enfermedades no graves, relaciona medicamentos evitando padecimientos, alergias, contraindicaciones, etc
% ------------------------------------------------------------------------------------------------------------------------
tratamiento(bronquitis, Medicamentos) :-
        (Rec1 = [reposo]),
        (Rec2 = [liquidos]),
        (not(padecimiento(ulcera_gastrica)) -> Med1 = [ibuprofeno]; Med1 = []),
        (not(padecimiento(colitis_ucerosa)) -> Med2 = [loperamida]; Med2 = []),
        (not(padecimiento(alergia_penicilina)) -> Med3 = [amoxicilina]; Med3 = []),
        (not(padecimiento(dano_hepatico)) -> Med4 = [acetaminofen]; Med4 = []),
        append([Rec1, Rec2, Med1, Med2, Med3, Med4], Medicamentos).

tratamiento(colitis, Medicamentos) :-
        (Rec1 = [dieta_blanda]),
        (Rec2 = [liquidos]),
        (not(padecimiento(insuficiencia_renal)) -> Med1 = [bismuto]; Med1 = []),
        (not(padecimiento(porfiria_aguda)) -> Med2 = [ranitidina]; Med2 = []),
        (not(padecimiento(colitis_ulcerosa)) -> Med3 = [loperamida]; Med3 = []),
        (not(padecimiento(obstruccion_gastrointestinal)) -> Med4 = [metoclopramida]; Med4 = []),
        append([Rec1, Rec2, Med1, Med2, Med3, Med4], Medicamentos).

tratamiento(conjuntivitis, Medicamentos) :-
        (Rec1 = [limpieza]),
        (Rec2 = [evitar_luz]),
        (not(padecimiento(ulcera_gastrica)) -> Med1 = [ibuprofeno]; Med1 = []),
        (not(padecimiento(enfermedad_hepatica)) -> Med2 = [paracetamol]; Med2 = []),
        (not(padecimiento(glaucoma)) -> Med3 = [clorfenamina]; Med3 = []),
        (not(padecimiento(colitis_ulcerosa)) -> Med4 = [loperamida]; Med4 = []),
        append([Rec1, Rec2, Med1, Med2, Med3, Med4], Medicamentos).
        
tratamiento(diarrea, Medicamentos) :-
        (Rec1 = [liquidos]),
        (Rec2 = [dieta_blanda]),
        (not(padecimiento(colitis_ulcerosa)) -> Med1 = [loperamida]; Med1 = []),
        (not(padecimiento(insuficiencia_renal)) -> Med2 = [bismuto]; Med2 = []),
        (not(padecimiento(porfiria_aguda)) -> Med3 = [ranitidina]; Med3 = []),
        (not(padecimiento(obstruccion_gastrointestinal)) -> Med4 = [metoclopramida]; Med4 = []),
        append([Rec1, Rec2, Med1, Med2, Med3, Med4], Medicamentos).

tratamiento(gastroenteritis, Medicamentos) :-
        (Rec1 = [reposo]),
        (Rec2 = [liquidos]),
        (not(padecimiento(colitis_ulcerosa)) -> Med1 = [loperamida]; Med1 = []),
        (not(padecimiento(insuficiencia_renal)) -> Med2 = [bismuto]; Med2 = []),
        (not(padecimiento(porfiria_aguda)) -> Med3 = [ranitidina]; Med3 = []),
        (not(padecimiento(obstruccion_gastrointestinal)) -> Med4 = [metoclopramida]; Med4 = []),
        append([Rec1, Rec2, Med1, Med2, Med3, Med4], Medicamentos).

tratamiento(laringitis, Medicamentos) :-
        (Rec1 = [reposo]),
        (Rec2 = [evitar_luz]),
        (not(padecimiento(ulcera_gastrica)) -> Med1 = [ibuprofeno]; Med1 = []),
        (not(padecimiento(enfermedad_hepatica)) -> Med2 = [paracetamol]; Med2 = []),
        (not(padecimiento(alergia_penicilina)) -> Med3 = [amoxicilina]; Med3 = []),
        (not(padecimiento(dano_hepatico)) -> Med4 = [acetaminofen]; Med4 = []),
        append([Rec1, Rec2, Med1, Med2, Med3, Med4], Medicamentos).

tratamiento(resfriado, Medicamentos) :-
        (Rec1 = [liquidos]),
        (Rec2 = [reposo]),
        (not(padecimiento(ulcera_gastrica)) -> Med1 = [ibuprofeno]; Med1 = []),
        (not(padecimiento(enfermedad_hepatica)) -> Med2 = [paracetamol]; Med2 = []),
        (not(padecimiento(alergia_penicilina)) -> Med3 = [amoxicilina]; Med3 = []),
        (not(padecimiento(dano_hepatico)) -> Med4 = [acetaminofen]; Med4 = []),
        append([Rec1, Rec2, Med1, Med2, Med3, Med4], Medicamentos).
        
tratamiento(tos_ferina, Medicamentos) :-
        (Rec1 = [evitar_luz]),
        (Rec2 = [liquidos]),
        (not(padecimiento(ulcera_gastrica)) -> Med1 = [ibuprofeno]; Med1 = []),
        (not(padecimiento(enfermedad_hepatica)) -> Med2 = [paracetamol]; Med2 = []),
        (not(padecimiento(glaucoma)) -> Med3 = [clorfenamina]; Med3 = []),
        (not(padecimiento(colitis_ulcerosa)) -> Med4 = [loperamida]; Med4 = []),
        append([Rec1, Rec2, Med1, Med2, Med3, Med4], Medicamentos).

        
% Predicados que informan del diagnóstico para enfermedad no grave
% ------------------------------------------------------------------------------------------------------------------------   
describe_medicamento(dieta_blanda, Recomendacion) :- Recomendacion = "/ dieta_blanda: Comer alimentos suaves y faciles de digerir. (Ej: pures, sopas, yogurt).".
describe_medicamento(evitar_luz, Recomendacion) :- Recomendacion = "/ evitar_luz: Reducir la exposicion a la luz brillante o usar lentes de sol.".
describe_medicamento(limpieza, Recomendacion) :- Recomendacion = "/ limpieza: Mantener la zona afectada limpia y seca.".
describe_medicamento(liquidos, Recomendacion) :- Recomendacion = "/ liquidos: Beber abundante agua y liquidos claros.".
describe_medicamento(reposo, Recomendacion) :- Recomendacion = "/ reposo: Descansar lo suficiente y evitar actividades extenuantes.".
describe_medicamento(acetaminofen, Recomendacion) :- Recomendacion = "+ acetaminofen: Adultos y ninos mayores de 12 anos: 325 mg a 650 mg cada 4 a 6 horas segun sea necesario. No administre mas de 4 dosis en 24 horas.".
describe_medicamento(amoxicilina, Recomendacion) :- Recomendacion = "+ amoxicilina: Adultos y ninos de mas de 40 kg: 250 a 500 mg via oral, 3 veces al dia.".
describe_medicamento(bismuto, Recomendacion) :- Recomendacion = "+ bismuto: Adultos: 524 mg de subsalicilato de bismuto (2 comprimidos masticables) cada 30-60 minutos. No exceder las 8 dosis/dia.".
describe_medicamento(clorfenamina, Recomendacion) :- Recomendacion = "+ clorfenamina: Adultos y ninos mayores de 12 anos: Tomar de 1 a 2 cucharaditas (5-10 ml) cada 4 a 6 horas".
describe_medicamento(ibuprofeno, Recomendacion) :- Recomendacion = "+ ibuprofeno: Adultos: 400 mg cada 6 a 8 horas si es necesario.".
describe_medicamento(loperamida, Recomendacion) :- Recomendacion = "+ loperamida: Adultos: 4 mg despues de la primera evacuacion y continuar con 2 mg despues de cada evacuacion.".
describe_medicamento(metoclopramida, Recomendacion) :- Recomendacion = "+ metoclopramida: Adultos: 10 mg cada 8 horas.".
describe_medicamento(paracetamol, Recomendacion) :- Recomendacion = "+ paracetamol: Adultos: 500 mg a 1 g cada 4 a 6 horas, no superando los 4 g al dia".
describe_medicamento(ranitidina, Recomendacion) :- Recomendacion = "+ ranitidina: Adultos: 300 mg al acostarse, o bien, 150 mg dos veces al dia, durante 4 a 8 semanas".

informa_tratamiento([]).

informa_tratamiento([Medicamento|Restantes]) :-
        describe_medicamento(Medicamento, Recomendacion),
        write(Recomendacion), nl,
        informa_tratamiento(Restantes).

informa_diagnostico_no_grave(Enfermedad, Medicamentos) :-
        write("DIAGNOSTICO"), nl,
        format("Los sintomas que presentas podrian indicar *** ~w ***.", [Enfermedad]), nl, nl,        
        write("TRATAMIENTO"), nl,
        write("Se recomienda:"), nl,
        informa_tratamiento(Medicamentos), nl,
        write("Recuerda: Esta informacion no es un sustituto del consejo profesional. Debes consultar con un medico antes de tomar cualquier medicamento.").


% Predicados que informan del diagnóstico para enfermedad grave
% ------------------------------------------------------------------------------------------------------------------------   
describe_recomendacion(cancer_de_pulmon, Explicacion, Recomendacion) :- 
        Explicacion = "El cancer_de_pulmon es una enfermedad grave causada por el crecimiento descontrolado de celulas en los pulmones.", 
        Recomendacion = "Te recomiendo que busques a un especialista, es decir a un Medico Neumonologo.".

describe_recomendacion(diabetes_tipo_2, Explicacion, Recomendacion) :- 
        Explicacion = "La diabetes_tipo_2 es una enfermedad grave con niveles altos de azucar en sangre por resistencia a la insulina.", 
        Recomendacion = "Te recomiendo que busques a un especialista, es decir a un Medico Endocrinologo.".

describe_recomendacion(enfermedad_cardiovascular, Explicacion, Recomendacion) :- 
        Explicacion = "La enfermedad_cardiovascular es una enfermedad grave que afecta corazon y vasos sanguineos. Causa dolor en el pecho, dificultad para respirar y fatiga.",
        Recomendacion = "Te recomiendo que busques a un especialista, es decir a un Medico Cardiologo.".

describe_recomendacion(hipertension, Explicacion, Recomendacion) :- 
        Explicacion = "La hipertension es una enfermedad grave donde se presenta presion arterial alta que dana los vasos sanguineos. Puede causar enfermedades cardiacas y renales.",
        Recomendacion = "Te recomiendo que busques a un especialista, es decir a un Medico Cardiologo o Nefrologo.".

informa_recomendacion(Recomendacion) :-
        write(Recomendacion), nl.

informa_diagnostico_grave(Enfermedad) :-
        describe_recomendacion(Enfermedad, Explicacion, Recomendacion), nl,
        write("DIAGNOSTICO"), nl,
        format("Los sintomas que presentas podrian indicar *** ~w ***.", [Enfermedad]), nl, nl,               
        write(Explicacion), nl, nl,
        write("RECOMENDACION"), nl,        
        informa_recomendacion(Recomendacion), nl,
        write("Recuerda: Esta informacion no es un sustituto del consejo profesional. Debes consultar con un medico antes de tomar cualquier medicamento.").


% Pregunta: este predicado presenta una pregunta el usuario y regresa true si contestó si
% ------------------------------------------------------------------------------------------------------------------------      
pregunta(Clase, Opcion) :- known(si, Clase, Opcion), !.
pregunta(Clase, Opcion) :- known(_, Clase, Opcion), !, fail.
pregunta(Clase, Opcion) :- 
        format("~w ~w ? ", [Clase, Opcion]),
        read(Respuesta),
        assert(known(Respuesta, Clase, Opcion)), 
        Respuesta == si.

% Preguntaremos síntomas y padecimientos
sintoma(Sintoma) :- pregunta(sintoma, Sintoma).
padecimiento(Padecimiento) :- pregunta(padecimiento, Padecimiento).


% Objetivos: identificar enfermedades y tratamientos
% ------------------------------------------------------------------------------------------------------------------------   
identifica_enfermedad(Enfermedad, Gravedad) :- enfermedad(Enfermedad), gravedad(Enfermedad, Gravedad).
identifica_tratamiento(Enfermedad, Medicamentos) :- tratamiento(Enfermedad, Medicamentos).


% Predicados principales de consulta
% ------------------------------------------------------------------------------------------------------------------------
consulta_sintomas(Enfermedad, Gravedad) :-
        write("1: SINTOMAS: Indica si tienes los siguientes sintomas (escribe si o no):"), nl, nl,
        identifica_enfermedad(Enfermedad, Gravedad), nl,
        format("... de acuerdo, ya tengo la enfermedad ..."), nl, nl.

consulta_padecimientos(Enfermedad, Medicamentos) :-
        write("2: PADECIMIENTOS: Indica si tienes las siguientes alergias o padecimientos (escribe si o no):"), nl, nl,     
        identifica_tratamiento(Enfermedad, Medicamentos), nl,
        format("... ya tengo tu diagnostico ..."), nl, nl.

consulta :- 
        abolish(known/3),
        dynamic(known/3), nl,
        write("SISTEMA DE SALUD"), nl, nl,        
        consulta_sintomas(Enfermedad, Gravedad),
        (                
                Gravedad = no_grave -> consulta_padecimientos(Enfermedad, Medicamentos), informa_diagnostico_no_grave(Enfermedad, Medicamentos);
                Gravedad = grave -> informa_diagnostico_grave(Enfermedad)
        ).
                
consulta :- 
        write("Lo siento pero en base a tus respuestas no puedo encontrar un diagnostico. Te sugiero volver a intentar o consultar a un medico."), nl.
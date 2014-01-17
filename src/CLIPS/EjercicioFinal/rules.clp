(defrule asignarGeneral
	(declare (salience 20))
	(cursoActual ?cursoActual)
	?as<-(asignatura 
		(nombre ?nombre) 
		(horasSemanales ?horasSemanales) 
		(horasRestantes ?horasRestantes) 
		(profesor ?profe) 
		(curso ?cursoActual)
	)
	
	(test (> ?horasRestantes 0))
	(diaActual ?dia)
	?h<- (horaActual ?horaInicio)
	(test (< ?horaInicio 14))
	
	(not (exists (clase (curso ?) (nombre ?) (diaSemana ?dia) (profe ?profe) (horaInicio ?horaInicio) (horaFin ?))))
	
	?hed <- (horasEnDia (asignatura ?nombre) (dia ?dia) (horas ?horas) (curso ?cursoActual))
	
	(test (< ?horas 3))
	
	=>
	
	(assert 
		(clase
			(curso ?cursoActual)
			(nombre ?nombre)
			(diaSemana ?dia)
			(profe ?profe)
			(horaInicio ?horaInicio)
			(horaFin (+ ?horaInicio 1))
		)
	)
	(retract ?h)
	(assert (horaActual (+ ?horaInicio 1)))
	(modify ?as (horasRestantes (- ?horasRestantes 1)))
	(modify ?hed (horas (+ 1 ?horas)))
	
)

(defrule asignar
	(declare (salience 10))
	(cursoActual ?cursoActual)
	?as<-(asignatura 
		(nombre ?nombre) 
		(horasSemanales ?horasSemanales) 
		(horasRestantes ?horasRestantes) 
		(profesor ?profe) 
		(curso ?cursoActual)
	)
	
	(test (> ?horasRestantes 0))
	(diaActual ?dia)
	?h<- (horaActual ?horaInicio)
	(test (< ?horaInicio 14))
	
	(not (exists (clase (curso ?) (nombre ?) (diaSemana ?dia) (profe ?profe) (horaInicio ?horaInicio) (horaFin ?))))
	(not (exists (horasEnDia (asignatura ?nombre) (dia ?dia) (horas ?) (curso ?cursoActual))))
	=>
	
	(assert 
		(clase
			(curso ?cursoActual)
			(nombre ?nombre)
			(diaSemana ?dia)
			(profe ?profe)
			(horaInicio ?horaInicio)
			(horaFin (+ ?horaInicio 1))
		)
	)
	(retract ?h)
	(assert (horaActual (+ ?horaInicio 1)))
	(modify ?as (horasRestantes (- ?horasRestantes 1)))
	(assert (horasEnDia (asignatura ?nombre) (dia ?dia) (horas 1) (curso ?cursoActual)))
	
)

(deffunction avanzardia (?dia)
	(bind ?var ?dia)
	(switch ?var
	(case LUNES then (bind ?var MARTES))
	(case MARTES then (bind ?var MIERCOLES))
	(case MIERCOLES then (bind ?var JUEVES))
	(case JUEVES then (bind ?var VIERNES))
	(case VIERNES then (bind ?var LUNES)))
)

(deffunction avanzarannio (?dia)
	(bind ?var ?dia)
	(switch ?var
	(case LUNES then (bind ?var 0))
	(case MARTES then (bind ?var 0))
	(case MIERCOLES then (bind ?var 0))
	(case JUEVES then (bind ?var 0))
	(case VIERNES then (bind ?var 1)))
)


(defrule avanzar
	?d<-(diaActual ?dia)
	?h <-(horaActual 14)
	?c<-(cursoActual ?cursoActual)
	=>
	(retract ?d)
	(retract ?h)
	(retract ?c)
	(assert (cursoActual (+ ?cursoActual (avanzarannio ?dia))))
	(assert (diaActual (avanzardia ?dia)))
	(assert (horaActual 8))
)


(defrule asignar
    (cursoActual ?cursoActual)
    ?as<-(asignatura 
		(nombre ?nombre) 
		(horasSemanales ?horasSemanales) 
		(horasRestantes ?horasRestantes) 
		(profesor ?profe) 
		(curso ?cursoActual)
	)
	(test (> ?horasRestantes 0 ))
    (diaActual ?dia)
	?h<- (horaActual ?horaInicio)
	(test (< ?horaInicio 14))
	
	(not (exists (clase (curso ?) (nombre ?) (diaSemana ?dia) (profe ?profe) (horaInicio ?horaInicio) (horaFin ?))))
	
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
    
)

(defrule avanzarDeLunesAMartes
	?d<-(diaActual LUNES)
	?h <-(horaActual 14)
	=>
	(retract ?d)
	(retract ?h)
	(assert (diaActual MARTES))
	(assert (horaActual 8))
)

(defrule avanzarDeMartesAMiercoles
	?d<-(diaActual MARTES)
	?h <-(horaActual 14)
	=>
	(retract ?d)
	(retract ?h)
	(assert (diaActual MIERCOLES))
	(assert (horaActual 8))
)

(defrule avanzarDeMiercolesAJueves
	?d<-(diaActual MIERCOLES)
	?h <-(horaActual 14)
	=>
	(retract ?d)
	(retract ?h)
	(assert (diaActual JUEVES))
	(assert (horaActual 8))
)

(defrule avanzarDeJuevesAViernes
	?d<-(diaActual JUEVES)
	?h <-(horaActual 14)
	=>
	(retract ?d)
	(retract ?h)
	(assert (diaActual VIERNES))
	(assert (horaActual 8))
)

(defrule avanzarDeViernesALunes
	?d<-(diaActual VIERNES)
	?h <-(horaActual 14)
	=>
	(retract ?d)
	(retract ?h)
	(assert (diaActual LUNES))
	(assert (cursoActual 2))
	(assert (horaActual 8))
)


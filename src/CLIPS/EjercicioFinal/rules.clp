(defrule asignar
    (cursoActual ?cursoActual)
    ?as<-(asignatura ?nombre ?horasSemanales ?horasRestantes ?profe ?cursoActual)
    
    =>
    (assert 
        (clase
            (curso ?cursoActual)
            (nombre ?nombre)
            (diaSemana LUNES)
            (profe ?profe)
            (horaInicio blabla)
            (horaFin blabla)
        )
    )
    (modify ?as (horasRestantes 1))
)
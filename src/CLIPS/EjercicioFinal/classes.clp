(deftemplate clase
    (slot curso 
        (type INTEGER)
    )

    (slot diaSemana
        (type SYMBOL)
        (allowed-values LUNES MARTES MIERCOLES JUEVES VIERNES)
    )
    
    (slot profe 
        (type SYMBOL)
    )

    (slot horaInicio
        (type INTEGER)
    )
    
    (slot horaFin
        (type INTEGER)
    )
)

(deftemplate asignatura
    
    (slot nombre 
        (type SYMBOL)
    )
    
    (slot horasSemanales
        (type INTEGER)
        (range 0 4)
    )
    
    (slot horasRestantes 
        (type INTEGER)
    )
    
    (slot profesor
        (type SYMBOL)
    )
    
    (slot curso
        (type INTEGER)
        (range 1 4)
    )
)
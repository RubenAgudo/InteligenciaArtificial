(deftemplate clase
    (slot curso 
        (type INTEGER)
    )
    
    (slot nombre
        (type SYMBOL)
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
        (range 8 14)
    )
    
    (slot horaFin
        (type INTEGER)
        (range 8 14)
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

(deftemplate horasEnDia
	(slot asignatura
		(type SYMBOL)
	)
	
	(slot dia
		(type SYMBOL)
	)
	
	(slot horas
		(type INTEGER)
	)
)

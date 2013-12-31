(defclass ASIGNATURA
    (is-a USER)
    (role concrete)
    
    (slot curso
        (type INTEGER)
        (range 1 4)
        (create-accessor read-write)
    )
    
    (slot horasRestantes
        (type INTEGER)
        (range 1 4)
        (create-accessor read-write)
    )
    
    (slot profesor
        (type SYMBOL)
        (create-accessor read-write)
    )
    
)

(defclass DIA
    (is-a USER)
    (role concrete)
    
    (multislot clases
        (type INSTANCE)
        (allowed-classes CLASE)
        (create-accessor read-write)
    )
)

(defclass SEMANA
    (is-a USER)
    (role concrete)
    
    (slot deCurso
        (type INTEGER)
        (range 1 4)
        (create-accessor read-write)
    )
    
    (multislot dias
        (type INSTANCE)
        (allowed-classes DIA)
        (create-accessor read-write)
    )
    
    (slot diasUsados
        (type INTEGER)
        (range 1 5 DEFAULT 0)
        (create-accessor read-write)
    )
)

(defclass CLASE
    (is-a USER)
    (role concrete)
    
    (slot deAsignatura
        (type INSTANCE)
        (allowed-instances ASIGNATURA)
    )
    
    (slot diaSemana
        (type SYMBOL)
        (allowed-values LUNES MARTES MIERCOLES JUEVES VIERNES)
        (create-accessor read-write)
    )
    
    (slot horaInicio
        (type INTEGER)
        (range 8 12)
    )
    
    (slot horaFin
        (type INTEGER)
        (range 8 12)
    )
)
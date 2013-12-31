(defrule sacarfoto
    (eq ABIERTA (send [miCamara] get-TAPA_CIERRA))
    (eq SI (send [miCamara] get-CARGADA))
    (eq QUITADO (send [miCamara] get-SEGURO))
    ?carrete <- (send [miCamara] get-PELICULA)
    (test < (send [miCamara] get-N_FOTOS) (send ?carrete get-N_FOTOS))
=>
    (send [miCamara] putt-N_FOTOS (+ 1 send [miCamara] get-N_FOTOS))
)

(defrule cargarPelicula
    (eq SI (send [miCamara] get-REBOBINADA))
    ?nombreInstancia <- (INSTANCE-NAME-TO-SYMBOL (send [miCamara] get-PELICULA))
    (eq ?nombreInstancia nil)
    (eq NO (send [miCamara] get-CARGADA))
=>
    (send [miCamara] putt-PELICULA (make-instance [miCarrete] of CARRETE_DE_DOS))
    (send [miCamara] putt-CARGADA SI)
)

(defrule rebobinar
    (eq NO (send [miCamara] get-REBOBINADA))
    (eq (send [miCamara] get-N_FOTOS) (send ?carrete get-N_FOTOS))
=>
    (send [miCamara] putt-REBOBINADA SI)
    (send [miCamara] putt-N_FOTOS 0)
    (send [miCamara] putt-PELICULA (make-instance [nil] of CARRETE))
    (send [miCamara] putt-CARGADA NO)
)

(defrule quitarSeguro
    (eq PUESTO (send [miCamara] get-SEGURO))
=>
    (send [miCamara] putt-SEGURO QUITADO)
)

(defrule quitarTapa
    (eq CERRADA (send [miCamara] get-TAPA_CIERRE))
=>
    (send [miCamara] putt-TAPA_CIERE ABIERTA)
)

(defclass CAMARA
    (is-a USER)
    (role concrete)
    (single-slot REBOBINADA
        (type SYMBOL)
        (allowed-values SI NO)
        (create-accessor read-write)
    )
    (single-slot NUEVA_FOTO
        (type SYMBOL)
        (allowed-values SACAR)
        (create-accessor read-write)
    )
    (single-slot PELICULA
        (type INSTANCE)
        (allowed-classes CARRETE)
        (create-accessor read-write)
    )
    (single-slot TAPA_CIERRE
        (type SYMBOL)
        (allowed-values ABIERTA CERRADA)
        (default CERRADA)
        (create-accessor read-write)
    )
    (single-slot CARGADA
        (type SYMBOL)
        (allowed-values SI NO)
        (default NO)
        (create-accessor read-write)
    )
    (single-slot SEGURO
        (type SYMBOL)
        (allowed-values PUESTO QUITADO)
        (default PUESTO)
        (create-accessor read-write))
    (single-slot N_FOTOS
        (type INTEGER)
        (range 0 ?VARIABLE)
        (default 0)
        (create-accessor read-write)
    )
)
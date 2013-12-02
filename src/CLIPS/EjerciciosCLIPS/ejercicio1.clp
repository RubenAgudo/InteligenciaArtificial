(deftemplate persona
    (slot nombre)
    (slot ojos)
    (slot edad)
)

(deftemplate tarea
    (slot tipo (allowed-symbols inicia busca-ojos busca-edad))
    (slot color(allowed-symbols azul verde negro))
    (slot edad (type INTEGER))
)

(deffacts inicio "define el estado inicial de la memoria de trabajo"
    (tarea (tipo inicia))
    (persona (nombre Jose)(ojos verde) (edad 18))
    (persona (nombre Antonio)(ojos azul) (edad 32))
    (persona (nombre Ramon)(ojos azul) (edad 27))
)

(defrule inicializa
    ?h1 <- (tarea (tipo inicia))
    =>
        (printout t "color de los ojos?:")
        (bind ?color (read))
        (assert (tarea (tipo busca-ojos)(color ?color)))
        (printout t "Personas con color de ojos" ?color": " crlf)
        (retract ?h1)
)

(defrule busca-color-ojo "muestra las personas con el color de ojos elegido"
    ?h1 <- (tarea (tipo busca-ojos)(color ?color))
    (persona (ojos ?color) (nombre ?nombre1)) ;frase escrita por mi
    => 
        (printout t ?nombre1 " tiene los ojos "
        ?color crlf)
)

(defrule pasa-a-ultima-tarea "cambia de tarea"
    ?h1 <- (tarea (tipo busca-ojos))
    =>
        (printout t "De los anteriores visualizo los mayores de ?: ")
        (bind ?edad (read))
        (modify ?h1 (edad ?edad)) ;frase escrita por mi
)

(defrule muestra-color-edad "muestra personas con el color de ojos y mayores que la edad elegida"
    ?h1 <- (tarea (tipo busca-edad)(color ?color) (edad ?edad))
    (persona (nombre ?nombre)(ojos ?color)(edad ?edad-persona))
    (test (> ?edad-persona ?edad)) ;frase escrita por mi
    =>
        (printout t ?nombre " tiene los ojos "
    ?color " y tiene mas de " ?edad crlf)
)
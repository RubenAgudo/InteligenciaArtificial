(defrule R1
    (estudiante (nombre ?nombre))
    ?estudiante <- (estudiante (nombre ?nombre))
    => (modify ?estudiante (nombre "pepe"))
)
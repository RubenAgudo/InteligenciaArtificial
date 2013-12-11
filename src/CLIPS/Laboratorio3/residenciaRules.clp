(defrule R2 
    (desalojar-ultimo ?x)
    ?h <- habitacion (numero ?x) 
    (plazas-libres ?plazas) 
    (ocupantes $?resto ?nombre) 
        =>
        (modify ?h (ocupantes $?resto)(plazas-libres (- ?plazas 1)))
        ?e <- estudiante (nombre ?nombre)
        (modify ?e (alojado ))
)

(defrule intercambiar
     ?e1 <- estudiante (nombre ?nombre1)(sexo ?sexo)(TV si)(alojado ?numero2)
     ?e2 <- estudiante (nombre ?nombre2)(sexo ?sexo)(TV no)(alojado ?numero1)
     ?h1 <- habitacion (numero ?numero1)(sexos ?sexo)(TV si)(ocupantes $?aux0 ?nombre2 $?aux1)
     ?h2 <- habitacion (numero ?numero2)(sexos ?sexo)(TV no)(ocupantes $?aux2 ?nombre1 $?aux3) 
     =>
        (modify ?e1 (alojado ?numero1))
        (modify ?e2 (alojado ?numero2))
        (modify ?h1 (ocupantes $?aux0 $?aux1 ?nombre1))
        (modify ?h2 (ocupantes $?aux2 $?aux3 ?nombre3)))
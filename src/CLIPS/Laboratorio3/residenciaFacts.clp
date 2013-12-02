(deftemplate estudiante
    (slot nombre)
    (slot sexo )
    (slot TV)
    (slot alojado)
)
(deftemplate habitacion
    (slot numero)
    (slot capacidad)
    (slot sexos)
    (slot TV)
    (slot plazas-libres)
    (multislot ocupantes)
)

(deffacts estudiantes
    (estudiante 
        (nombre Mikel) 
        (sexo masculino) 
        (TV si) 
        (alojado 222)
    )
    (estudiante 
        (nombre Maite) 
        (sexo femenino) 
        (TV no)
        (alojado 111)
    )
    (estudiante 
        (nombre Miren) 
        (sexo femenino) 
        (TV no)
        (alojado 111)
    )
    (estudiante 
        (nombre Martin) 
        (sexo masculino) 
        (TV si)
        (alojado 222)
    )
)

(deffacts habitaciones
    (habitacion 
        (numero 222) 
        (capacidad 4) 
        (sexos masculino)
        (TV si)
        (plazas-libres 2)
        (ocupantes Mikel Martin)
    )
    (habitacion 
        (numero 111) 
        (capacidad 3) 
        (sexos femenino)
        (TV no)
        (plazas-libres 1)
        (ocupantes Maite Miren)
    )
    (habitacion 
        (numero 444) 
        (capacidad 4) 
        (sexos masculino)
        (TV si)
        (plazas-libres 4)
    )
)
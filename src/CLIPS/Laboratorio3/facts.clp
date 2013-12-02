(deffacts inicio-pala
    (viven-mismo-pueblo ander maria)
    (estudian-misma-facultad miren ane)
    (posible-equipo jon mikel)
    (gusta-jugar-pala ander)
    (gusta-jugar-pala maria)
    (gusta-jugar-pala miren)
    (gusta-jugar-pala ane)
    (gusta-jugar-pala mikel)
    (es-zurda miren)
    (pista-libre-Anoeta 7)
    (pista-libre-Anoeta 2)
    (buen-saque jon)
    (gusta-cualquier-deporte jon)
)

(deftemplate partido
   (multislot equipo1)
   (multislot equipo2)
   (slot pista)
)

(deftemplate equipo
    (slot jug1)
    (slot jug2)
)
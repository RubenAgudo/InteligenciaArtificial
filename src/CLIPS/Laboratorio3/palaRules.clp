(defrule R1 
    (viven-mismo-pueblo ?x ?y)
        => (assert (posible-equipo ?x ?y))
)

(defrule R2 
    (estudian-misma-facultad ?x ?y)
        => (assert (posible-equipo ?x ?y))
)

(defrule R3 
    (son-misma-cuadrilla ?x ?y)
        => (assert (posible-equipo ?x ?y))
)

(defrule R4 
    (posible-equipo ?x ?y)
        => (assert (equipo-campeonato ?x ?y))
)

(defrule R5 
    (equipo-campeonato ?x ?y) 
    (gusta-jugar-pala ?x) 
    (gusta-jugar-pala ?y)
    (not (en-equipo ?x))
    (not (en-equipo ?y))
        => (assert (equipo-pala ?x ?y)) 
            (assert (en-equipo ?x)) 
            (assert (en-equipo ?y))
)

(defrule R6 
    (equipo-campeonato ?x ?y) (gusta-jugar-pala ?x) (gusta-jugar-pala ?y)(es-zurda ?x)
        =>(assert (equipo-pala ?x ?y))
)

(defrule R7 
    (buen-saque ?x) (gusta-cualquier-deporte ?x)
        => (assert (gusta-jugar-pala ?x))
)

(defrule R8 
    (habitual-Anoeta ?x)(gusta-cualquier-deporte ?x)
        => (assert (gusta-jugar-pala ?x))
)
(defrule R9
    ?equipo1<-(equipo-pala ?x ?y)
    ?equipo2<-(equipo-pala ?w ?z)
    ?pista<-(pista-libre-Anoeta ?m)
    (test(neq ?equipo1 ?equipo2))
        =>  (assert (partido (equipo1 ?x ?y) (equipo2 ?w ?z) (pista ?m))) 
            (retract ?pista)
)
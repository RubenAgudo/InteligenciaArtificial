(deffunction intercambiar (?v1 ?v2)
    (bind ?aux ?v1)
    (bind ?v1 ?v2)
    (bind ?v2 ?aux)
)

(progn$
    (bind ?a 7)
    (bind ?b 18)
    (intercambiar ?a ?b)
    (printout t "Valor de a: " ?a " Valor de b: " ?b)
)

(deffunction factorial (?fact)
    (if (= x 0) then 
        1
    else
        (* ?fact (factorial(- 1 ?fact)))
    )
)

(defmethod mostrar ()
	(bind ?nombre (class ?self))
	(bind ?lAtrib (class-slots ?nombre))
	(loop-for-count ?cont [1 (length ?latrib)]
        (printout t (nth$ ?cont ?lAtrib) : ")
        (send ?self (sym-cat get-(nth$ ?cont ?lAtrib)))
    )
)


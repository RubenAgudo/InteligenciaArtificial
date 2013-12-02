(deftemplate elemento
    (slot valor (type INTEGER))
)

(defrule regla1
    (declare (salience 10))
    (elemento (valor ?x))
    =>
    (assert (valor ?x))
)

(defrule regla2
    (declare (salience 5))
    ?a <- (valor ?x)
    (valor ?y)
    (test (< ?x ?y))
    =>
    (retract ?a)
)
(defrule regla3
    (declare (salience 1))
    ?a <- (valor ?x)
    =>
    (printout t "Resultado: valor " ?x crlf)
    (retract ?a)
)

(deffacts hechos-iniciales
    (elemento (valor 1))
    (elemento (valor 8))
    (elemento (valor 5))
)
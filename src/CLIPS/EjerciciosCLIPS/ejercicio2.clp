(defrule regla-1
    (declare (salience 10))
    ?a <- (elemento ?x)
    =>
        (assert (elemento (+ 1 ?x)))
)

(defrule regla-2
    (declare (salience 20))
    (elemento ?x)
    (test (> ?x 15))
    =>
    (halt)
)
(deffacts hechos-iniciales
    (elemento 1)
)
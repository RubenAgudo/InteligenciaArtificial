(defrule regla-1
    (declare (salience 10))
    (elemento ?x)
    (elemento ?y)
    =>
    (assert (elemento (+ ?x ?y)))
)
(defrule regla-2
    (declare (salience 20))
    (elemento ?x)
    (test (> ?x 30))
    =>
    (halt)
)
(deffacts hechos-iniciales
(elemento 1))
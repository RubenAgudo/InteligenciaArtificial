(deffacts hechos-iniciales
    (numsFactorial 0 1)
)
(defrule factorial
    ?paBorrar<-(numsFactorial ?x ?y)
    (not (numsFactorial 0 ?y))
    =>
    (assert (numsFactorial (- ?x 1)(* ?y ?x)))
    (retract ?paBorrar)
)

(defrule casoBase
    ?paBorrar<-(numsFactorial 0 ?y)
    =>
    (printout t "Resultado: valor " ?y crlf)
    (retract ?paBorrar)
    
)


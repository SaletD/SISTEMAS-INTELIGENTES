(deffacts lista-entrada
   (num 1)
   (num 5)
   (num 3)
   (num 7)
   (num 2)
)

(defrule asignar-primer-minimo
   ?x <- (num ?y)
   (not (minimo ?z))
   =>
   (assert (minimo ?y))
)

(defrule comparar-con-minimo
   ?x <- (num ?y)
   ?minimo <- (minimo ?z)
   (test (< ?y ?z))
   =>
   (retract ?minimo)
   (assert (minimo ?y))
)

(reset)
(run)
(facts)

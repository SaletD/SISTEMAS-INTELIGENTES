(deffacts cadenas
   (cadena1 B)
   (cadena1 C)
   (cadena1 A)
   (cadena1 D)
   (cadena1 E)
   (cadena1 E)
   (cadena1 B)
   (cadena1 C)
   (cadena1 E)
   (cadena2 E)
   (cadena2 E)
   (cadena2 B)
   (cadena2 C)
   (cadena2 A)
   (cadena2 F)
   (cadena2 E)
)

(defrule obtener-union
   ?f1 <- (cadena1 ?x)
   ?f2 <- (cadena2 ?x)
   (not (letra-union ?x))
   =>
   (assert (letra-union ?x))
)

(defrule mostrar-union
   ?f <- (cadena1 ?x)
   (letra-union ?x)
   =>
   (printout t ?x " ")
)

(defrule fin
   =>
   (printout t crlf)
)

(reset)
(run)

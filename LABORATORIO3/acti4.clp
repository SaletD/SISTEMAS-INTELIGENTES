(deftemplate Pais
   (slot Nombre)
   (multislot Bandera))
(assert (Pais (Nombre "Argentina") (Bandera "Azul" "Blanco" "Amarillo")))
(assert (Pais (Nombre "Colombia") (Bandera "Amarillo" "Azul" "Rojo")))
(assert (Pais (Nombre "Bolivia") (Bandera "Rojo" "Amarillo" "Verde")))
(assert (Pais (Nombre "Perú") (Bandera "Rojo" "Blanco")))
(defglobal ?*colores-a-buscar* = (create$ "Blanco" "Amarillo"))

(defrule buscar-paises
   ?pais <- (Pais (Nombre ?nombre) (Bandera $?bandera))
   (test (and (member$ "Blanco" $?bandera)
               (member$ "Amarillo" $?bandera)))
   =>
   (printout t ?nombre crlf))
(run)

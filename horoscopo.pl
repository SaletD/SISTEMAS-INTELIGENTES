%signos

signo(aries, 21, 3, 21, 4).
signo(tauro, 21, 4, 21, 5).
signo(geminis, 21, 5, 21, 6).
signo(cancer, 21, 6, 21, 7).
signo(leo, 21, 7, 21, 8).
signo(virgo, 21, 8, 21, 9).
signo(libra, 21, 9, 21, 10).
signo(escorpio, 23, 10, 21, 11).
signo(sagitario, 22, 11, 21, 12).
signo(capricornio, 21, 12, 19, 1).
signo(acuario, 20, 1, 18, 2).
signo(piscis, 19, 2, 20, 3).

%mes
mes(1,31,enero).
mes(2,28,febrero).
mes(3,31,marzo).
mes(4,30,abril).
mes(5,31,mayo).
mes(6,30,junio).
mes(7,31,julio).
mes(8,31,agosto).
mes(9,30,septiembre).
mes(10,31,octubre).
mes(11,30,noviembre).
mes(12,31,diciembre).

horoscopo(Dia, Mes, Zodiaco) :-
    signo(Zodiaco, D1, M1, D2, M2),
    ((Mes == M1, Dia >= D1);
     (Mes > M1, Mes < M2);
     (Mes == M2, Dia =< D2)).

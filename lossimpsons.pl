%genero
varon(homero).
varon(abraham).
varon(clancy).
varon(bart).
varon(herbert).
mujer(jackeline).
mujer(marge).
mujer(maggie).
mujer(lisa).
mujer(paty).
mujer(selma).
mujer(mona).
mujer(ling).
%padres
es_madre_de(jackeline,marge).
es_madre_de(mona,homero).
es_madre_de(mona,herbert).
es_madre_de(jackeline,paty).
es_madre_de(jackeline,selma).
es_madre_de(marge,bart).
es_madre_de(marge,lisa).
es_madre_de(marge,maggie).
es_madre_de(selma,ling).
es_padre_de(abraham,homero).
es_padre_de(clancy,marge).
es_padre_de(clancy,selma).
es_padre_de(clancy,paty).
es_padre_de(homero,bart).
es_padre_de(homero,lisa).
es_padre_de(abraham,herbert).
es_padre_de(homero,maggie).
%parejas
estan_casados(homero,marge).
estan_casados(clancy,jackeline).
estan_casados(abraham,mona).
%padres
padres(X, Y) :-
    es_padre_de(X,Y).
padres(X,Y) :-
    es_madre_de(X,Y).
%reglas
es_hijo_de(X,Y) :-
    varon(X),
    padres(Y,X).
es_hija_de(X, Y) :-
    mujer(X),
    padres(Y, X).
es_nieto_de(X, Y) :-
    es_hijo_de(X, Z), es_hijo_de(Z, Y), varon(X).
es_nieta_de(X, Y) :-
    es_hija_de(X, Z), es_hija_de(Z, Y), mujer(X).
sus_hermanos_son(X, Y) :-
    padres(Z, X), padres(Z, Y), X \= Y.
es_hermana_de(X, Y) :-
    sus_hermanos_son(X, Y), mujer(X).
es_hermano_de(X, Y) :-
    sus_hermanos_son(X, Y), varon(X).
es_abuelo_de(X, Y) :-
    es_padre_de(X, Z), padres(Z, Y).
es_abuela_de(X, Y) :-
    es_madre_de(X, Z), padres(Z, Y).
es_tio_de(X, Y) :-
    es_hermano_de(X, Z), padres(Z, Y).
es_tia_de(X, Y) :-
    es_hermana_de(X, Z), padres(Z, Y).

addPokemon(Time, Pokemon, [(Pokemon, 100)|Time]).

isVivo((_, Vida)) :- Vida > 0.

getPokemonVivo([], 0).
getPokemonVivo([Pokemon| _], 1):-
    isVivo(Pokemon).
getPokemonVivo([_| Tail], Posicao):-
    getPokemonVivo(Tail, ProximoIndice),
    Posicao is ProximoIndice + 1.

tamanho([], 0).
tamanho([_|L], T):-
    tamanho(L, X),
    T is X + 1.

getPokemon(1, [Pokemon|_], Pokemon).
getPokemon(Posicao, [_|Tail], Pokemon):-
    getPokemon(Aux, Tail, Pokemon),
    Posicao is Aux + 1.

alteraHP(DanoCura, Pokemon, Retorno):-
    (Nome, HP) = Pokemon,
    calculaNewHP(DanoCura, HP, NewHP),
    Retorno = (Nome, NewHP).

calculaNewHP(DanoCura, HP, Retorno):-
    DanoCura =< 0,
    Retorno is HP + DanoCura.
calculaNewHP(DanoCura, HP, Retorno):-
    DanoCura + HP >= 100 ->
    Retorno is 100;
    Retorno is DanoCura + HP.

alteraTime(_, [], _, []).
alteraTime(1, [_|Tail], NewPokemon, [NewPokemon|Tail]).
alteraTime(Posicao, [Head|Tail], NewPokemon, Retorno):-
    alteraTime(Aux, Tail, NewPokemon, TimeAlterado),
    Retorno = [Head|TimeAlterado],
    Posicao is Aux + 1.

verificaPerdeu([],true).
verificaPerdeu([(_,HP)|Tail], Retorno):-
    HP > 0 ->
    Retorno = false;
    verificaPerdeu(Tail, Retorno).

curaTime([], []).
curaTime([(Nome, _)|Tail], Retorno):-
    curaTime(Tail, Aux),
    Retorno = [(Nome, 100)|Aux].

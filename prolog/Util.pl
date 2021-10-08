addPokemon(Time, Pokemon, [(Pokemon, 100)|Time]).

getVida((_|Vida), Vida).

isVivo((_, Vida)) :- Vida > 0.

getPokemonVivo([], [0,0]).
getPokemonVivo([Pokemon| _], Pokemon):-
    isVivo(Pokemon).
getPokemonVivo([_| Tail], R):-
    getPokemonVivo(Tail, R).

tamanho([], 0).
tamanho([_|L], T):-
    tamanho(L, X),
    T is X + 1.

getPokemon(1, [Pokemon|_], Pokemon).
getPokemon(Posicao, [_|Tail], Pokemon):-
    getPokemon(Aux, Tail, Pokemon),
    Posicao is Aux + 1.

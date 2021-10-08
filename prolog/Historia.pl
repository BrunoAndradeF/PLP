:-include('Menus.pl').
:-include('Ataques.pl').
:-include('Util.pl').

fluxoHist(_, _, 4) :-
    cls, exibePlayerGanha, pausa.

fluxoHist(TimePLayer, TimeBot, BatalhaAtual) :-
    cls,
    exibeCabecalhoHistoria,
    exibeMenuDeSelecao,
    writeln("Player escolha seu pokemon"),
    read(PokemonPlayer),
    addPokemon(TimePlayer, PokemonPlayer, NovoTimePLayer),

    cls,
    writeln("Voce escolheu :"),
    exibePokemon(PokemonPlayer),
    pausa,

    cls,
    random(1, 6, PokemonBot),
    writeln("O bot escolheu :"),
    exibePokemon(PokemonBot),
    addPokemon(TimeBot, PokemonBot, NovoTimeBot),
    pausa,

    batalhaHist(NovoTimePLayer, NovoTimeBot, BatalhaAtual).


batalhaHist(_, _, _):-
    cls,writeln('ainda nao implementado'),pausa.

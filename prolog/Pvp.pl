iniciaBatalhaPvP:-
    cls,
    exibeCabecalhoPvP,
    exibeMenuDeSelecao,
    writeln("Player1 escolha seu pokemon"),
    read(PokemonPlayer1),

    cls,
    exibeCabecalhoPvP,
    exibeMenuDeSelecao,
    writeln("Player2 escolha seu pokemon"),
    read(PokemonPlayer2),

    batalhaPvP(PokemonPlayer1, PokemonPlayer2, 1, 100, 100).


/*-----------------------------------Player 1-----------------------------------*/
batalhaPvP(_, _, Vez, VidaPlayer1, _):-
    Vez = 1,
    VidaPlayer1 =< 0,
    cls, exibePlayer2Ganha, pausa.

batalhaPvP(PokemonPlayer1, PokemonPlayer2, Vez, VidaPlayer1, VidaPlayer2):-
    Vez = 1,
    cls,
    exibePokemon(PokemonPlayer1),
    write("|  vida do Player1: "),
    writeln(VidaPlayer1),
    write("|  vida do Player2: "),
    writeln(VidaPlayer2),
    exibeAtaques,

    read(Ataque),
    designaAtaque(Ataque, ValorAtaque),

    cls,
    exibePokemon(PokemonPlayer1),
    exibeAtaque(ValorAtaque,"Player1"),
    pausa,

    aplicaAtaque(ValorAtaque, VidaPlayer1, VidaPlayer2, VidaPlayer1Alterada, VidaPlayer2Alterada),
    batalhaPvP(PokemonPlayer1, PokemonPlayer2, 2, VidaPlayer1Alterada, VidaPlayer2Alterada).


/*-----------------------------------Player 2-----------------------------------*/
batalhaPvP(_, _, Vez, _, VidaPlayer2):-
    Vez = 2,
    VidaPlayer2 =< 0,
    cls, exibePlayer1Ganha, pausa.

batalhaPvP(PokemonPlayer1, PokemonPlayer2, Vez, VidaPlayer1, VidaPlayer2):-
    Vez = 2,
    cls,
    exibePokemon(PokemonPlayer2),
    write("|  vida do Player1: "),
    writeln(VidaPlayer1),
    write("|  vida do Player2: "),
    writeln(VidaPlayer2),
    exibeAtaques,

    read(Ataque),
    designaAtaque(Ataque, ValorAtaque),

    cls,
    exibePokemon(PokemonPlayer2),
    exibeAtaque(ValorAtaque,"Player2"),
    pausa,

    aplicaAtaque(ValorAtaque, VidaPlayer2, VidaPlayer1, VidaPlayer2Alterada, VidaPlayer1Alterada),
    batalhaPvP(PokemonPlayer1, PokemonPlayer2, 1, VidaPlayer1Alterada, VidaPlayer2Alterada).

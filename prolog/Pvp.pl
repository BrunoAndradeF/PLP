:-include('Menus.pl').
:-include('Ataques.pl').


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
batalhaPvP(PokemonPlayer1, PokemonPlayer2, Vez, VidaPlayer1, VidaPlayer2):-
    Vez = 1,
    VidaPlayer1 =< 0,
    cls, exibePlayer2Ganha, pausa.

batalhaPvP(PokemonPlayer1, PokemonPlayer2, Vez, VidaPlayer1, VidaPlayer2):-
    Vez = 1,
    cls,
    write("vida do Player2: "),
    writeln(VidaPlayer2),
    write("vida do Player1: "),
    writeln(VidaPlayer1),
    exibePokemon(PokemonPlayer1),
    exibeAtaques,

    read(Ataque),
    designaAtaque(Ataque, R),

    cls,
    exibePokemon(PokemonPlayer1),
    write("Player1 ataca em: "),
    writeln(R),
    pausa,

    NovaVida is VidaPlayer2-R,
    batalhaPvP(PokemonPlayer1, PokemonPlayer2, 2, VidaPlayer1, NovaVida).


/*-----------------------------------Player 2-----------------------------------*/
batalhaPvP(PokemonPlayer1, PokemonPlayer2, Vez, VidaPlayer1, VidaPlayer2):-
    Vez = 2,
    VidaPlayer2 =< 0,
    cls, exibePlayer1Ganha, pausa.

batalhaPvP(PokemonPlayer1, PokemonPlayer2, Vez, VidaPlayer1, VidaPlayer2):-
    Vez = 2,
    cls,
    write("vida do Player2: "),
    writeln(VidaPlayer2),
    write("vida do Player1: "),
    writeln(VidaPlayer1),
    exibePokemon(PokemonPlayer2),
    exibeAtaques,

    read(Ataque),
    designaAtaque(Ataque, R),

    cls,
    exibePokemon(PokemonPlayer2),
    write("Player2 ataca em: "),
    writeln(R),
    pausa,

    NovaVida is VidaPlayer1-R,
    batalhaPvP(PokemonPlayer1, PokemonPlayer2, 1, NovaVida, VidaPlayer2).
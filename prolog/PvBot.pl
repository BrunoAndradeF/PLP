:-include('Menus.pl').
:-include('Ataques.pl').

iniciaBatalhaPvBot:-
    cls,
    exibeCabecalhoPvBot,
    exibeMenuDeSelecao,
    read(PokemonPlayer),

    cls,
    random(1, 6, PokemonBot),
    writeln("O bot escolheu :"),
    exibePokemon(PokemonBot),
    pausa,

    batalhaPvBot(PokemonPlayer, PokemonBot, 1, 100, 100).


/*-----------------------------------Player-----------------------------------*/
batalhaPvBot(_, _, Vez, VidaPlayer, _):-
    Vez = 1,
    VidaPlayer =< 0,
    cls, exibeBotGanha, pausa.

batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 1,
    cls,
    exibePokemon(PokemonPlayer),
    write("|  vida do Player: "),
    writeln(VidaPlayer),
    write("|  vida do Bot: "),
    writeln(VidaBot),
    exibeAtaques,

    read(Ataque),
    designaAtaque(Ataque, R),

    cls,
    exibePokemon(PokemonPlayer),
    write("Player ataca em: "),
    writeln(R),
    pausa,

    NovaVida is VidaBot-R,
    batalhaPvBot(PokemonPlayer, PokemonBot, 2, VidaPlayer, NovaVida).


/*-----------------------------------Bot-----------------------------------*/
batalhaPvBot(_, _, Vez, _, VidaBot):-
    Vez = 2,
    VidaBot =< 0,
    cls, exibePlayerGanha, pausa.

batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 2,
    random(1, 4, AtqBot),
    designaAtaque(AtqBot, R),

    cls,
    exibePokemon(PokemonBot),
    write("Bot ataca em: "),
    writeln(R),
    pausa,

    NovaVida is VidaPlayer-R,
    batalhaPvBot(PokemonPlayer, PokemonBot, 1, NovaVida, VidaBot).



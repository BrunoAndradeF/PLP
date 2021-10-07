:-include('Menus.pl').
:-include('Ataques.pl').

iniciaBatalhaPvBot:-
    cls,
    exibeCabecalhoPvBot,
    exibeMenuDeSelecao,
    read(PokemonPlayer),

    random(1, 6, PokemonBot),
    batalhaPvBot(PokemonPlayer, PokemonBot, 1, 100, 100).


/*-----------------------------------Player-----------------------------------*/
batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 1,
    VidaPlayer =< 0,
    cls, exibeBotGanha, pausa.

batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 1,
    cls,
    write("vida do bot: "),
    writeln(VidaBot),
    write("vida do Player: "),
    writeln(VidaPlayer),
    exibePokemon(PokemonPlayer),
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
batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 2,
    VidaBot =< 0,
    cls, exibePlayerGanha, pausa.

batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 2,
    cls,
    write("vida do bot: "),
    writeln(VidaBot),
    write("vida do Player: "),
    writeln(VidaPlayer),

    random(1, 4, AtqBot),
    designaAtaque(AtqBot, R),

    cls,
    exibePokemon(PokemonBot),
    write("Bot ataca em: "),
    writeln(R),
    pausa,

    NovaVida is VidaPlayer-R,
    batalhaPvBot(PokemonPlayer, PokemonBot, 1, NovaVida, VidaBot).



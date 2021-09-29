:-include('Menus.pl').
cls :- write('\33\[2J').

main:-
    cls,
    exibeMenuInicial,
    read(X),
    designaModo(X).

designaModo(Modo):-
    Modo = 1,
    iniciaBatalhaPvBot.
designaModo(Modo):-
    Modo = 2,
    writeln("2").
designaModo(Modo):-
    Modo = 3,
    writeln("3").



/*-----------------------------BATALHA PLAYER VS BOT-----------------------------*/
iniciaBatalhaPvBot:-
    cls,
    exibeCabecalhoPvBot,
    exibeMenuDeSelecao,
    read(PokemonPlayer),
    random(1, 7, PokemonBot),
    batalhaPvBot(PokemonPlayer, PokemonBot, 1, 100, 100).

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
    write("Player ataca em: "),
    writeln(R),
    pausa,
    NovaVida is VidaBot-R,
    batalhaPvBot(PokemonPlayer, PokemonBot, 2, VidaPlayer, NovaVida).

batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 2,
    VidaBot =< 0,
    exibePlayerGanha.

batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 2,
    cls,
    write("vida do bot: "),
    writeln(VidaBot),
    write("vida do Player: "),
    writeln(VidaPlayer),
    exibePokemon(PokemonBot),
    random(1, 4, AtqBot),
    designaAtaque(AtqBot, R),
    write("Bot ataca em: "),
    writeln(R),
    pausa,
    NovaVida is VidaPlayer-R,
    batalhaPvBot(PokemonPlayer, PokemonBot, 1, NovaVida, VidaBot).

batalhaPvBot(PokemonPlayer, PokemonBot, Vez, VidaPlayer, VidaBot):-
    Vez = 1,
    VidaPlayer =< 0,
    exibeBotGanha.


/*-----------------------------------ATAQUES-----------------------------------*/
designaAtaque(Ataque, R):-
    Ataque = 1, random(5, 16, R).
designaAtaque(Ataque, R):-
    Ataque = 2, random(5, 26, R).
designaAtaque(Ataque, R):-
    Ataque = 3, random(10, 36, R).
    

danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Zeca Skull", PokemonDef = "SeaHourse";
    PokemonAtaq = "Digglet", PokemonDef = "Zeca Skull";
    PokemonAtaq = "Digglet", PokemonDef = "Pikachu";
    PokemonAtaq = "Digglet", PokemonDef = "Kakuna", R is 10.
danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Digglet", PokemonDef = "SeaHourse";
    PokemonAtaq = "Kakuna", PokemonDef = "Digglet", R is -5.
danoPorTipo(PokemonAtaq, PokemonDef, R):-
    PokemonAtaq = "Pikachu", PokemonDef = "Digglet";
    PokemonAtaq = "Zeca Skull", PokemonDef = "Digglet", R is -5.



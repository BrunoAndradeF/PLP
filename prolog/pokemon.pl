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
    batalhaPvBot(PokemonPlayer, PokemonBot, 1).


batalhaPvBot(PokemonPlayer, PokemonBot, Vez):-
    Vez = 1,
    cls,
    exibePokemon(PokemonPlayer),
    exibeAtaques,
    read(Ataque),
    designaAtaque(Ataque, R),
    write("Player ataca em: "),
    writeln(R),
    /*funcao para realizar ataque*/
    batalhaPvBot(PokemonPlayer, PokemonBot, 2).

batalhaPvBot(PokemonPlayer, PokemonBot, Vez):-
    Vez = 2,
    cls,
    exibePokemon(PokemonBot),
    random(1, 4, AtqBot),
    designaAtaque(AtqBot, R),
    write("Bot ataca em: "),
    writeln(R),
    /*funcao para realizar ataque*/
    batalhaPvBot(PokemonPlayer, PokemonBot, 1).
    






/*-----------------------------------ATAQUES-----------------------------------*/
designaAtaque(Ataque, R):-
    Ataque = 1, curar(R).
designaAtaque(Ataque, R):-
    Ataque = 2, atacar(R).
designaAtaque(Ataque, R):-
    Ataque = 3, ataqueCritico(R).

atacar(R):-
    random(5, 26, R).

curar(R):-
    random(5, 16, R).

ataqueCritico(R):-
    random(10, 36, R).
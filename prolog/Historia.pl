fluxoHist(TimePlayer, _) :-
    length(TimePlayer,R),
    R >= 3,
    cls, exibePlayerGanha, pausa.

fluxoHist(TimePlayer, TimeBot) :-
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

    batalhaHist(NovoTimePLayer, NovoTimeBot, true, 1, 1).


batalhaHist(TimePlayer, TimeBot, Vez, NumP, NumB):-

    Vez,
    cls,

    getPokemon(NumP, TimePlayer, PokemonPlayer),
    (NomeP, VidaP) = PokemonPlayer,

    getPokemon(NumB, TimeBot, PokemonBot),
    (_, VidaB) = PokemonBot,

    exibePokemon(NomeP),
    write("|  vida do Player: "),
    writeln(VidaP),
    write("|  vida do Bot: "),
    writeln(VidaB),
    exibeAtaques,

    read(Ataque),
    designaAtaque(Ataque, ValorAtaque),

    cls,
    exibePokemon(NomeP),
    write("Voce ataca em: "),
    writeln(ValorAtaque),
    pausa,

    alteraHP(ValorAtaque, PokemonBot, PokemonAlterado),
    alteraTime(NumB, TimeBot, PokemonAlterado, TimeAlterado),

    writeln("Fim do turno"),
    pausa.

batalhaHist(TimePlayer, TimeBot, Vez, NumP, NumB):-
    not(Vez),
    random(1, 4, AtqBot),
    designaAtaque(AtqBot, ValorAtaque),

    getPokemon(NumB, TimeBot, PokemonBot),
    (NomeB, _) = PokemonBot,

    cls,
    exibePokemon(NomeB),
    write("Bot ataca em: "),
    writeln(ValorAtaque),
    pausa,

    getPokemon(NumP, TimePlayer, PokemonPlayer),

    alteraHP(ValorAtaque, PokemonPlayer, PokemonAlterado),
    alteraTime(numB, TimePlayer, PokemonAlterado, TimeAlterado),

    cls,
    writeln("Fim do turno"),
    pausa.



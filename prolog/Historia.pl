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

    batalhaHist(NovoTimePLayer, NovoTimeBot, 1, 1, 1).


batalhaHist(TimePlayer, TimeBot, 1, NumP, NumB):-
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
    exibeAtaque(ValorAtaque, "Voce"),
    pausa,

    aplicaAtaqueHist(ValorAtaque, TimePlayer, TimeBot, NumP, NumB, PokemonPlayer, PokemonBot, TimePlayerAlterado, TimeBotAlterado),
    fimDoTurno(TimePlayerAlterado, TimeBotAlterado, 1, NumP, NumB).

batalhaHist(TimePlayer, TimeBot, 2, NumP, NumB):-
    random(1, 4, AtqBot),
    designaAtaque(AtqBot, ValorAtaque),

    getPokemon(NumB, TimeBot, PokemonBot),
    (NomeB, _) = PokemonBot,
    getPokemon(NumP, TimePlayer, PokemonPlayer),

    cls,
    exibePokemon(NomeB),
    exibeAtaque(ValorAtaque, "O bot"),
    pausa,

    aplicaAtaqueHist(ValorAtaque, TimeBot, TimePlayer, NumB, NumP, PokemonBot, PokemonPlayer, TimeBotAlterado, TimePlayerAlterado),
    fimDoTurno(TimePlayerAlterado, TimeBotAlterado, 2, NumP, NumB).

fimDoTurno(TimePlayer, TimeBot, 1, NumP, NumB):-
    verificaPerdeu(TimeBot,Retorno),
    Retorno ->

    cls,
    writeln("voce venceu uma batalha"),
    pausa,

    curaTime(TimePlayer, TimePlayerCurado),
    curaTime(TimeBot, TimeBotCurado),
    fluxoHist(TimePlayerCurado, TimeBotCurado)
    ;

    getPokemon(NumB, TimeBot,PokemonBot),
    isVivo(PokemonBot)->
    batalhaHist(TimePlayer,TimeBot,2,NumP,NumB)
    ;

    getPokemonVivo(TimeBot, NovoNumB),
    batalhaHist(TimePlayer,TimeBot,2,NumP,NovoNumB).

fimDoTurno(TimePlayer, TimeBot, 2, NumP, NumB):-
    verificaPerdeu(TimePlayer,Retorno),
    Retorno ->
    cls,exibeBotGanha,pausa
    ;

    getPokemon(NumP, TimePlayer,PokemonPlayer),
    isVivo(PokemonPlayer)->
    batalhaHist(TimePlayer,TimeBot,1,NumP,NumB)
    ;

    getPokemonVivo(TimePlayer,NovoNumP),
    batalhaHist(TimePlayer,TimeBot,1,NovoNumP,NumB).


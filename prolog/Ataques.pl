designaAtaque(1, R):-
    random(14, 16, R).
designaAtaque(2, R):-
    random(15, 26, Aux),
    R is Aux * -1.
designaAtaque(3, R):-
    random(0, 40, Aux),
    R is Aux * -1.

exibeAtaque(ValorAtaque, Atacante):-
    ValorAtaque > 0 ->
    write(Atacante),
    write(" se cura em: "),
    writeln(ValorAtaque)
    ;
    Aux is ValorAtaque * -1,
    write(Atacante),
    write(" ataca em: "),
    writeln(Aux).

aplicaAtaque(ValorAtaque, VidaAtacante, VidaDefensor, VidaAtacanteAlterada, VidaDefensor):-
    ValorAtaque > 0,
    VidaAtacanteAlterada is VidaAtacante + ValorAtaque.
aplicaAtaque(ValorAtaque, VidaAtacante, VidaDefensor, VidaAtacante, VidaDefensorAlterada):-
    VidaDefensorAlterada is VidaDefensor + ValorAtaque.

aplicaAtaqueHist(ValorAtaque, TimeAtacante, TimeDefensor, NumA, _, PokeA, _, TimeA_Alterado, TimeDefensor):-
    ValorAtaque > 0,
    alteraHP(ValorAtaque, PokeA, PokemonAlterado),
    alteraTime(NumA, TimeAtacante, PokemonAlterado, TimeA_Alterado).
aplicaAtaqueHist(ValorAtaque, TimeAtacante, TimeDefensor, _, NumD, _, PokeD, TimeAtacante, TimeD_Alterado):-
    alteraHP(ValorAtaque, PokeD, PokemonAlterado),
    alteraTime(NumD, TimeDefensor, PokemonAlterado, TimeD_Alterado).


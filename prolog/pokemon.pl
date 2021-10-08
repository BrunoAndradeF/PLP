:-include('Menus.pl').
:-include('Pvp.pl').
:-include('PvBot.pl').
:-include('Historia.pl').
cls :- write('\33\[2J').

main:-
    cls,
    exibeMenuInicial,
    read(X),
    designaModo(X),
    main.

designaModo(Modo):-
    Modo = 1,
    iniciaBatalhaPvBot.
designaModo(Modo):-
    Modo = 2,
    iniciaBatalhaPvP.
designaModo(Modo):-
    Modo = 3,
    fluxoHist([], [], 1).

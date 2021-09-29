

exibePokemon(X):-
        X = 1, exibeZeca.
exibePokemon(X):-
        X = 2, exibePikachu.
exibePokemon(X):-
        X = 3, exibeSeaHourse.
exibePokemon(X):-
        X = 4, exibeKakuna.
exibePokemon(X):-
        X = 5, exibeDigglet.
exibePokemon(X):-
        X = 6, exibeEevee.

informacoesDeAtaque(Ataque, Vez):-
        Ataque = 1, Vez = 1, writeln().
informacoesDeAtaque(Ataque, Vez):-
        Ataque = 1, Vez = 1, writeln().
informacoesDeAtaque(Ataque, Vez):-
        Ataque = 1, Vez = 1, writeln().
informacoesDeAtaque(Ataque, Vez):-
        Ataque = 1, Vez = 1, writeln().
informacoesDeAtaque(Ataque, Vez):-
        Ataque = 1, Vez = 1, writeln().
informacoesDeAtaque(Ataque, Vez):-
        Ataque = 1, Vez = 1, writeln().



exibeMenuInicial:-
        writeln(" ______________________________________________________________________"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                   888                                                |"),
        writeln("|                   888                                                |"),
        writeln("|                   888                                                |"),
        writeln("| 88888b.   .d88b.  888  888  .d88b.  88888b.d88b.   .d88b.  88888b.   |"),
        writeln("| 888  88b d88  88b 888 .88P d8P  Y8b 888  888  88b d88  88b 888  88b  |"),
        writeln("| 888  888 888  888 888888K  88888888 888  888  888 888  888 888  888  |"),
        writeln("| 888 d88P Y88..88P 888  88b Y8b.     888  888  888 Y88..88P 888  888  |"),
        writeln("| 88888P     Y88P   888  888   Y8888  888  888  888   Y88    888  888  |"),
        writeln("| 888                                                                  |"),
        writeln("| 888                  ______  _______ _______ _______        _______  |"),
        writeln("| 888                  |_____] |_____|    |       |    |      |______  |"),
        writeln("|                      |_____] |     |    |       |    |_____ |______  |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|______________________________________________________________________|"),
        writeln("                                                                        "),
        writeln("                      ~ESCOLHA O MODO DE JOGO~                          "),
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                  Digite 1 para Player vs Bot                         |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                  Digite 2 para Player vs Player                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                  Digite 3 para modo historia                         |"),
        writeln("|                                                                      |"),
        writeln("|______________________________________________________________________|").

exibeCabecalhoPvBot:-
        
        writeln(" ______________________________________________________________________"),
        writeln("|  8888888b.  888                                                      |"),
        writeln("|  888   Y88b 888                                                      |"),
        writeln("|  888    888 888                                                      |"),
        writeln("|  888   d88P 888  8888b.  888  888  .d88b.  888d888                   |"),
        writeln("|  8888888P   888     _88b 888  888 d8P  Y8b 888P                      |"),
        writeln("|  888        888 .d888888 888  888 88888888 888                       |"),
        writeln("|  888        888 888  888 Y88b 888 Y8b.     888                       |"),
        writeln("|  888        888  Y888888   Y88888   Y8888  888                       |"),
        writeln("|                               888                                    |"),
        writeln("|  888     888  .d8888b.   Y8b d88P 888888b.    .d88888b. 88888888888  |"),
        writeln("|  888     888 d88P  Y88b    Y88P   888   88b  d88P   Y88b    888      |"),
        writeln("|  888     888 Y88b.                888  .88P  888     888    888      |"),
        writeln("|  Y88b   d88P   Y888b.             8888888K.  888     888    888      |"),
        writeln("|   Y88b d88P       Y88b.           888   Y88b 888     888    888      |"),
        writeln("|    Y88o88P          888           888    888 888     888    888      |"),
        writeln("|     Y888P    Y88b  d88P           888   d88P Y88b. .d88P    888      |"),
        writeln("|      Y8P       Y8888P             8888888P     Y88888P      888      |"),
        writeln("|______________________________________________________________________|").

exibeCabecalhoPvP:-
        writeln(" ______________________________________________________________________"),
        writeln("|  8888888b.  888                                                      |"),
        writeln("|  888   Y88b 888                                                      |"),
        writeln("|  888    888 888                                                      |"),
        writeln("|  888   d88P 888  8888b.  888  888  .d88b.  888d888                   |"),
        writeln("|  8888888P   888     _88b 888  888 d8P  Y8b 888P                      |"),
        writeln("|  888        888 .d888888 888  888 88888888 888                       |"),
        writeln("|  888        888 888  888 Y88b 888 Y8b.     888                       |"),
        writeln("|  888        888  Y888888   Y88888   Y8888  888                       |"),
        writeln("|                               888                                    |"),
        writeln("|                          Y8b d88P                                    |"),
        writeln("| oooooooooo.                Y88P                                      |"),
        writeln("| `888'   `Y8b                                                         |"),
        writeln("|  888     888     o   ooooooooooo ooooooooooo ooooo       ooooooooooo |"),
        writeln("|  888oooo888'    888  88  888  88 88  888  88  888         888    88  |"),
        writeln("|  888    `88b   8  88     888         888      888         888ooo8    |"),
        writeln("|  888    .88P  8oooo88    888         888      888      o  888    oo  |"),
        writeln("| o888bood8P' o88o  o888o o888o       o888o    o888ooooo88 o888ooo8888 |"),
        writeln("|______________________________________________________________________|").

exibeCabecalhoHistoria:-
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),
        writeln("|                     .o8                                              |"),
        writeln("|           .oooo.o .o888oo  .ooooo.  oooo d8b oooo    ooo             |"),
        writeln("|          d88(   8   888   d88' `88b `888 8P  `88.  .8'               |"),
        writeln("|          ` Y88b.    888   888   888  888       `88..8'               |"),
        writeln("|          o.  )88b   888 . 888   888  888        `888'                |"),
        writeln("|          860888P'    888  `Y8bod8P' d888b        .8'                 |"),
        writeln("|                                              .o..P'                  |"),
        writeln("|                                              `Y8P'                   |"),
        writeln("|                                           .o8                        |"),
        writeln("|                                          '888                        |"),
        writeln("|         ooo. .oo.  .oo.    .ooooo.   .oooo888   .ooooo.              |"),
        writeln("|         `888P Y88bP Y88b  d88' `88b d88' `888  d88' `88b             |"),
        writeln("|          888   888   888  888   888 888   888  888ooo888             |"),
        writeln("|          888   888   888  888   888 888   888  888    .o             |"),
        writeln("|         o888o o888o o888o `Y8bod8P' `Y8bod88P  `Y8bod8P'             |"),
        writeln("|                                                                      |"),
        writeln("|______________________________________________________________________|").

exibeMenuDeSelecao:-
        writeln("                                                                        "),
        writeln("                      ~ESCOLHA O SEU POKEMON~                           "),
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),
        writeln("|                    Digite 1 para Zeca skull                          |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 2 para Pikachu                             |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 3 para SeaHourse                           |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 4 para Kakuna                              |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 5 para Digglet                             |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 6 para Eevee                               |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 7 para voltar                              |"),
        writeln("|______________________________________________________________________|").
exibeMenuDeSelecaoPlayer1:-
        writeln("                                                                        "),
        writeln("                  ~PLAYER 1 ESCOLHA O SEU POKEMON~                      "),
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),
        writeln("|                    Digite 1 para Zeca skull                          |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 2 para Pikachu                             |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 3 para SeaHourse                           |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 4 para Kakuna                              |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 5 para Digglet                             |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 6 para Eevee                               |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 7 para voltar                              |"),
        writeln("|______________________________________________________________________|").
exibeMenuDeSelecaoPlayer2:-
        writeln("                                                                        "),
        writeln("                  ~PLAYER 2 ESCOLHA O SEU POKEMON~                      "),
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),
        writeln("|                    Digite 1 para Zeca skull                          |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 2 para Pikachu                             |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 3 para SeaHourse                           |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 4 para Kakuna                              |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 5 para Digglet                             |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 6 para Eevee                               |"),
        writeln("|                                                                      |"),
        writeln("|                    Digite 7 para voltar                              |"),
        writeln("|______________________________________________________________________|").

exibeZeca:-
        writeln(" ______________________________________________________________________"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                         ,-,,-,                       |"),
        writeln("|                                   _____/     /_____                  |"),
        writeln("|                                  (_________________)                 |"),
        writeln("|                                       |() () |                       |"),
        writeln("|                                    (  | oo   |                       |"),
        writeln("|_____________________________________)_`|  |--'_______________________|"),
        writeln("|                -                   (___^^^^|                         |"),
        writeln("|         __          _                 (____'    -- Elmar Kurgpold    |"),
        writeln("|        (  )_              ____                    __                 |"),
        writeln("|       (___( )                   -                                    |"),
        writeln("|                       __                                             |"),
        writeln("|     ___                                                              |"),
        writeln("|                -                           __                        |"),
        writeln("|                                         _                            |"),
        writeln("|                                                                      |"),
        writeln("|______________________________________________________________________|").

exibeDigglet:-
        writeln(" ______________________________________________________________________"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                           .''''''.                                   |"),
        writeln("|                          ;        ;                                  |"),
        writeln("|                         ;  HP  HP  ;                                 |"),
        writeln("|                        ;   H   H    ;               ____             |"),
        writeln("|                        ;     ___    ;              /                 |"),
        writeln("|________________________;    (___)   ;_____________|______|___________|"),
        writeln("|             -          ;            ;      _                         |"),
        writeln("|                        ;            ;                              - |"),
        writeln("|           O           h;            ;g                               |"),
        writeln("|                     jg ggh      hgj gggf            __               |"),
        writeln("|        __         og  h   hgfgfj   f  j gh                           |"),
        writeln("|                     gh h  h      hg  g                         __    |"),
        writeln("|______________________________________________________________________|").

exibeKakuna:-
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),  
        writeln("|                            _.---._                                   |"),
        writeln("|                          .'       '.                                 |"),
        writeln("|                         |           |                                |"),
        writeln("|                        { !'-.   .-'! }                               |"),
        writeln("|                        '.`^^^` `^^^`.'                               |"),
        writeln("|                         !'-._   _.-'!                                |"),
        writeln("|                        !_.-- `-`/--._!                               |"),
        writeln("|                        ;    |'-'|    ;                               |"),
        writeln("|                        |  .'/ |  '.  |                               |"),
        writeln("|                        |  |   |   |  |                               |"),
        writeln("|________________________ |  !  |  !  | _______________________________|"),
        writeln("|                          !_! `_´ !_!                                 |"),
        writeln("|                           |-'` `'-|                                  |"),
        writeln("|                 _         |.-^^^-.|           _                      |"),
        writeln("|            __         jgs ! .---. !               __                 |"),
        writeln("|                            '._ _.'                                   |"),
        writeln("|       __          ^^^^^^^         ^^^^^^^              __            |"),
        writeln("|                           ^^^^^^^^                                   |"),
        writeln("|______________________________________________________________________|").

exibeEevee:-
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                     ;-.                ,                             |"),
        writeln("|                      `, '.           .'/                             |"),
        writeln("|                        `  ! .---. .-' /                              |"),
        writeln("|                         '. '     ` _.'                               |"),
        writeln("|                           |(),()  |     ,                            |"),
        writeln("|                           (  __   /   .' ?                           |"),
        writeln("|                          .''.___.'--,/ _,|                           |"),
        writeln("|                         {  /     !   }   |                           |"),
        writeln("|__________________________'.!     /_.'    /___________________________|"),
        writeln("|                           |'-.-',  `; _.'                            |"),
        writeln("|            ____       jgs |  |  |   |`          ____                 |"),
        writeln("|        ____               `^^`^^`^ ^`               ____             |"),
        writeln("|    ____                                                 ____         |"),
        writeln("|                 ____                       ____                      |"),
        writeln("|                     ____               ____                          |"),
        writeln("|                                                                      |"),
        writeln("|______________________________________________________________________|").

exibePikachu:-
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                      |`.     ;;,            ,;;'                     |"),
        writeln("|                      |  `!    ! '.        .'.'                       |"),
        writeln("|                      |    `!   !  '-""""-' /                         |"),
        writeln("|                      `.     `! /          |`                         |"),
        writeln("|                        `>    /;   _     _ !                          |"),
        writeln("|                         /   / |       .    ;                         |"),
        writeln("|                        <  (` ;! ()   ~~~  ()_                        |"),
        writeln("|                         ';;!  `,     __ _.-'` )                      |"),
        writeln("|                           >;           `   _.'                       |"),
        writeln("|                           `;;!          !-'                          |"),
        writeln("|_____________________________;/           ! _ ________________________|"),
        writeln("|                             |   ,  .     .` ?                        |"),
        writeln("|  ---         ---            |      _|   '   /           ----         |"),
        writeln("|     ---   ---                ;    / )     .;-,              --       |"),
        writeln("|        ---              jgs   !    /  __   .-'       ---             |"),
        writeln("|            ----                !,_/- `  `-'                          |"),
        writeln("|                 ----                                      ----       |"),
        writeln("|______________________________________________________________________|").


exibeSeaHourse:-
        writeln(" ______________________________________________________________________"),
        writeln("|                                                                      |"),
        writeln("|                                                                      |"),
        writeln("|                               O                                      |"),
        writeln("|                            O                                         |"),
        writeln("|                                     ^                                |"),
        writeln("|                                      ´´/                             |"),
        writeln("|                                o    /o `))                           |"),
        writeln("|                                    /_/                               |"),
        writeln("|                                        _ss))                         |"),
        writeln("|                                        |_ss))/|                      |"),
        writeln("|                                       |__ss))_|                      |"),
        writeln("|                                      |__sss))_|                      |"),
        writeln("|                                      |___ss))                        |"),
        writeln("|                                       |_ss))                         |"),
        writeln("|                                        )_s))                         |"),
        writeln("|                                  (`(  /_s))                          |"),
        writeln("|                                   (_                                 |"),
        writeln("|                                      /_s))                           |"),
        writeln("|                                    (                                 |"),
        writeln("|                                      /))                             |"), 
        writeln("|______________________________________________________________________|"),
        writeln("| .                                       .                           -|"),
        writeln("|            ,       .                                     o.          |"),
        writeln("|______________________________________________________________________|").


exibeAtaques:-
        writeln("                                                                        "),
        writeln("                         ~ESCOLHA O SEU ATAQUE~                         "),
        writeln(" ________________________________   ___________________________________ "),
        writeln("|                                | |                                   |"),
        writeln("|        Digite 1 para Cura      | |       Digite 2 para Ataque        |"),
        writeln("|________________________________| |___________________________________|"),
        writeln("                   ________________________________                     "),
        writeln("                  |                                |                    "),
        writeln("                  |      Digite 3 para Critico     |                    "),
        writeln("                  |________________________________|                    "),
        writeln("                                                                        "),               
        writeln("                                                                        ").

exibeOpcaoInvalida:-
        writeln(" ______________________________________________________________________ "),
        writeln("|                                                                      |"),
        writeln("|                    Opcao invalida, tente novamente!                  |"),
        writeln("|______________________________________________________________________|").

exibePlayerGanha:-
        writeln(""),
        writeln("                         Você derrotou o bot"),
        writeln(""),
        writeln(" ______________________________________________________________________ "),
        writeln("|  8888888b.  888                                                      |"),
        writeln("|  888   Y88b 888                                                      |"),
        writeln("|  888    888 888                                                      |"),
        writeln("|  888   d88P 888  8888b.  888  888  .d88b.  888d888                   |"),
        writeln("|  8888888P   888     _88b 888  888 d8P  Y8b 888P                      |"),
        writeln("|  888        888 .d888888 888  888 88888888 888                       |"),
        writeln("|  888        888 888  888 Y88b 888 Y8b.     888                       |"),
        writeln("|  888        888  Y888888   Y88888   Y8888  888                       |"),
        writeln("|                               888                                    |"),
        writeln("|  888       888 d8b       Y8b d88P                                    |"),
        writeln("|  888   o   888 Y8P         Y88P                                      |"),
        writeln("|  888  d8b  888                                                       |"),
        writeln("|  888 d888b 888 888 88888b.  .d8888b                                  |"),
        writeln("|  888d88888b888 888 888  88b 88K                                      |"),
        writeln("|  88888P Y88888 888 888  888  Y8888b.                                 |"),
        writeln("|  8888P   Y8888 888 888  888      X88                                 |"),
        writeln("|  888P     Y888 888 888  888  88888P'                                 |"),
        writeln("|______________________________________________________________________|").

exibeBotGanha:-
        writeln(""),
        writeln("                          O bot te derrotou"),
        writeln(""),
        writeln(" ______________________________________________________________________ "),
        writeln("|  888888b.    .d88888b. 88888888888                                   |"),
        writeln("|  888   88b  d88P   Y88b    888                                       |"),
        writeln("|  888  .88P  888     888    888                                       |"),
        writeln("|  8888888K.  888     888    888                                       |"),
        writeln("|  888   Y88b 888     888    888                                       |"),
        writeln("|  888    888 888     888    888                                       |"),
        writeln("|  888   d88P Y88b. .d88P    888                                       |"),
        writeln("|  8888888P     Y88888P      888                                       |"),
        writeln("|                                           'humano fraco'             |"),
        writeln("|  888       888 d8b                                 _____             |"),
        writeln("|  888   o   888 Y8P                                |     |            |"),
        writeln("|  888  d8b  888                                    | | | |            |"),
        writeln("|  888 d888b 888 888 88888b.  .d8888b               |_____|            |"),
        writeln("|  888d88888b888 888 888  88b 88K             ____ ___|_|___ ____      |"),
        writeln("|  88888P Y88888 888 888  888  Y8888b.       ()___)         ()___)     |"),
        writeln("|  8888P   Y8888 888 888  888      X88       // /|           |         |"),
        writeln("|  888P     Y888 888 888  888  88888P'      // / |           |         |"),
        writeln("|                                                                      |"),
        writeln("|______________________________________________________________________|").

exibePlayer1Ganha:-
        writeln(" ______________________________________________________________________ "),
        writeln("|  8888888b.  888                                                      |"),
        writeln("|  888   Y88b 888                                                      |"),
        writeln("|  888    888 888                                                      |"),
        writeln("|  888   d88P 888  8888b.  888  888  .d88b.  888d888                   |"),
        writeln("|  8888888P   888     _88b 888  888 d8P  Y8b 888P        d888          |"),
        writeln("|  888        888 .d888888 888  888 88888888 888        d8888          |"),
        writeln("|  888        888 888  888 Y88b 888 Y8b.     888          888          |"),
        writeln("|  888        888  Y888888   Y88888   Y8888  888          888          |"),
        writeln("|                               888                       888          |"),
        writeln("|  888       888 d8b       Y8b d88P                       888          |"),
        writeln("|  888   o   888 Y8P         Y88P                       8888888        |"),
        writeln("|  888  d8b  888                                        8888888        |"),
        writeln("|  888 d888b 888 888 88888b.  .d8888b                                  |"),
        writeln("|  888d88888b888 888 888  88b 88K                                      |"),
        writeln("|  88888P Y88888 888 888  888  Y8888b.                                 |"),
        writeln("|  8888P   Y8888 888 888  888      X88                                 |"),
        writeln("|  888P     Y888 888 888  888  88888P'                                 |"),
        writeln("|______________________________________________________________________|").

exibePlayer2Ganha:-
        writeln(" ______________________________________________________________________ "),
        writeln("|  8888888b.  888                                                      |"),
        writeln("|  888   Y88b 888                                                      |"),
        writeln("|  888    888 888                                                      |"),
        writeln("|  888   d88P 888  8888b.  888  888  .d88b.  888d888                   |"),
        writeln("|  8888888P   888     _88b 888  888 d8P  Y8b 888P                      |"),
        writeln("|  888        888 .d888888 888  888 88888888 888        .d8888b.       |"),
        writeln("|  888        888 888  888 Y88b 888 Y8b.     888       d88P  Y88b      |"),
        writeln("|  888        888  Y888888   Y88888   Y8888  888              888      |"),
        writeln("|                               888                         .d88P      |"),
        writeln("|  888       888 d8b       Y8b d88P                     .od888P        |"),
        writeln("|  888   o   888 Y8P         Y88P                       d88P           |"),
        writeln("|  888  d8b  888                                       8888    d8      |"),
        writeln("|  888 d888b 888 888 88888b.  .d8888b                  8888888888      |"),
        writeln("|  888d88888b888 888 888  88b 88K                                      |"),
        writeln("|  88888P Y88888 888 888  888  Y8888b.                                 |"),
        writeln("|  8888P   Y8888 888 888  888      X88                                 |"),
        writeln("|  888P     Y888 888 888  888  88888P'                                 |"),
        writeln("|______________________________________________________________________|").

pausa:-
    writeln("Digite: '1.' para continuar"),
    read(X).
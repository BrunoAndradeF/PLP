# PLP - Pokemon Battle
Repositório para desenvolver projeto em Plp 2020.2

- [DOC](https://docs.google.com/document/d/1WI50JorZAW0hgNbR-MqGb3jKC5XCZhh-jDRoMGqpdPc/edit)

## Descrição dos modos:



- Player vs Player: 2 jogares batalham(1 contra 1) escolhendo entre os 6 pokémons listados até um deles ter seu pokémon derrotado.
- Player vs Bot: 1 jogador batalha contra o computador(1 contra 1) escolhendo entre os 6 pokémons listados enquanto o computador sorteia seu pokémon e escolhe qual lançar a partir dos tipos que o jogador escolher.
- Modo História: O jogador passa por 3 batalhas contra bots para conquistar sua insígnia, tendo possibilidade de salvar o progresso das lutas para continuar depois. Um exemplo disso é o jogador ganhar uma batalha ou duas e resolver deixar para lutar o que falta posteriormente, caso ele perca para algum adversário, o modo se encerra como uma derrota.
### Instruções para executar o jogo:
- Para utilizar o programa, é preciso clonar o repositório com o jogo.
```
git clone https://github.com/Bruno-af/PLP
cd PLP  
..
```
#### Versão Haskell
- Ter haskell instalado em sua máquina
- Instalar a biblioteca System.Random
```
cabal update
cabal install --lib random
```

Feito isso, rode o jogo com o ghci via terminal
#### Versão Prolog
- Ter o [SWI-Prolog](https://www.swi-prolog.org/download/stable) instalado em sua máquina
- Feito isso, execute o jogo via o SWI-Prolog.

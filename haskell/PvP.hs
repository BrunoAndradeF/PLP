module PvP where
import MenusGraficos
import Ataques
import System.Process
import System.IO
import Util

--Define a vez de jogar (1 para Player1 e 2 para o bot)
type Vez = Int

inicioPvP :: Pokemons -> Pokemons -> IO()
inicioPvP pokesp1 pokesp2= do
        exibeCabecalhoPvP
        menuDeSelecaoPlayer1 pokesp1 pokesp2


menuDeSelecaoPlayer1 :: Pokemons -> Pokemons -> IO()
menuDeSelecaoPlayer1 pokesP1 pokesP2 = do
        exibeMenuDeSelecao 1
        aux <- readLn :: IO Int
        system "cls"
        let op1 = aux - 1

        if  op1 >= 0 && op1 <= 5 then do
                let pokeDoPlayer1 = nomesPokemons !! op1
                addPokemon  pokesP1 (Pokemon pokeDoPlayer1 100 False False) "p1"

                putStrLn ("Player 1 escolheu o: " ++ pokeDoPlayer1)
                exibePokemons pokeDoPlayer1
                pausa
                menuDeSelecaoPlayer2 (Pokemon pokeDoPlayer1 100 False False:pokesP1) pokesP2 pokeDoPlayer1

        else do
                if op1 == 6 then return ()
                else do
                        exibeOpcaoInvalida
                        pausa
                        menuDeSelecaoPlayer1 pokesP1 pokesP2

        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

menuDeSelecaoPlayer2 :: Pokemons -> Pokemons -> String -> IO()
menuDeSelecaoPlayer2 pokesP1 pokesP2 pokeDoPlayer1 = do
        system "cls"
        exibeMenuDeSelecao 2
        aux <- readLn :: IO Int
        system "cls"
        let op2 = aux - 1

        if  op2 >= 0 && op2 <= 5 then do
                let pokeDoPlayer2 = nomesPokemons !! op2
                addPokemon  pokesP2 (Pokemon pokeDoPlayer2 100 False False) "p2"

                putStrLn ("Player 2 escolheu o: " ++ pokeDoPlayer2)
                exibePokemons pokeDoPlayer2
                pausa
                batalhaPvP pokesP1 (Pokemon pokeDoPlayer2 100 False False:pokesP2) 1

        else do
                if op2 == 6 then do
                        limpaTimes
                        menuDeSelecaoPlayer1 [] []
                else do
                        exibeOpcaoInvalida
                        pausa
                        menuDeSelecaoPlayer2 pokesP1 pokesP2 pokeDoPlayer1

        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]


batalhaPvP :: Pokemons -> Pokemons -> Util.Vez -> IO()
batalhaPvP (Pokemon nomeP1 player1HP s1P1 s2P1:pokesP1)
        (Pokemon nomeP2 player2HP s1P2 s2P2:pokesP2) vez = do

        system "cls"
        if vez == 1 then do
                exibePokemons nomeP1
                exibeEstadoBatalhaPvp player1HP player2HP vez
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op nomeP1 nomeP2

                        if op == 1 then do
                                setVida (Pokemon nomeP1 player1HP s1P1 s2P1:pokesP1) valorAtaque "p1" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 1 se cura em " ++ show valorAtaque)

                        else do
                                setVida (Pokemon nomeP2 player2HP s1P2 s2P2:pokesP2) valorAtaque "p2" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 1 ataca em " ++ show (-1 * valorAtaque))


                        aux <- getTime "p1"
                        aux2 <- getTime "p2"

                        let vidaAtualPlayer1 = getVida aux 1
                        let vidaAtualPlayer2 = getVida aux2 1

                        if vidaAtualPlayer2 <= 0 then do
                                limpaTimes
                                exibePlayer1Ganha
                                pausa
                                system "cls"
                                inicioPvP [] []

                        else do
                                putStrLn ""
                                exibePokemons nomeP1
                                pausa
                                system "cls"
                                batalhaPvP (Pokemon nomeP1 vidaAtualPlayer1 s1P1 s2P1:pokesP1)
                                        (Pokemon nomeP2 vidaAtualPlayer2 s1P2 s2P2:pokesP2)  2
                else do
                        exibeOpcaoInvalida
                        pausa
                        batalhaPvP (Pokemon nomeP1 player1HP s1P1 s2P1:pokesP1)
                                (Pokemon nomeP2 player2HP s1P2 s2P2:pokesP2)  1

        else do
                exibePokemons nomeP2
                exibeEstadoBatalhaPvp player1HP player2HP vez
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op nomeP1 nomeP2

                        if op == 1 then do
                                setVida (Pokemon nomeP2 player2HP s1P2 s2P2:pokesP2) valorAtaque "p2" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 2 se cura em " ++ show valorAtaque)

                        else do
                                setVida (Pokemon nomeP1 player1HP s1P1 s2P1:pokesP1) valorAtaque "p1" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 2 ataca em " ++ show (-1 * valorAtaque))

                        aux <- getTime "p1"
                        aux2 <- getTime "p2"

                        let vidaAtualPlayer1 = getVida aux 1
                        let vidaAtualPlayer2 = getVida aux2 1

                        if vidaAtualPlayer1 <= 0 then do
                                limpaTimes
                                exibePlayer2Ganha
                                pausa
                                system "cls"
                                inicioPvP [] []

                        else do
                                putStrLn ""
                                exibePokemons nomeP2
                                pausa
                                system "cls"
                                batalhaPvP (Pokemon nomeP1 vidaAtualPlayer1 s1P1 s2P1:pokesP1)
                                        (Pokemon nomeP2 vidaAtualPlayer2 s1P2 s2P2:pokesP2)  1
                else do
                        exibeOpcaoInvalida
                        pausa
                        batalhaPvP (Pokemon nomeP1 player1HP s1P1 s2P1:pokesP1)
                                (Pokemon nomeP2 player2HP s1P2 s2P2:pokesP2)  2



module PvP where
import MenusGraficos
import Ataques
import System.Process
import System.IO
import PlayerOneMovimentos
import PlayerTwoMovimentos
import Control.Concurrent

--Define a vez de jogar (1 para Player1 e 2 para o bot)
type Vez = Int

inicioPvP :: IO()
inicioPvP = do
        menuDeSelecaoPlayer1
        
        
menuDeSelecaoPlayer1 :: IO()
menuDeSelecaoPlayer1 = do
        exibeCabecalhoPvP
        exibeMenuDeSelecao 1
        aux <- readLn :: IO Int
        system "cls"
        let op1 = aux - 1

        if  op1 >= 0 && op1 <= 5 then do
                putStrLn ("Player 1 escolheu o: " ++ (nomesPokemons !! op1))
                exibePokemons (nomesPokemons !! op1)
                pausa
                menuDeSelecaoPlayer2 op1

        else do
                if op1 == 6 then return ()
                else do
                        system "cls"
                        putStrLn ""
                        exibeCabecalhoPvP
                        exibeOpcaoInvalida
                        threadDelay 2000000
                        system "cls"
                        menuDeSelecaoPlayer1

        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

menuDeSelecaoPlayer2 :: Int -> IO()
menuDeSelecaoPlayer2 op1 = do
        system "cls"
        exibeCabecalhoPvP
        exibeMenuDeSelecao 2
        aux <- readLn :: IO Int
        system "cls"
        let op2 = aux - 1

        if  op2 >= 0 && op2 <= 5 then do
                putStrLn ("Player 2 escolheu o: " ++ (nomesPokemons !! op2))
                exibePokemons (nomesPokemons !! op2)
                pausa
                batalhaPvP (nomesPokemons !! op1) (nomesPokemons !! op2) 1

        else do
                if op2 == 6 then menuDeSelecaoPlayer1
                else do
                        system "cls"
                        putStrLn ""
                        exibeCabecalhoPvP
                        exibeOpcaoInvalida
                        threadDelay 2000000
                        system "cls"
                        menuDeSelecaoPlayer2 op1

        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]


batalhaPvP :: String -> String-> Vez -> IO()
batalhaPvP player1 player2 vez = do
        system "cls"
        if vez == 1 then do
                exibePokemons player1
                player1HP <- getVidaPlayer1
                player2HP <- getVidaPlayer2
                exibeEstadoBatalhaPvp player1HP player2HP vez
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op player1 player2

                        if op == 1 then do 
                                atualizaVidaPlayer1 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 1 se cura em " ++ show valorAtaque)
                                
                        else do 
                                atualizaVidaPlayer2 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 1 ataca em " ++ show valorAtaque)

                                arq <- openFile "ArquivosPlayerTwo/pokemonVidaPlayer2.txt" ReadMode
                                vidaP2 <- hGetLine arq
                                hClose arq

                                if read vidaP2 <= 0 then do
                                        guardaDadosVidaPlayer1 100
                                        guardaDadosVidaPlayer2 100

                                        exibePlayer1Ganha
                                        pausa
                                        system "cls"
                                        print ""
                                else do
                                        putStrLn ""
                                        exibePokemons player1
                                        pausa
                                        system "cls"
                                        batalhaPvP player1 player2 2   
                else do
                        system "cls"
                        putStrLn ""
                        exibePokemons player1
                        exibeOpcaoInvalida
                        threadDelay 2000000
                        system "cls"
                        batalhaPvP player1 player2 1
                              
        else do
                exibePokemons player2
                player1HP <- getVidaPlayer1
                player2HP <- getVidaPlayer2
                exibeEstadoBatalhaPvp player1HP player2HP vez
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op player2 player1

                        if op == 1 then do
                                atualizaVidaPlayer2 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 2 se cura em " ++ show valorAtaque)
                                
                        else do
                                atualizaVidaPlayer1 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 2 ataca em " ++ show valorAtaque)

                                arq <- openFile "ArquivosPlayerOne/pokemonVidaPlayer1.txt" ReadMode
                                vidaP1 <- hGetLine arq
                                hClose arq

                                if read vidaP1 <= 0 then do
                                        guardaDadosVidaPlayer1 100
                                        guardaDadosVidaPlayer2 100

                                        exibePlayer2Ganha
                                        pausa
                                        system "cls"
                                        print ""
                                else do
                                        putStrLn ""
                                        exibePokemons player2
                                        pausa
                                        system "cls"
                                        batalhaPvP player1 player2 1  
                else do
                        system "cls"
                        putStrLn ""
                        exibePokemons player1
                        exibeOpcaoInvalida
                        threadDelay 2000000
                        system "cls"
                        batalhaPvP player1 player2 2



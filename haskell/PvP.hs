module PvP where
import MenusGraficos
import Ataques
import System.Process
import System.IO
import PlayerOneMovimentos
import PlayerTwoMovimentos

--Define a vez de jogar (1 para Player1 e 2 para o bot)
type Vez = Int

inicioPvP :: IO()
inicioPvP = do
        exibeCabecalhoPvP
        menuDeSelecaoPvP
        
menuDeSelecaoPvP :: IO()
menuDeSelecaoPvP = do
        exibeMenuDeSelecao
        aux <- readLn :: IO Int
        system "cls"
        let op = aux - 1

        if  op >= 0 && op <= 5 then do
                putStrLn ("Pokemon selecionado Player1: " ++ (nomesPokemons !! op))
        else do
                exibeOpcaoInvalida
                menuDeSelecaoPvP

        exibeMenuDeSelecao
        aux2 <- readLn :: IO Int
        system "cls"
        let op2 = aux2 - 1

        if  op2 >= 0 && op2 <= 5 then do
                putStrLn ("Pokemon selecionado Player2: " ++ (nomesPokemons !! op2))
        else do
                exibeOpcaoInvalida
                menuDeSelecaoPvP

        batalhaPvP (nomesPokemons !! op) (nomesPokemons !! op2) 1

        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]



batalhaPvP :: String -> String-> Vez -> IO()
batalhaPvP player1 player2 vez = do
        if vez == 1 then do
                exibePokemons player1
                exibeAtaques
                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op
                        if (op == 1) then do 
                                atualizaVidaPlayer1 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn "valor do ataque Player1:"
                                print valorAtaque
                                batalhaPvP player1 player2 2
                        else do 
                                atualizaVidaPlayer2 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn "valor do ataque Player1:"
                                print valorAtaque
                                arq <- openFile "pokemonVidaPlayer2.txt" ReadMode
                                vidaP2 <- hGetLine arq
                                hClose arq
                                if ((read vidaP2)<=0) then do
                                        exibePlayer1Ganha
                                        guardaDadosVidaPlayer1 100
                                        guardaDadosVidaPlayer2 100
                                        putStr "Tecle Enter para jogar novamente"
                                        getLine
                                        putStr ""
                                else do
                                        batalhaPvP player1 player2 2   
                else do
                        exibeOpcaoInvalida
                        batalhaPvP player1 player2 1
                              
        else do
                exibePokemons player2
                exibeAtaques
                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op
                        if (op == 1) then do
                                atualizaVidaPlayer2 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn "valor do ataque Player2:"
                                print valorAtaque
                                batalhaPvP player1 player2 1
                        else do
                                atualizaVidaPlayer1 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn "valor do ataque Player2:"
                                print valorAtaque
                                arq <- openFile "pokemonVidaPlayer1.txt" ReadMode
                                vidaP1 <- hGetLine arq
                                hClose arq
                                if ((read vidaP1)<=0) then do
                                        exibePlayer2Ganha
                                        guardaDadosVidaPlayer1 100
                                        guardaDadosVidaPlayer2 100
                                        putStr "Tecle Enter para jogar novamente"
                                        getLine
                                        putStr ""
                                else do
                                        batalhaPvP player1 player2 1 
                else do
                        exibeOpcaoInvalida
                        batalhaPvP player1 player2 2
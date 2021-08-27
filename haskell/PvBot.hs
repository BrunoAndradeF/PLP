module PvBot where
import MenusGraficos
import Ataques
import MovimentosBot
import System.Process
import System.IO
import PlayerOneMovimentos


--Define a vez de jogar (1 para Player1 e 2 para o bot)
type Vez = Int

inicioPvBot :: IO()
inicioPvBot = do
        system "cls"
        exibeCabecalhoPvBot
        menuDeSelecaoPvBot

menuDeSelecaoPvBot :: IO()
menuDeSelecaoPvBot = do
        exibeMenuDeSelecao 0
        aux <- readLn :: IO Int
        system "cls"
        let op = aux - 1

        if  op >= 0 && op <= 5 then do                
                let pokeDoBot = nomesPokemons !! escolhePokemonBot

                putStrLn ("Você escolheu o: " ++ (nomesPokemons !! op))
                exibePokemons (nomesPokemons !! op)
                pausa
                system "cls"

                putStrLn ("O bot escolheu o: " ++ pokeDoBot)
                exibePokemons pokeDoBot
                pausa
                system "cls"

                batalhaPvBot (nomesPokemons !! op) pokeDoBot 1
        else do
                if op == 6 then return ()
                else do
                        exibeOpcaoInvalida
                        pausa
                        menuDeSelecaoPvBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

batalhaPvBot :: String -> String-> Vez -> IO()
batalhaPvBot player1 bot vez = do
        if vez == 1 then do
                exibePokemons player1
                playerHP <- getVidaPlayer1
                botHP <- getVidaBot
                exibeEstadoBatalhaPvBot playerHP botHP
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op player1 bot

                        if op == 1 then do
                                atualizaVidaPlayer1 op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn ("Você se cura em " ++ show valorAtaque)

                        else do
                                atualizaVidaBot op valorAtaque
                                system "cls"
                                putStrLn ""
                                putStrLn ("Você ataca em " ++ show valorAtaque)
                                
                                arq <- openFile "ArquivosBot/pokemonVidaBot.txt" ReadMode
                                aux <- hGetLine arq
                                hClose arq

                                if read aux <= 0 then do
                                        guardaDadosVidaBot 100
                                        guardaDadosVidaPlayer1 100

                                        exibePlayerGanha
                                        pausa
                                        system "cls"
                                        inicioPvBot
                                else do
                                        putStr ""

                        putStrLn ""
                        exibePokemons player1   
                        pausa
                        system "cls"
                        batalhaPvBot player1 bot 2  
                else do
                        exibeOpcaoInvalida
                        batalhaPvBot player1 bot 1                          
        else do
                arquivo <- openFile "ArquivosBot/pokemonVidaBot.txt" ReadMode
                vida <- hGetLine arquivo
                hClose arquivo

                if read vida +15 <= 20 then do
                        let cura = designaAtaque 1 bot player1
                        atualizaVidaBot 1 cura

                        putStrLn ("O bot se cura em "++ show cura) 
                        batalhaPvBot player1 bot 1

                else do
                        let atq = escolheAtaqueBot
                        let valorAtaquebot = designaAtaque atq bot player1
                        atualizaVidaPlayer1 atq valorAtaquebot

                        putStrLn ("O bot ataca em " ++ show valorAtaquebot)

                        arq2 <- openFile "ArquivosPlayerOne/pokemonVidaPlayer1.txt" ReadMode
                        aux2 <- hGetLine arq2
                        hClose arq2

                        if read aux2 <= 0 then do 
                                guardaDadosVidaBot 100
                                guardaDadosVidaPlayer1 100

                                exibeBotGanha        
                                pausa
                                system "cls"
                                inicioPvBot
                        else do
                                putStr ""
                
                putStrLn ""
                exibePokemons bot   
                pausa
                system "cls"
                batalhaPvBot player1 bot 1
        
        
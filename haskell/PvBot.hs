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
        exibeMenuDeSelecao
        aux <- readLn :: IO Int
        system "cls"
        let op = aux - 1

        if  op >= 0 && op <= 5 then do
                putStrLn ("Pokemon selecionado Player1: " ++ (nomesPokemons !! op))
                batalhaPvBot (nomesPokemons !! op) (nomesPokemons !!escolhePokemonBot) 1
        else do
                exibeOpcaoInvalida
                menuDeSelecaoPvBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

batalhaPvBot :: String -> String-> Vez -> IO()
batalhaPvBot player1 bot vez = do
        if vez == 1 then do
                exibePokemons player1
                exibeAtaques
                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op
                        atualizaVidaBot op valorAtaque
                        system "cls"
                        putStrLn ""
                        putStrLn "valor do ataque Player1:"
                        print valorAtaque
                        arq <- openFile "pokemonVidaBot.txt" ReadMode
                        aux <- hGetLine arq
                        hClose arq
                        if ((read aux)<=0) then do
                                exibePlayerGanha
                                guardaDadosVidaBot 100
                                guardaDadosVidaPlayer1 100
                                putStr "Tecle Enter para jogar novamente"
                                getLine
                                putStr ""
                        else do
                                batalhaPvBot player1 bot 2       
                else do
                        exibeOpcaoInvalida
                        batalhaPvBot player1 bot 1
                              
        else do
                putStrLn ("Pokemon selecionado pelo Bot: " ++ bot)
                exibePokemons bot
                putStr "Tecle Enter para continuar"
                getLine
                putStr ""
                system "cls"
                let atq = escolheAtaqueBot
                let valorAtaquebot = designaAtaque atq
                atualizaVidaPlayer1 atq valorAtaquebot
                putStrLn "valor do ataque do bot:"
                print valorAtaquebot
                arq2 <- openFile "pokemonVidaPlayer1.txt" ReadMode
                aux2 <- hGetLine arq2
                hClose arq2
                if ((read aux2)<=0) then do 
                        exibeBotGanha
                        guardaDadosVidaBot 100
                        guardaDadosVidaPlayer1 100
                        putStr "Tecle Enter para jogar novamente"
                        getLine
                        putStr ""
                else do
                        batalhaPvBot player1 bot 1



        

        
module PvBot where
import MenusGraficos
import Ataques
import MovimentosBot
import System.Process
import System.IO
import Util
import Control.Concurrent

inicioPvBot :: Time -> Time -> IO()
inicioPvBot pokesP1 pokesBot = do
        system "cls"
        menuDeSelecaoPvBot pokesP1 pokesBot

menuDeSelecaoPvBot :: Time -> Time -> IO()
menuDeSelecaoPvBot pokesP1 pokesBot = do
        exibeCabecalhoPvBot
        exibeMenuDeSelecao 0
        aux <- readLn :: IO Int
        system "cls"
        let op = aux - 1

        if  op >= 0 && op <= 5 then do
                let pokeDoBot = nomesPokemons !! escolhePokemonBot
                let pokeDoPlayer = nomesPokemons !! op

                addPokemon  pokesP1 (Pokemon pokeDoPlayer 100 False False) "p1"
                addPokemon  pokesBot (Pokemon pokeDoBot 100 False False) "bot"

                putStrLn ("Você escolheu o: " ++ pokeDoPlayer)
                exibePokemons pokeDoPlayer
                pausa
                system "cls"

                putStrLn ("O bot escolheu o: " ++ pokeDoBot)
                exibePokemons pokeDoBot
                pausa
                system "cls"

                batalhaPvBot (Pokemon pokeDoPlayer 100 False False:pokesP1)
                        (Pokemon pokeDoBot 100 False False:pokesBot) 1
        else do
                if op == 6 then return ()
                else do
                        system "cls"
                        putStrLn ""
                        exibeCabecalhoPvBot
                        exibeOpcaoInvalida
                        
                        threadDelay 2000000
                        system "cls"
                        menuDeSelecaoPvBot pokesP1 pokesBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

batalhaPvBot :: Time -> Time -> Vez -> IO()
batalhaPvBot (Pokemon nomeP playerHP s1P s2P:timeP1)
        (Pokemon nomeBot botHP s1Bot s2Bot:timeBot) vez = do

        if vez == 1 then do
                exibePokemons nomeP
                exibeEstadoBatalhaPvBot playerHP botHP
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op nomeP nomeBot
                        system "cls"
                        putStrLn ""
                        exibePokemons nomeP
                        putStrLn ""

                        if op == 1 then do
                                setVida (Pokemon nomeP playerHP s1P s2P:timeP1) valorAtaque "p1" 1
                                putStrLn ("Você se cura em " ++ show valorAtaque)

                        else do
                                setVida (Pokemon nomeBot botHP s1Bot s2Bot:timeBot) valorAtaque "bot" 1                            
                                putStrLn ("Você ataca em " ++ show (-1 * valorAtaque))

                        timeP1Atualizado <- getTime "p1"
                        timeBotAtualizado <- getTime "bot"
                        let vidaAtualBot = getVida timeBotAtualizado 1


                        if  vidaAtualBot <= 0 then do
                                system "cls"
                                limpaTimes
                                exibePlayerGanha
                                pausa
                                system "cls"
                                inicioPvBot [] []

                        else do
                                putStrLn "\n\n"
                                pausa
                                system "cls"
                                batalhaPvBot timeP1Atualizado timeBotAtualizado 2
                else do
                        system "cls"
                        putStrLn ""
                        exibePokemons nomeP
                        exibeOpcaoInvalida
                        
                        threadDelay 2000000
                        system "cls"
                        batalhaPvBot (Pokemon nomeP playerHP s1P s2P:timeP1)
                           (Pokemon nomeBot botHP s1Bot s2Bot:timeBot) 1
        else do
                putStrLn ""
                exibePokemons nomeBot
                putStrLn ""

                if botHP + 15 <= 20 then do
                        let cura = designaAtaque 1 nomeP nomeBot
                        setVida (Pokemon nomeBot botHP s1Bot s2Bot:timeBot) cura "bot" 1

                        putStrLn ("O bot se cura em "++ show cura)

                else do
                        let atq = escolheAtaqueBot
                        let valorAtaque = designaAtaque atq nomeBot nomeP
                        setVida (Pokemon nomeP playerHP s1P s2P:timeP1) valorAtaque "p1" 1

                        putStrLn ("O bot ataca em " ++ show (-1 * valorAtaque))

                timeP1Atualizado <- getTime "p1"
                timeBotAtualizado <- getTime "bot"
                let vidaAtualPlayer = getVida timeP1Atualizado 1

                if vidaAtualPlayer <= 0 then do
                        system "cls"
                        limpaTimes
                        exibeBotGanha
                        pausa
                        system "cls"
                        inicioPvBot [] []

                else do
                        putStrLn "\n\n"
                        pausa
                        system "cls"
                        batalhaPvBot timeP1Atualizado timeBotAtualizado 1

        
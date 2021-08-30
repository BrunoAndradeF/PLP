module PvBot where
import MenusGraficos
import Ataques
import MovimentosBot
import System.Process
import System.IO
import Util

inicioPvBot :: Pokemons -> Pokemons -> IO()
inicioPvBot pokesP1 pokesBot = do
        system "cls"
        exibeCabecalhoPvBot
        menuDeSelecaoPvBot pokesP1 pokesBot

menuDeSelecaoPvBot :: Pokemons -> Pokemons -> IO()
menuDeSelecaoPvBot pokesP1 pokesBot = do
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
                        exibeOpcaoInvalida
                        pausa
                        menuDeSelecaoPvBot pokesP1 pokesBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

batalhaPvBot :: Pokemons -> Pokemons -> Vez -> IO()
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

                        if op == 1 then do
                                setVida (Pokemon nomeP playerHP s1P s2P:timeP1) valorAtaque "p1" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Você se cura em " ++ show valorAtaque)

                        else do
                                setVida (Pokemon nomeBot botHP s1Bot s2Bot:timeBot) valorAtaque "bot" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Você ataca em " ++ show (-1 * valorAtaque))

                        timeP1Atualizado <- getTime "p1"
                        timeBotAtualizado <- getTime "bot"
                        let vidaAtualBot = getVida timeBotAtualizado 1


                        if  vidaAtualBot <= 0 then do
                                limpaTimes
                                exibePlayerGanha
                                pausa
                                system "cls"
                                inicioPvBot [] []

                        else do
                                putStrLn ""
                                exibePokemons nomeP
                                pausa
                                system "cls"
                                batalhaPvBot timeP1Atualizado timeBotAtualizado 2
                else do
                        exibeOpcaoInvalida
                        pausa
                        batalhaPvBot (Pokemon nomeP playerHP s1P s2P:timeP1)
                           (Pokemon nomeBot botHP s1Bot s2Bot:timeBot) 1
        else do

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
                        limpaTimes
                        exibeBotGanha
                        pausa
                        system "cls"
                        inicioPvBot [] []

                else do
                        putStrLn ""
                        exibePokemons nomeBot
                        pausa
                        system "cls"
                        batalhaPvBot timeP1Atualizado timeBotAtualizado 1

        
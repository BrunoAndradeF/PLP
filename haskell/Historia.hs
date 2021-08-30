module Historia where
import MenusGraficos
import Ataques
import Util
import MovimentosBot
import System.Process

inicioHistoria :: Pokemons -> Pokemons -> IO()
inicioHistoria timeP timeBot = do
        system "cls"
        fluxoHist

fluxoHist :: IO()
fluxoHist = do
        limpaTimes
        exibeCabecalhoHistoria  
        retorno <- menuDeSelecaoComVoltar [] []
        
        if retorno == 1 then return()
        else do
                timeP <- getTime "p1"
                timeBot <- getTime "bot"
                batalhaHist timeP (getPokemon timeP 1) 1
                        timeBot (getPokemon timeBot 1) 1 1

        print "Congratulations"
        pausa
        
        
menuDeSelecaoComVoltar :: Pokemons -> Pokemons -> IO Int
menuDeSelecaoComVoltar timeP timeBot = do
        exibeMenuDeSelecao 0
        aux <- readLn :: IO Int
        system "cls"
        let op = aux - 1

        if  op >= 0 && op <= 5 then do
                let pokeDoBot = nomesPokemons !! escolhePokemonBot
                let pokeDoPlayer = nomesPokemons !! op

                addPokemon  timeP (Pokemon pokeDoPlayer 100 False False) "p1"
                addPokemon  timeBot (Pokemon pokeDoBot 100 False False) "bot"

                putStrLn ("Você escolheu o: " ++ pokeDoPlayer)
                exibePokemons pokeDoPlayer
                pausa
                system "cls"

                putStrLn ("O bot escolheu o: " ++ pokeDoBot)
                exibePokemons pokeDoBot
                pausa
                system "cls"
                return 0
        else do
                if op == 6 then return 1
                else do
                        exibeOpcaoInvalida
                        pausa
                        menuDeSelecaoComVoltar timeP timeBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

menuDeSelecaoSemVoltar :: Pokemons -> Pokemons -> IO Int
menuDeSelecaoSemVoltar timeP timeBot = do
        exibeMenuDeSelecao 0
        aux <- readLn :: IO Int
        system "cls"
        let op = aux - 1

        if  op >= 0 && op <= 5 then do
                let pokeDoBot = nomesPokemons !! escolhePokemonBot
                let pokeDoPlayer = nomesPokemons !! op

                addPokemon  timeP (Pokemon pokeDoPlayer 100 False False) "p1"
                addPokemon  timeBot (Pokemon pokeDoBot 100 False False) "bot"

                putStrLn ("Você escolheu o: " ++ pokeDoPlayer)
                exibePokemons pokeDoPlayer
                pausa
                system "cls"

                putStrLn ("O bot escolheu o: " ++ pokeDoBot)
                exibePokemons pokeDoBot
                pausa
                system "cls"

                return 0
        else do
                exibeOpcaoInvalida
                pausa
                menuDeSelecaoComVoltar timeP timeBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]


batalhaHist :: Pokemons -> Pokemon -> Int -> Pokemons -> Pokemon -> Int -> Int -> IO()
batalhaHist timeP (Pokemon nomeP pHP s1P s2P) numP
        timeBot (Pokemon nomeBot botHP s1Bot s2Bot) numBot vez = do
               
        if vez == 1 then do
                exibePokemons nomeP
                exibeEstadoBatalhaPvBot pHP botHP
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op nomeP nomeBot

                        if op == 1 then do
                                setVida (Pokemon nomeP pHP s1P s2P:timeP) valorAtaque "p1" numP
                                system "cls"
                                putStrLn ""
                                putStrLn ("Você se cura em " ++ show valorAtaque)

                        else do
                                setVida (Pokemon nomeBot botHP s1Bot s2Bot:timeBot) valorAtaque "bot" numBot
                                system "cls"
                                putStrLn ""
                                putStrLn ("Você ataca em " ++ show (-1 * valorAtaque))

                        timeP1Atualizado <- getTime "p1"
                        timeBotAtualizado <- getTime "bot"

                        if verificaPerdeu timeBotAtualizado then do
                                print "win"
                                pausa 
                        else do
                                let vidaAtualBot = getVida timeBotAtualizado numBot
                                let vidaAtualPlayer = getVida timeP1Atualizado numP
                                
                                putStrLn ""
                                exibePokemons nomeP
                                pausa
                                system "cls"

                                if  vidaAtualBot <= 0 then do
                                        let novoPoke = getPokemon timeBotAtualizado (numBot + 1)
                                        batalhaHist timeP1Atualizado (Pokemon nomeP vidaAtualPlayer False False) numP
                                                timeBotAtualizado novoPoke (numBot + 1) 2
                                else do
                                        batalhaHist timeP1Atualizado (Pokemon nomeP vidaAtualPlayer False False) numP
                                                timeBotAtualizado (Pokemon nomeBot vidaAtualBot False False) numBot 2
                else do
                        exibeOpcaoInvalida
                        pausa
                        batalhaHist timeP (Pokemon nomeP pHP False False) numP
                                 timeBot (Pokemon nomeBot botHP False False) numBot 1
        else do

                if botHP + 15 <= 20 then do
                        let cura = designaAtaque 1 nomeP nomeBot
                        setVida (Pokemon nomeBot botHP s1Bot s2Bot:timeBot) cura "bot" 1

                        putStrLn ("O bot se cura em "++ show cura)

                else do
                        let atq = escolheAtaqueBot
                        let valorAtaque = designaAtaque atq nomeBot nomeP
                        setVida (Pokemon nomeP pHP s1P s2P:timeP) valorAtaque "p1" 1

                        putStrLn ("O bot ataca em " ++ show (-1 * valorAtaque))

                timeP1Atualizado <- getTime "p1"
                timeBotAtualizado <- getTime "bot"

                if verificaPerdeu timeP1Atualizado then do
                        limpaTimes
                        exibeBotGanha
                        pausa
                        system "cls"
                        inicioHistoria [] []

                else do
                        let vidaAtualPlayer = getVida timeP1Atualizado numP
                        let vidaAtualBot = getVida timeBotAtualizado numBot

                        putStrLn ""
                        exibePokemons nomeBot
                        pausa
                        system "cls"

                        if vidaAtualPlayer <= 0 then do
                                let novoPoke = getPokemon timeP1Atualizado (numP + 1)
                                batalhaHist timeP1Atualizado novoPoke (numP + 1)
                                        timeBotAtualizado (Pokemon nomeBot vidaAtualBot False False) numBot 1
                        else
                                batalhaHist timeP1Atualizado (Pokemon nomeP vidaAtualPlayer False False) numP
                                        timeBotAtualizado (Pokemon nomeBot vidaAtualBot False False) numBot 1
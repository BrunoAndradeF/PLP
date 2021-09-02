module Historia where
import MenusGraficos
import Ataques
import Util
import MovimentosBot
import System.Process

inicioHistoria :: IO()
inicioHistoria = do
        system "cls"
        exibeCabecalhoHistoria 
        exibeMenusNovoJogoHist
        op <- readLn :: IO Int

        if op == 1 then do
                limpaTimesHist 
                fluxoHist [] [] 0
        else do
                if op == 2 then carregaJogo     
                else do
                        if op == 3 then return()
                        else do
                                system "cls"
                                exibeCabecalhoHistoria 
                                exibeOpcaoInvalida 
                                pausa
                                inicioHistoria

carregaJogo :: IO()
carregaJogo = do
        timeP <- getTime "phist"
        let tamanhoTime = lenght timeP

        if tamanhoTime <= 0 then do
                system "cls"
                exibetimeInexistente 
                pausa
                inicioHistoria
        else do
                carregaTimes
                timeP <- getTime "p1"
                timeB <- getTime "bot"
                fluxoHist timeP timeB tamanhoTime

--O terceiro atributo represente quantas batalhas o player já venceu
fluxoHist :: Time -> Time -> Int -> IO ()
fluxoHist timeP timeB 3 = do
        limpaTimes
        limpaTimesHist 

        system "cls"
        exibePlayerGanha
        pausa
        system "cls"

        inicioHistoria
fluxoHist timeP timeB _ = do
        system "cls"
        retorno <- menuDeSelecaoHist timeP timeB
        
        if retorno then do
                timeP <- getTime "p1"
                timeBot <- getTime "bot"
                batalhaHist timeP (getPokemon timeP 1) 1
                        timeBot (getPokemon timeBot 1) 1 1
        else do
                print ""

menuDeSelecaoHist :: Time -> Time -> IO Bool
menuDeSelecaoHist timeP timeBot = do
        exibeCabecalhoHistoria 
        exibeMenuDeSelecao 0
        aux <- readLn :: IO Int
        system "cls"
        let op = aux - 1

        if  op >= 0 && op <= 5 then do
                let pokeDoBot = nomesPokemons !! escolhePokemonBot
                let pokeDoPlayer = nomesPokemons !! op

                addPokemon  timeP (Pokemon pokeDoPlayer 100 ) "p1"
                addPokemon  timeBot (Pokemon pokeDoBot 100 ) "bot"

                putStrLn ("Você escolheu o: " ++ pokeDoPlayer)
                exibePokemons pokeDoPlayer
                pausa
                system "cls"

                putStrLn ("O bot escolheu o: " ++ pokeDoBot)
                exibePokemons pokeDoBot
                pausa
                system "cls"
                return True
        else do
                if op == 6 then return False
                else do
                        system "cls"
                        exibeCabecalhoHistoria 
                        exibeOpcaoInvalida
                        pausa
                        system "cls"
                        menuDeSelecaoHist timeP timeBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

batalhaHist :: Time -> Pokemon -> Int -> Time -> Pokemon -> Int -> Int -> IO()
batalhaHist timeP (Pokemon nomeP pHP) numP
        timeBot (Pokemon nomeBot botHP) numBot vez = do
               
        if vez == 1 then do
                exibePokemons nomeP
                exibeEstadoBatalhaPvBot pHP botHP
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 3 then do
                        let valorAtaque = designaAtaque op nomeP nomeBot
                        if op == 1 then do
                                setVida timeP valorAtaque "p1" numP
                                system "cls"
                                putStrLn ""
                                putStrLn ("Você se cura em " ++ show valorAtaque)
                        else do
                                setVida timeBot valorAtaque "bot" numBot
                                system "cls"
                                putStrLn ""
                                putStrLn ("Você ataca em " ++ show (-1 * valorAtaque))

                        timeP1Atualizado <- getTime "p1"
                        timeBotAtualizado <- getTime "bot"

                        if verificaPerdeu timeBotAtualizado then playerVenceBatalha
                        else do
                                let vidaAtualBot = getVida timeBotAtualizado numBot
                                let vidaAtualPlayer = getVida timeP1Atualizado numP
                                
                                putStrLn ""
                                exibePokemons nomeP
                                pausa
                                system "cls"

                                if  vidaAtualBot <= 0 then do
                                        let novoPoke = getPokemon timeBotAtualizado (numBot + 1)
                                        batalhaHist timeP1Atualizado (Pokemon nomeP vidaAtualPlayer) numP
                                                timeBotAtualizado novoPoke (numBot + 1) 2
                                else do
                                        batalhaHist timeP1Atualizado (Pokemon nomeP vidaAtualPlayer) numP
                                                timeBotAtualizado (Pokemon nomeBot vidaAtualBot) numBot 2
                else do
                        system "cls"
                        exibePokemons nomeP
                        exibeOpcaoInvalida
                        pausa
                        system "cls"
                        batalhaHist timeP (Pokemon nomeP pHP) numP
                                 timeBot (Pokemon nomeBot botHP) numBot 1
        else do

                if botHP + 15 <= 20 then do
                        let cura = designaAtaque 1 nomeP nomeBot
                        setVida timeBot cura "bot" numBot

                        putStrLn ("O bot se cura em "++ show cura)

                else do
                        let atq = escolheAtaqueBot
                        let valorAtaque = designaAtaque atq nomeBot nomeP
                        setVida timeP valorAtaque "p1" numP

                        putStrLn ("O bot ataca em " ++ show (-1 * valorAtaque))

                timeP1Atualizado <- getTime "p1"
                timeBotAtualizado <- getTime "bot"

                if verificaPerdeu timeP1Atualizado then botVenceBatalha
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
                                        timeBotAtualizado (Pokemon nomeBot vidaAtualBot) numBot 1
                        else
                                batalhaHist timeP1Atualizado (Pokemon nomeP vidaAtualPlayer) numP
                                        timeBotAtualizado (Pokemon nomeBot vidaAtualBot) numBot 1

playerVenceBatalha :: IO()
playerVenceBatalha = do
        curaTimes 
        salvaTimes 

        timeP <- getTime "p1"
        timeB <- getTime "bot"
        let progresso = lenght timeP

        if progresso < 3 then do
                system "cls"
                putStrLn ("Você venceu a " ++ show progresso ++ "ª batalha!!")
                putStrLn "O seu progresso foi salvo"
                putStrLn ("Agora você irá escolher o seu " ++ show (progresso + 1) ++ "º Pokemon...")
                pausa
        else print ""

        fluxoHist timeP timeB progresso

botVenceBatalha :: IO()
botVenceBatalha = do
        limpaTimesHist
        system "cls"
        exibeBotGanha
        pausa
        system "cls"
        inicioHistoria
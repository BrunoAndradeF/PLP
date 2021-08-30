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
menuDeSelecaoPlayer1 pokesp1 pokesp2 = do
        exibeMenuDeSelecao 1
        aux <- readLn :: IO Int
        system "cls"
        let op1 = aux - 1

        if  op1 >= 0 && op1 <= 5 then do
                let pokeDoPlayer1 = nomesPokemons !! op1

                arq <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode
                hPutStrLn arq (show (Pokemon pokeDoPlayer1 100 False False:pokesp1))
                hClose arq

                putStrLn ("Player 1 escolheu o: " ++ pokeDoPlayer1)
                exibePokemons pokeDoPlayer1
                pausa
                menuDeSelecaoPlayer2 (Pokemon pokeDoPlayer1 100 False False:pokesp1) pokesp2 pokeDoPlayer1

        else do
                if op1 == 6 then return ()
                else do
                        exibeOpcaoInvalida
                        pausa
                        menuDeSelecaoPlayer1 pokesp1 pokesp2

        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

menuDeSelecaoPlayer2 :: Pokemons -> Pokemons -> String -> IO()
menuDeSelecaoPlayer2 pokesp1 pokesp2 pokeDoPlayer1 = do
        system "cls"
        exibeMenuDeSelecao 2
        aux <- readLn :: IO Int
        system "cls"
        let op2 = aux - 1

        if  op2 >= 0 && op2 <= 5 then do
                let pokeDoPlayer2 = nomesPokemons !! op2

                arq2 <- openFile "ArquivosTimes/timePlayer2.txt" WriteMode
                hPutStrLn arq2 (show (Pokemon pokeDoPlayer2 100 False False:pokesp2))
                hClose arq2

                putStrLn ("Player 2 escolheu o: " ++ pokeDoPlayer2)
                exibePokemons pokeDoPlayer2
                pausa
                batalhaPvP pokesp1 (Pokemon pokeDoPlayer2 100 False False:pokesp2) 1

        else do
                if op2 == 6 then do
                        arq <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
                        hPutStrLn arq "[]";
                        hClose arq
                        menuDeSelecaoPlayer1 [] []
                else do
                        exibeOpcaoInvalida
                        pausa
                        menuDeSelecaoPlayer2 pokesp1 pokesp2 pokeDoPlayer1

        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]


batalhaPvP :: Pokemons -> Pokemons -> Util.Vez -> IO()
batalhaPvP (Pokemon nomep1 player1HP s1p1 s2p1:pokesp1)
        (Pokemon nomep2 player2HP s1p2 s2p2:pokesp2) vez = do

        system "cls"
        if vez == 1 then do
                exibePokemons nomep1
                exibeEstadoBatalhaPvp player1HP player2HP vez
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op nomep1 nomep2

                        if op == 1 then do
                                setVida (Pokemon nomep1 player1HP s1p1 s2p1:pokesp1) valorAtaque "p1" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 1 se cura em " ++ show valorAtaque)

                        else do
                                setVida (Pokemon nomep2 player2HP s1p2 s2p2:pokesp2) valorAtaque "p2" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 1 ataca em " ++ show (-1 * valorAtaque))


                        arq1 <- openFile "ArquivosTimes/timePlayer1.txt" ReadMode
                        aux1 <- hGetLine arq1
                        hClose arq1

                        arq2 <- openFile "ArquivosTimes/timePlayer2.txt" ReadMode
                        aux2 <- hGetLine arq2
                        hClose arq2

                        let vidaAtualPlayer1 = getVida (read aux1) 1
                        let vidaAtualPlayer2 = getVida (read aux2) 1

                        if vidaAtualPlayer2 <= 0 then do
                                arq <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
                                hPutStrLn arq "[]";
                                hClose arq

                                arq <- openFile "ArquivosTimes/timePlayer2.txt" WriteMode;
                                hPutStrLn arq "[]";
                                hClose arq

                                exibePlayer1Ganha
                                pausa
                                system "cls"
                                inicioPvP [] []
                        else do
                                putStrLn ""
                                exibePokemons nomep1
                                pausa
                                system "cls"
                                batalhaPvP (Pokemon nomep1 vidaAtualPlayer1 s1p1 s2p1:pokesp1)
                                        (Pokemon nomep2 vidaAtualPlayer2 s1p2 s2p2:pokesp2)  2
                else do
                        exibeOpcaoInvalida
                        batalhaPvP (Pokemon nomep1 player1HP s1p1 s2p1:pokesp1)
                                (Pokemon nomep2 player2HP s1p2 s2p2:pokesp2)  1

        else do
                exibePokemons nomep2
                exibeEstadoBatalhaPvp player1HP player2HP vez
                exibeAtaques

                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op nomep1 nomep2

                        if op == 1 then do
                                setVida (Pokemon nomep2 player2HP s1p2 s2p2:pokesp2) valorAtaque "p2" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 2 se cura em " ++ show valorAtaque)

                        else do
                                setVida (Pokemon nomep1 player1HP s1p1 s2p1:pokesp1) valorAtaque "p1" 1
                                system "cls"
                                putStrLn ""
                                putStrLn ("Player 2 ataca em " ++ show (-1 * valorAtaque))

                        arq1 <- openFile "ArquivosTimes/timePlayer1.txt" ReadMode
                        aux1 <- hGetLine arq1
                        hClose arq1

                        arq2 <- openFile "ArquivosTimes/timePlayer2.txt" ReadMode
                        aux2 <- hGetLine arq2
                        hClose arq2

                        let vidaAtualPlayer1 = getVida (read aux1) 1
                        let vidaAtualPlayer2 = getVida (read aux2) 1

                        if vidaAtualPlayer1 <= 0 then do
                                arq <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
                                hPutStrLn arq "[]";
                                hClose arq

                                arq <- openFile "ArquivosTimes/timePlayer2.txt" WriteMode;
                                hPutStrLn arq "[]";
                                hClose arq

                                exibePlayer2Ganha
                                pausa
                                system "cls"
                                inicioPvP [] []
                        else do
                                putStrLn ""
                                exibePokemons nomep2
                                pausa
                                system "cls"
                                batalhaPvP (Pokemon nomep1 vidaAtualPlayer1 s1p1 s2p1:pokesp1)
                                        (Pokemon nomep2 vidaAtualPlayer2 s1p2 s2p2:pokesp2)  1
                else do
                        exibeOpcaoInvalida
                        batalhaPvP (Pokemon nomep1 player1HP s1p1 s2p1:pokesp1)
                                (Pokemon nomep2 player2HP s1p2 s2p2:pokesp2)  2



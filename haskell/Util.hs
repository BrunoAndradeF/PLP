module Util where

import System.IO
import MenusGraficos
import System.Directory
import System.FilePath
type Time = [Pokemon]
type Nome = String
type Vida = Int
type Vez = Int
data Pokemon = Pokemon Nome Vida
        deriving (Show, Read)

--num representa o número do pokemon na fila
getVida :: Time -> Int -> Int
getVida time num = getVidaRecursivo time num 1

getVidaRecursivo :: Time -> Int -> Int -> Int
getVidaRecursivo (Pokemon nome vida :xs) num cont
        | num == cont = vida
        | otherwise = getVidaRecursivo xs num (cont + 1)

setVida :: Time -> Int -> String -> Int -> IO ()
setVida time alteracao player num = do
        let diretorio = getDiretorio player
        arq <- openFile diretorio WriteMode;

        if alteracao > 0 then do
                let novaVida = calculaCura (getVida time num) alteracao
                let retorno = retornaTimeAtualizado time novaVida num 1
                hPrint arq retorno;

        else do
                let retorno = retornaTimeAtualizado time (getVida time num + alteracao) num 1
                hPrint arq retorno;
        hClose arq

calculaCura :: Int -> Int -> Int
calculaCura vidaAtual a = if vidaAtual + a < 100 then vidaAtual + a
                          else 100

retornaTimeAtualizado :: Time -> Int -> Int -> Int -> Time
retornaTimeAtualizado ((Pokemon nome vida ):xs) novaVida num cont
        | num == cont = Pokemon nome novaVida : xs
        | otherwise = Pokemon nome vida : retornaTimeAtualizado xs novaVida num (cont + 1)


getTime :: String -> IO Time
getTime player = do
        let diretorio = getDiretorio player
        arq <- openFile diretorio ReadMode;
        time <- hGetLine arq;
        hClose arq;
        return (read time)

getPokemon :: Time -> Int -> Pokemon
getPokemon pokemons num = getPokemonRecursivo pokemons num 1

getPokemonRecursivo :: Time -> Int -> Int -> Pokemon
getPokemonRecursivo ((Pokemon nome vida ):xs) num cont
        | cont == num = Pokemon nome vida
        | otherwise = getPokemonRecursivo xs num (cont + 1)


addPokemon :: Time -> Pokemon -> String -> IO()
addPokemon time pokemon player = do
        let diretorio = getDiretorio player
        arq <- openFile diretorio WriteMode;
        hPrint arq (pokemon : time)
        hClose arq

verificaPerdeu :: Time -> Bool
verificaPerdeu [] = True
verificaPerdeu ((Pokemon nome vida ):xs) = vida <= 0 && verificaPerdeu xs

curaTimes :: IO()
curaTimes = do
        timeP1 <- getTime "p1"
        timeP2 <- getTime "p2"
        timeBot <- getTime "bot"


        arq1 <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
        arq2 <- openFile "ArquivosTimes/timePlayer2.txt" WriteMode;
        arqBot <- openFile "ArquivosTimes/timeBot.txt" WriteMode;

        hPrint arq1 (curaTime timeP1)
        hPrint arq2 (curaTime timeP2)
        hPrint arqBot (curaTime timeBot)

        hClose arq1
        hClose arq2
        hClose arqBot



curaTime :: Time -> Time
curaTime [] = [];
curaTime (Pokemon nome vida : xs) = Pokemon nome 100 : curaTime xs


limpaTimes :: IO()
limpaTimes = do
        arq <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
        hPutStrLn arq "[]";
        hClose arq

        arq <- openFile "ArquivosTimes/timePlayer2.txt" WriteMode;
        hPutStrLn arq "[]";
        hClose arq

        arq <- openFile "ArquivosTimes/timeBot.txt" WriteMode;
        hPutStrLn arq "[]";
        hClose arq

limpaTimesHist :: IO()
limpaTimesHist = do
        arq <- openFile "ArquivosTimes/timePlayerHist.txt" WriteMode;
        hPutStrLn arq "[]";
        hClose arq

        arq <- openFile "ArquivosTimes/timeBotHist.txt" WriteMode;
        hPutStrLn arq "[]";
        hClose arq

carregaTimes :: IO()
carregaTimes = do
        timeP <- getTime "phist"
        timeB <- getTime "bhist"
 

        arqP <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
        arqB <- openFile "ArquivosTimes/timeBot.txt" WriteMode;
        hPutStrLn arqP  (show timeP)
        hPutStrLn arqB  (show timeB)

        hClose arqP
        hClose arqB

salvaTimes :: IO()
salvaTimes = do
        timeP <- getTime "p1"
        timeB <- getTime "bot"

        arqP <- openFile "ArquivosTimes/timePlayerHist.txt" WriteMode;
        arqB <- openFile "ArquivosTimes/timeBotHist.txt" WriteMode;
        hPutStrLn arqP  (show timeP)
        hPutStrLn arqB  (show timeB)

        hClose arqP
        hClose arqB

        

getDiretorio :: String -> String
getDiretorio "p1" = "ArquivosTimes/timePlayer1.txt"
getDiretorio "p2" = "ArquivosTimes/timePlayer2.txt"
getDiretorio "bot" = "ArquivosTimes/timeBot.txt"
getDiretorio "phist" = "ArquivosTimes/timePlayerHist.txt"
getDiretorio "bhist" = "ArquivosTimes/timeBotHist.txt"

verificaArquivos :: IO ()
verificaArquivos = do
        createDirectoryIfMissing True $ takeDirectory "ArquivosTimes"
        existsP1Team <- doesFileExist "ArquivosTimes/timePlayer1.txt"
        existsP2Team <- doesFileExist "ArquivosTimes/timePlayer2.txt"
        existsBotTeam <- doesFileExist "ArquivosTimes/timeBot.txt"
        existsPHistTeam <- doesFileExist "ArquivosTimes/timePlayerHist.txt"
        existsBHistTeam <- doesFileExist "ArquivosTimes/timeBotHist.txt"

        if  existsP1Team then putStr ""
        else do
                arq <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq
        if  existsP2Team then putStr ""
        else do
                arq <- openFile "ArquivosTimes/timePlayer2.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq
        if  existsBotTeam then putStr ""
        else do
                arq <- openFile "ArquivosTimes/timeBot.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq
        if  existsPHistTeam then putStr ""
        else do
                arq <- openFile "ArquivosTimes/timePlayerHist.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq
        if  existsBHistTeam then putStr ""
        else do
                arq <- openFile "ArquivosTimes/timeBotHist.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq

lenght :: [a] -> Int
lenght = foldr (\ a -> (+) 1) 0
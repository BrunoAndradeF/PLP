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
getVida time num = do
        getVidaRecursivo time num 1

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
                hPutStrLn arq (show retorno);

        else do
                let retorno = retornaTimeAtualizado time (getVida time num + alteracao) num 1
                hPutStrLn arq (show retorno);
        hClose arq

calculaCura :: Int -> Int -> Int
calculaCura vidaAtual a = do
        if vidaAtual + a < 100 then vidaAtual + a
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
        hPutStrLn arq (show ([pokemon] ++ time))
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

        hPutStrLn arq1 (show  (curaTime timeP1))
        hPutStrLn arq2 (show  (curaTime timeP2))
        hPutStrLn arqBot (show  (curaTime timeBot))

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

        arq <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
        hPutStrLn arq "[]";
        hClose arq

        arq <- openFile "ArquivosTimes/timeBot.txt" WriteMode;
        hPutStrLn arq "[]";
        hClose arq

getDiretorio :: String -> String
getDiretorio "p1" = "ArquivosTimes/timePlayer1.txt"
getDiretorio "p2" = "ArquivosTimes/timePlayer2.txt"
getDiretorio _  = "ArquivosTimes/timeBot.txt"

verificaArquivos :: IO ()
verificaArquivos = do
        createDirectoryIfMissing True $ takeDirectory "ArquivosTimes"
        existsP1team <- doesFileExist "ArquivosTimes/timePlayer1.txt"
        existsP2team <- doesFileExist "ArquivosTimes/timePlayer2.txt"
        existsBotTeam <- doesFileExist "ArquivosTimes/timeBot.txt"

        if  existsP1team then putStr ""
        else do
                arq <- openFile "ArquivosTimes/timePlayer1.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq
        if  existsP2team then putStr ""
        else do
                arq <- openFile "ArquivosTimes/timePlayer2.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq

        if  existsBotTeam then putStr ""
        else do
                arq <- openFile "ArquivosTimes/timeBot.txt" WriteMode;
                hPutStrLn arq "[]";
                hClose arq

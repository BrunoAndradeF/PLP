module Util where

import System.IO
type Pokemons = [Pokemon]
type Nome = String
type Vida = Int
type PerdeTurno  =  Bool
type TomaDano  =  Bool
type Vez = Int
data Pokemon = Pokemon Nome Vida PerdeTurno TomaDano
        deriving (Show, Read)

--num representa o número do pokemon na fila
getVida :: Pokemons -> Int -> Int
getVida (Pokemon nome vida s1 s2:xs) num = getVidaRecursivo (Pokemon nome vida s1 s2:xs) num 1

getVidaRecursivo :: Pokemons -> Int -> Int -> Int
getVidaRecursivo (Pokemon nome vida s1 s2:xs) num cont 
        | num == cont = vida
        | otherwise = getVidaRecursivo xs num (cont + 1)

setVida :: Pokemons -> Int -> String -> Int -> IO ()
setVida (Pokemon nome vida s1 s2:xs) alteracao player num = do
        let diretorio = getDiretorio player
        arq <- openFile diretorio WriteMode;

        if alteracao > 0 then do
                let novaVida = calculaCura vida alteracao
                let retorno = retornaListaAtualizada (Pokemon nome vida s1 s2:xs) novaVida num 1
                hPutStrLn arq (show retorno);

        else do
                let retorno = retornaListaAtualizada (Pokemon nome vida s1 s2:xs) (vida + alteracao) num 1
                hPutStrLn arq (show retorno);
        hClose arq

retornaListaAtualizada :: Pokemons -> Int -> Int -> Int -> Pokemons
retornaListaAtualizada ((Pokemon nome vida s1 s2):xs) novaVida num cont
        | num == cont = Pokemon nome novaVida s1 s2 : xs
        | otherwise = retornaListaAtualizada xs novaVida num (cont + 1)

calculaCura :: Int -> Int -> Int
calculaCura vidaAtual a = do
        if vidaAtual + a < 100 then vidaAtual + a
        else 100

getDiretorio :: String -> String
getDiretorio "p1" = "ArquivosTimes/timePlayer1.txt"
getDiretorio "p2" = "ArquivosTimes/timePlayer2.txt"
getDiretorio _  = "ArquivosTimes/timeBot.txt"

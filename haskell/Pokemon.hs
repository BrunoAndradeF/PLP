import System.IO
import System.Process
import MenusGraficos
import PvBot
import PvP
import Historia
import MovimentosBot
import Util


iniciar :: IO()
iniciar = do
        system "cls"

        verificaArquivos
        pokesP1 <- getTime "p1"
        pokesP2 <- getTime "p2"
        pokesBot <- getTime "bot"

        menuInicial pokesP1 pokesP2 pokesBot
        iniciar


menuInicial :: Time -> Time -> Time -> IO()
menuInicial pokesP1 pokesP2 pokesBot = do
        exibeMenuInicial 
        op <- getChar
        getChar
        designaModo pokesP1 pokesP2 pokesBot op


--Função que identifica e invoca o modo de jogo escolhido pelo usuário
designaModo :: Time -> Time -> Time -> Char -> IO()
designaModo pokesP1 pokesP2 pokesBot '1' = do
        system "cls"
        inicioPvBot pokesP1 pokesBot
designaModo pokesP1 pokesP2 pokesBot '2' = do
        system "cls"
        inicioPvP pokesP1 pokesP2
designaModo pokesP1 pokesP2 pokesBot '3' = do
        system "cls"
        inicioHistoria pokesP1 pokesBot
designaModo pokesP1 pokesP2 pokesBot _ = do
        system "cls" 
        putStrLn "comando invalido"
        menuInicial pokesP1 pokesP2 pokesBot



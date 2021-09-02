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
        limpaTimes
        menuInicial 
        iniciar


menuInicial :: IO()
menuInicial = do
        exibeMenuInicial 
        op <- getChar
        getChar
        designaModo op


--Função que identifica e invoca o modo de jogo escolhido pelo usuário
designaModo :: Char -> IO()
designaModo '1' = do
        inicioPvBot
designaModo '2' = do
        inicioPvP
designaModo '3' = do
        inicioHistoria
designaModo  _ = do
        system "cls" 
        putStrLn "comando invalido"
        menuInicial



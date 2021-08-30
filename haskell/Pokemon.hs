import System.IO
import Data.Char
import System.Process
import System.FilePath.Posix
import MenusGraficos
import PvBot
import PvP
import Historia
import MovimentosBot
import Control.Exception
import System.IO.Error
import System.Directory
import Util


iniciar :: IO()
iniciar = do
        system "cls"

        verificaArquivos

        arq <- openFile "ArquivosTimes/timePlayer1.txt" ReadMode;
        pokesP1 <- hGetLine arq;
        hClose arq;

        arq <- openFile "ArquivosTimes/timePlayer2.txt" ReadMode;
        pokesP2 <- hGetLine arq;
        hClose arq;

        arq <- openFile "ArquivosTimes/timeBot.txt" ReadMode;
        pokesBot <- hGetLine arq;
        hClose arq;

        menuInicial (read pokesP1) (read pokesP2) (read pokesBot)
        iniciar


menuInicial :: Pokemons -> Pokemons -> Pokemons -> IO()
menuInicial pokesP1 pokesP2 pokesBot = do
        exibeMenuInicial 
        op <- getChar
        getChar
        designaModo pokesP1 pokesP2 pokesBot op


--Função que identifica e invoca o modo de jogo escolhido pelo usuário
designaModo :: Pokemons -> Pokemons -> Pokemons -> Char -> IO()
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
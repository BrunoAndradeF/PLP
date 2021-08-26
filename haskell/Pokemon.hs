import System.IO
import Data.Char
import System.Process
import System.FilePath.Posix
import MenusGraficos
import PvBot
import PvP
import Historia
import MovimentosBot
import PlayerOneMovimentos

--Definicao de tipos

type Pokemons = [Pokemon]
type Nome = String
type Vida = Int
type PerdeTurno  =  Bool
type TomaDano  =  Bool
type Tipo = String
data Pokemon = Pokemon Nome Vida PerdeTurno TomaDano Tipo
        deriving (Show, Read) 


--funcao que inicia o jogo
iniciar :: IO()
iniciar = do
        guardaDadosVidaBot 100
        guardaDadosVidaPlayer1 100
        gravaDados []
        system "cls"
        menuInicial
        iniciar

--funcao que grava os principais dados do jogo
gravaDados :: Pokemons -> IO Pokemons
gravaDados dados = do
        arq1 <- openFile "dadosPlayer1.txt" WriteMode
        hPrint arq1 (Pokemon "Zeca skull" 100 False False  "Fogo":dados)
        hPrint arq1 (Pokemon "Pikachu" 100 False False  "Fogo":dados)
        hPrint arq1 (Pokemon "SeaHourse" 100 False False  "Fogo":dados)
        hPrint arq1 (Pokemon "Kakuna" 100 False False  "Fogo":dados)
        hPrint arq1 (Pokemon "Digglet" 100 False False "Fogo":dados)
        hPrint arq1 (Pokemon "Eevee" 100 False  False "Fogo":dados)
        hClose arq1

        arq2 <- openFile "dadosPlayer2.txt" WriteMode
        hPrint arq2 (Pokemon "Zeca skull" 100 False False  "Fogo":dados)
        hPrint arq2 (Pokemon "Pikachu" 100 False False "Fogo":dados)
        hPrint arq2 (Pokemon "SeaHourse" 100 False False "Fogo":dados)
        hPrint arq2 (Pokemon "Kakuna" 100 False False "Fogo":dados)
        hPrint arq2 (Pokemon "Digglet" 100 False False "Fogo":dados)
        hPrint arq2 (Pokemon "Eevee" 100 False False "Fogo":dados)
        hClose arq2
        return dados
        

menuInicial :: IO()
menuInicial = do
        exibeMenuInicial 
        op <- getChar
        getChar
        designaModo op


--Função que identifica e invoca o modo de jogo escolhido pelo usuário
designaModo :: Char -> IO()
designaModo '1' = do
        system "cls"
        inicioPvBot
designaModo '2' = do
        system "cls"
        inicioPvP
designaModo '3' = do
        system "cls"
        inicioHistoria
designaModo _ = do
        system "cls" 
        putStrLn "comando invalido"
        menuInicial 
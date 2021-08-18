import System.IO
import Data.Char
import System.Process
import System.FilePath.Posix

--Definicao de tipos

type Pokemons = [Pokemon]
type Nome = String
type Vida = Int
type Tipo = String
type Vantagem = Int --valor a ser multiplicado quando o pokemon rival é inferior
data Pokemon = Pokemon Nome Vida Tipo Vantagem
        deriving (Show, Read) 






--funcao que inicia o jogo
iniciar :: IO()
iniciar = do
        gravaDados []
        system "cls"
        menuInicial


--funcao que grava os principais dados do jogo
gravaDados :: Pokemons -> IO Pokemons
gravaDados dados = do        
        arq <- openFile "dados.txt" WriteMode
        hPutStrLn arq (show ((Pokemon "Zeca skull" 100 "Fogo" 2):dados))
        hPutStrLn arq (show ((Pokemon "Pikachu" 100 "Fogo" 2):dados))
        hPutStrLn arq (show ((Pokemon "SeaHourse" 100 "Fogo" 2):dados))
        hPutStrLn arq (show ((Pokemon "Kakuna" 100 "Fogo" 2):dados))
        hPutStrLn arq (show ((Pokemon "Digglet" 100 "Fogo" 2):dados))
        hPutStrLn arq (show ((Pokemon "Eevee" 100 "Fogo" 2):dados))
        hClose arq
        return dados
        

menuInicial :: IO()
menuInicial = do
        putStrLn " ______________________________________________________________________"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                   888                                                |"
        putStrLn "|                   888                                                |"
        putStrLn "|                   888                                                |"
        putStrLn "| 88888b.   .d88b.  888  888  .d88b.  88888b.d88b.   .d88b.  88888b.   |"
        putStrLn "| 888  88b d88  88b 888 .88P d8P  Y8b 888  888  88b d88  88b 888  88b  |"
        putStrLn "| 888  888 888  888 888888K  88888888 888  888  888 888  888 888  888  |"
        putStrLn "| 888 d88P Y88..88P 888  88b Y8b.     888  888  888 Y88..88P 888  888  |"
        putStrLn "| 88888P     Y88P   888  888   Y8888  888  888  888   Y88    888  888  |"
        putStrLn "| 888                                                                  |"
        putStrLn "| 888                  ______  _______ _______ _______        _______  |"
        putStrLn "| 888                  |_____] |_____|    |       |    |      |______  |"
        putStrLn "|                      |_____] |     |    |       |    |_____ |______  |"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|______________________________________________________________________|"
        putStrLn "                                                                        "
        putStrLn "                      ~ESCOLHA O MODO DE JOGO~                          "
        putStrLn " ______________________________________________________________________ "
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                  Digite 1 para Player vs Bot                         |"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                  Digite 2 para Player vs Player                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                  Digite 3 para modo historia                         |"
        putStrLn "|                                                                      |"
        putStrLn "|______________________________________________________________________|"
        op <- getChar
        getChar
        designaModo op



--Função que identifica e invoca o modo de jogo escolhido pelo usuário
designaModo :: Char -> IO()
designaModo '1' = inicioPvBot
designaModo '2' = inicioPvP
designaModo '3' = inicioHistoria
designaModo _ = do
        system "cls" 
        putStrLn "comando invalido"
        menuInicial        


inicioHistoria :: IO()
inicioHistoria = do
        cabecalhoModoHistoria


inicioPvP :: IO()
inicioPvP = do
        cabecalhoPvP


inicioPvBot :: IO()
inicioPvBot = do
        cabecalhoPvBot


cabecalhoPvBot :: IO()
cabecalhoPvBot = do
        
        putStrLn " ______________________________________________________________________"
        putStrLn "|  8888888b.  888                                                      |"
        putStrLn "|  888   Y88b 888                                                      |"
        putStrLn "|  888    888 888                                                      |"
        putStrLn "|  888   d88P 888  8888b.  888  888  .d88b.  888d888                   |"
        putStrLn "|  8888888P°  888     _88b 888  888 d8P  Y8b 888P°                     |"
        putStrLn "|  888        888 .d888888 888  888 88888888 888                       |"
        putStrLn "|  888        888 888  888 Y88b 888 Y8b.     888                       |"
        putStrLn "|  888        888 °Y888888  °Y88888  °Y8888  888                       |"
        putStrLn "|                               888                                    |"
        putStrLn "|  888     888  .d8888b.   Y8b d88P 888888b.    .d88888b. 88888888888  |"
        putStrLn "|  888     888 d88P  Y88b   °Y88P°  888  °88b  d88P° °Y88b    888      |"
        putStrLn "|  888     888 Y88b.                888  .88P  888     888    888      |"
        putStrLn "|  Y88b   d88P  °Y888b.             8888888K.  888     888    888      |"
        putStrLn "|   Y88b d88P      °Y88b.           888  °Y88b 888     888    888      |"
        putStrLn "|    Y88o88P         °888           888    888 888     888    888      |"
        putStrLn "|     Y888P    Y88b  d88P           888   d88P Y88b. .d88P    888      |"
        putStrLn "|      Y8P      °Y8888P°            8888888P°   °Y88888P°     888      |"
        putStrLn "|______________________________________________________________________|"
        menuDeSelecao '1'


cabecalhoPvP :: IO()
cabecalhoPvP = do

        menuDeSelecao '2'


cabecalhoModoHistoria :: IO()
cabecalhoModoHistoria = do

        menuDeSelecao '3'






menuDeSelecao :: Char -> IO()
menuDeSelecao '1' = do
        putStrLn "                                                                        "
        putStrLn "                      ~ESCOLHA O SEU POKEMON~                           "
        putStrLn " ______________________________________________________________________ "
        putStrLn "|                                                                      |"
        putStrLn "|                    Digite 1 para Zeca skull                          |"
        putStrLn "|                                                                      |"
        putStrLn "|                    Digite 2 para Pikachu                             |"
        putStrLn "|                                                                      |"
        putStrLn "|                    Digite 3 para SeaHourse                           |"
        putStrLn "|                                                                      |"
        putStrLn "|                    Digite 4 para Kakuna                              |"
        putStrLn "|                                                                      |"
        putStrLn "|                    Digite 5 para Digglet                             |"
        putStrLn "|                                                                      |"
        putStrLn "|                    Digite 6 para Eevee                               |"
        putStrLn "|______________________________________________________________________|"
        op <- getChar
        getChar
        batalhaPvBot op



batalhaPvBot :: Char -> IO()
batalhaPvBot '1' = do
        putStrLn "Pokemon selecionado: Zeca skull"
        return()
batalhaPvBot '2' = do
        putStrLn "Pokemon selecionado: Pikachu"
        return()
batalhaPvBot '3' = do
        putStrLn "Pokemon selecionado: SeaHourse"
        return()
batalhaPvBot '4' = do
        putStrLn "Pokemon selecionado: Kakuna"
        return()
batalhaPvBot '5' = do
        putStrLn "Pokemon selecionado: Digglet"
        return()
batalhaPvBot '6' = do
        putStrLn "Pokemon selecionado: Eevee"
        return()

batalhaPvBot _ = do 
        system "cls"
        putStrLn "comando invalido"
        cabecalhoPvBot



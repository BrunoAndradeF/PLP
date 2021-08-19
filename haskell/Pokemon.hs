import System.IO
import Data.Char
import System.Process
import System.FilePath.Posix
import System.Random
import System.IO.Unsafe
import System.IO.Error
import Control.Exception

--Definicao de tipos

type Pokemons = [Pokemon]
type Nome = String
type Vida = Int
type  PerdeTurno  =  Bool
type  TomaDano  =  Bool
type Tipo = String
data Pokemon = Pokemon Nome Vida PerdeTurno TomaDano Tipo
        deriving (Show, Read) 


--funcao que inicia o jogo
iniciar :: IO()
iniciar = do
        system "cls"
        menuInicial

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
        putStrLn "|  888     888  .d8888b.   Y8b d88P                                    |"
        putStrLn "|  888     888 d88P  Y88b   °Y88P°                                     |"
        putStrLn "|  888     888 Y88b.                                                   |"
        putStrLn "|  Y88b   d88P  °Y888b.                                                |"
        putStrLn "|   Y88b d88P      °Y88b.                                              |"
        putStrLn "|    Y88o88P         °888                                              |"
        putStrLn "|     Y888P    Y88b  d88P                                              |"
        putStrLn "|      Y8P      °Y8888P°                                               |"
        putStrLn "|  8888888b.  888                                                      |"
        putStrLn "|  888   Y88b 888                                                      |"
        putStrLn "|  888    888 888                                                      |"
        putStrLn "|  888   d88P 888  8888b.  888  888  .d88b.  888d888                   |"
        putStrLn "|  8888888P°  888     _88b 888  888 d8P  Y8b 888P°                     |"
        putStrLn "|  888        888 .d888888 888  888 88888888 888                       |"
        putStrLn "|  888        888 888  888 Y88b 888 Y8b.     888                       |"
        putStrLn "|  888        888 °Y888888  °Y88888  °Y8888  888                       |"
        putStrLn "|                               888                                    |"
        putStrLn "|                          Y8b d88P                                    |"
        putStrLn "|                           °Y88P°                                     |"
        putStrLn "|______________________________________________________________________|"

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
        batalhaPvBot op escolhePokemonBot





{-______________________________________MOVIMENTOS DO BOT DO SISTEMA______________________________________-}

-- funcao que escolhe pokemon do bot

opcoesDePokemon = ["Zeca skull","Pikachu","SeaHourse","Kakuna","Digglet","Eevee"]
escolhePokemonBot :: String
escolhePokemonBot = opcoesDePokemon !!unsafePerformIO (getStdRandom (randomR (0, 5)))


--funcao que altera o estado do pokemon do bot (String = nome do pokemon, Char = tipo de ataque, int = dano ou cura causado)

curaBot :: String -> Int -> IO()
curaBot p a = do
        {catch (ler_arquivo) tratar_erro;}
        where
                -- tenta ler o arquivo
                ler_arquivo = do
                {
                        arq <- openFile "dadosPlayer2.txt" ReadMode; -- abre o arquivo para leitura
                        dados <- hGetLine arq; -- ler o conteúdo do arquivo
                        hClose arq; -- fecha o arquivo
                        atualizaPokemon (read dados) p a "cura"; -- passa os dados para a função menu
                        return ()
                }
                tratar_erro erro = if isDoesNotExistError erro then do
                {
                        return ()
                }
                else
                        ioError erro



atualizaPokemon :: Pokemons -> String -> Int -> String -> Pokemons
atualizaPokemon ((Pokemon nome vida pT tD ty):xs) p a m
        |(nome == p) = [(Pokemon nome (vida+a) pT tD ty)] ++ xs
        |otherwise = (Pokemon nome vida pT tD ty):(atualizaPokemon xs p a m)


--funcao que escolhe ataque do bot
opcoesDeAtqueBot = [1,2,3,4]
escolheAtaqueBot :: Int
escolheAtaqueBot = opcoesDeAtqueBot !!unsafePerformIO (getStdRandom (randomR (0, 3)))



{-______________________________________FIM DOS MOVIMENTOS DO BOT DO SISTEMA______________________________________-}




batalhaPvBot :: Char -> String -> IO()
batalhaPvBot '1' x = do
        system "cls" 
        menuExibeZeca
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        print valorAtaque

        batalhaPvBot '1' x
        
batalhaPvBot '2' x = do
        putStrLn "Pokemon selecionado: Pikachu"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()
        
batalhaPvBot '3' x = do
        putStrLn "Pokemon selecionado: SeaHourse"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()

batalhaPvBot '4' x = do
        putStrLn "Pokemon selecionado: Kakuna"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()

batalhaPvBot '5' x = do
        putStrLn "Pokemon selecionado: Digglet"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()

batalhaPvBot '6' x = do
        putStrLn "Pokemon selecionado: Eevee"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()

batalhaPvBot _ x = do 
        system "cls"
        putStrLn "comando invalido"
        cabecalhoPvBot





menuExibeZeca :: IO()
menuExibeZeca = do
        putStrLn " ______________________________________________________________________"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                                                                      |"
        putStrLn "|                                         ,-,,-,                       |"
        putStrLn "|                                   _____/     /_____                  |"
        putStrLn "|                                  (_________________)                 |"
        putStrLn "|                                       |() () |                       |"
        putStrLn "|                                    (  | oo   |                       |"
        putStrLn "|_____________________________________)_`|  |--'_______________________|"
        putStrLn "|                -                   (___^^^^|                         |"
        putStrLn "|         __          _                 (____'    -- Elmar Kurgpold    |"
        putStrLn "|        (  )_              ____                    __                 |"
        putStrLn "|       (___( )                   -                                    |"
        putStrLn "|                       __                                             |"
        putStrLn "|     ___                                                              |"
        putStrLn "|                -                           __                        |"
        putStrLn "|                                         _                            |"
        putStrLn "|                                                                      |"
        putStrLn "|______________________________________________________________________|"

menuExibePikachu :: IO()
menuExibePikachu = do
        system "cls"
        putStrLn "Pikachu"

menuExibeSeaHourse :: IO()
menuExibeSeaHourse = do
        system "cls"
        putStrLn "SeaHourse"

menuExibeKakuna :: IO()
menuExibeKakuna = do
        system "cls"
        putStrLn "Kakuna"

menuExibeDigglet :: IO()
menuExibeDigglet = do
        system "cls"
        putStrLn "Digglet"

menuExibeEevee :: IO()
menuExibeEevee = do
        system "cls"
        putStrLn "Eevee"












exibeAtaques :: IO()
exibeAtaques = do
        putStrLn "                                                                        "
        putStrLn "                                                                        "
        putStrLn "                         ~ESCOLHA O SEU ATAQUE~                         "
        putStrLn "                                                                        "
        putStrLn " ________________________________   ___________________________________ "
        putStrLn "|                                | |                                   |"
        putStrLn "|        Digite 1 para Cura      | |       Digite 2 para Ataque        |"
        putStrLn "|________________________________| |___________________________________|"
        putStrLn " ________________________________   ___________________________________ "
        putStrLn "|                                | |                                   |"
        putStrLn "|      Digite 3 para Critico     | |   Digite 4 para alterar Status    |"
        putStrLn "|________________________________| |___________________________________|"
        putStrLn "                                                                        "

{-___________________________________________________ metodo para designar ataques ___________________________________________________-}

designaAtaque :: Char -> Int
designaAtaque '1' = curar
designaAtaque '2' = atacar
designaAtaque '3' = ataqueCritico
designaAtaque _ = 0
--designaAtaque '4' = alteraStatus


{- ___________________________________________________sessão de metodos de ataque___________________________________________________-}

{-Possibilitam curar a própria vida
Infligem dano no adversário
Causem dano Critical
Alteram status de Pokémons (como paralisia e envenenamento )
-}

opcoesDeCura = [15,10,5]
curar :: Int
curar = opcoesDeCura !!unsafePerformIO (getStdRandom (randomR (0, 2)))



opcoesDeAtaqueNormal = [25,15,5]
atacar :: Int
atacar = opcoesDeAtaqueNormal !!unsafePerformIO (getStdRandom (randomR (0, 2)))


opcoesDeCritico = [0,0,0,0,40]
ataqueCritico :: Int
ataqueCritico = opcoesDeCritico !!unsafePerformIO (getStdRandom (randomR (0, 4)))


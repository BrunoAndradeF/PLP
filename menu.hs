import Control.Exception
import System.IO
import System.IO.Error
import System.Process
type Jogadores = [Jogador]
type Nome = String
type Pontuacao = Int
type Vez = Int
type Tabela = [Char]
data Jogador = Jogador Nome Pontuacao
                                        deriving (Show, Read)
menu :: Jogadores -> IO Jogadores
menu dados = do
                system "cls"
                putStrLn "-------------------------------- Pokémon Battle--------------------------------"
                putStrLn "\nDigite 1 para jogar Player vs Player"
                putStrLn "Digite 2 para jogar Player vs Bot"
                putStrLn "Digite 3 para jogar Modo História"
                putStrLn "Digite 0 para sair do jogo"
                putStr "Opção: "
                op <- getChar
                getChar -- descarta o Enter
                executarOpcao dados op
--Verificar se faço um menu a parte por conta dos modos contra bot
executarOpcao :: Jogadores -> Char -> IO Jogadores
executarOpcao dados '1' = pvp dados

--executarOpcao dados '2' = pvbot dados

--executarOpcao dados '3' = hist dados

executarOpcao dados '0' = do
                                putStrLn ("\nObrigado por jogar\n")
                                return dados
executarOpcao dados _ = do
                                putStrLn "\nDigite uma opção listada"
                                putStr "\nPressione <Enter> para voltar ao menu..."
                                getChar
                                menu dados
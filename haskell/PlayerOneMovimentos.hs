module PlayerOneMovimentos where
import System.IO
import Data.Char
import System.Process
import System.Random
import System.IO.Unsafe
import MovimentosBot

-- funcao que atualiza um pokemon parametros(tipoDeMovimento, valorDanoOuCura)
atualizaVidaPlayer1 :: Int -> Int -> IO()
atualizaVidaPlayer1 tipoDeMovimento valorDanoOuCura
	| (tipoDeMovimento == 1) = atualizaArqCuraPlayer1 valorDanoOuCura
	| otherwise = atualizaArqAtaquePlayer1 valorDanoOuCura

--funcao que atualiza a vida do pokemon do bot quando se cura
atualizaArqCuraPlayer1 :: Int -> IO()
atualizaArqCuraPlayer1 valorCura = do
	arq <- openFile "pokemonVidaPlayer1.txt" ReadMode
	aux <- hGetLine arq
	hClose arq
	if (podeCurar (read aux)) then do guardaDadosVidaPlayer1 (soma (read aux) valorCura) else do putStrLn "Pokemon com a vida cheia"
	

--funcao que atualiza a vida do pokemon do bot quando é atacado
atualizaArqAtaquePlayer1 :: Int -> IO()
atualizaArqAtaquePlayer1 valorCura = do
	arq <- openFile "pokemonVidaPlayer1.txt" ReadMode
	aux <- hGetLine arq
	hClose arq
	guardaDadosVidaPlayer1 (subtracao (read aux) valorCura)

guardaDadosVidaPlayer1 :: Int -> IO()
guardaDadosVidaPlayer1 vidaAtual = do
	arq <- openFile "pokemonVidaPlayer1.txt" WriteMode
	hPrint arq vidaAtual
	hClose arq
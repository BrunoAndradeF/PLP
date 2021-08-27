module PlayerTwoMovimentos where
import System.IO
import Data.Char
import System.Process
import System.Random
import System.IO.Unsafe
import MovimentosBot

-- funcao que atualiza um pokemon parametros(tipoDeMovimento, valorDanoOuCura)
atualizaVidaPlayer2 :: Int -> Int -> IO()
atualizaVidaPlayer2 tipoDeMovimento valorDanoOuCura
	| (tipoDeMovimento == 1) = atualizaArqCuraPlayer2 valorDanoOuCura
	| otherwise = atualizaArqAtaquePlayer2 valorDanoOuCura

--funcao que atualiza a vida do pokemon do bot quando se cura
atualizaArqCuraPlayer2 :: Int -> IO()
atualizaArqCuraPlayer2 valorCura = do
	arq <- openFile "pokemonVidaPlayer2.txt" ReadMode
	aux <- hGetLine arq
	hClose arq
	if (podeCurar (read aux)) then do guardaDadosVidaPlayer2 (soma (read aux) valorCura) else do putStrLn "Pokemon com a vida cheia"
	

--funcao que atualiza a vida do pokemon do bot quando é atacado
atualizaArqAtaquePlayer2 :: Int -> IO()
atualizaArqAtaquePlayer2 valorCura = do
	arq <- openFile "pokemonVidaPlayer2.txt" ReadMode
	aux <- hGetLine arq
	hClose arq
	guardaDadosVidaPlayer2 (subtracao (read aux) valorCura)

guardaDadosVidaPlayer2 :: Int -> IO()
guardaDadosVidaPlayer2 vidaAtual = do
	arq <- openFile "pokemonVidaPlayer2.txt" WriteMode
	hPrint arq vidaAtual
	hClose arq

getVidaPlayer2 :: IO String 
getVidaPlayer2 = do
	arq <- openFile "pokemonVidaPlayer2.txt" ReadMode
	aux <- hGetLine arq
	hClose arq
	return aux
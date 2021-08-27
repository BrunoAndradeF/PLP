module MovimentosBot where
import System.IO
import Data.Char
import System.Process
import System.Random
import System.IO.Unsafe

-- funcao que escolhe pokemon do bot
escolhePokemonBot :: Int
escolhePokemonBot = unsafePerformIO (getStdRandom (randomR (0, 5)))

--funcao que escolhe ataque do bot
escolheAtaqueBot :: Int
escolheAtaqueBot = unsafePerformIO (getStdRandom (randomR (2, 3)))

-- funcao que atualiza um pokemon parametros(tipoDeMovimento, valorDanoOuCura)
atualizaVidaBot :: Int -> Int -> IO()
atualizaVidaBot tipoDeMovimento valorDanoOuCura
	| (tipoDeMovimento == 1) = atualizaArqCura valorDanoOuCura
	| otherwise = atualizaArqAtaque valorDanoOuCura

--funcao que atualiza a vida do pokemon do bot quando se cura
atualizaArqCura :: Int -> IO()
atualizaArqCura valorCura = do
	arq <- openFile "pokemonVidaBot.txt" ReadMode
	aux <- hGetLine arq
	hClose arq
	if (podeCurar (read aux)) then guardaDadosVidaBot (soma (read aux) valorCura) else putStrLn "Pokemon com a vida cheia"
	return()

--funcao que diz se o bot pode curar
podeCurar :: Int -> Bool
podeCurar a = if (a>=100) then False else True

-- funcao que soma a vida do bot
soma :: Int -> Int -> Int
soma a b = a + b 

--funcao que atualiza a vida do pokemon do bot quando é atacado
atualizaArqAtaque :: Int -> IO()
atualizaArqAtaque valorAtaque = do
	arq <- openFile "pokemonVidaBot.txt" ReadMode
	aux <- hGetLine arq
	hClose arq
	guardaDadosVidaBot (subtracao (read aux) valorAtaque)

--funcao que subtrai a vida do bot
subtracao :: Int -> Int -> Int
subtracao a b = a - b


guardaDadosVidaBot :: Int -> IO()
guardaDadosVidaBot vidaAtual = do
	arq <- openFile "pokemonVidaBot.txt" WriteMode
	hPrint arq vidaAtual
	hClose arq


 	
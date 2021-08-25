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
escolheAtaqueBot = unsafePerformIO (getStdRandom (randomR (2, 4)))

-- funcao que atualiza um pokemon parametros(tipoDeMovimento, valorDanoOuCura)
atualizaVidaBot :: Int -> Int -> Int
atualizaVidaBot tipoDeMovimento valorDanoOuCura
	| (tipoDeMovimento == 1) = atualizaArqCura valorDanoOuCura
	| otherwise = atualizaArqAtaque valorDanoOuCura

atualizaArqCura :: Int -> IO()
atualizaArqCura valorCura = do


atualizaArqAtaque :: Int -> IO()



guardaDadosVidaBot :: IO()
guardaDadosVidaBot = do
	arq <- openFile "pokemonVida.txt" WriteMode
	hPrint arq 100
	hClose arq


 	
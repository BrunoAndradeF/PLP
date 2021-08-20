module MovimentosBot where
import System.Random
import System.IO.Unsafe

-- funcao que escolhe pokemon do bot

escolhePokemonBot :: Int
escolhePokemonBot = unsafePerformIO (getStdRandom (randomR (0, 5)))

--funcao que escolhe ataque do bot
escolheAtaqueBot :: Int
escolheAtaqueBot = unsafePerformIO (getStdRandom (randomR (1, 4)))
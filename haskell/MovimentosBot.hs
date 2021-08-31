module MovimentosBot where
import System.IO
import Data.Char
import System.Process
import System.Random
import System.IO.Unsafe

escolhePokemonBot :: Int
escolhePokemonBot = unsafePerformIO (getStdRandom (randomR (0, 5)))

escolheAtaqueBot :: Int
escolheAtaqueBot = unsafePerformIO (getStdRandom (randomR (2, 3)))

module MovimentosBot where
import System.Random

-- funcao que escolhe pokemon do bot
opcoesDePokemon = ["Zeca skull","Pikachu","SeaHourse","Kakuna","Digglet","Eevee"]
escolhePokemonBot :: String
escolhePokemonBot = opcoesDePokemon !!unsafePerformIO (getStdRandom (randomR (0, 5)))

--funcao que escolhe ataque do bot
opcoesDeAtqueBot = [1,2,3,4]
escolheAtaqueBot :: Int
escolheAtaqueBot = opcoesDeAtqueBot !!unsafePerformIO (getStdRandom (randomR (0, 3)))
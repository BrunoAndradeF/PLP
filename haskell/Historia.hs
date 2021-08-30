module Historia where
import MenusGraficos
import Ataques
import Util

inicioHistoria :: Pokemons -> Pokemons -> IO()
inicioHistoria pokesP1 pokesBot = do
        exibeCabecalhoHistoria
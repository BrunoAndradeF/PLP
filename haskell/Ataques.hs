module Ataques where
import System.Random
import System.IO.Unsafe
import MenusGraficos

{-___________________________________________________ metodo para designar ataques ___________________________________________________-}

designaAtaque :: Int -> String -> String -> Int
designaAtaque movimento pokemonAtacando pokemonDefendendo
  | movimento == 1 = curar
  | movimento == 2 = atacar + danoPorTipo pokemonAtacando pokemonDefendendo
  | movimento == 3 = ataqueCritico + danoPorTipo pokemonAtacando pokemonDefendendo

{- ___________________________________________________sessão de metodos de ataque___________________________________________________-}


curar :: Int
curar = unsafePerformIO (getStdRandom (randomR (5, 15)))

atacar :: Int
atacar = -1 * unsafePerformIO (getStdRandom (randomR (5, 25)))

ataqueCritico :: Int
ataqueCritico = -1 * unsafePerformIO (getStdRandom (randomR (10, 35)))




alteraStatus :: Int
alteraStatus = -1 * unsafePerformIO (getStdRandom (randomR (0, 10)))
--Tentar deixar o status mais dinâmico
turnosComStatus :: Int
turnosComStatus = unsafePerformIO (getStdRandom (randomR (0,2)))

perdeTurno :: String -> Bool
perdeTurno a
  |(a == "Digglet") || (a == "SeaHourse") || (a == "Eevee") = True
  |otherwise = False

turnoComDano :: String -> Bool
turnoComDano a
  |(a == "Zeca Skull") || (a == "Kakuna") || (a == "Pikachu") = True
  |otherwise = False
danoPorTipo :: String -> String -> Int
danoPorTipo a b
  | (a=="Zeca Skull" && b=="SeaHourse") || (a=="Digglet" && b=="Zeca Skull") || ((a=="Digglet" && b=="Pikachu") || (a=="Digglet" && b=="Kakuna")) = 10
  | (a=="Digglet" && b=="SeaHourse") || (a=="Kakuna" && b=="Digglet") = -5
  | (a=="Pikachu" && b=="Digglet") || (a=="Zeca Skull" && b=="Digglet") = -5
  | otherwise =0


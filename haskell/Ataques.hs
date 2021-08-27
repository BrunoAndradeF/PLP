module Ataques where
import System.Random
import System.IO.Unsafe
import MenusGraficos

{-___________________________________________________ metodo para designar ataques ___________________________________________________-}

designaAtaque :: Int -> String -> String -> Int
designaAtaque movimento pokemonAtacando pokemonDefendendo
  | (movimento == 1) = curar + danoPorTipo pokemonAtacando pokemonDefendendo
  | (movimento == 2) = atacar + danoPorTipo pokemonAtacando pokemonDefendendo
  | (movimento == 3) = ataqueCritico + danoPorTipo pokemonAtacando pokemonDefendendo

{- ___________________________________________________sessão de metodos de ataque___________________________________________________-}


curar :: Int
curar = unsafePerformIO (getStdRandom (randomR (5, 15)))

atacar :: Int
atacar = unsafePerformIO (getStdRandom (randomR (5, 25)))

ataqueCritico :: Int
ataqueCritico = unsafePerformIO (getStdRandom (randomR (10, 35)))



opcoesDeStatus=[0,0,0,10,10]
alteraStatus :: Int
alteraStatus = opcoesDeStatus !!unsafePerformIO (getStdRandom (randomR (0, 4)))


--Usar para rodar nos turnos e ver se o efeito sai depois nos rounds
tiraStatus=[False,True,True,True,False]

--Pensar como pegar os tipos do pokemon da batalha
danoPorTipo :: String -> String -> Int
danoPorTipo a b
  | (a=="Zeca Skull" && b=="SeaHourse") || (a=="Digglet" && b=="Zeca Skull") || ((a=="Digglet" && b=="Pikachu") || (a=="Digglet" && b=="Kakuna")) = 10
  | (a=="Digglet" && b=="SeaHourse") || (a=="Kakuna" && b=="Digglet") = -5
  | (a=="Pikachu" && b=="Digglet") || (a=="Zeca Skull" && b=="Digglet") = -5
  | otherwise =0


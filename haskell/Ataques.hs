
module Ataques where
import System.Random
import System.IO.Unsafe
import MenusGraficos

{-___________________________________________________ metodo para designar ataques ___________________________________________________-}
designaAtaque :: Int -> Int
designaAtaque 1 = curar
designaAtaque 2 = atacar
designaAtaque 3 = ataqueCritico
--designaAtaque 4 = alteraStatus



{- ___________________________________________________sessão de metodos de ataque___________________________________________________-}


curar :: Int
curar = unsafePerformIO (getStdRandom (randomR (5, 15)))

atacar :: Int
atacar = unsafePerformIO (getStdRandom (randomR (5, 25)))

ataqueCritico :: Int
ataqueCritico = unsafePerformIO (getStdRandom (randomR (10, 40)))

{-opcoesDeStatus=[0,0,0,10,10]
alteraStatus :: Int
alteraStatus = opcoesDeCritico !!unsafePerformIO (getStdRandom (randomR (0, 4)))
--Usar para rodar nos turnos e ver se o efeito sai depois nos rounds
tiraStatus=[false,true,true,true,false]
--Pensar como pegar os tipos do pokemon da batalha no txt
danoPorTipo :: String -> String -> Int
danoPorTipo a b
  | (a=="Fogo" && b=="Gelo") || (a=="Terrestre" && b=="Fogo") || ((a=="Terrestre" && b=="Elétrico") || (a=="Terrestre" && b=="Poison")) = 10
  | (a=="Terrestre" && b=="Gelo") || (a=="Poison" && b=="Terrestre") = -5
  | (a=="Elétrico" && b=="Terrestre") || (a=="Fogo" && b=="Terrestre") = -5
  | otherwise =0-}
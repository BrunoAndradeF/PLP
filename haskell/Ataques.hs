
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

{-Possibilitam curar a própria vida
Infligem dano no adversário
Causem dano Critical
Alteram status de Pokémons (como paralisia e envenenamento )
-}

opcoesDeCura = [15,10,5]
curar :: Int
curar = opcoesDeCura !!unsafePerformIO (getStdRandom (randomR (0, 2)))



opcoesDeAtaqueNormal = [25,15,5]
atacar :: Int
atacar = opcoesDeAtaqueNormal !!unsafePerformIO (getStdRandom (randomR (0, 2)))


opcoesDeCritico = [0,0,0,0,40]
ataqueCritico :: Int
ataqueCritico = opcoesDeCritico !!unsafePerformIO (getStdRandom (randomR (0, 4)))

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
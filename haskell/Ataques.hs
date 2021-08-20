
module Ataques where
import System.Random
import System.IO.Unsafe
import MenusGraficos

{-___________________________________________________ metodo para designar ataques ___________________________________________________-}
designaAtaque :: Int -> Int 
designaAtaque 1 = curar
designaAtaque 2 = atacar
designaAtaque 3 = ataqueCritico
designaAtaque 4 = alteraStatus



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


alteraStatus :: Int
alteraStatus = error "not implemented"

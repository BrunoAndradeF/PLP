module MovimentosBot where
import System.IO
import Data.Char
import System.Process
import System.Random
import System.IO.Unsafe

--definindo pokemons (vida, (status, status))
zecaSkull = (100, (False, False)) --id:1
pikachu = (100, (False, False)) --id:2
seaHourse = (100, (False, False)) --id:3
kakuna = (100, (False, False)) --id:4
digglet = (100, (False, False)) --id:5
eevee = (100, (False, False)) --id:6

-- funcao que escolhe pokemon do bot
escolhePokemonBot :: Int
escolhePokemonBot = unsafePerformIO (getStdRandom (randomR (0, 5)))

--funcao que escolhe ataque do bot
escolheAtaqueBot :: Int
escolheAtaqueBot = unsafePerformIO (getStdRandom (randomR (2, 4)))

--movimentos = ["curar", "ataque", "ataqueCritico", "Status"]
-- funcao que atualiza um pokemon parametros(idPokemon, tipoDeMovimento, valorDanoOuCura)
atualizaPokemon :: Int -> Int -> Int -> IO()
atualizaPokemon idPokemon tipoDeMovimento valorDanoOuCura 
	| (idPokemon == 1)
	| (idPokemon == 2)
	| (idPokemon == 3)
	| (idPokemon == 4)
	| (idPokemon == 5)
	| (idPokemon == 6)
	


data Tabela chave valor = Tab [(chave, valor)]

--procura por uma chave, retorna o valor associado
buscar :: (Ord a) => a -> Tabela a b -> Maybe b
buscar _ (Tab []) = Nothing
buscar chave (Tab ((c,v):xs))
		| (chave < c) = Nothing
		| (chave == c) = Just v
		| (chave > c) = buscar chave (Tab xs)


-- atualiza a tabela
-- se já existir a chave, atualiza com o novo valor
-- se a chave for menor, então insere no início
-- se a chave for maior, então continua percorrendo
atualizar :: (Ord a) => (a,b) -> Tabela a b -> Tabela a b
atualizar (chave, valor) (Tab []) = Tab [(chave, valor)]
atualizar (chave, valor) (Tab ((c,v):xs))
			| (chave < c) = Tab ((chave, valor):(c,v):xs)
			| (chave == c) = Tab ((c, valor):xs)
			| (chave > c) = let (Tab t) = (atualizar (chave, valor) (Tab xs))
								in Tab ((c,v):t)

lista = [(1, zecaSkull),(2, pikachu),(3, seaHourse),(4, kakuna),(5, digglet),(6, eevee)]

-- instância de Show para mostrar os dados
instance (Show a, Show b) => Show (Tabela a b) where
	show (Tab []) = ""
	show (Tab ((c,v):xs)) = "Chave: " ++ (show c) ++ ", Valor: " ++ (show v) ++ "\n" ++ (show (Tab xs))
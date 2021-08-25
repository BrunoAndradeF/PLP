module PvBot where
import MenusGraficos
import Ataques
import MovimentosBot
import System.Process
import System.IO

--Define a vez de jogar (1 para Player1 e 2 para o bot)
type Vez = Int

inicioPvBot :: IO()
inicioPvBot = do
        exibeCabecalhoPvBot
        menuDeSelecaoPvBot

menuDeSelecaoPvBot :: IO()
menuDeSelecaoPvBot = do
        exibeMenuDeSelecao
        aux <- readLn :: IO Int
        let op = aux - 1

        if  op >= 0 && op <= 5 then do
                putStrLn ("Pokemon selecionado: " ++ (nomesPokemons !! op))
                batalhaPvBot (nomesPokemons !! op) (nomesPokemons !!escolhePokemonBot) 1
        else do
                exibeOpcaoInvalida
                menuDeSelecaoPvBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

batalhaPvBot :: String -> String-> Vez -> IO()
batalhaPvBot player1 bot vez = do
        if vez == 1 then do
                exibePokemons player1
                exibeAtaques
                aux <- readLn :: IO Int
                let op = aux
                if  op >= 1 && op <= 4 then do
                        let valorAtaque = designaAtaque op
                        atualizaVidaBot op valorAtaque
                        print valorAtaque
                        batalhaPvBot player1 bot 2
                else do
                        exibeOpcaoInvalida
                        batalhaPvBot player1 bot 1
                
                
        else do
                exibePokemons bot
                --funcao de atualização do pokemon apos ataque aqui
                --funcao de verificacao se o pokemon do player1 ta vivo aq
                --batalhaPvBot player1 bot 1

        

        
module PvBot where
import MenusGraficos
import Ataques
import System.Process
import System.IO


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
                batalhaPvBot (nomesPokemons !! op)
        else do
                exibeOpcaoInvalida
                menuDeSelecaoPvBot
        where nomesPokemons = ["Zeca Skull", "Pikachu", "SeaHourse", "Kakuna", "Digglet", "Eevee"]

batalhaPvBot :: String -> IO()
batalhaPvBot p = do
        exibePokemons p
        exibeAtaques

        aux <- readLn :: IO Int
        let op = aux

        if  op >= 1 && op <= 4 then do
                let valorAtaque = designaAtaque op
                print valorAtaque
        else do
                exibeOpcaoInvalida
                batalhaPvBot p
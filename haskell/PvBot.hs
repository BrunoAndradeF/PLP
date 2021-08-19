module PvBot where
import MenusGraficos
import Ataques
import System.Process

inicioPvBot :: IO()
inicioPvBot = do
        exibeCabecalhoPvBot 
        menuDeSelecaoPvBot

menuDeSelecaoPvBot :: IO()
menuDeSelecaoPvBot = do
        exibeMenuDeSelecao
        op <- getChar
        getChar
        batalhaPvBot op

batalhaPvBot :: Char -> IO()
batalhaPvBot '1' = do
        putStrLn "Pokemon selecionado: Zeca skull"
        exibeZeca
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        print valorAtaque

        return()
        
batalhaPvBot '2' = do
        putStrLn "Pokemon selecionado: Pikachu"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()
        
batalhaPvBot '3' = do
        putStrLn "Pokemon selecionado: SeaHourse"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()

batalhaPvBot '4' = do
        putStrLn "Pokemon selecionado: Kakuna"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()

batalhaPvBot '5' = do
        putStrLn "Pokemon selecionado: Digglet"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()

batalhaPvBot '6' = do
        putStrLn "Pokemon selecionado: Eevee"
        exibeAtaques
        op <- getChar
        getChar
        let valorAtaque = designaAtaque op
        return()

batalhaPvBot _ = do 
        system "cls"
        putStrLn "comando invalido"
        inicioPvBot
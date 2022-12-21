module Main (main) where


import qualified HelloWorld


main :: IO ()
main =
    putStrLn (HelloWorld.hello "test")

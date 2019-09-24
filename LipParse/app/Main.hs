module Main where

import           Parse

main :: IO ()
main = do
  putStrLn "Day: "
  d <- getLine
  putStrLn "Fuso: "
  f <- getLine
  repl d f

repl :: String -> String -> IO ()
repl d f = putStrLn "File (absolute path): " >>
           getLine >>= \x -> case words x of
                          ["exit"]  -> pure ()
                          ["mudar"] -> main
                          [i]       -> parse i i "nn,nome,numero,email,dia,date,net" d f
                          _         -> repl d f

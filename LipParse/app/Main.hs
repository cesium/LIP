module Main where

import Parse 

main :: IO ()
main = putStrLn "Day: " >> getLine >>= repl 

repl :: String -> IO ()
repl d = putStrLn "Filei (absolute path): " >> getLine >>= \x -> case words x of
                                                            ["exit"] -> pure ()
                                                            ["mudar"] -> main
                                                            [i] -> parse i i "nn,nome,numero,email,dia,date,net" d
                                                            _ -> repl d  

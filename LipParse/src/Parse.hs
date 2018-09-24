{-# LANGUAGE OverloadedStrings #-}
module Parse
    ( Person(..)
    , parse
    ) where


import Control.Applicative

import Data.Vector 

import qualified Data.ByteString.Lazy as BL

import qualified Data.Text.IO  as T
import qualified Data.Text as T
import Data.Text (Text)

import Data.Csv


data Person = Person
    { nn :: !Text
    , nome :: !Text
    , numero :: !Text
    , email :: !Text
    , dia :: !Text
    , date :: !Text
    , net :: !Text
    } deriving Show

instance FromNamedRecord Person where
    parseNamedRecord r = Person <$> r .: "nn" <*> r .:  "nome" <*> r .: "numero" <*> r .: "email" <*> r .: "dia" <*> r .: "date" <*> r .: "net"


updateHead :: Text -> [Text] -> [Text]
updateHead _ [] = []
updateHead h (_:vals) = h:vals

changeHeaders :: FilePath -> Text -> FilePath -> IO ()
changeHeaders path content opath = do
    input <- T.readFile path
    content <-  T.unlines . updateHead content . T.lines <$> T.readFile path
    T.writeFile opath content

getData :: FilePath -> IO (Vector Person)
getData path  = do
    cdvData <- BL.readFile path 
    case decodeByName cdvData of
        Left r -> error r
        Right (_,v) -> pure v

parse :: FilePath -> FilePath -> FilePath -> String -> IO ()
parse i o headers d = changeHeaders i (T.pack headers) o >> getData o >>= pp (T.pack d)

pp :: Text -> Vector Person -> IO ()
pp d v = Data.Vector.mapM_ (\x -> if T.isPrefixOf d (dia x) then (T.putStrLn.ptr) x else pure ()) v where
    ptr :: Person -> Text
    ptr p = (nome p) <> " " <>  (numero p) <> " " <>  (email p) <> " " <> (dia p) 

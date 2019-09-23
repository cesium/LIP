{-# LANGUAGE OverloadedStrings #-}
module Parse
    ( parse
    ) where


import           Control.Applicative
import qualified Data.ByteString.Lazy as BL
import           Data.Csv
import           Data.Text            (Text)
import qualified Data.Text            as T
import qualified Data.Text.IO         as T
import           Data.Vector
import           Types


updateHead :: Text -> [Text] -> [Text]
updateHead _ []       = []
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
        Left r      -> error r
        Right (_,v) -> pure v

parse :: FilePath -> FilePath -> FilePath -> String -> String -> IO ()
parse i o headers d f = changeHeaders i (T.pack headers) o >> getData o >>= pp (T.pack d) (T.pack f)

pp :: Text -> Text -> Vector Person -> IO ()
pp d f v = let gajos = Data.Vector.filter (T.isPrefixOf (fuso f) . dia) v
               nGajos = T.pack . show . Data.Vector.length $ gajos
           in T.putStrLn ("Nº: " <> nGajos) >> Data.Vector.mapM_ (T.putStrLn.ptr) gajos where
                fuso :: Text -> Text
                fuso "manha" = d <> ": 9"
                fuso "tarde" = d <> ": 1"
                fuso _       = d

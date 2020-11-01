{-# LANGUAGE OverloadedStrings #-}

module Types where

import           Control.Applicative
import           Data.Csv
import           Data.Text           (Text)
import qualified Data.Text           as T

data Person = Person
    { nn     :: !Text
    , nome   :: !Text
    , numero :: !Text
    , email  :: !Text
    , dia    :: !Text
    , date   :: !Text
    , net    :: !Text
    } deriving Show

instance FromNamedRecord Person where
    parseNamedRecord r = Person <$> r .: "nn"
                                <*> r .: "nome"
                                <*> r .: "numero"
                                <*> r .: "email"
                                <*> r .: "dia"
                                <*> r .: "date"
                                <*> r .: "net"


ptr :: Person -> Text
ptr p = nome p <> " " <>  numero p <> " " <>  dia p

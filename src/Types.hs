module Types where

import Data.Map

data CTSettings = CTSettings { verbose :: Bool
                         , help :: Bool
                         }

defaultSettings = CTSettings { verbose = False
                           , help = False
                           }


type Name = String

data Stat = ArbitraryNumber Name Integer Bool
          | BoundedNumber Name Integer Integer Integer
          | ArbitraryString Name String Bool
          | StatBoundedNumber Name Integer Name (Integer -> (Integer, Integer))
          | StatBasedNumber Name Name (Integer -> Integer)

data Item = Item { cTitle :: String
                 , cKeywords :: [String]
                 , cStatModifiers :: Map String Integer
                 , cOtherNotes :: [String]
                 } deriving (Show, Read, Eq)

data Ability = Ability { aTitle :: String
                       , aKeywords :: [String]
                       , aStatModifiers :: Map String Integer
                       , aOtherNotes :: [String]
                       } deriving (Show, Read, Eq)
data Event = Event { eDescription :: String
                   , eStatModifiers :: Map String Integer
                   , eOtherNotes :: [String]
                   } deriving (Show, Read, Eq)


module Types where

import Data.Map

data CTSettings = CTSettings { verbose :: Bool
                         , help :: Bool
                         }

defaultSettings = CTSettings { verbose = False
                           , help = False
                           }


type Name = String

data Stat = ArbitraryNumber Name Int Bool
          | BoundedNumber Name Int Int Int
          | ArbitraryString Name String Bool
          | StatBoundedNumber Name Int Int Name (Int -> (Int, Int))
          | StatBasedNumber Name Name (Int -> Int)

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


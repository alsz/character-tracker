module Main where

import Graphics.UI.Gtk
import System.Console.GetOpt
import System.Environment (getArgs)
import System.Exit

import Types
import SampleData
import Layout

main :: IO ()
main = do
    args <- getArgs
    let (settings, nonOptions, errors) = getOpt RequireOrder options args
    if Help `elem` settings
      then do
        putStrLn $ usageInfo "character-tracker" options
        exitWith ExitSuccess
      else do
        return ()
    startGui $ optionsToSettings settings

data Flag = Verbose | Help | Version
    deriving (Eq, Show)

options :: [ OptDescr (Flag) ]
options =
    [ Option "h" ["help"] (NoArg Help) "Print Help Info"
    , Option "v" ["verbose"] (NoArg Verbose) "Be Verbose"
    , Option "V" ["version"] (NoArg Version) "Get Version"
    ]

optionsToSettings :: [Flag] -> CTSettings
optionsToSettings [] = defaultSettings
optionsToSettings (Verbose:opts) = (optionsToSettings opts){verbose = True}
optionsToSettings (_:opts) = (optionsToSettings opts)

startGui :: CTSettings -> IO ()
startGui _settings = do
    initGUI
    window <- generateLayout sampleStats
    window `onDestroy` mainQuit
    widgetShowAll window
    mainGUI

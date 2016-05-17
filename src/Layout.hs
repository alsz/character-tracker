module Layout where

import Graphics.UI.Gtk

import Types
import SampleData

generateLayout :: [[Stat]] -> IO (Window)
generateLayout _stats = do
  window <- windowNew
  frame <- frameNew
  button <- buttonNew
  window `set` [ containerBorderWidth := 5, containerChild := frame ]
  frame `set` [ frameLabel := "Hello" , containerChild := button]
  button `set` [ buttonLabel := "Click Me!" ]
  button `onClicked` putStrLn "Click!"
  return window

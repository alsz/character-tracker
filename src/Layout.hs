module Layout where

import Graphics.UI.Gtk

import Types
import SampleData

genericMax = 2000
genericMin = -10

generateLayout :: [[Stat]] -> IO (Window)
generateLayout stats = do
  window <- windowNew
  frame <- frameNew
  button <- buttonNew
  vbox <- vBoxNew True 4
  mapM (\a -> generateRow a >>= containerAdd vbox) stats
  window `set` [ containerBorderWidth := 5, containerChild := frame ]
  frame `set` [ frameLabel := "Alice" , containerChild := vbox]
  button `set` [ buttonLabel := "Click Me!" ]
  button `onClicked` putStrLn "Click!"
  return window

generateRow :: [Stat] -> IO (HBox)
generateRow stats = do
  row <- hBoxNew True 4
  statBoxes <- mapM generateStatBox stats
  mapM (containerAdd row) statBoxes
  return row

generateStatBox (BoundedNumber name val min max) = do
  frame <- frameNew
  adj <- adjustmentNew (fromInteger val) (fromInteger min) (fromInteger max) 1 0 (fromInteger max)
  sp <- spinButtonNew adj 1 0
  frame `set` [ frameLabel := name , containerChild := sp]
  return frame
generateStatBox (ArbitraryNumber name val True) = do
  frame <- frameNew
  adj <- adjustmentNew (fromInteger val) genericMin genericMax 1 0 genericMax
  sp <- spinButtonNew adj 1 0
  frame `set` [ frameLabel := name , containerChild := sp]
  return frame
generateStatBox (ArbitraryNumber name val False) = do
  frame <- frameNew
  entry <- entryNew
  frame `set` [ frameLabel := name , containerChild := entry]
  entry `set` [ entryText := show val, entryEditable := False]
  return frame
generateStatBox (ArbitraryString name val modifiable) = do
  frame <- frameNew
  entry <- entryNew
  frame `set` [ frameLabel := name , containerChild := entry]
  entry `set` [ entryText := show val, entryEditable := modifiable]
  return frame
generateStatBox (StatBasedNumber name otherStat otherStatModifier) = do
  frame <- frameNew
  entry <- entryNew
  let val = 4 -- TODO get actual value of otherStat
  frame `set` [ frameLabel := name , containerChild := entry]
  entry `set` [ entryText := show (otherStatModifier val), entryEditable := False]
  return frame
generateStatBox (StatBoundedNumber name val otherStat otherStatModifier) = do
  frame <- frameNew
  let val = 4 -- TODO get actual value of otherStat
  let (min, max) = otherStatModifier val
  adj <- adjustmentNew (fromInteger val) (fromInteger min) (fromInteger max) 1 0 (fromInteger max)
  sp <- spinButtonNew adj 1 0
  frame `set` [ frameLabel := name , containerChild := sp]
  return frame


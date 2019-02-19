module Rendering where

import Graphics.Gloss
import Graphics.Gloss.Data.Bitmap
import Game
import Movement


ship :: IO Picture
ship = loadBMP "res\\ship1.bmp"

ship' = bitmapOfBMP 


startCircle :: Picture
startCircle = Color white $ Circle 4.50

window :: Display
window = InWindow "Game" (640, 480) (100, 100)

backgroudColor :: Color
backgroudColor = black

drawSquare :: Player -> Picture
drawSquare (Player (Coordinates x y)) = Translate x y startCircle

drawPlayer :: Player -> Picture
drawPlayer (Player c) = ship >>= Translate x' y' ship
        where x' = x c
              y' = y c

gameAsPicture :: Game -> Picture
gameAsPicture (Game player) = drawSquare player



module Rendering where

import Graphics.Gloss
import Graphics.Gloss.Data.Bitmap
import Game
import Movement


startCircle :: Picture
startCircle = Color white $ Circle 4.50

window :: Display
window = InWindow "Game" (640, 480) (100, 100)

backgroudColor :: Color
backgroudColor = black

drawSquare :: Player -> Picture
drawSquare (Player (Coordinates x y)) = Translate x y startCircle

drawPlayer :: Picture -> Player -> Picture
drawPlayer ship (Player c) = Translate x' y' ship
        where x' = x c
              y' = y c

gameAsPicture :: Picture -> Game -> Picture
gameAsPicture ship (Game player) = drawPlayer ship player



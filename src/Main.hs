module Main where

import Game
import Movement

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

startCircle :: Picture
startCircle = Color white $ Circle 4.50

window :: Display
window = InWindow "Game" (640, 480) (100, 100)

backgroudColor :: Color
backgroudColor = black


drawSquare :: Player -> Picture
drawSquare (Player (Coordinates x y)) = Translate x y startCircle


main :: IO ()
main = play window backgroudColor 60 initialGame gameAsPicture transformGame (\_ -> id) -- TODO implement the last function, render/draw.


module Main where

import Game
import Movement
import Rendering

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game

ship :: IO Picture
ship = loadBMP "res\\ship3.bmp"

main :: IO ()
main = do
    playerShip <- ship
    play window backgroudColor 60 initialGame (gameAsPicture playerShip) transformGame (\_ -> id)


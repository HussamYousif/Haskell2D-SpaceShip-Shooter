module Main where

import Game
import Movement
import Rendering

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game


main :: IO ()
main = play window backgroudColor 60 initialGame gameAsPicture transformGame (\_ -> id)


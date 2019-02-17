module Main where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
-- The origin of the coordinates is in the middle of the screen

velocity :: Float
velocity = 3

data Coordinates = Coordinates {
    x :: Float,
    y :: Float
} deriving (Show, Eq)

data Player = Player {
        coordinates :: Coordinates
} deriving (Show, Eq)


data Game = Game {
          player :: Player
} deriving (Show, Eq)

goUp :: Coordinates -> Coordinates
goUp (Coordinates x y) = Coordinates x  (y+velocity)

goDown :: Coordinates -> Coordinates
goDown (Coordinates x y) = Coordinates x (y-velocity)

goLeft :: Coordinates -> Coordinates
goLeft (Coordinates x y) = Coordinates (x-velocity) y

goRight :: Coordinates -> Coordinates
goRight (Coordinates x y) = Coordinates (x+velocity) y

startCircle :: Picture
startCircle = Color white $ Circle 4.50

window :: Display
window = InWindow "Game" (640, 480) (100, 100)

backgroudColor :: Color
backgroudColor = black


-- Initial game should not contain anything more than
initialGame :: Game
initialGame = Game player
    where coordinates = Coordinates 0 0
          player = Player coordinates


gameAsPicture :: Game -> Picture
gameAsPicture (Game player) = drawSquare player


drawSquare :: Player -> Picture
drawSquare (Player (Coordinates x y)) = Translate x y startCircle


-- This is going to be our game loop.
-- Error, I can't seem to set the handle movement in the transformGame, need further reading there.
transformGame :: Event -> Game -> Game
transformGame (EventKey key _ _ _) (Game (Player c))
    | key == (SpecialKey KeyUp) = Game (Player (goUp c))
    | key == (SpecialKey KeyDown) = Game (Player (goDown c))
    | key == (SpecialKey KeyLeft) = Game (Player (goLeft c))
    | key == (SpecialKey KeyRight) = Game (Player (goRight c))
transformGame _ game = game


main :: IO ()
main = play window backgroudColor 60 initialGame gameAsPicture transformGame (\_ -> id) -- TODO implement the last function, render/draw.


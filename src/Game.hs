module Game where

import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Movement

data Player = Player {
        coordinates :: Coordinates
} deriving (Show, Eq)


data Game = Game {
          player :: Player
} deriving (Show, Eq)


-- This is going to be our game loop.
-- Error, I can't seem to set the handle movement in the transformGame, need further reading there.
transformGame :: Event -> Game -> Game
transformGame (EventKey key _ _ _) (Game (Player c))
    | key == (SpecialKey KeyUp) = Game (Player (goUp c))
    | key == (SpecialKey KeyDown) = Game (Player (goDown c))
    | key == (SpecialKey KeyLeft) = Game (Player (goLeft c))
    | key == (SpecialKey KeyRight) = Game (Player (goRight c))
transformGame _ game = game


-- Initial game should not contain anything more than
initialGame :: Game
initialGame = Game player
    where coordinates = Coordinates 0 180 -- Spawning at the top of the screen.
          player = Player coordinates



module Movement where


data Coordinates = Coordinates {
    x :: Float,
    y :: Float
} deriving (Show, Eq)


data Employee = Developer {name :: String, salary :: Int, language :: String}
              | Marketer {name :: String, salary :: Int}

velocity :: Float
velocity = 3



goUp :: Coordinates -> Coordinates
goUp (Coordinates x y) = Coordinates x  (y+velocity)

goDown :: Coordinates -> Coordinates
goDown (Coordinates x y) = Coordinates x (y-velocity)

goLeft :: Coordinates -> Coordinates
goLeft (Coordinates x y) = Coordinates (x-velocity) y

goRight :: Coordinates -> Coordinates
goRight (Coordinates x y) = Coordinates (x+velocity) y


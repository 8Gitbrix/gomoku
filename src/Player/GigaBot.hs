module Player.GigaBot (playerGigaBot) where

import Types
import Checks

teamMembers :: String
teamMembers = "Ashwin Jeyaseelan Sang-Kyun Han"

playerGigaBot :: Player
playerGigaBot = Player strategy "GigaBot"

strategy :: Tile -> Board -> IO Move
strategy tile board = error "Define me!"

data Node = Node { state :: Board, -- Current state
                   action :: Move, -- action you took to get to this state
                   value :: Maybe Int -- value of the action you took to get to state
                 } deriving (Show)

data Tree a = Empty | Data Node [Tree a] deriving (Show)

createChildren :: Tile -> Tree a -> Tree a
createChildren tile (Data (Node s a v) [Empty]) = Data (Node s a v) x
  where x = [Data (Node (put s tile m) m (scoreBoard tile (put s tile m))) [Empty] | m <- (validMoves s)]


--monteCarlo :: Tree -> IO Move
--monteCarlo tree = error "Define me!"

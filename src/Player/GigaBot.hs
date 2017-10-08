module Player.GigaBot (playerGigaBot) where

import Types
import Checks

teamMembers :: String
teamMembers = "Ashwin Jeyaseelan Sang-Kyun Han"

playerGigaBot :: Player
playerGigaBot = Player strategy "GigaBot"

strategy :: Tile -> Board -> IO Move
strategy tile board = case (winningMoves board tile) of
  [] -> pure (adjMove board tile 4)
  h:t -> pure h

-- find max adjacent area and return move
adjMove :: Board -> Tile -> Int -> Move
adjMove b t 1 = head (validMoves b)
adjMove b t d  = case (numMoves b t d) of
  [] -> adjMove b t (d-1)
  h:t -> h

numMoves :: Board -> Tile -> Int -> [Move]
numMoves b t dimA =
   concatMap (\col -> concatMap (\row -> if all (\k -> b??(row,col+k)   == t) [0..dimA] then [(row,col+k)   | k <- [0..dimA]] else []) [1..dimM dim]) [1..dimN dim] ++
   concatMap (\col -> concatMap (\row -> if all (\k -> b??(row+k,col)   == t) [0..dimA] then [(row+k,col)   | k <- [0..dimA]] else []) [1..dimM dim]) [1..dimN dim] ++
   concatMap (\col -> concatMap (\row -> if all (\k -> b??(row+k,col+k) == t) [0..dimA] then [(row+k,col+k) | k <- [0..dimA]] else []) [1..dimM dim]) [1..dimN dim] ++
   concatMap (\col -> concatMap (\row -> if all (\k -> b??(row-k,col+k) == t) [0..dimA] then [(row-k,col+k) | k <- [0..dimA]] else []) [1..dimM dim]) [1..dimN dim]

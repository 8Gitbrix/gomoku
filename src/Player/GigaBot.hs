module Player.GigaBot (playerGigaBot) where

import Types
import Checks
import Data.List

teamMembers :: String
teamMembers = "Ashwin Jeyaseelan Sang-Kyun Han"

playerGigaBot :: Player
playerGigaBot = Player strategy "GigaBot"

strategy :: Tile -> Board -> IO Move
strategy tile board = case (winningMoves board tile) of
  [] -> pure (adjMove board tile 5)
  h:t -> pure h

-- find max adjacent matching tiles row/column/diagonal and return the first move
adjMove :: Board -> Tile -> Int -> Move
adjMove b t 1 = head (validMoves b)
adjMove b t d  = case ((numMoves b t d) `intersect` (validMoves b)) of
  [] -> adjMove b t (d-1)
  h:t -> h

-- Returns a lit of moves that place tiles next to adjacent diag, row, or column consisting of dimA matching tiles
numMoves :: Board -> Tile -> Int -> [Move]
numMoves b t dimA =
   concatMap (\col -> concatMap (\row -> if all (\k -> b??(row,col+k) == t) [0..(dimA+1)] then [(row,col+k) | k <- [0..(dimA+1)]] else []) [1..dimM dim]) [1..dimN dim] ++
   concatMap (\col -> concatMap (\row -> if all (\k -> b??(row+k,col) == t) [0..(dimA+1)] then [(row+k,col) | k <- [0..(dimA+1)]] else []) [1..dimM dim]) [1..dimN dim] ++
   concatMap (\col -> concatMap (\row -> if all (\k -> b??(row+k,col+k) == t) [0..(dimA+1)] then [(row+k,col+k) | k <- [0..(dimA+1)]] else []) [1..dimM dim]) [1..dimN dim] ++
   concatMap (\col -> concatMap (\row -> if all (\k -> b??(row-k,col+k) == t) [0..(dimA+1)] then [(row-k,col+k) | k <- [0..(dimA+1)]] else []) [1..dimM dim]) [1..dimN dim]

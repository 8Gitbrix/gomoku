module Player.MonteCarlo (playerMonteCarlo) where

import Types
import Checks

teamMembers :: String
teamMembers = "Ashwin Jeyaseelan Sang-Kyun Han"

playerMonteCarlo :: Player
playerGigaBot = Player strategy "GigaBot"

strategy :: Tile -> Board -> IO Move
strategy tile board = error "define me!"

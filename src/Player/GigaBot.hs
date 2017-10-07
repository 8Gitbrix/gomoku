module Player.GigaBot (playerGigaBot) where

import Types
import Checks

teamMembers :: String
teamMembers = "Ashwin Jeyaseelan Sang-Kyun Han"

playerGigaBot :: Player
playerGigaBot = Player strategy "Future"

strategy :: Tile -> Board -> IO Move
strategy tile board = error "Define me!"

module Players (players) where
import Types
import Player.BestNext (playerBestNext)
import Player.Computer (playerComputer)
import Player.GigaBot (playerGigaBot)
import Player.Human (playerHuman)
players :: [(String, Player)]
players = [
  ("BestNext", playerBestNext),("Computer", playerComputer),("GigaBot", playerGigaBot),("Human", playerHuman)
  ]

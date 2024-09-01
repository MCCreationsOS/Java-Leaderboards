##
 # reset.mcfunction
 # MCCreations Leaderboards - Load
 # 
 # Creates the scoreboard objectives necessary to run MCCreations Leaderboards. 
 # Running /reload will run this function, and reset the datapack
 #
 # Created by CrazyCowMM.
##

# Remove all the objectives in order to fully reset them
scoreboard objectives remove MCCreations.Leaderboards.Start
scoreboard objectives remove MCCreations.Leaderboards.Pause
scoreboard objectives remove MCCreations.Leaderboards.End
scoreboard objectives remove MCCreations.Leaderboards.Reset
scoreboard objectives remove MCCreations.Leaderboards.Time
scoreboard objectives remove MCCreations.Leaderboards.Running
scoreboard objectives remove MCCreations.Leaderboards.DisplayTime
scoreboard objectives remove MCCreations.Leaderboards.EnableTriggers
scoreboard objectives remove MCCreations.Leaderboards.Math

# Add trigger objectives. These are what you should use to control the leaderboard system
scoreboard objectives add MCCreations.Leaderboards.Start trigger
scoreboard objectives add MCCreations.Leaderboards.Pause trigger
scoreboard objectives add MCCreations.Leaderboards.End trigger
scoreboard objectives add MCCreations.Leaderboards.Reset trigger
scoreboard objectives add MCCreations.Leaderboards.DisplayTime trigger

# Configurable settings for the leaderboard system. Set to 1 to allow non-operators to control the leaderboard (useful if you need the commands to be run in a tellraw or book)
scoreboard objectives add MCCreations.Leaderboards.EnableTriggers dummy

# Add dummy objectives. These are used to store the data for the leaderboards, you should not modify them
scoreboard objectives add MCCreations.Leaderboards.Time dummy
scoreboard objectives add MCCreations.Leaderboards.Running dummy
scoreboard objectives add MCCreations.Leaderboards.Math dummy

scoreboard players set Twenty MCCreations.Leaderboards.Math 20
scoreboard players set TwentyFour MCCreations.Leaderboards.Math 24
scoreboard players set Sixty MCCreations.Leaderboards.Math 60
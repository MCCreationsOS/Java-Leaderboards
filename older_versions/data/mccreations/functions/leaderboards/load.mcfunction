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
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.Start
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.Pause
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.End
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.Reset
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.Time
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.Running
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.DisplayTime
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.EnableTriggers
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.Math
execute if score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard objectives remove MCCreations.Leaderboards.ResetOnReload

# Add trigger objectives. These are what you should use to control the leaderboard system
scoreboard objectives add MCCreations.Leaderboards.Start trigger
scoreboard objectives add MCCreations.Leaderboards.Pause trigger
scoreboard objectives add MCCreations.Leaderboards.End trigger
scoreboard objectives add MCCreations.Leaderboards.Reset trigger
scoreboard objectives add MCCreations.Leaderboards.DisplayTime trigger
scoreboard objectives add MCCreations.Leaderboards.ResetOnReload trigger

# Configurable settings for the leaderboard system. Set to 1 to allow non-operators to control the leaderboard (useful if you need the commands to be run in a tellraw or book)
scoreboard objectives add MCCreations.Leaderboards.EnableTriggers dummy

# Add dummy objectives. These are used to store the data for the leaderboards, you should not modify them
scoreboard objectives add MCCreations.Leaderboards.Time dummy
scoreboard objectives add MCCreations.Leaderboards.Running dummy
scoreboard objectives add MCCreations.Leaderboards.Math dummy

scoreboard players set Twenty MCCreations.Leaderboards.Math 20
scoreboard players set TwentyFour MCCreations.Leaderboards.Math 24
scoreboard players set Sixty MCCreations.Leaderboards.Math 60

execute unless score .var MCCreations.Leaderboards.ResetOnReload matches 1 run scoreboard players set .var MCCreations.Leaderboards.ResetOnReload 0
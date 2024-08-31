##
 # main.mcfunction
 # MCCreations Leaderboards - Tick
 #
 # This function is run every tick to update the leaderboards.
 #
 # Created by CrazyCowMM.
##

execute as @a[scores={MCCreations.Leaderboards.Running=1..}] run function mccreations:leaderboards/leaderboard

execute as @a run function mccreations:leaderboards/triggers
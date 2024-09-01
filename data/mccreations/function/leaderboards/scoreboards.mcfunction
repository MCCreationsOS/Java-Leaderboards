##
 # triggers.mcfunction
 # MCCreations Leaderboards - Triggers
 #
 # This function manages the control of the leaderboard though triggers.
 # @s -> All players
 #
 # Created by CrazyCowMM.
##
# scoreboard players enable @a MCCreations.Leaderboards.Start
# scoreboard players enable @a MCCreations.Leaderboards.Pause
# scoreboard players enable @a MCCreations.Leaderboards.End
# scoreboard players enable @a MCCreations.Leaderboards.DisplayTime
# scoreboard players enable @a MCCreations.Leaderboards.Reset

execute if score @s MCCreations.Leaderboards.Start matches 1.. run scoreboard players set @s MCCreations.Leaderboards.Running 1
execute if score @s MCCreations.Leaderboards.Pause matches 1.. run scoreboard players set @s MCCreations.Leaderboards.Running 0
execute if score @s MCCreations.Leaderboards.End matches 1.. run function mccreations:leaderboards/end
execute if score @s MCCreations.Leaderboards.DisplayTime matches 1.. run function mccreations:leaderboards/display

scoreboard players reset @a[scores={MCCreations.Leaderboards.Start=1..}] MCCreations.Leaderboards.Start
scoreboard players reset @a[scores={MCCreations.Leaderboards.Pause=1..}] MCCreations.Leaderboards.Pause
scoreboard players reset @a[scores={MCCreations.Leaderboards.End=1..}] MCCreations.Leaderboards.End
scoreboard players reset @a[scores={MCCreations.Leaderboards.Reset=1..}] MCCreations.Leaderboards.Reset
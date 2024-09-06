##
 # display.mcfunction
 # MCCreations Leaderboards - Display
 #
 # Created by CrazyCowMM.
##
scoreboard players operation Ticks MCCreations.Leaderboards.Math = @s MCCreations.Leaderboards.Score
scoreboard players operation Seconds MCCreations.Leaderboards.Math = @s MCCreations.Leaderboards.Score
scoreboard players operation Minutes MCCreations.Leaderboards.Math = @s MCCreations.Leaderboards.Score
scoreboard players operation Hours MCCreations.Leaderboards.Math = @s MCCreations.Leaderboards.Score


scoreboard players operation Ticks MCCreations.Leaderboards.Math %= Twenty MCCreations.Leaderboards.Math

scoreboard players operation Seconds MCCreations.Leaderboards.Math /= Twenty MCCreations.Leaderboards.Math
scoreboard players operation Seconds MCCreations.Leaderboards.Math %= Sixty MCCreations.Leaderboards.Math

scoreboard players operation Minutes MCCreations.Leaderboards.Math /= Twenty MCCreations.Leaderboards.Math
scoreboard players operation Minutes MCCreations.Leaderboards.Math /= Sixty MCCreations.Leaderboards.Math
scoreboard players operation Minutes MCCreations.Leaderboards.Math %= Sixty MCCreations.Leaderboards.Math

scoreboard players operation Hours MCCreations.Leaderboards.Math /= Twenty MCCreations.Leaderboards.Math
scoreboard players operation Hours MCCreations.Leaderboards.Math /= Sixty MCCreations.Leaderboards.Math
scoreboard players operation Hours MCCreations.Leaderboards.Math /= Sixty MCCreations.Leaderboards.Math
scoreboard players operation Hours MCCreations.Leaderboards.Math %= TwentyFour MCCreations.Leaderboards.Math

title @s actionbar ["", {"score": { "name": "Hours", "objective": "MCCreations.Leaderboards.Math" } }, {"text": ":"}, {"score": { "name": "Minutes", "objective": "MCCreations.Leaderboards.Math" } }, {"text": ":"}, {"score": { "name": "Seconds", "objective": "MCCreations.Leaderboards.Math" } }, {"text": ":"}, {"score": { "name": "Ticks", "objective": "MCCreations.Leaderboards.Math" } }]
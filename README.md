# MCCreations Java Leaderboards
 Easily implement leaderboards into your Minecraft Java Edition project!

## Setup

### Setting Up Your Creation
1. Add the command ```scoreboard players set @a MCCreations.Leaderboards.Start 1``` to the commands you run when your creation starts
2. Add the command ```scoreboard players set @a MCCreations.Leaderboards.End 1``` to the commands you run when your creation ends

You can also use 
```mcfunction
scoreboard players set @a MCCreations.Leaderboards.Pause 1
``` 
to pause the timer, like during a cutscene, and you can use
```mcfunction
scoreboard players set @a MCCreations.Leaderboard.Reset 1
```
to reset the leaderboard for a player.

### When Uploading Directly to MCCreations
If you are submitting your content to MCCreations, simply check "Use Leaderboards" during the submission process and this pack will automatically be added to your creation. You still need to do the setup above, however.

### When Using File Hosting or Uploading to Other Sites
If you plan on uploading your creation to other sites, or want to use a file hosting service like Mediafire instead of uploading directly to MCCreations, you need to perform a few steps to setup this datapack for your use.

1. Download this Github Repository
2. Unzip it (if you downloaded as a zip)
3. Run `node setup.js`. This requires you to have nodejs installed, which you can get [here](https://nodejs.org)
4. Add the datapack to your creation


## Additional Setup
The datapack also features some extra toggle options that you can choose to turn on.

### Custom Scoring
By default, leaderboards will use time to score players. However, if your creation has it's own scoring system you will need to do a few things differently
1. During setup, set your score type as highest_score or lowest_score
2. Don't use MCCreations.Leaderboards.Start. Instead, whenever players earn score add it to MCCreations.Leaderboards.Score
3. When your creation finishes, run
```mcfunction
scoreboard players set @s MCCreations.Leaderboards.End 1
```

### Time Display
You can enable a timer display in the action bar by running
```mcfunction
scoreboard players set @a MCCreations.Leaderboards.DisplayTime 1
```

### Allow Non-OPs to Control the Leaderboard
By default, only oped players have permission to make changes to the leaderboard, like stopping or starting it. To change this, run
```mcfunction
scoreboard players set @a MCCreations.Leaderboards.EnableTriggers 1
```

This will allow non-op players to use the following commands, which are equivalent to the commands above:
```mcfunction
trigger MCCreations.Leaderboards.Start
trigger MCCreations.Leaderboards.Pause
trigger MCCreations.Leaderboards.End
trigger MCCreations.Leaderboards.DisplayTime
```

### Reset on Reload
You can configure the datapack to be reset on reload or relog using the command
```mcfunction
scoreboard players set .var MCCreations.Leaderboards.ResetOnReload 1
```
This will delete all leaderboard data and scores when the pack is reloaded

## Caveats
By default, the maximum amount of time the leaderboard can save is 5 hrs. The timer and display will continue working past 5 hrs, however, scores will not be publishable to MCCreations. If this is not enough time for your map, you can change the `MAX_TIME` const in the setup.js script. However, be wary that increasing this value will exponentially increase the amount of time to generate files, as well as increase strain on the game. Values higher than 5 hrs may lag your creation.

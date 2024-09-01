# MCCreations Java Leaderboards
 Easily implement leaderboards into your Minecraft Java Edition project!

## Setup

### Setting Up Your Creation
1. Add the command `scoreboard players set @a MCCreations.Leaderboards.Start 1` to the commands you run when your creation starts
2. Add the command `scoreboard players set @a MCCreations.Leaderboards.End 1` to the commands you run when your creation ends

You can also use `scoreboard players set @a MCCreations.Leaderboards.Pause 1` to pause the timer, like during a cutscene, and you can use `scoreboard players set @a MCCreations.Leaderboard.Reset 1` to reset the leaderboard for a player.

### When Using MCCreations
If you are submitting your content to MCCreations, simply check "Use Leaderboards" during the submission process and this pack will automatically be added to your creation

### When Using With Other Sites
If you plan on uploading your creation to other sites, or want to use a file hosting service like Mediafire instead of uploading directly to MCCreations, you need to perform a few steps to setup this datapack for your use.

1. Download this Github Repository
2. Unzip it (if you downloaded as a zip)
3. Run `node setup.js`. This requires you to have nodejs installed, which you can get [here](https://nodejs.org)
4. Add the datapack to your creation


## Additional Setup
The datapack also features some extra toggle options that you can choose to turn on.

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
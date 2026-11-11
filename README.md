# Data Service for Roblox

A small, modular data saving system for Roblox, written in Luau. It splits player data handling into separate modules (template, loading, saving and loop helpers) so you can drop it into a game and adapt it instead of rewriting the same code every time.

## Features

- 💾 Loads and saves player data with `DataStoreService`
- 🧩 Modular structure: template, loader and loop functions are separate modules
- 📋 Easy-to-edit data template with automatic default values
- 🔧 Missing keys are filled in from the template, so old saves keep working when you add new fields
- ⚠️ Errors are wrapped in `pcall`, and failed saves print a warning with the player name
- 🗂️ Shared `Cache` table that other scripts can use to read a player's data

## Structure

```
DataService (ModuleScript)
├── Loaded          -- Load and Save functions
├── DataTemplate    -- default data for new players
└── LoopFunctions   -- [short description of what this module does]
```

Place the `DataService` ModuleScript in `ServerScriptService`, with the three modules as its children.

## Setup

1. Put the `DataService` ModuleScript (with its children) in `ServerScriptService`.
2. Open `Loaded` and replace `"YourDataStoreName"` with your own DataStore name.
3. Open `DataTemplate` and change the fields to the data your game needs.
4. To test in Studio, enable **Game Settings → Security → Enable Studio Access to API Services**.

## Usage

```lua
local Players = game:GetService("Players")
local DataService = require(game.ServerScriptService.DataService)

Players.PlayerAdded:Connect(function(player)
    local data = DataService.loaded.Load(player)
    DataService.Cache[player.UserId] = data
end)

Players.PlayerRemoving:Connect(function(player)
    local data = DataService.Cache[player.UserId]
    if data then
        DataService.loaded.Save(player, data)
        DataService.Cache[player.UserId] = nil
    end
end)
```

## API

| Function / Field | Description |
|------------------|-------------|
| `DataService.loaded.Load(player)` | Loads the player's saved data. Returns a fresh template if there is no save or the load fails. |
| `DataService.loaded.Save(player, data)` | Saves the given data table for the player. |
| `DataService.DataTemplate.New()` | Returns a new copy of the default data. |
| `DataService.Cache` | Table shared between scripts that use the module. |
| `DataService.LoopFunctions` | [describe the loop functions here] |

## Customizing the template

```lua
function DataTemplate.New()
    return {
        Currency = 400,
        Achievements = {},
        Boolean = false,
    }
end
```

Add any field you want. Players with older saves get the new fields automatically the next time they load.

## What I learned

- Working with `DataStoreService` and handling errors with `pcall`
- Organizing Luau code into reusable modules
- Merging saved data with a template so updates don't break old saves

## License

MIT. Feel free to use and modify it.

## Author

Made by [Daniel Dias](https://github.com/danixxficial)

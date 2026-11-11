# Data Service for Roblox

A [lightweight / easy-to-use] data saving module for Roblox, written in Luau.
It handles saving and loading player data with [DataStoreService], so you
don't have to rewrite the same code in every game.

## Features
- 💾 Saves and loads player data automatically
- 🔁 [Retries on failure / handles DataStore errors]
- 🛡️ [Prevents data loss when players leave or the server shuts down]
- ⚙️ Easy to set up with a default data template
- [Add or remove features based on what your code really does]

## Installation
1. Download the module from this repository.
2. In Roblox Studio, insert a `ModuleScript` into `ServerScriptService`
   and name it `DataService`.
3. Paste the code in.

## Usage

```lua
local DataService = require(game.ServerScriptService.DataService)

local DEFAULT_DATA = {
    Coins = 0,
    Level = 1,
}

game.Players.PlayerAdded:Connect(function(player)
    local data = DataService:Load(player, DEFAULT_DATA)
    print(player.Name .. " has " .. data.Coins .. " coins")
end)
```


## What I learned
- Working with `DataStoreService` and handling errors safely
- Writing reusable, modular Luau code

## License
MIT. Feel free to use and modify it.

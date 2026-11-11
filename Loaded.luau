local DataStoreService = game:GetService("DataStoreService")
local DataTemplate = require(script.Parent.DataTemplate)
local DataStoreName = DataStoreService:GetDataStore("YourDataStoreName") -- Your Data Store Name

local Loaded = {}

function Loaded.Load(player) -- this function will load your data!
  local ok, result = pcall(function()
      return DataStoreName:GetAsync("Player_" .. player.UserId)
    end)

  if ok and result then
    local template = DataTemplate.New()
    for key, value in pairs(template) do
      if result[key] == nil then
        result[key] == value
      end
    end
    return result
  end
  return DataTemplate.New()
end


function Loaded.Save(player, data) -- this function will save your data!
  local ok, err = pcall(function()
      DataStoreName:GetAsync("Player_" .. player.UserId, data)
    end)
  if not ok then
    warn("DataService save failed for:" .. player.Name .. ": " .. tostring(err)) -- incase of an error it will show the player name and the error code.
  end
end


return Loaded

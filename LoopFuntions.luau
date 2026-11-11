local LoopFunctions = {}

function LoopFunctions.StartAutoSave(playerDataCache, saveFunc, serializeFunc, interval) -- auto saves the data
  interval = interval or 60
  task.spawn(function()
      while true do
        task.wait(interval)
        for player, data in pairs(PlayerDataCache) do
          -- Sync your variables / currency
          local currency = player.leaderstats and player.leaderstats:FindFirstChild("Currency")
          if currency then data.currency = Currency.Value end
          
          saveFunc(player, data)
        end
        print("Auto Saved all Players") -- Just to make sure it works
      end
    end)
end


return LoopFunctions = {}

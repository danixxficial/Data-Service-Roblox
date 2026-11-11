local DataService = {}

DataService.Cache               = {} -- Shared Between every module that need DataService
DataService.loaded              = require(script.Loaded)
DataService.DataTemplate        = require(script.DataTemplate)
DataService.LoopFunctions       = require(script.LoopFunctions)


return DataService

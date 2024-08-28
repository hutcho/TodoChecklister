--------------------------------------
-- Imports
--------------------------------------
---@class TodoAddon
local TodoAddon = select(2, ...)

--------------------------------------
-- Declarations
--------------------------------------
TodoAddon.Constants = {}

---@class Constants
local Constants = TodoAddon.Constants

--------------------------------------
-- Defaults
--------------------------------------
Constants.debugMode = false

Constants.theme = {
	red = 0.8, -- 204/255
	green = 0.2, -- 51/255
	blue = 1,
	hex = "cc33ff"
}

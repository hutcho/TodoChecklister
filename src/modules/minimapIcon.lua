--------------------------------------
-- Imports
--------------------------------------
local addonName, TodoAddon = ...

---@class TodoChecklisterFrame
local TodoChecklisterFrame = TodoAddon.TodoChecklisterFrame
---@class Settings
local TCSettings = TodoAddon.Settings
---@class InterfaceOptions
local InterfaceOptions = TodoAddon.InterfaceOptions

--------------------------------------
-- Declarations
--------------------------------------
TodoAddon.MinimapIcon = {}

---@class MinimapIcon
local TCMinimapIcon = TodoAddon.MinimapIcon

--------------------------------------
-- Lifecycle Events
--------------------------------------
---
---Load required configuration for this class
function TCMinimapIcon:LoadCFG()
	local icon = LibStub("LibDBIcon-1.0")
	if (TCSettings:DisplayMinimapIcon()) then
		icon:Show(addonName)
		-- print("MinimapIcon:LoadCFG SHOWING ICON")
	else
		icon:Hide(addonName)
		-- print("MinimapIcon:LoadCFG HIDING ICON")
	end

end

---Initializes the minimap icon if the user can have it
function TCMinimapIcon:Init()
	if not type(TodoChecklisterMapIcon) == "table" then
		---The SavedVariable where the map settings are stored into
		---@class TodoMapIcon
		TodoChecklisterMapIcon = {
			profile = {
				minimap = {
					hide = true,
				},
			},
		}
	end

	local icon = LibStub("LibDBIcon-1.0")

	local minimapIconLDB = LibStub("LibDataBroker-1.1"):NewDataObject(addonName, {
			type = "data source",
			text = addonName,
			icon = "Interface\\Icons\\INV_Misc_Note_03",
			OnClick = function() TodoChecklisterFrame:Toggle() end,
			OnTooltipShow = function(GameTooltip)
				GameTooltip:SetText(addonName, 1, 1, 1)
				GameTooltip:AddLine("Click to toggle your list", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
			end
		}
	)



	icon:Register(addonName, minimapIconLDB, TodoChecklisterMapIcon)
	InterfaceOptions:LoadCFG()
	TCMinimapIcon:LoadCFG()
end

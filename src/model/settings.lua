--------------------------------------
-- Imports
--------------------------------------
local _, TodoAddon = ...

--------------------------------------
-- Declarations
--------------------------------------
TodoAddon.Settings = {}
local TCSettings = TodoAddon.Settings

--------------------------------------
-- Settings functions
--------------------------------------

---@return boolean @Get: Window is displayed on the user's screen
function TCSettings:IsShown()
	return TodoChecklisterSettingsDB.isShown
end

---@param value boolean @Set window is displayed on the user's screen
function TCSettings:SetIsShown(value)
	TodoChecklisterSettingsDB.isShown = value
end

---@return boolean @Get: KeepFocus checkbox is checked
function TCSettings:KeepFocus()
	return TodoChecklisterSettingsDB.keepFocus
end

---Toggles whether or not the KeepFocus checkbox is checked
function TCSettings:ToggleFocus()
	TodoChecklisterSettingsDB.keepFocus = not self:KeepFocus()
end

---@return boolean @Get: KeepFocus checkbox is displayed to the user
function TCSettings:IsKeepFocusShown()
	return TodoChecklisterSettingsDB.isKeepFocusShown
end

---@param value boolean @Sets whether or not the KeepFocus checkbox is displayed to the user
function TCSettings:SetIsKeepFocusShown(value)
	TodoChecklisterSettingsDB.isKeepFocusShown = value
end

---@return number @Get the alpha value of 0 to 1 for the window opacity
function TCSettings:Opacity()
	return TodoChecklisterSettingsDB.windowOpacity
end

---@param opacity number @Sets the alpha value of 0 to 1 for the window opacity
function TCSettings:SetOpacity(opacity)
	TodoChecklisterSettingsDB.windowOpacity = opacity
end

---@return boolean @Get if a fanfare sound should be played
function TCSettings:PlayFanfare()
	return TodoChecklisterSettingsDB.playFanfare
end

---@param value boolean @Sets whether or not a fanfare sound should be played
function TCSettings:SetPlayFanfare(value)
	TodoChecklisterSettingsDB.playFanfare = value
end

---@return boolean @Get if should display linked items count from bag
function TCSettings:DisplayLinked()
	return TodoChecklisterSettingsDB.displayLinked
end

---@param value boolean @Sets whether or not to display linked items count from bag
function TCSettings:SetDisplayLinked(value)
	TodoChecklisterSettingsDB.displayLinked = value
end

---@return boolean @Whether or not to display the icon on minimap
function TCSettings:DisplayMinimapIcon()
	return TodoChecklisterSettingsDB.displayMinimapIcon
end

---@param value boolean @Whether or not to display the icon on minimap
function TCSettings:SetDisplayMinimapIcon(value)
	TodoChecklisterSettingsDB.displayMinimapIcon = value
end

---@return boolean @Whether or not to display chat messages
function TCSettings:ChatShow()
	return TodoChecklisterSettingsDB.chatShow
end

---@param value boolean @Sets whether or not to display chat messages
function TCSettings:SetChatShow(value)
	TodoChecklisterSettingsDB.chatShow = value
end

---@return number @The alpha value of 0 to 1 for the window opacity when hovering the mouse
function TCSettings:OpacityOnHover()
	return TodoChecklisterSettingsDB.windowOpacityOnHover
end

---@param opacity number @Sets the alpha value of 0 to 1 for the window opacity when hovering the mouse
function TCSettings:SetOpacityOnHover(opacity)
	TodoChecklisterSettingsDB.windowOpacityOnHover = opacity
end

---@return boolean @Whether or not should count bank items on linked items
function TCSettings:DisplayBankOnLinked()
	return TodoChecklisterSettingsDB.displayBankOnLinked
end

---@param value boolean @Whether or not should count bank items on linked items
function TCSettings:SetDisplayBankOnLinked(value)
	TodoChecklisterSettingsDB.displayBankOnLinked = value
end

---@return boolean @Whether or not should count charges on linked items
function TCSettings:DisplayChargesOnLinked()
	return TodoChecklisterSettingsDB.displayChargesOnLinked
end

---@param value boolean @Sets whether or not should count charges on linked items
function TCSettings:SetDisplayChargesOnLinked(value)
	TodoChecklisterSettingsDB.displayChargesOnLinked = value
end

--------------------------------------
-- Lifecycle Events
--------------------------------------

---Sets options to default values
function SetDefaultTodoChecklisterSettings()
	TodoChecklisterSettingsDB = {}
	TodoChecklisterSettingsDB["isShown"] = true
	TodoChecklisterSettingsDB["isKeepFocusShown"] = false
	TodoChecklisterSettingsDB["keepFocus"] = false
	TodoChecklisterSettingsDB["playFanfare"] = true
	TodoChecklisterSettingsDB["displayLinked"] = false
	TodoChecklisterSettingsDB["displayMinimapIcon"] = true
	TodoChecklisterSettingsDB["chatShow"] = true
	TodoChecklisterSettingsDB["displayBankOnLinked"] = false
	TodoChecklisterSettingsDB["displayChargesOnLinked"] = false
	TodoChecklisterSettingsDB["windowOpacity"] = 1
	TodoChecklisterSettingsDB["windowOpacityOnHover"] = 1
end

---Initializes options
function TCSettings:Init()
	if (not TodoChecklisterSettingsDB) then
		print("MAKING DEFAULTS")
		---The SavedVariable where the settings are stored into
		---@field public isShown boolean|nil @Whether or not the window is displayed on the user's screen
		---@field public keepFocus boolean|nil @Whether or not the KeepFocus checkbox is checked
		---@field public isKeepFocusShown boolean|nil @Whether or not the KeepFocus checkbox is displayed to the user
		---@field public windowOpacity number|nil @The alpha value of 0 to 1 for the window opacity
		---@field public playFanfare boolean|nil @Whether or not a fanfare sound should be played
		---@field public displayLinked boolean|nil @Whether or not to display linked items count from bag
		---@field public displayMinimapIcon boolean|nil @Whether or not to display the icon on minimap
		---@field public chatShow boolean|nil @Whether or not to display chat messages
		---@field public windowOpacityOnHover number|nil @The alpha value of 0 to 1 for the window opacity when hovering the mouse
		---@field public displayBankOnLinked number|nil @Whether or not should count bank items on linked items
		---@field public displayChargesOnLinked number|nil @Whether or not should count charges on linked items
		SetDefaultTodoChecklisterSettings()
	end

	-- TodoAddon.TableUtils:printTable(TodoChecklisterSettingsDB)
	-- print(TodoChecklisterSettingsDB.isShown)

end

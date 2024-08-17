--------------------------------------
-- Imports
--------------------------------------
local addonName, TodoAddon = ...

---@class Constants
local Constants = TodoAddon.Constants
---@class Utils
local Utils = TodoAddon.Utils
---@class TodoChecklisterFrame
local TodoChecklisterFrame = TodoAddon.TodoChecklisterFrame
---@class InterfaceOptions
local InterfaceOptions = TodoAddon.InterfaceOptions
---@class Settings
local TCSettings = TodoAddon.Settings

--------------------------------------
-- Declarations
--------------------------------------
TodoAddon.Chat = {}

---@class Chat
local Chat = TodoAddon.Chat

--------------------------------------
-- Defaults
--------------------------------------
Chat.command = "/todo"
Chat.commands = {
    ["help"] = function()
        Chat:ForcePrint("Available commands:")
        Chat:ForcePrint("|cff00cc66/todo show|r - Show list")
        Chat:ForcePrint("|cff00cc66/todo hide|r - Hide list")
        Chat:ForcePrint("|cff00cc66/todo toggle|r - Toggle show/hide list")
        Chat:ForcePrint("|cff00cc66/todo add|r |cffff2211TEXT|r - Adds |cffff2211TEXT|r to the list")
        Chat:ForcePrint("|cff00cc66/todo tick|r |cffff2211INDEX|r - Ticks/unticks list at |cffff2211INDEX|r")
        Chat:ForcePrint("|cff00cc66/todo move|r |cffff2211FROM_INDEX TO_INDEX|r - Move item from |cffff2211FROM_INDEX|r to |cffff2211TO_INDEX|r")
        Chat:ForcePrint("|cff00cc66/todo remove|r |cffff2211INDEX|r - Remove list item at |cffff2211INDEX|r")
        Chat:ForcePrint("|cff00cc66/todo set|r - Open the options window. /todo options also works.")
        Chat:ForcePrint("|cff00cc66/todo resetposition|r - Reset the list window to its default size, position and scale. Does not touch the list items.")
    end,
    -- Visibility commands
    ["show"] = function() TodoChecklisterFrame:Show() end,
    ["hide"] = function() TodoChecklisterFrame:Hide() end,
    ["toggle"] = function() TodoChecklisterFrame:Toggle() end,
    ["add"] = function(...)
        if (TodoChecklisterFrame.selectedItem and TodoChecklisterFrame.selectedItem > 0) then
            TodoChecklisterFrame:ClearSelected()
            TodoChecklisterFrame:OnUpdate()
        end
        TodoChecklisterFrame:AddItem(strjoin(" ", ...))
    end,
    ["tick"] = function(indexToCheck)
        TodoChecklisterFrame:CheckItemWithIndex(tonumber(indexToCheck))
    end,
    ["move"] = function(indexFrom, indexTo)
        TodoChecklisterFrame:Move(tonumber(indexFrom), tonumber(indexTo), true)
    end,
    ["remove"] = function(indexToRemove)
        TodoChecklisterFrame:RemoveItemWithIndex(tonumber(indexToRemove))
    end,
    ["resetposition"] = function() InterfaceOptions:Defaults() end,
    ["set"] = function() Settings.OpenToCategory(InterfaceOptions.settingsCategory.ID) end,
    ["options"] = function() Settings.OpenToCategory(InterfaceOptions.settingsCategory.ID) end
}

--------------------------------------
-- Chat functions
--------------------------------------
function Chat:MaybePrint(...)
    if (TCSettings:ChatShow()) then
        Chat:ForcePrint(...)
    end
end

function Chat:ForcePrint(...)
    local hex = select(4, Utils:GetThemeColor())
    local prefix = string.format("|cff%s%s:|r", hex:upper(), addonName)
    DEFAULT_CHAT_FRAME:AddMessage(string.join(" ", prefix, ...))
end



--------------------------------------
-- Lifecycle Events
--------------------------------------
---
---Initializes the chat slash commands
function Chat:Init()
    SLASH_TodoChecklister1 = self.command
    function SlashCmdList.TodoChecklister(msg, editBox)
        if (msg.len == 0) then
            -- User just typed "/todo" with no args, so give them help message
            Chat.commands.help()
            return
        end

        local args = {}
        for _, arg in ipairs({string.split(" ", msg)}) do
            if (#arg > 0) then
                table.insert(args, arg)
            end
        end

        local path = Chat.commands -- required for updating found table.

        for id, arg in ipairs(args) do
            if (#arg > 0) then -- if string length is greater than 0.
                arg = arg:lower()
                if (path[arg]) then
                    if (type(path[arg]) == "function") then
                        -- all remaining args passed to our function!
                        path[arg](select(id + 1, unpack(args)))
                        return
                    elseif (type(path[arg]) == "table") then
                        path = path[arg] -- another sub-table found!
                    end
                else
                    -- does not exist!
                    Chat:ForcePrint("|cffff2211'" .. msg .. "' is not a valid command|r")
                    Chat.commands.help()
                    return
                end
            end
        end
    end
end

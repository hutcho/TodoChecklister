--------------------------------------
-- Imports
--------------------------------------
---@class TodoAddon
local TodoAddon = select(2, ...)

---@type string
local addonName = select(1, ...)

---@class Debug
local Debug = TodoAddon.Debug
---@class Settings
local TCSettings = TodoAddon.Settings
---@class TodoList
local TodoList = TodoAddon.TodoList
---@class InterfaceOptions
local InterfaceOptions = TodoAddon.InterfaceOptions
---@class TodoChecklisterFrame
local TodoChecklisterFrame = TodoAddon.TodoChecklisterFrame
---@class Chat
local Chat = TodoAddon.Chat

--------------------------------------
-- Init keybindings
--------------------------------------
-- Export a show/hide toggle to a global function
-- so that it can be called from a keybind in bindings.xml
GLOBAL_TodoChecklisterFrameToggle = function()
    if TodoChecklisterFrame.frame:IsShown() then
        TodoChecklisterFrame:Hide()
    else
        TodoChecklisterFrame:Show()
    end
end

--------------------------------------
-- Initialization
--------------------------------------
local main = CreateFrame("Frame", addonName .. "MAINFRAME", UIParent)
TodoAddon.main = main

function TodoAddon:Init(event, name)
    if (name ~= addonName) then
        return
    end

    -- Config
    Debug:Init()
    TCSettings:Init()

    -- Model
    TodoList:Init()

    -- Components
    InterfaceOptions:Init()
    TodoChecklisterFrame:Init()

    -- Modules
    Chat:Init()

    -- Addon welcome message
    Chat:MaybePrint(TodoList:TaskCompletionSummary())
end

main:RegisterEvent("ADDON_LOADED")
main:SetScript("OnEvent", TodoAddon.Init)

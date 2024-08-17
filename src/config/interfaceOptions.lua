--------------------------------------
-- Imports
--------------------------------------
local addonName, TodoAddon = ...

---@class Constants
local Constants = TodoAddon.Constants
---@class Settings
local TCSettings = TodoAddon.Settings
---@class MinimapIcon
local MinimapIcon = TodoAddon.MinimapIcon

--------------------------------------
-- Declarations
--------------------------------------
TodoAddon.InterfaceOptions = {}

---@class InterfaceOptions
local InterfaceOptions = TodoAddon.InterfaceOptions

--------------------------------------
-- Lifecycle Events
--------------------------------------
---
---Resets all properties to their default values
function InterfaceOptions:Defaults()
  -- This will also call TCSettings:Defaults
  TodoAddon.TodoChecklisterFrame:Defaults()
  -- self:LoadCFG()
  TodoAddon.MinimapIcon:LoadCFG()
end


-----------------------------------------------
---Load required configuration for this class
-----------------------------------------------
function InterfaceOptions:LoadCFG()
    self.frame.TCSettingsContainer.FocusCheckButton:SetChecked(TCSettings:IsKeepFocusShown())
    self.frame.TCSettingsContainer.KeepFocusCheckButton:SetChecked(TCSettings:KeepFocus())

    if TCSettings:Opacity() then
      self.frame.TCSettingsContainer.Opacity:SetValue(TCSettings:Opacity())
    end

  --   if (TCSettings:OpacityOnHover()) then
  --     self.frame.SettingsContainer.OpacityOnHover:SetValue(TCSettings:OpacityOnHover())
  --     self.frame.SettingsContainer.OpacityOnHover.Value:SetText(
  --       string.format("%d%s", TCSettings:OpacityOnHover() * 100, "%")
  --     )
  --   end

    self.frame.TCSettingsContainer.LinkedCounterCheckButton:SetChecked(TCSettings:DisplayLinked())
    self.frame.TCSettingsContainer.DisplayBankOnLinked:SetChecked(TCSettings:DisplayBankOnLinked())
    self.frame.TCSettingsContainer.ToggleMapButton:SetChecked(TCSettings:DisplayMinimapIcon())
    self.frame.TCSettingsContainer.MuteChatCheckButton:SetChecked(TCSettings:ChatShow())
    self.frame.TCSettingsContainer.FanfareCheck:SetChecked(TCSettings:PlayFanfare())
    self.frame.TCSettingsContainer.DisplayChargesOnLinked:SetChecked(TCSettings:DisplayChargesOnLinked())

  if (TodoAddon.TodoChecklisterFrame) then
    -- Update the onscreen app frame.
    TodoAddon.TodoChecklisterFrame:LoadCFG()
  end

end

---
---Initializes required properties for this class
function InterfaceOptions:Init()
  self.frame = CreateFrame("Frame", -- frameType
    "TodoChecklisterOptions",   -- name
    InterfaceOptionsFrame,     -- parent
    "TodoChecklisterOptionsPanelTemplate") -- templatename from xml

    -- local background = self.frame:CreateTexture()
    -- background:SetAllPoints(self.frame)
    -- background:SetColorTexture(1, 0, 1, 0.2) --pink


  self.frame.OnCommit = function(frame)
  end

  self.frame.OnDefault = function(frame)
    self:Defaults()
  end

  self.frame.OnRefresh  = function(frame)
    self:LoadCFG()
  end

  -- Set up fixed values
  self.frame.Title:SetText(addonName .. " v" .. C_AddOns.GetAddOnMetadata(addonName, "version"))
  -- self.frame.TCSettingsContainer.Obs.Text:SetText("To report bugs visit: https://github.com/AssisrMatheus/TodoChecklister/issues")

  -- -- Set up the github popup
  -- StaticPopupDialogs[addonName .. "WEBSITE"] = {
  --   text = "Copy the url and paste it on your browser",
  --   button1 = "Done",
  --   OnShow = function(self, data)
  --     self.editBox:SetText("https://github.com/AssisrMatheus/TodoChecklister/issues")
  --     self.editBox:SetWidth(260)
  --   end,
  --   hasEditBox = true,
  --   exclusive = true,
  --   whileDead = true,
  --   hideOnEscape = true,
  --   preferredIndex = 3
  -- }

  -- -- Open github pop up
  -- self.frame.TCSettingsContainer.Obs:SetScript(
  --   "OnClick",
  --   function()
  --     StaticPopup_Show(addonName .. "WEBSITE")
  --   end
  -- )

  -- self:LoadCFG()
  local mycategoryname = addonName
  local category, layout  = Settings.RegisterCanvasLayoutCategory(self.frame, mycategoryname)
  self.settingsCategory = category
  Settings.RegisterAddOnCategory(category)

  -- SLASH_HELLOW1 = "/hw"
  -- SLASH_HELLOW2 = "/helloworld"
  -- SlashCmdList.HELLOW = function(msg, editBox)
  --   Settings.OpenToCategory(category.ID)
  -- end

  Settings.OpenToCategory(category.ID)

end

--------------------------------------
-- XML Events
--------------------------------------
function ShowKeepFocusCheckBoxClick(frame)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  TCSettings:SetIsKeepFocusShown(frame:GetChecked())
  InterfaceOptions:LoadCFG()
end

function KeepFocusCheckboxClick(frame)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  TCSettings:ToggleFocus()
  InterfaceOptions:LoadCFG()
end

function ShowItemCountFromBagsClick(frame)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
  TCSettings:SetDisplayLinked(frame:GetChecked())
  InterfaceOptions:LoadCFG()
end

function ToggleMapClick(frame)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  TCSettings:SetDisplayMinimapIcon(frame:GetChecked())
  TodoAddon.MinimapIcon:LoadCFG()
  InterfaceOptions:LoadCFG()
end

function PlayFanfareCheckboxClick(frame)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  TCSettings:SetPlayFanfare(frame:GetChecked())
  InterfaceOptions:LoadCFG()
end

function ShowChatCheckboxClick(frame)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  TCSettings:SetChatShow(frame:GetChecked())
  InterfaceOptions:LoadCFG()
end

function OpacityValueChanged(frame)
  if (InterfaceOptions.frame) then
    TCSettings:SetOpacity(frame:GetValue())
    InterfaceOptions:LoadCFG()
  end
end

function OpacityOnHoverValueChanged(frame)
  -- if (InterfaceOptions.frame) then
  --   TCSettings:SetOpacityOnHover(frame:GetValue())
  --   InterfaceOptions:LoadCFG()
  -- end
end

function DisplayBankClick(frame)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  TCSettings:SetDisplayBankOnLinked(frame:GetChecked())
  InterfaceOptions:LoadCFG()
end

function DisplayChargesClick(frame)
  PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
  TCSettings:SetDisplayChargesOnLinked(frame:GetChecked())
  InterfaceOptions:LoadCFG()
end

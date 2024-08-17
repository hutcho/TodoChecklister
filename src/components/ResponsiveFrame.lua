local _ , TodoAddon = ...

--------------------------------------
-- Declarations
--------------------------------------
TodoAddon.ResponsiveFrame = {}

---@class ResponsiveFrame
local ResponsiveFrame = TodoAddon.ResponsiveFrame

--------------------------------------
-- ResponsiveFrame functions
--------------------------------------

---Sets up required properties so the frame can resize
function ResponsiveFrame:OnLoad(frame)

  self.frame = frame

  local min_width = 200
  local min_height = 200
  frame:SetResizeBounds(min_width, min_height)

  frame:RegisterForDrag("LeftButton")
  frame:SetScale(1)

  -- cartesian coords
  -- frame.x_leftedge = frame:GetLeft()
  -- frame.y_bottomedge = (frame:GetTop() - frame:GetHeight())

  frame:SetScript("OnDragStart", function(self, button)
      self:StartMoving(true)
    end
  )

  frame:SetScript("OnDragStop", function(self, button)
      self:StopMovingOrSizing()
    end
  )

end

--------------------------------------
-- XML Events
--------------------------------------
function OnLoad(frame)
  ResponsiveFrame:OnLoad(frame)
end

function OnMouseDown(self, button)
  if button == "LeftButton" then
    self.isSizing = true
    self:GetParent():StartSizing("BOTTOMRIGHT", true)
  elseif button == "RightButton" then
    self.isScaling = true
  end
end


function OnUpdate(self)
  if self.isScaling == true then

    local cursor_x, cursor_y = GetCursorPosition()
    local left, bottom, width, height  = self:GetParent():GetRect()
    local effectivescale = self:GetParent():GetEffectiveScale()

    local cursor_x_offset_from_leftedge = (cursor_x / effectivescale) - left
    local cursor_y_offset_from_topedge = bottom - (cursor_y / effectivescale) + height

    local tNewScale = cursor_x_offset_from_leftedge / width
    local tx, ty = left / tNewScale, bottom / tNewScale

    local finalScale = self:GetParent():GetScale() * tNewScale
    if (finalScale > 0.5) then
      self:GetParent():ClearAllPoints()
      self:GetParent():SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tx, ty)
      self:GetParent():SetScale(finalScale)
    end

  end

end

function OnMouseUp(self, button)
  if button == "LeftButton" then
    self.isSizing = false
  elseif button == "RightButton" then
    self.isScaling = false
  end
  self:GetParent():StopMovingOrSizing()
end

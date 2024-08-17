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
  frame.x_leftedge = frame:GetLeft()
  frame.y_bottomedge = (frame:GetTop() - frame:GetHeight())

  frame:SetScript("OnDragStart", function(self, button)
      self:StartMoving()
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
  -- Fix a bug if you click too much in the scale button
  -- self:GetParent():StartMoving()
  -- self:GetParent():StopMovingOrSizing()

  if button == "LeftButton" then
    self.isSizing = true
    self:GetParent():StartSizing("BOTTOMRIGHT")
  elseif button == "RightButton" then
    self.isScaling = true
  end
end


function OnUpdate(self)

  if self.isScaling == true then
    local cx, cy = GetCursorPosition()
    cx = cx / self:GetEffectiveScale() - self:GetParent():GetLeft()
    cy = self:GetParent():GetHeight() - (cy / self:GetEffectiveScale() - self:GetParent():GetBottom())

    local tNewScale = cx / self:GetParent():GetWidth()
    local tx, ty = self:GetParent().x / tNewScale, self:GetParent().y / tNewScale
    local newScale = self:GetParent():GetScale() * tNewScale

    if (newScale > 0) then
      local finalScale = self:GetParent():GetScale() * tNewScale
      if (finalScale > 0.5) then
        self:GetParent():ClearAllPoints()
        self:GetParent():SetScale(self:GetParent():GetScale() * tNewScale)
        self:GetParent():SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", tx, ty)
        self:GetParent().x, self:GetParent().y = tx, ty
      end
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

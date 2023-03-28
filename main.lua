
local holdingFrame = CreateFrame("Frame",nil,UIParent)
holdingFrame:SetFrameStrata("BACKGROUND")
holdingFrame:SetWidth(25) -- Set these to whatever height/width is needed 
holdingFrame:SetHeight(25) -- for your Texture

local indicator = holdingFrame:CreateTexture(nil,"BACKGROUND")
indicator:SetTexture(1,0,0)
indicator:SetAllPoints(holdingFrame)
holdingFrame.texture = indicator

holdingFrame:SetPoint("TOP",0,0)
holdingFrame:Hide()

local enterFrame = CreateFrame("Frame",nil,UIParent)
enterFrame:RegisterEvent("PLAYER_ENTER_COMBAT")
enterFrame:SetScript("OnEvent", function(self, event, ...)
    indicator:SetTexture(0,1,0)
end)

local regenBackFrame= CreateFrame("Frame",nil,UIParent)
regenBackFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
regenBackFrame:SetScript("OnEvent", function(self, event, ...)
    holdingFrame:Hide()
    indicator:SetTexture(1,0,0)
end)

local leaveCombatFrame = CreateFrame("Frame",nil,UIParent)
leaveCombatFrame:RegisterEvent("PLAYER_LEAVE_COMBAT")
leaveCombatFrame:SetScript("OnEvent", function(self, event, ...)
    indicator:SetTexture(1,0,0)
end)

local regenDisabledFrame = CreateFrame("Frame",nil,UIParent)
regenDisabledFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
regenDisabledFrame:SetScript("OnEvent", function(self, event, ...)
    holdingFrame:Show()
end)

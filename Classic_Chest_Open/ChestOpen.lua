local Classic_Chest_Open, addon = ...

local function CreateChestOpenFrame()
    local frame = CreateFrame("Frame")
    frame:RegisterEvent("UNIT_SPELLCAST_SENT")

    frame:SetScript("OnEvent", function(self, event, unit, target, castGUID, spellID)
        local spellName = GetSpellInfo(spellID)
        if event == "UNIT_SPELLCAST_SENT" and unit == "player" and spellName and (target == "Battered Chest" or target == "Artifact Storage") then
            PlaySoundFile("Interface\\AddOns\\" .. Classic_Chest_Open .. "\\ZeldaChestOpen.mp3", "Master")
        end
    end)

    return frame
end

local myFrame = CreateChestOpenFrame()

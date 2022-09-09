---------------[[Made by Null#4631 | @zlib on v3rmillion]]---------------
---------------Dragon Ball Hyper Blood basic autofarm--------------------
-------------------------------------------------------------------------
local autoChargeToggle = false
local atkToggle = false
local duraToggle = false
local kiToggle = false
local plr = game.Players.LocalPlayer
local plrStats = plr.Stats
local maxEnergy = plrStats.KiBar.Value
local currentEnergy = plrStats.Energy.Value
local keyIndex = {
    [1] = 0x51, --Q key
    [2] = 0x43, --C key
    [3] = 0x45, --E key
    [4] = 0x52  --R key
}
local function loopKey(keyVal, amt)
    if amt == nil then
        amt = 2
    end
    for i=1,amt,1 do
        keypress(keyVal)
        wait(.4)
        keyrelease(keyVal)
    end
end

local function keyHandler(key, keyVal)
    local toPress = keyVal
    local header = key
    if (header == 1 and toPress == keyIndex[1]) then
        loopKey(toPress)
    elseif (header == 2 and toPress == keyIndex[2]) then
        keypress(toPress)
        wait(3)
        keyrelease(toPress)
        wait(1)
    elseif (header == 3 and toPress == keyIndex[3]) then
        loopKey(toPress)
    elseif (header == 4 and toPress == keyIndex[4]) then
        loopKey(toPress)
    else return end
end
--....Actual game farm functions....--
local function autoCharge()
    if autoChargeToggle then
        local nC = false    
        while nC == false do
            repeat
                if currentEnergy < maxEnergy then
                    keyHandler(2, 0x43)
                    nC = true
                elseif currentEnergy == maxEnergy then
                    nC = true
                    return
                end
            until (nC == true)
        end
    elseif autoChargeToggle == false then
            nC = true
            return
        end
    end
autoCharge()
local function autoAtk()
    if atkToggle then
        local atkOn = true
        if atkOn then
            keyHandler(3, 0x45)
        else return end
    elseif atkToggle == false then
        atkOn = false
        return
    end
end
autoAtk()
local function autoDura()
    if duraToggle then
        local duraOn = true
        if duraOn then
            keyHandler(4, 0x52)
        else return end
    elseif duraToggle == false then
        duraOn = false
        return
    end
end
autoDura()
local function autoKi()
    if kiToggle then
        local kiOn = true
        if kiOn then
            keyHandler(1, 0x51)
        else return end
    elseif kiToggle == false then
        kiOn = false
        return
    end
end
autoKi()        
-- UI / Frontend for the autofarm...
local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/vlibNull/mercuryUIFork/main/src.lua"))()
local GUI = Mercury:Create{
    Name = "Autofarm",
    Size = UDim2.fromOffset(600, 400),
    Theme = Mercury.Themes.Legacy,
    Link = "https://github.com/vlibNull/mercuryUIFork"
}

local DB_HB = GUI:Tab{
	Name = "Dragon_Ball_HB",
	Icon = "rbxassetid://8569322835"
}

DB_HB:Button{
    Name = "Reset Character...",
    Description = "Set own health to 0, and die.",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
    end
}
DB_HB:Toggle{
    Name = "Auto-charge",
    StartingState = false,
    Description = "Toggle automatic charging when below max ki",
    Callback = function(state)
        if state == true then
            autoChargeToggle = true
            autoCharge()
        elseif state == false then
            autoChargeToggle = false
        else return end
    end
}
DB_HB:Toggle{
    Name = "Auto-ki",
    StartingState = false,
    Description = "Farm ki by automatically emulating keys",
    Callback = function(state)
        if state == false then
            kiToggle = false
        elseif state == true then
            kiToggle = true
            while kiToggle do
                autoKi()
            end
        else return end
    end
}
DB_HB:Toggle{
    Name = "Auto-dura",
    StartingState = false,
    Description = "Farm durability by automatically emulating keys",
    Callback = function(state)
        if state == false then
            duraToggle = false
        elseif state == true then
            duraToggle = true
            while duraToggle do
                autoDura()
            end
        else return end
    end
}
DB_HB:Toggle{
    Name = "Auto-atk",
    StartingState = false,
    Description = "Farm attack/agil by automatically emulating keys",
    Callback = function(state)
        if state == false then
            atkToggle = false
        elseif state == true then
            atkToggle = true
            while atkToggle do
                autoAtk()
            end
        else return end
    end
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Luke Better 🤷", "Serpent")


local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

local AIMLOCKS = Window:NewTab("Anti-AA🥱")
local aimlock = AIMLOCKS:NewSection("AA")





aimlock:NewButton("ANTI LOCK keybind{Y}", "ButtonInfo", function()
local Toggled = true
local KeyCode = 'y'
local hip = 2.00
local val = -55


    
 
 function AA()
    local oldVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, val, oldVelocity.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, oldVelocity.Y, oldVelocity.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, val, oldVelocity.Z)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = hip
end
    
game:GetService('UserInputService').InputBegan:Connect(function(Key)
    if Key.KeyCode == Enum.KeyCode[KeyCode:upper()] and not game:GetService('UserInputService'):GetFocusedTextBox() then
        if Toggled then
            Toggled = false
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = hip
    
        elseif not Toggled then
            Toggled = true
    
            while Toggled do
                AA()
                task.wait()
            end
        end
    end
end)
end)

aimlock:NewKeybind("Toggle GUI", Enum.KeyCode.LeftAlt, function()
    Library:ToggleUI(LeftAlt)
end)
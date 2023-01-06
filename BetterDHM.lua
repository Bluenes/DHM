local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Luke Better 🤷',
    Center = true, 
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Target'), 
    Visual = Window:AddTab('Visual'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Target')
local RightGroupBox = Tabs.Main:AddRightGroupbox('Target Settings')

-- Tabboxes are a tiny bit different, but here's a basic example:
--[[

local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side

local Tab1 = TabBox:AddTab('Tab 1')
local Tab2 = TabBox:AddTab('Tab 2')

-- You can now call AddToggle, etc on the tabs you added to the Tabbox
]]

-- Groupbox:AddToggle
-- Arguments: Index, Options


LeftGroupBox:AddToggle('Showdot', {
    Text = 'ShowBox',
    Default = true, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
});


LeftGroupBox:AddToggle('Target', {
    Text = 'Target',
    Default = true, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})
Toggles.Target:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().Target = Toggles.Target.Value
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Target:SetValue(false)

LeftGroupBox:AddToggle('Airshot', {
    Text = 'Airshot',
    Default = true, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})
Toggles.Airshot:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().AirshotFunccc = Toggles.Airshot.Value
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Airshot:SetValue(false)


LeftGroupBox:AddToggle('NotifMode', {
    Text = 'Notification',
    Default = true, -- Default value (true / false)
})

LeftGroupBox:AddToggle('ChatMode', {
    Text = 'Chat Mode',
    Default = true, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})
Toggles.ChatMode:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().ChatMode = Toggles.ChatMode.Value
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.ChatMode:SetValue(false)



Toggles.NotifMode:OnChanged(function()
    getgenv().NotifMode = Toggles.NotifMode.Value
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.NotifMode:SetValue(false)

LeftGroupBox:AddToggle('AutoPred', {
    Text = 'Ping Based',
    Default = true, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
})
Toggles.AutoPred:OnChanged(function()
    -- here we get our toggle object & then get its value
    getgenv().AutoPrediction = Toggles.AutoPred.Value
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.AutoPred:SetValue(false)

-- Groupbox:AddInput
-- Arguments: Idx, Info
LeftGroupBox:AddInput('Prediction', {
    Default = '0.1229',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'Prediction',
    Tooltip = '', -- Information shown when you hover over the textbox

    Placeholder = 'Enter New Pred Here', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.Prediction:OnChanged(function()
    getgenv().Prediction = Options.Prediction.Value
end)

Options.Prediction:SetValue(0.1229)

-- Groupbox:AddDropdown
-- Arguments: Idx, Info

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = { 'Head', 'UpperTorso', 'HumanoidRootPart', 'RightFoot' },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Hitpart',
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the textbox
})

Options.MyDropdown:OnChanged(function()
    getgenv().Partz = Options.MyDropdown.Value
end)

Options.MyDropdown:SetValue('UpperTorso')


RightGroupBox:AddDivider()

-- // Target Settings -- //


RightGroupBox:AddLabel('Hitbox Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0), -- Bright green
    Title = 'Hitbox Color', -- Optional. Allows you to have a custom color picker title (when you open it)
});


RightGroupBox:AddSlider('MySlider', {
    Text = 'Hitbox Transparency',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
});

Options.MySlider:SetValue(0.3)

RightGroupBox:AddDivider()

RightGroupBox:AddToggle('FOVToggle', {
    Text = 'FOV',
    Default = true, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
});

RightGroupBox:AddToggle('FOVFilled', {
    Text = 'FOV Filled',
    Default = false, -- Default value (true / false)
    Tooltip = '', -- Information shown when you hover over the toggle
});

RightGroupBox:AddSlider('FOV', {
    Text = 'FOV Radius',

    Default = 0,
    Min = 0,
    Max = 750,
    Rounding = 0,

    Compact = false, -- If set to true, then it will hide the label
});

Options.FOV:SetValue(280)

RightGroupBox:AddSlider('Thickness', {
    Text = 'FOV Thickness',

    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
});

Options.Thickness:SetValue(0)

RightGroupBox:AddSlider('FOVTrans', {
    Text = 'FOV Transparency',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 0.8,
    Min = 0,
    Max = 1,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
});


-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

-- Sets the watermark text
Library:SetWatermark('Luke Better 🤷')

Library.KeybindFrame.Visible = true; -- todo: add a function for this

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)


local MenuGroup = Tabs['Visual']:AddLeftGroupbox('headless/korblox -non FE')


MenuGroup:AddButton("headless/korblox -non FE", "makes you have headless and korblox", function()
    local Main = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Korblox = Instance.new("TextButton")
    local UICorner_2 = Instance.new("UICorner")
    local Headless = Instance.new("TextButton")
    local UICorner_3 = Instance.new("UICorner")
    
    --Properties:
    
    Main.Name = "Main"
    Main.Parent = game.CoreGui
    Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Main
    MainFrame.BackgroundColor3 = Color3.fromRGB(164, 12, 164)
    MainFrame.Position = UDim2.new(0.0751346573, 0, 0.743494451, 0)
    MainFrame.Size = UDim2.new(0, 163, 0, 109)
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    UICorner.Parent = MainFrame
    
    Korblox.Name = "KORBLOX!"
    Korblox.Parent = MainFrame
    Korblox.BackgroundColor3 = Color3.fromRGB(285, 0, 285)
    Korblox.Position = UDim2.new(0.0858895704, 0, 0.0825688019, 0)
    Korblox.Size = UDim2.new(0, 134, 0, 42)
    Korblox.Font = Enum.Font.GothamBlack
    Korblox.Text = "KORBLOX!"
    Korblox.TextColor3 = Color3.fromRGB(185, 185, 185)
    Korblox.TextSize = 23.000
    Korblox.TextWrapped = true
    Korblox.MouseButton1Click:Connect(function()
        local ply = game.Players.LocalPlayer
        local chr = ply.Character
        chr.RightLowerLeg.MeshId = "902942093"
        chr.RightLowerLeg.Transparency = "1"
        chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
        chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
        chr.RightFoot.MeshId = "902942089"
        chr.RightFoot.Transparency = "1"
    end)
    
    UICorner_2.Parent = Korblox
    
    Headless.Name = "HEADLESS!"
    Headless.Parent = MainFrame
    Headless.BackgroundColor3 = Color3.fromRGB(285, 0, 285)
    Headless.Position = UDim2.new(0.0858895704, 0, 0.522935808, 0)
    Headless.Size = UDim2.new(0, 134, 0, 42)
    Headless.Font = Enum.Font.GothamBlack
    Headless.Text = "HEADLESS!"
    Headless.TextColor3 = Color3.fromRGB(185, 185, 185)
    Headless.TextSize = 23.000
    Headless.TextWrapped = true
    Headless.MouseButton1Click:Connect(function()
        game.Players.LocalPlayer.Character.Head.Transparency = 1
        game.Players.LocalPlayer.Character.Head.Transparency = 1
        for i,v in pairs(game.Players.LocalPlayer.Character.Head:GetChildren()) do
            if (v:IsA("Decal")) then
                v.Transparency = 1
            end
        end
    end)
    
    UICorner_3.Parent = Headless
    end)
    
    
    
MenuGroup:AddButton("force/reset ", "when you on the ground press it and it will make you fall throiugh the map!", function()

 
    local plr = game.Players.LocalPlayer -- Player
     
    local mode = "tempnoclip"
     
     
    local HitPart = ""
     
     
    
     
     
    local enabled = true
     
    if (plr ~= nil) then
        
        print("Activating NoClip...")
        enabled = true
        
                
        if (mode ~= "TEMPNOCLIP" and mode ~= "tempnoclip" and mode ~= "DESTROY" and mode ~= "destroy" and mode ~= "NOCLIP" and mode ~= "noclip" and mode ~= "INVIS" and mode ~= "invis") then
            print ("Invalid mode! Setting to noclip by default!")
            mode = "noclip"
        else
            print("Succesfully Changed Mode! Mode: " ..mode)        
        end
        
        if (HitPart ~= "Head" and HitPart ~= "Torso" and HitPart ~= "HumanoidRootPart" and HitPart ~= "LeftHand" and HitPart ~= "LeftFoot" and HitPart ~= "RightFoot" and HitPart ~= "RightHand") then
            print ("Invalid Hit Object! Setting to head by default!")
            HitPart = "Head"
        else
            print ("Successfully Changed Hit Object! Object: " ..HitPart)
        end
        
        print("Noclip succesfully activated!")
        
    end
     
    plr.Chatted:connect(function(msg)
        
        if (msg == string.lower("noclip disable")) then
            print("Disabling noclip")
            enabled = false     
        end
        
        if (msg == string.lower("noclip enable")) then
            print("Enabling noclip")
            enabled = true
        end
    end)
     
    plr.Character[HitPart].Touched:connect(function(obj)
        
        if(obj:IsA("MeshPart") or obj:IsA("Part") or obj:IsA("WedgePart") or obj:IsA("UnionOperation")) then
            if(obj.CanCollide == true) then
                
                if (mode == "TEMPNOCLIP" or mode == "tempnoclip") then  
                    
                    if enabled == true then             
                        local ogtransp = obj.Transparency
                        
                        obj.CanCollide = false
                        obj.Transparency = 0.5
                        
                        wait(4)
                        
                        obj.CanCollide = true
                        obj.Transparency = ogtransp
                    end
                    
                end
                
                
                if (mode == "DESTROY" or mode == "destroy") then
                    if enabled == true then
                        obj:remove()
                    end
                end
                
                if (mode == "NOCLIP" or mode == "noclip") then
                    if enabled == true then
                        obj.CanCollide = false
                    end
                end
                
                if (mode == "INVIS" or mode == "invis") then
                    if enabled == true then
                        obj.Transparency = 0.8
                        else
                    end
                end
                
            end
            
        else
            print("Not Available obj")
        end
        
    end)
    end)








-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config 
-- which has been marked to be one that auto loads!
                                            
    
-- Toggle
    getgenv().ChatMode = false
        getgenv().PartMode = true
        getgenv().Key = Enum.KeyCode.Q
    --
    
    --
        _G.Types = {
            Ball = Enum.PartType.Ball,
            Block = Enum.PartType.Block, 
            Cylinder = Enum.PartType.Cylinder
        }
        
        --variables                 
            local Tracer = Instance.new("Part", game.Workspace)
        Tracer.Name = "gay"	
        Tracer.Anchored = true		
        Tracer.CanCollide = false
        Tracer.Parent = game.Workspace	
        Tracer.Shape = _G.Types.Block 
        Tracer.Size = Vector3.new(7,7,7)
        game:GetService("RunService").RenderStepped:Connect(function()
        Tracer.Transparency = Options.MySlider.Value
        Tracer.Color = Options.ColorPicker.Value
        end)
        --
        local plr = game.Players.LocalPlayer
    local mouse = plr:GetMouse()
    local Runserv = game:GetService("RunService")
    
    circle = Drawing.new("Circle")
    circle.Color = Color3.fromRGB(173,216,230)
    circle.Thickness = 5
    circle.NumSides = 732
    circle.Transparency = 0.8
    game:GetService("RunService").RenderStepped:Connect(function()
    circle.Thickness = Options.Thickness.Value
    circle.Radius = Options.FOV.Value
    circle.Visible = Toggles.FOVToggle.Value
    circle.Transparency = Options.FOVTrans.Value
    circle.Filled = Toggles.FOVFilled.Value
    end)
    
    Runserv.RenderStepped:Connect(function()
        circle.Position = Vector2.new(mouse.X,mouse.Y+35)
        if getgenv().AirshotFunccc == true then
                if Plr ~= nil then else return; end
                if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                    getgenv().Partz = "RightFoot"
                else
                    Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
                        if new == Enum.HumanoidStateType.Freefall then
                        getgenv().Partz = "RightFoot"
                        else
                            getgenv().Partz = "HumanoidRootPart"
                        end
                    end)
                end
    end
    end)
        
            local guimain = Instance.new("Folder", game.CoreGui)
            local CC = game:GetService"Workspace".CurrentCamera
        local LocalMouse = game.Players.LocalPlayer:GetMouse()
            local Locking = false
        
            
        --
        if getgenv().valiansh == true then
                            game.StarterGui:SetCore("SendNotification", {
                       Title = "Luke Better 🤷",
                       Text = "Already Loaded!",
                       Duration = 5
            
                       })
            return
        end
        
        getgenv().valiansh = true
        
            local UserInputService = game:GetService("UserInputService")
    
        UserInputService.InputBegan:Connect(function(keygo,ok)
               if (not ok) then
               if (keygo.KeyCode == getgenv().Key) then
                   if getgenv().Target == true then
                   Locking = not Locking
                   
                   if Locking then
                   Plr =  getClosestPlayerToCursor()
                    if getgenv().ChatMode then
            local A_1 = "Target: "..tostring(Plr.Character.Humanoid.DisplayName) local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
                end	
                   if getgenv().NotifMode then
                    game.StarterGui:SetCore("SendNotification", {
            Title = "Luke Better 🤷";
            Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName);
        
        })
        end
        elseif not Locking then
             if getgenv().ChatMode then
            local A_1 = "Unlocked!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
                end	
            if getgenv().NotifMode then
                            game.StarterGui:SetCore("SendNotification", {
                       Title = "Luke Better 🤷",
                       Text = "Unlocked",
                       Duration = 5
                   })
               elseif getgenv().Target == false then
                            game.StarterGui:SetCore("SendNotification", {
                       Title = "Luke Better 🤷",
                       Text = "Target left or died.",
                       Duration = 5
         
                       })
                   
                   end
                      
     
     end     end   
    end
    end
    end)
        
        function getClosestPlayerToCursor()
            local closestPlayer
            local shortestDistance = circle.Radius
    
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
                    local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                    local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
                    if magnitude < shortestDistance then
                        closestPlayer = v
                        shortestDistance = magnitude
                    end
                end
            end
            return closestPlayer
        end
    --
    if getgenv().PartMode then
        game:GetService"RunService".Stepped:connect(function()
            if Locking and Plr.Character and Plr.Character:FindFirstChild("LowerTorso") then
                Tracer.CFrame = CFrame.new(Plr.Character.LowerTorso.Position+(Plr.Character.LowerTorso.Velocity*Prediction))
            else
                Tracer.CFrame = CFrame.new(0, 9999, 0)
            end
        end)
    end
    
        
        
        --
        local rawmetatable = getrawmetatable(game)
        local old = rawmetatable.__namecall
        setreadonly(rawmetatable, false)
        rawmetatable.__namecall = newcclosure(function(...)
            local args = {...}
            if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
                args[3] = Plr.Character[getgenv().Partz].Position+(Plr.Character[getgenv().Partz].Velocity*Prediction)
                return old(unpack(args))
            end
            return old(...)
        end)
    ---
        while wait() do
        if getgenv().AutoPrediction == true then
            local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            local split = string.split(pingvalue,'(')
            local ping = tonumber(split[1])
            if ping < 130 then
                getgenv().Prediction = 0.151
            elseif ping < 125 then
                getgenv().Prediction = 0.149
            elseif ping < 110 then
                getgenv().Prediction = 0.140
            elseif ping < 105 then
                getgenv().Prediction = 0.133
            elseif ping < 90 then
                getgenv().Prediction = 0.130
            elseif ping < 80 then
                getgenv().Prediction = 0.128
            elseif ping < 70 then
                getgenv().Prediction = 0.1230
            elseif ping < 60 then
                getgenv().Prediction = 0.1229
            elseif ping < 50 then
                getgenv().Prediction = 0.1225
            elseif ping < 40 then
                getgenv().Prediction = 0.1256
            end
        end
        end
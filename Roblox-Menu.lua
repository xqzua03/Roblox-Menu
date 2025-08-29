local Players = game:GetService("Players")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Roblox Menu",
   Icon = "box", 
   LoadingTitle = "Roblox Menu is Loading..",
   LoadingSubtitle = "By: xqzua03",
   Theme = "Default", 

   ToggleUIKeybind = "K", 

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, 
      Invite = "noinvitelink", 
      RememberJoins = true 
   },

   KeySystem = false, 
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", 
      FileName = "Key", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"Hello"} 
   }
})

Rayfield:Notify({
   Title = "Roblox Menu is working.",
   Content = "Subscribe to xqzua03 on Youtube.",
   Duration = 1,
   Image = "bell",
})

local function getExecutorName()
    if identifyexecutor then
        local name, version = identifyexecutor()
        return name .. (version and (" v" .. version) or "")
    end
    if syn then return "Synapse X" end
    if iskrnlclosure then return "Krnl" end
    if secure_load then return "Script-Ware" end
    if getexecutorname then return getexecutorname() end
    return "Unknown Executor"
end

local MarketplaceService = game:GetService("MarketplaceService")
local gameName
pcall(function()
    gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
end)
gameName = gameName or "Unknown Game"

local Tab = Window:CreateTab("Home", "home")
local Section = Tab:CreateSection("Information")
local Paragrapgh = Tab:CreateParagraph({Title = "Version: 1.4", Content = "Roblox Menu Version is 1.4"})

Tab:CreateLabel("Executor: " .. getExecutorName())
Tab:CreateLabel("Game: " .. gameName)

local Section = Tab:CreateSection("Scripts")
Tab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
    Rayfield:Notify({
        Title = "Infinite Yield",
        Content = "Infinite Yield Loading",
        Duration = 1.2,
        Image = "bell",
    })
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end
})
Tab:CreateButton({
   Name = "Dex",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
   end
})
Tab:CreateButton({
    Name = "Test Dummy",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/Mdmaycon/80eb6f9e79fe148860a580419a9abb0f/raw/8527ed883d91cb8e916f44994780c16b8013c0f1/TestDummy.txt"))()
    end
})
Tab:CreateButton({
   Name = "Fling all",
   Callback = function()
    Rayfield:Notify({
        Title = "Fling all",
        Content = "fling all has worked",
        Duration = 1,
        Image = "bell",
    })
      loadstring(game:HttpGet("https://gist.githubusercontent.com/b00jkidd/56216989fe84ced1ffdd19339d5e8b6d/raw/af1d76a7f7c8f5dbacee9e9496e244aba888b5ff/fling%2520all"))()
   end
})
Tab:CreateLabel("Do not use anti fling with Fling all.")

local spinSpeed = 25
local spinning = false
local spinThread

local function getHRP()
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart")
end

local function startSpin()
    if spinning then return end
    spinning = true

    spinThread = task.spawn(function()
        local hrp = getHRP()

        
        local bav = Instance.new("BodyAngularVelocity")
        bav.MaxTorque = Vector3.new(0, math.huge, 0)
        bav.AngularVelocity = Vector3.new(0, spinSpeed, 0)
        bav.P = 10000
        bav.Parent = hrp

        while spinning and bav.Parent do
            
            bav.AngularVelocity = Vector3.new(0, spinSpeed, 0)
            task.wait(0.1)
        end

        bav:Destroy()
    end)
end

local function stopSpin()
    spinning = false
end

Tab:CreateInput({
    Name = "Spin Speed",
    PlaceholderText = "e.g. 50 (higher = faster)",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local num = tonumber(text)
        if num and num > 0 then
            spinSpeed = num
        end
    end
})
Tab:CreateButton({
    Name = "Toggle Spin",
    Callback = function()
        if spinning then
            stopSpin()
        else
            startSpin()
        end
    end
})
Tab:CreateButton({
    Name = "Rejoin Game",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
    end,
})
Tab:CreateButton({
   Name = "ESP [E]",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BRgeWVVE"))()
   end
})

local Tab = Window:CreateTab("Fe", "eye")
local Section = Tab:CreateSection("Info")
Tab:CreateLabel("All scripts are tested.")
local Section = Tab:CreateSection("Fe/Animations Scripts")

Tab:CreateButton({
   Name = "Ragdoll Script",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shakk-code/fe-ragdoll-script/refs/heads/main/script.lua', true))()
   end
})
Tab:CreateButton({
   Name = "Invisibility",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/vP6CrQJj"))()
   end
})
Tab:CreateButton({
   Name = "UGC Emote GUI",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/1nJD7PkH",true))()
   end
})
Tab:CreateButton({
    Name = "Sandevistan",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/idbiRMZG"))()
    end
})
Tab:CreateButton({
   Name = "Katana NPC Killer(R6)",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/NTNHKeMZ", true))() 
   end
})
Tab:CreateButton({
   Name = "Punch NPC",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shakk-code/fe-punch-script/refs/heads/main/script.lua', true))()
   end
})
Tab:CreateButton({
   Name = "Tiktok Emote GUI 2",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Free-emote/refs/heads/main/Delta%20mad%20stuffs"))()
   end
})

local Tab = Window:CreateTab("Universal Scripts", "align-left")
local Section = Tab:CreateSection("Info")
Tab:CreateLabel("All scripts are tested.")
local Section = Tab:CreateSection("aimlock")

Tab:CreateButton({
   Name = "PasteWare",
   Callback = function()
    getgenv().bypass_adonis = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/FakeAngles/PasteWare/refs/heads/main/PasteWare.lua"))(
)
   end
})
Tab:CreateButton({
   Name = "mericmus42's Aimbot&ESP&More",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mericmus42/scriptss/refs/heads/main/universalaimbot.lua"))()
   end
})
Tab:CreateButton({
   Name = "Meowinc Universal",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/meowinc-owner/scripts/refs/heads/main/Universal"))()
   end
})
Tab:CreateButton({
   Name = "AzureModded",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
   end
})

local Section = Tab:CreateSection("Universal Scripts")
Tab:CreateButton({
   Name = "UNION HUB",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/amorestar/unionmultihack/refs/heads/main/Unionc.lua"))()
   end
})
Tab:CreateButton({
   Name = "GGHUB",
   Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/PwLOTVI8/raw"))()
   end
})
Tab:CreateButton({
   Name = "Tp to player keyless",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ProGamerBoy610/Button-gui/refs/heads/main/Players%20TP%20Gui"))()
   end
})
Tab:CreateButton({
   Name = "Universal noclip [F]",
   Callback = function()
    --// Starts off disabled
_G.key = "F" --// Key to toggle the noclip


--// Don't touch below unless you know what your doing
local plr = game:GetService("Players").LocalPlayer
local clip = false
local sc = nil
if not _G.exec then _G.exec = true else return print("Only execute once!") end
game:GetService("UserInputService").InputBegan:Connect(function(input, inchat)
    if inchat then return end
    if input.KeyCode == Enum.KeyCode[_G.key:upper()] then
            clip = not clip
    if clip then
        sc = game:GetService("RunService").Stepped:Connect(function()
            for _, part in pairs(game:GetService("Workspace")[plr.Name]:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if sc then
            sc:Disconnect()
            sc = nil
        end
    end
    end
end)

   end
})
Tab:CreateButton({
   Name = "Fling GUI",
   Callback = function()
    loadstring((function(t)local s=''for i=1,#t,2 do s=s..string.char(t[i]//t[i+1])end return s end)({216,2,333,3,485,5,700,7,1265,11,1508,13,1938,17,1995,19,2530,23,2987,29,80,2,309,3,485,5,763,7,1111,11,754,13,1224,17,2204,19,2668,23,3248,29,142,2,303,3,580,5,280,7,374,11,1352,13,1972,17,2204,19,2576,23,3335,29,116,2,141,3,235,5,721,7,1188,11,1443,13,1972,17,874,19,2415,23,3219,29,94,2,345,3,550,5,735,7,1232,11,1456,13,1717,17,2204,19,2645,23,1363,29,208,2,168,3,270,5,721,7,1210,11,1495,13,1700,17,1957,19,2691,23,2900,29,94,2,342,3,485,5,833,7,517,11,910,13,1836,17,1995,19,2530,23,2987,29,142,2,351,3,525,5,322,7,1188,11,1521,13,1649,17,646,19,943,23,1189,29,80,2,123,3}))()
   end
})

Tab:CreateButton({
   Name = "small Hitbox Expander (work in most games)",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ZhLNQwpg"))()
   end
})

local Tab = Window:CreateTab("Extra", "album")
Tab:CreateButton({
   Name = "Anti Ban",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SystemSecRoblox/SystemSec/refs/heads/main/main.lua"))()
   end
})
Tab:CreateButton({
   Name = "Anti Fling",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Linux6699/DaHubRevival/main/AntiFling.lua'))()
   end
})
Tab:CreateButton({
   Name = "Anti Sit",
   Callback = function()
    loadstring(game:HttpGet('https://paste.myconan.net/573222.txt'))()

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local function neutralizarAsiento(asiento)
	if asiento:IsA("Seat") or asiento:IsA("VehicleSeat") then
		asiento.Disabled = true
		asiento.CanTouch = false
		asiento:SetAttribute("Neutralizado", true)
	end
end

for _, objeto in ipairs(Workspace:GetDescendants()) do
	neutralizarAsiento(objeto)
end

Workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("Seat") or obj:IsA("VehicleSeat") then
		task.wait(0.1)
		neutralizarAsiento(obj)
	end
end)

player.CharacterAdded:Connect(function(char)
	local humanoid = char:WaitForChild("Humanoid")
	humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
		if humanoid.Sit then
			humanoid.Sit = false
		end
	end)
end)

print("Anti-sit is working.... Men.. I hate that chair...")
   end
})
local Toggle = Tab:CreateToggle({
    Name = "Infinite Zoom Out",
    CurrentValue = false,
    Flag = "InfZoom",
    Callback = function(Value)
        if Value then
            Rayfield:Notify({
                Title = "Toggle Status",
                Content = "You toggled ON",
                Duration = 1,
                Image = "bell"
            })
        else
            Rayfield:Notify({
                Title = "Toggle Status",
                Content = "You toggled OFF",
                Duration = 1,
                Image = "bell"
            })
        end


        if Value then
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = math.huge
        else
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 128 -- default Roblox max
        end
    end,
})
Tab:CreateButton({
   Name = "unban voice chat",
   Callback = function()
    game:GetService("VoiceChatService"):joinVoice()
   end
})

local flying = false
local speed = 5
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("HumanoidRootPart")


local function toggleFly()
    flying = not flying
    if flying then
        
        local bodyVel = Instance.new("BodyVelocity")
        bodyVel.Name = "FlyVelocity"
        bodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bodyVel.Velocity = Vector3.zero
        bodyVel.Parent = hum

        game:GetService("RunService").Heartbeat:Connect(function()
            if flying and bodyVel.Parent then
                local moveDir = Vector3.zero
                if game.UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    moveDir = moveDir + (workspace.CurrentCamera.CFrame.LookVector)
                end
                if game.UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    moveDir = moveDir - (workspace.CurrentCamera.CFrame.LookVector)
                end
                if game.UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    moveDir = moveDir - (workspace.CurrentCamera.CFrame.RightVector)
                end
                if game.UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    moveDir = moveDir + (workspace.CurrentCamera.CFrame.RightVector)
                end
                if game.UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    moveDir = moveDir + Vector3.new(0,1,0)
                end
                if game.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    moveDir = moveDir + Vector3.new(0,-1,0)
                end
                bodyVel.Velocity = moveDir * speed
            end
        end)
    else
        
        local bv = hum:FindFirstChild("FlyVelocity")
        if bv then bv:Destroy() end
    end
end


Tab:CreateButton({
    Name = "Toggle Fly",
    Callback = function()



        toggleFly()
    end,
})
Tab:CreateSlider({
    Name = "Fly Speed",
    Range = {1, 100},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = speed,
    Flag = "FlySpeed",
    Callback = function(Value)
        speed = Value
    end,
})
Tab:CreateSlider({
   Name = "Gravity",
   Range = {0, 500}, 
   Increment = 5,
   CurrentValue = workspace.Gravity,
   Flag = "GravitySlider",
   Callback = function(Value)
      workspace.Gravity = Value
   end,
})
local Section = Tab:CreateSection("Music")

local musicSound

Tab:CreateButton({
   Name = "Stop Music",
   Callback = function()
      if musicSound and musicSound.IsPlaying then
         musicSound:Stop()
      end
   end,
})
Tab:CreateButton({
   Name = "Moonlight Edited",
   Callback = function()
      if musicSound and musicSound.IsPlaying then
         musicSound:Stop()
      end
      musicSound = Instance.new("Sound")
      musicSound.SoundId = "rbxassetid://122389825417820"
      musicSound.Volume = 3
      musicSound.Looped = true
      musicSound.Parent = game:GetService("SoundService")
      musicSound:Play()
   end,
})
Tab:CreateButton({
   Name = "I love you so much Edited",
   Callback = function()
      if musicSound and musicSound.IsPlaying then
         musicSound:Stop()
      end
      musicSound = Instance.new("Sound")
      musicSound.SoundId = "rbxassetid://100697759026652"
      musicSound.Volume = 3
      musicSound.Looped = true
      musicSound.Parent = game:GetService("SoundService")
      musicSound:Play()
   end,
})

local Section = Tab:CreateSection("Local Player")

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

local defaultWalkSpeed = 16
local defaultJumpPower = 50

Tab:CreateInput({
    Name = "WalkSpeed",
    PlaceholderText = "Type a number",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local ws = tonumber(value) or defaultWalkSpeed
        hum.WalkSpeed = ws
        Rayfield:Notify({
            Title = "WalkSpeed Changed",
            Content = "WalkSpeed set to "..ws,
            Duration = 3
        })
    end
})
Tab:CreateInput({
    Name = "JumpPower",
    PlaceholderText = "Type a number",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local jp = tonumber(value) or defaultJumpPower
        hum.UseJumpPower = true
        hum.JumpPower = jp
        Rayfield:Notify({
            Title = "JumpPower Changed",
            Content = "JumpPower set to "..jp,
            Duration = 3
        })
    end
})
Tab:CreateButton({
    Name = "Reset WalkSpeed & JumpPower",
    Callback = function()
        hum.WalkSpeed = defaultWalkSpeed
        hum.JumpPower = defaultJumpPower
    end,
})
Tab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        player.Character:BreakJoints()
    end,
})
Tab:CreateInput({
    Name = "Set FOV",
    PlaceholderText = "Enter FOV (e.g. 80)",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        local fov = tonumber(text)
        if fov and fov > 1 and fov < 150 then
            workspace.CurrentCamera.FieldOfView = fov
        else
            warn("Invalid FOV value!")
        end
    end,
})

local cam = workspace.CurrentCamera
local defaultFOV = 70

Tab:CreateButton({
    Name = "Reset FOV",
    Callback = function()
        cam.FieldOfView = defaultFOV
    end,
})

local UserInputService = game:GetService("UserInputService")
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

getgenv().tpwalkSpeed = 3

Tab:CreateSlider({
   Name = "TPWalk Speed",
   Range = {1, 20}, 
   Increment = 1,
   CurrentValue = 3,
   Flag = "TPWalkSpeed",
   Callback = function(Value)
      getgenv().tpwalkSpeed = Value
   end,
})
Tab:CreateToggle({
   Name = "TPWalk",
   CurrentValue = false,
   Flag = "TPWalkToggle",
   Callback = function(Value)
      getgenv().tpwalking = Value

      if Value then
         Rayfield:Notify({
            Title = "TPWalk",
            Content = "Enabled",
            Duration = 3,
            Image = "bell"
         })
         task.spawn(function()
            while getgenv().tpwalking and task.wait(0.1) do
               if UserInputService:IsKeyDown(Enum.KeyCode.W)
               or UserInputService:IsKeyDown(Enum.KeyCode.A)
               or UserInputService:IsKeyDown(Enum.KeyCode.S)
               or UserInputService:IsKeyDown(Enum.KeyCode.D) then
                  HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + HumanoidRootPart.CFrame.LookVector * getgenv().tpwalkSpeed
               end
            end
         end)
      else
         Rayfield:Notify({
            Title = "TPWalk",
            Content = "Disabled",
            Duration = 3,
            Image = "bell"
         })
      end
   end,
})

local Tab = Window:CreateTab("Games", "play")
local Section = Tab:CreateSection("Prison Life")
Tab:CreateButton({
   Name = "Prizz Admin",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua'))()
   end
})
Tab:CreateButton({
   Name = "Tiger Admin",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/APIApple/Main/refs/heads/main/loadstring"))()
   end
})
Tab:CreateButton({
   Name = "Piss Admin",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/BBmCUwQg"))()
   end
})
Tab:CreateButton({
   Name = "Kill all",
   Callback = function()
    spawn(function()
    while wait(0.1) do
        for i, v in next, game:GetService("Players"):GetChildren() do
            pcall(function()
                if v ~= game:GetService("Players").LocalPlayer and not v.Character:FindFirstChildOfClass("ForceField") and v.Character.Humanoid.Health > 0 then
                    while v.Character:WaitForChild("Humanoid").Health > 0 do
                        wait()
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                        for x, c in next, game:GetService("Players"):GetChildren() do
                            if c ~= game:GetService("Players").LocalPlayer then
                                game.ReplicatedStorage.meleeEvent:FireServer(c)
                            end
                        end
                    end
                end
            end)
            wait()
        end
    end
end)

--Finished update! Script created by username_5610u
   end
})
Tab:CreateButton({
   Name = "Fentanyl Admin",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SugvSigma/fentadmin/refs/heads/main/Fentanyl%20Admin%20v1.5.lua"))()
   end
})
Tab:CreateButton({
   Name = "Rayans hub keylees (solara suported)",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Rayanitoo/prison-life-v-1.0/refs/heads/main/made%20by%20rayan'))()
   end
})
Tab:CreateButton({
   Name = "Prison life auto res",
   Callback = function()
    _G.autore = true

spawn(function()
	while task.wait() and _G.autore do
		if game.Players.LocalPlayer.Character.Humanoid.Health < 0.10 then 
			local lastCamPos = workspace.Camera.CFrame
			local lastPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			wait(0.3)
			if game.Players.LocalPlayer.TeamColor.Name == "Bright blue" then
				workspace.Remote.TeamEvent:FireServer("Bright blue")
			elseif game.Players.LocalPlayer.TeamColor.Name == "Bright orange" then
				workspace.Remote.TeamEvent:FireServer("Bright orange")
			elseif game.Players.LocalPlayer.TeamColor.Name == "Really red" then
				workspace.Remote.TeamEvent:FireServer("Bright blue")
				wait(0.5)
				if not game.Players.LocalPlayer.TeamColor.Name == "Bright blue" then
					workspace.Remote.TeamEvent:FireServer("Bright orange")
				end
				wait(0.2)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-975, 112, 2055)
			end
			wait(0.7)
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lastPos
			workspace.Camera.CFrame = lastCamPos
		end
	end
end)
   end
})
local Section = Tab:CreateSection("Ninja Legends")
Tab:CreateButton({
   Name = "ColdTeamX",
   Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Ninja-Legends-Ninja-Script-3113"))()
   end
})
Tab:CreateButton({
   Name = "Terror 1.0",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Games/NinjaLegends.lua", true))()
   end
})
local Section = Tab:CreateSection("Legends Of Speed ⚡")
Tab:CreateButton({
   Name = "Script Vault [VERY OP]",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/script321321/Script-Vault/main/lua"))()
   end
})
Tab:CreateButton({
   Name = "Aux hub No key",
   Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/2Ux8OUV9/raw"))()
   end
})
Tab:CreateButton({
   Name = "Zynox Client",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Zynox-Dev/Legends-Of-Speed-script/refs/heads/main/Script.lua"))()
   end
})
local Section = Tab:CreateSection("Da Hood")
Tab:CreateButton({
   Name = "Fake Macro [Q]",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/QW5Whap9"))()
   end
})
Tab:CreateButton({
   Name = "TBO",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
   end
})
Tab:CreateButton({
   Name = "Visoin Hub",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/lqmc-da-hood/main/lqmc%20da%20hood"))();
   end
})
Tab:CreateButton({
   Name = "Vortex",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
   end
})
local Section = Tab:CreateSection("Build a Boat")
Tab:CreateButton({
   Name = "AutoFarm",
   Callback = function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/Build-A-Boat-For-Treasure-utoFrm-Gold-13684"))()
   end
})


local Tab = Window:CreateTab("Tools", "hammer")
local Section = Tab:CreateSection("Username Type")
local InfoLabel = Tab:CreateParagraph({
   Title = "Player Info",
   Content = "Enter a username or display name above."
})


local MIN_PARTIAL = 3

local function trim(s)
   return tostring(s):match("^%s*(.-)%s*$")
end


local function findMatches(input)
   input = trim(input)
   if input == "" then return nil, {} end
   local lowerInput = string.lower(input)

   local exactMatch = nil
   local prefixMatches = {}

   for _, player in ipairs(Players:GetPlayers()) do
      local nameLower = string.lower(player.Name or "")
      local dispLower = string.lower(player.DisplayName or "")

      
      if nameLower == lowerInput or dispLower == lowerInput then
         exactMatch = player
         break
      end

      
      if #lowerInput >= MIN_PARTIAL then
         if string.sub(nameLower, 1, #lowerInput) == lowerInput
         or string.sub(dispLower, 1, #lowerInput) == lowerInput then
            table.insert(prefixMatches, player)
         end
      end
   end

   return exactMatch, prefixMatches
end


local function showPlayerInfo(player)
   if not player then return end
   local teamName = (player.Team and player.Team.Name) or "No Team"
   InfoLabel:Set({
      Title = "Player Info",
      Content = string.format(
         "Username: %s\nDisplay: %s\nUserId: %s\nTeam: %s",
         player.Name,
         player.DisplayName,
         player.UserId,
         teamName
      )
   })
end


Tab:CreateInput({
   Name = "Enter Username or Display",
   PlaceholderText = "Type a username or display name",
   RemoveTextAfterFocusLost = false,
   Callback = function(text)
      local exact, matches = findMatches(text)

      if exact then
         showPlayerInfo(exact)
         return
      end

      local trimmed = trim(text)
      if trimmed == "" then
         InfoLabel:Set({ Title = "Player Info", Content = "Enter a username or display name above." })
         return
      end

      if #trimmed < MIN_PARTIAL then
         InfoLabel:Set({
            Title = "Player Info",
            Content = ("No exact match. Type at least %d characters to search by prefix."):format(MIN_PARTIAL)
         })
         return
      end

      if #matches == 1 then
         showPlayerInfo(matches[1])
         return
      elseif #matches > 1 then
         
         local list = {}
         for i, p in ipairs(matches) do
            table.insert(list, ("%s (%s)"):format(p.Name, p.DisplayName))
            if i >= 10 then break end 
         end
         InfoLabel:Set({
            Title = "Player Info",
            Content = ("Multiple matches found:\n%s\nType more characters to narrow it down.")
                      :format(table.concat(list, ", "))
         })
         return
      else
         InfoLabel:Set({ Title = "Player Info", Content = "Player not found in the server." })
      end
   end
})

Tab:CreateSection("User IDs")

local Paragraph 


local function buildUserIdList()
    local lines = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        table.insert(lines, string.format("%s (@%s): %d", plr.DisplayName, plr.Name, plr.UserId))
    end
    if #lines == 0 then
        return "No players found."
    end
    return table.concat(lines, "\n")
end


local function setParagraph(text)
    if Paragraph and Paragraph.Set then
        local ok = pcall(function()
            Paragraph:Set({ Title = "Server User IDs", Content = text })
        end)
        if not ok then
            pcall(function()
                Paragraph:Set(text)
            end)
        end
    else
        Paragraph = Tab:CreateParagraph({ Title = "Server User IDs", Content = text })
    end
end


Tab:CreateButton({
    Name = "Get UserIDs (Whole Server)",
    Callback = function()
        local list = buildUserIdList()
        setParagraph(list)
        Rayfield:Notify({
            Title = "User IDs Updated",
            Content = "Listed all current players.",
            Duration = 2,
            image = "bell"
        })
    end
})
Tab:CreateButton({
    Name = "Clear UserIDs",
    Callback = function()
        setParagraph("User ID list cleared.")
        Rayfield:Notify({
            Title = "User IDs Cleared",
            Content = "Paragraph has been reset.",
            Duration = 2,
            Image = "bell"
        })
    end
})
Paragraph = Tab:CreateParagraph({
    Title = "Server User IDs",
    Content = "Press the button to list all players' user IDs."
})

local Section = Tab:CreateSection("Team Checker")

local TeamParagraph


local function buildTeamList()
    local lines = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        local teamName = plr.Team and plr.Team.Name or "No Team"
        table.insert(lines, string.format("%s (@%s) → %s", plr.DisplayName, plr.Name, teamName))
    end
    if #lines == 0 then
        return "No players found."
    end
    return table.concat(lines, "\n")
end


local function setTeamParagraph(text)
    if TeamParagraph and TeamParagraph.Set then
        local ok = pcall(function()
            TeamParagraph:Set({ Title = "Server Teams", Content = text })
        end)
        if not ok then
            pcall(function()
                TeamParagraph:Set(text)
            end)
        end
    else
        TeamParagraph = Tab:CreateParagraph({ Title = "Server Teams", Content = text })
    end
end


Tab:CreateButton({
    Name = "Team Check",
    Callback = function()
        setTeamParagraph(buildTeamList())
        Rayfield:Notify({
            Title = "Teams Updated",
            Content = "Listed all current players and their teams.",
            Duration = 2,
            image = "bell"
        })
    end
})
Tab:CreateButton({
    Name = "Clear Teams",
    Callback = function()
        setTeamParagraph("Team list cleared.")
        Rayfield:Notify({
            Title = "Teams Cleared",
            Content = "Paragraph has been reset.",
            Duration = 2,
            image = "bell"
        })
    end
})
TeamParagraph = Tab:CreateParagraph({
    Title = "Server Teams",
    Content = "Press 'Team Check' to see all players' teams."
})
Tab:CreateSection("Health Monitor")

local HPParagraph 


local function buildHPList()
    local lines = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            local hp = math.floor(plr.Character.Humanoid.Health)
            local maxHp = math.floor(plr.Character.Humanoid.MaxHealth)
            table.insert(lines, string.format("%s → %d/%d HP", plr.DisplayName, hp, maxHp))
        end
    end
    if #lines == 0 then
        return "No players found."
    end
    return table.concat(lines, "\n")
end


local function setHPParagraph(text)
    if HPParagraph and HPParagraph.Set then
        local ok = pcall(function()
            HPParagraph:Set({ Title = "Live Player HP", Content = text })
        end)
        if not ok then
            pcall(function()
                HPParagraph:Set(text)
            end)
        end
    else
        HPParagraph = Tab:CreateParagraph({ Title = "Live Player HP", Content = text })
    end
end


HPParagraph = Tab:CreateParagraph({
    Title = "Live Player HP",
    Content = "Waiting for updates..."
})


local function connectPlayerHumanoid(plr)
    if plr.Character and plr.Character:FindFirstChild("Humanoid") then
        local humanoid = plr.Character.Humanoid
        humanoid.HealthChanged:Connect(function()
            setHPParagraph(buildHPList())
        end)
    end
end


for _, plr in ipairs(Players:GetPlayers()) do
    connectPlayerHumanoid(plr)
end


Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        connectPlayerHumanoid(plr)
    end)
end)


setHPParagraph(buildHPList())

local Tab = Window:CreateTab("Settings", "settings")
local Section = Tab:CreateSection("User Info")

local player = game.Players.LocalPlayer
local username = player.Name
local displayName = player.DisplayName
local userId = player.UserId

Tab:CreateLabel("Username: " .. username)
Tab:CreateLabel("Display Name: " .. displayName)
Tab:CreateLabel("User ID: " .. userId)

local Section = Tab:CreateSection("Roblox Menu Settings")
Tab:CreateButton({
    Name = "Close UI",
    Callback = function()
        Rayfield:Destroy()
    end
})


local textToCopy = "https://discord.gg/BTZKkNjdWd"

Tab:CreateButton({
    Name = "Copy Discord",
    Callback = function()
        if setclipboard then
            setclipboard(textToCopy)
            
            Rayfield:Notify({
                Title = "Notification",
                Content = "discord link has been copied.",
                Duration = 1,
                Image = "bell"
            })
        else
            Rayfield:Notify({
                Title = "Notification",
                Content = "Your executor does not support clipboard.",
                Duration = 2,
                Image = "bell"
            })
        end
    end,
})
Tab:CreateButton({
   Name = "Feedback UI",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xqzua03/feedback/main/feedback.lua"))()
   end
})

Tab:CreateButton({
    Name = "reload Roblox Menu",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xqzua03/Roblox-Menu/main/Roblox-Menu.lua"))()
    end
})

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Roblox Menu",
   Icon = "box", 
   LoadingTitle = "Roblox Menu is Loading..",
   LoadingSubtitle = "by xqzua03",
   ShowText = "Rayfield", 
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
   Duration = 3,
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

-- Sections & info
local Section = Tab:CreateSection(" ")

local Paragraph = Tab:CreateParagraph({Title = "Version: 1.2", Content = "Script Version is 1.2"})

Tab:CreateLabel("Executor: " .. getExecutorName())
Tab:CreateLabel("Game: " .. gameName)

local Section = Tab:CreateSection(" ")

local Paragraph = Tab:CreateParagraph({
    Title = "Information",
    Content = "Your executor might be too bad to run a script, or the script doesn't work!"
})

local Section = Tab:CreateSection("Roblox Menu Settings")

-- Existing buttons
Tab:CreateButton({
   Name = "Close UI Fully",
   Callback = function()
      Rayfield:Destroy()
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
   Name = "Open F9",
   Callback = function()
      pcall(function()
            game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
        end)
   end
})

local Section = Tab:CreateSection("Player Using script.")

-- Get player info
local player = game.Players.LocalPlayer
local username = player.Name
local displayName = player.DisplayName
local userId = player.UserId

-- Create labels to display info
Tab:CreateLabel("Username: " .. username)
Tab:CreateLabel("Display Name: " .. displayName)
Tab:CreateLabel("User ID: " .. userId)


-- ===============================
-- PLAYER INFO TRACKER
-- ===============================
local Section = Tab:CreateSection("Player Info Tracker")

local PlayerInfo = Tab:CreateParagraph({
    Title = "Player Info",
    Content = "Click a player to see their info"
})

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local currentConnection -- health listener
local deathConnection -- death listener
local selectedPlayer -- the player currently tracked

local function ClearInfo()
    PlayerInfo:Set({
        Title = "Player Info",
        Content = "Click a player to see their info"
    })

    if currentConnection then
        currentConnection:Disconnect()
        currentConnection = nil
    end
    if deathConnection then
        deathConnection:Disconnect()
        deathConnection = nil
    end
    selectedPlayer = nil
end

local function ShowPlayerInfo(player)
    selectedPlayer = player
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local team = player.Team and player.Team.Name or "No Team"
    local displayName = player.DisplayName or player.Name
    local userId = player.UserId

    local function updateInfo()
        local newHealth = humanoid and math.floor(humanoid.Health) or "N/A"
        local info = "Username: " .. player.Name ..
                     "\nDisplay Name: " .. displayName ..
                     "\nUserId: " .. tostring(userId) ..
                     "\nHealth: " .. tostring(newHealth) ..
                     "\nTeam: " .. tostring(team)
        PlayerInfo:Set({Title = "Player Info", Content = info})
    end

    updateInfo()

    if currentConnection then currentConnection:Disconnect() end
    if deathConnection then deathConnection:Disconnect() end

    if humanoid then
        currentConnection = humanoid.HealthChanged:Connect(updateInfo)
        deathConnection = humanoid.Died:Connect(function()
            ClearInfo()
        end)
    end

    player.AncestryChanged:Connect(function(_, parent)
        if not parent and player == selectedPlayer then
            ClearInfo()
        end
    end)
end

-- detect player under mouse
local function GetPlayerFromMouse()
    local mouse = Players.LocalPlayer:GetMouse()
    local target = mouse.Target
    if target then
        local character = target:FindFirstAncestorWhichIsA("Model")
        if character then
            return Players:GetPlayerFromCharacter(character)
        end
    end
    return nil
end

-- hook left click
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.UserInputType == Enum.UserInputType.MouseButton1 then
        local player = GetPlayerFromMouse()
        if player and player ~= Players.LocalPlayer then
            ShowPlayerInfo(player)
        end
    end
end)

-- Clear Info Button
Tab:CreateButton({
    Name = "Clear Player Info",
    Callback = function()
        ClearInfo()
    end
})



local Section = Tab:CreateSection("Main Scripts")

Tab:CreateButton({
    Name = "Anti Ban",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SystemSecRoblox/SystemSec/refs/heads/main/main.lua"))()
    end
})

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
   Name = "Fly [Toggle G] [SLOW]",
   Callback = function()
    Rayfield:Notify({
        Title = "Flying is on.",
        Content = "Press G to enable it.",
        Duration = 1,
        Image = "bell",
    })
      loadstring(game:HttpGet('https://pastebin.com/raw/H5A7Y4YJ'))()
   end
})

Tab:CreateButton({
   Name = "Anti-Fling",
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

Tab:CreateButton({
    Name = "Infinite Jumps",
    Callback = function()
        _G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
    end
})

local Tab = Window:CreateTab("Update Log", "list")
local Section = Tab:CreateSection(" ")

local Paragrapgh = Tab:CreateParagraph({Title = "Version: 1.2", Content = "Removed Player clicked information. Added Player using script information, in Home Tab. Removed Label for destroy ui, changed name to Close UI Fully. Removed BackPack viewer, in Other Scripts. Updated the Click on Player Information, you will get user display/ userid. Added a Games Tab. Rename the Fly button on Home Tab to Fly [Toggle G] [SLOW]."})
Tab:CreateLabel("Dev Message: Don't use Fling all and anti fling, together. Then fling all will not work.")
local Section = Tab:CreateSection(" ")

local Paragrapgh = Tab:CreateParagraph({Title = "Version: 1.1", Content = "Added a update log. Balloon button has a print script now. Added Button Test Dummy, in Other Scripts. Added a health viewer, backpack checker Button. Removed Other Scripts Section. Added a Tab called Other Scripts. Added new button in GUI. Added a new button in FE. Removed FE Grab Part button in FE tab. Removed TP Tool in FE Tab. Removed Welcome Paragrapgh in Home Tab. Added a Player information, that shows you there username, and more. Removed Balloon Button."})

local Tab = Window:CreateTab("Player", "folder")

local Section = Tab:CreateSection(" ")

Tab:CreateInput({
    Name = "WalkSpeed",
    PlaceholderText = "Enter a number",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        local speed = tonumber(Text) -- convert text to number
        if speed and speed > 0 then
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = speed
            end
        else
            warn("Invalid speed value entered!")
        end
    end,
})

Tab:CreateInput({
    Name = "JumpPower",
    PlaceholderText = "Enter a number",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
        local power = tonumber(Text)
        if power and power > 0 then
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.UseJumpPower = true -- Make sure JumpPower works
                player.Character.Humanoid.JumpPower = power
            end
        else
            warn("Invalid jump power value entered!")
        end
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


Tab:CreateButton({
    Name = "Reset WalkSpeed",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = 16
        end
    end,
})

Tab:CreateButton({
    Name = "Reset JumpPower",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = 50
        end
    end,
})

Tab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        Rayfield:Notify({
            Title = "Reseted.",
            Content = "Your Character has be reseted.",
            Duration = 0.9,
            Image = "bell",
        })
        local player = game.Players.LocalPlayer
        if player and player.Character then
            player.Character:BreakJoints() 
        end
    end,
})

local Tab = Window:CreateTab("Other Scripts", "asterisk")
local Section = Tab:CreateSection(" ")

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

--// State
local spinSpeed = 25
local spinning = false
local spinThread

--// Helpers
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

        -- Use BodyAngularVelocity to spin
        local bav = Instance.new("BodyAngularVelocity")
        bav.MaxTorque = Vector3.new(0, math.huge, 0)
        bav.AngularVelocity = Vector3.new(0, spinSpeed, 0)
        bav.P = 10000
        bav.Parent = hrp

        while spinning and bav.Parent do
            -- Keep updating in case user changes the speed
            bav.AngularVelocity = Vector3.new(0, spinSpeed, 0)
            task.wait(0.1)
        end

        bav:Destroy()
    end)
end

local function stopSpin()
    spinning = false
end

--// UI: Text input to set speed
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

--// UI: Button to toggle spin
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
    Name = "Test Dummy",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/Mdmaycon/80eb6f9e79fe148860a580419a9abb0f/raw/8527ed883d91cb8e916f44994780c16b8013c0f1/TestDummy.txt"))()
    end
})


local Tab = Window:CreateTab("FE", "eye")

local Section = Tab:CreateSection(" ")

local Paragrapgh = Tab:CreateParagraph({Title = "FE Scripts.", Content = "Fe means Filtering Enabled. All scripts will be tested by owner of Roblox Menu."})

local Section Tab:CreateSection(" ")

Tab:CreateButton({
   Name = "FE Ragdoll Script",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shakk-code/fe-ragdoll-script/refs/heads/main/script.lua', true))()
   end
})

Tab:CreateButton({
   Name = "Egor/Fake Lag",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DROID-cell-sys/ANTI-UTTP-SCRIPTT/refs/heads/main/EGOR%20SCRIPT%20BY%20ANTI-UTTP"))()
   end
})

Tab:CreateButton({
   Name = "Hacker Chat V2",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/a9iK0EH1"))()
   end
})

Tab:CreateButton({
   Name = "Punch NPC",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/shakk-code/fe-punch-script/refs/heads/main/script.lua', true))()
   end
})

Tab:CreateButton({
   Name = "CMD FE Admin",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/main.lua"))()
   end
})

Tab:CreateButton({
   Name = "FE Invisibility",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/vP6CrQJj"))()
   end
})

Tab:CreateButton({
    Name = "Sandevistan FE Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/idbiRMZG"))()
    end
})

local Tab = Window:CreateTab("GUI", "squircle")

local Section = Tab:CreateSection(" ")

Tab:CreateButton({
   Name = "c00lkid V2 FE Trolling",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/14EU4i8n",true))()
   end
})

Tab:CreateButton({
   Name = "Pilots Universal Script GUI",
   Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/U1o71wOq/raw"))()
   end
})

Tab:CreateButton({
   Name = "Cloud Hub FE Script GUI",
   Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/X6fuVyEZ/raw"))()
   end
})

Tab:CreateButton({
   Name = "Youtube Video Player GUI",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Dan41/Roblox-Scripts/refs/heads/main/Youtube%20Play/1%20YoutubePlay.lua', true))()
   end
})

Tab:CreateButton({
   Name = "XVC FE Script GUI",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()
   end
})

Tab:CreateButton({
   Name = "FE Troll Animation GUI",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/alifSTARZ/HERMAN-KONTOL-ANIMATION/refs/heads/main/Animation%20script%20by%20xploit%20force"))()
   end
})

Tab:CreateButton({
   Name = "mericmus42's Aimbot&ESP&More",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mericmus42/scriptss/refs/heads/main/universalaimbot.lua"))()
   end
})

Tab:CreateButton({
   Name = "1x1x1x1 Trolling GUI",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/gd4qQJGu"))()
   end
})

Tab:CreateButton({
    Name = "Free UGC Emote GUI Script",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/1nJD7PkH",true))()
    end
})

local Tab = Window:CreateTab("Games", "gamepad")

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

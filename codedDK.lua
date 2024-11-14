local p = game.Players.LocalPlayer
        local TS = game:GetService("TweenService")
        local RunService = game:GetService("RunService")
        
        local FinalDamage = 75
        local sped = 300
        local candash = true
        local hit = 0
        local Character = p.Character
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local move = Instance.new("BodyVelocity", RootPart)
        move.MaxForce = Vector3.new(math.huge, 0, math.huge)
        
        local hitbox = Instance.new("Part")
        hitbox.CanCollide = false
        hitbox.Anchored = false
        hitbox.Name = "Hitbox"
        hitbox.Material = Enum.Material.ForceField
        hitbox.Size = Vector3.new(15, 15, 10)
        hitbox.CanQuery = false
        hitbox.Transparency = 1
        hitbox.Color = Color3.fromRGB(255, 0, 0)
        hitbox.Massless = true
        hitbox.Parent = workspace
        
        function getRoot(char)
            local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
            return rootPart
        end
        
        local hitlist = {}
        
        local AnimAnim = Instance.new("Animation")
        AnimAnim.AnimationId = "rbxassetid://17354976067"
        local Anim = Humanoid:LoadAnimation(AnimAnim)
        AnimAnim.AnimationId = "rbxassetid://0"
        Anim:Play()
        
        local soundId = 17429233290 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Dropkick_Miss"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 0
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        local soundId = 17356346310 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Dropkick_SFX"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 0
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        Anim:GetMarkerReachedSignal("StartHitbox"):Connect(function()
            
            move.Velocity = sped * RootPart.CFrame.LookVector
            move.Parent = RootPart
            hitbox.CFrame = RootPart.CFrame * CFrame.new(0, 0, -9)
        
            local function onHeartbeat()
                if candash then
                    move.Velocity = sped * RootPart.CFrame.LookVector
                    hitbox.CFrame = RootPart.CFrame * CFrame.new(0, 0, -9)
                end
            end
        
            local heartbeatConnection
            heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
        
            hitbox.Touched:Connect(function(hitPart)
                local hitHumanoid = hitPart.Parent:FindFirstChildOfClass("Humanoid")
                if hitHumanoid and hitPart.Parent ~= Character and hit == 0 then
                    if not hitlist[hitHumanoid] then
                        hitlist[hitHumanoid] = true
                        candash = false
                        hit = 1
        
                        local speaker = p
                        speaker.Character:FindFirstChildOfClass('Humanoid').AutoRotate  = false
                        heartbeatConnection:Disconnect()
                        move:Destroy()
                        hitbox:Destroy()
                        Anim:Stop()
        
                        if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
                            speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
                            task.wait(.1)
                        end
                        getRoot(speaker.Character).CFrame = getRoot(hitPart.Parent).CFrame + Vector3.new(-10,1,0)
        
                        local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                        delay(0, function()
                            BeenASecond = true
                        end)
                        while not BeenASecond do
                            for _, v in ipairs(speaker.Character:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    v.Velocity, v.RotVelocity = V3, V3
                                end
                            end
                            task.wait()
                        end
                        -- Stops the sound
                        sound:stop()
        
                        Humanoid.WalkSpeed = 0
                        
                        local PlayerAnim = Instance.new("Animation")
                        PlayerAnim.AnimationId = "rbxassetid://0"
                        local Player = Humanoid:LoadAnimation(PlayerAnim)
                        PlayerAnim.AnimationId = "rbxassetid://0"
                        Player:Play()

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

localPlayer:SetAttribute("NoShiftlock", true)

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

localPlayer:SetAttribute("NoHeadFollow", true)

local newInstance = Instance.new
local partName = "Part"
local v139_1_ = game.Players.LocalPlayer.Character
local v139_4_ = "HumanoidRootPart"
local v139_2_ = v139_1_:FindFirstChild(v139_4_)
local v0_2_
v0_2_ = game:GetService("ReplicatedStorage")
local v141_6_ = v0_2_

local part = newInstance(partName)
part.Transparency = 1
part.CanCollide = false
part.Massless = true
part.Name = "Cam"
part.Parent = game.Players.LocalPlayer.Character

local motor6D = newInstance("Motor6D")
motor6D.Part0 = v139_2_
motor6D.Part1 = part
motor6D.Parent = part

local a1 = {}
a1.CameraPart = part

local function startCutscene()
    local cutsceneProgress = 0
    local dropkick

    if not dropkick then
        dropkick = require(game.ReplicatedStorage.Cutscenes.Dropkick)
    end

    local camera = workspace.CurrentCamera
    local character = game.Players.LocalPlayer.Character

    if character then
        local folder = newInstance("Folder")
        folder.Name = "NoRotate"
        folder.Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Character:SetAttribute("NoHeadFollow", true)

        local renderStepConnection
        renderStepConnection = game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
            cutsceneProgress = cutsceneProgress + deltaTime * 60
            local stepNumber = math.ceil(cutsceneProgress)
            stepNumber = tonumber(stepNumber)

            if stepNumber >= 922 then
                stepNumber = 2000000000
            end

            local frameData = dropkick[stepNumber]
            if frameData then
                if camera.CameraType ~= Enum.CameraType.Scriptable then
                    camera.CameraType = Enum.CameraType.Scriptable
                end

                if tick() > 0.5 then
                    camera.FieldOfView = frameData.fov
                else
                    camera.FieldOfView = camera.FieldOfView + (frameData.fov - camera.FieldOfView) * 0.25
                end

                local noRotateFolder = game.Players.LocalPlayer.Character:FindFirstChild("NoRotate")

                if noRotateFolder and a1.CameraPart then
                    local cameraLerpFactor = 0.25
                    if tick() > 0.5 then
                        cameraLerpFactor = 0.9
                    end
                    camera.CFrame = camera.CFrame:lerp(a1.CameraPart.CFrame, cameraLerpFactor)
                end
            end

            if not (game.Players.LocalPlayer.Character == game.Players.LocalPlayer.Character) then
                renderStepConnection:Disconnect()
            end
        end)
    end
end

local function checkAnimation()
    local playingTracks = game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()
    local erm = Instance.new("Animation")
    erm.AnimationId = "rbxassetid://17420452843"
local what = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(erm)
     erm.AnimationId = "rbxassetid://0"
    what:Play()
    for _, track in pairs(playingTracks) do
        if track.Animation.AnimationId == "rbxassetid://0" then
            track:Stop()
        end
    end
end

startCutscene()
checkAnimation()

local soundeffect = Instance.new("Sound")
soundeffect.SoundId = "rbxassetid://17363383992"
soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
soundeffect:Play()
soundeffect.Volume = 4
        
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Get the current orientation of the HumanoidRootPart
        local currentCFrame = humanoidRootPart.CFrame
        
        -- Calculate the new orientation to look behind (180-degree rotation on Y axis)
        local newCFrame = currentCFrame * CFrame.Angles(0, math.rad(180), 0)
        
        -- Update the HumanoidRootPart CFrame to the new orientation
        humanoidRootPart.CFrame = newCFrame
        
            local VictimAnim = Instance.new("Animation")
            VictimAnim.AnimationId = "rbxassetid://17363256069"
            local Victim = hitHumanoid:LoadAnimation(VictimAnim)
            VictimAnim.AnimationId = "rbxassetid://0"
            Victim:Play()
            workspace.Dropkick_SFX:Destroy()
            workspace.Dropkick_Miss:Destroy()
            
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("Part") then
                    part.CanCollide = false
                end
            end
            local weakDummy = game.Workspace.Live["Weakest Dummy"]
            local weakDummyHRP = weakDummy:FindFirstChild("HumanoidRootPart")
            
            -- Karakterin pozisyonunu ve rotasyonunu ayarla
            local offset = CFrame.new(0, 0, 10) -- Karakteri sola (negatif x) ve biraz geriye (negatif z) kaydÄ±r
            local rotation = CFrame.Angles(0, math.pi, 0) -- 180 derece dÃ¶ndÃ¼r
            
            -- Karakterin CFrame'ini ayarla
            character:WaitForChild("HumanoidRootPart").CFrame = weakDummyHRP.CFrame * rotation * offset
            character:WaitForChild("HumanoidRootPart").Anchored = true
            character:WaitForChild("Humanoid").AutoRotate = false
        
        
        
                        wait(2)
                        speaker.Character:FindFirstChildOfClass('Humanoid').AutoRotate  = true
                        Humanoid.WalkSpeed = 0
                        candash = true
                        hitlist[hitHumanoid] = nil
                        hit = 0
                    end
                end
            end)
        end)
        
        Anim:GetMarkerReachedSignal("End"):Connect(function()
            move:Destroy()
            candash = false
            hitbox:Destroy()
workspace.Dropkick_SFX:Destroy()
            workspace.Dropkick_Miss:Destroy()
        end)	
local p = game.Players.LocalPlayer
        local TS = game:GetService("TweenService")
        local RunService = game:GetService("RunService")
        
        local FinalDamage = 75
        local sped = 300
        local candash = true
        local hit = 0
        local Character = p.Character
        local Humanoid = Character:WaitForChild("Humanoid")
        local RootPart = Character:WaitForChild("HumanoidRootPart")
        local move = Instance.new("BodyVelocity", RootPart)
        move.MaxForce = Vector3.new(math.huge, 0, math.huge)
        
        local hitbox = Instance.new("Part")
        hitbox.CanCollide = false
        hitbox.Anchored = false
        hitbox.Name = "Hitbox"
        hitbox.Material = Enum.Material.ForceField
        hitbox.Size = Vector3.new(15, 15, 10)
        hitbox.CanQuery = false
        hitbox.Transparency = 1
        hitbox.Color = Color3.fromRGB(255, 0, 0)
        hitbox.Massless = true
        hitbox.Parent = workspace
        
        function getRoot(char)
            local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
            return rootPart
        end
        
        local hitlist = {}
        
        local AnimAnim = Instance.new("Animation")
        AnimAnim.AnimationId = "rbxassetid://17354976067"
        local Anim = Humanoid:LoadAnimation(AnimAnim)
        AnimAnim.AnimationId = "rbxassetid://0"
        Anim:Play()
        
        local soundId = 17429233290 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Dropkick_Miss"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 0
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        local soundId = 17356346310 -- Correct sound ID
        
        -- Create a new Sound instance
        local sound = Instance.new("Sound")
        sound.Name = "Dropkick_SFX"
        sound.SoundId = "rbxassetid://" .. soundId
        sound.Volume = 0
        sound.Pitch = 1.0 -- Pitch set to 1.0
        sound.PlaybackSpeed = 1.0 -- Adjusted playback speed
        
        -- Parent the sound to Workspace
        sound.Parent = workspace
        
        -- Play the sound
        sound:Play()
        
        Anim:GetMarkerReachedSignal("StartHitbox"):Connect(function()
            
            move.Velocity = sped * RootPart.CFrame.LookVector
            move.Parent = RootPart
            hitbox.CFrame = RootPart.CFrame * CFrame.new(0, 0, -9)
        
            local function onHeartbeat()
                if candash then
                    move.Velocity = sped * RootPart.CFrame.LookVector
                    hitbox.CFrame = RootPart.CFrame * CFrame.new(0, 0, -9)
                end
            end
        
            local heartbeatConnection
            heartbeatConnection = RunService.Heartbeat:Connect(onHeartbeat)
        
            hitbox.Touched:Connect(function(hitPart)
                local hitHumanoid = hitPart.Parent:FindFirstChildOfClass("Humanoid")
                if hitHumanoid and hitPart.Parent ~= Character and hit == 0 then
                    if not hitlist[hitHumanoid] then
                        hitlist[hitHumanoid] = true
                        candash = false
                        hit = 1
        
                        local speaker = p
                        speaker.Character:FindFirstChildOfClass('Humanoid').AutoRotate  = false
                        heartbeatConnection:Disconnect()
                        move:Destroy()
                        hitbox:Destroy()
                        Anim:Stop()
        
                        if speaker.Character:FindFirstChildOfClass('Humanoid') and speaker.Character:FindFirstChildOfClass('Humanoid').SeatPart then
                            speaker.Character:FindFirstChildOfClass('Humanoid').Sit = false
                            task.wait(.1)
                        end
                        getRoot(speaker.Character).CFrame = getRoot(hitPart.Parent).CFrame + Vector3.new(-10,1,0)
        
                        local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
                        delay(0, function()
                            BeenASecond = true
                        end)
                        while not BeenASecond do
                            for _, v in ipairs(speaker.Character:GetDescendants()) do
                                if v:IsA("BasePart") then
                                    v.Velocity, v.RotVelocity = V3, V3
                                end
                            end
                            task.wait()
                        end
                        -- Stops the sound
                        sound:stop()
        
                        Humanoid.WalkSpeed = 0
                        
                        local PlayerAnim = Instance.new("Animation")
                        PlayerAnim.AnimationId = "rbxassetid://0"
                        local Player = Humanoid:LoadAnimation(PlayerAnim)
                        PlayerAnim.AnimationId = "rbxassetid://0"
                        Player:Play()

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

localPlayer:SetAttribute("NoShiftlock", true)

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

localPlayer:SetAttribute("NoHeadFollow", true)

local newInstance = Instance.new
local partName = "Part"
local v139_1_ = game.Players.LocalPlayer.Character
local v139_4_ = "HumanoidRootPart"
local v139_2_ = v139_1_:FindFirstChild(v139_4_)
local v0_2_
v0_2_ = game:GetService("ReplicatedStorage")
local v141_6_ = v0_2_

local part = newInstance(partName)
part.Transparency = 1
part.CanCollide = false
part.Massless = true
part.Name = "Cam"
part.Parent = game.Players.LocalPlayer.Character

local motor6D = newInstance("Motor6D")
motor6D.Part0 = v139_2_
motor6D.Part1 = part
motor6D.Parent = part

local a1 = {}
a1.CameraPart = part

local function startCutscene()
    local cutsceneProgress = 0
    local dropkick

    if not dropkick then
        dropkick = require(game.ReplicatedStorage.Cutscenes.Dropkick)
    end

    local camera = workspace.CurrentCamera
    local character = game.Players.LocalPlayer.Character

    if character then
        local folder = newInstance("Folder")
        folder.Name = "NoRotate"
        folder.Parent = game.Players.LocalPlayer.Character
        game.Players.LocalPlayer.Character:SetAttribute("NoHeadFollow", true)

        local renderStepConnection
        renderStepConnection = game:GetService("RunService").RenderStepped:Connect(function(deltaTime)
            cutsceneProgress = cutsceneProgress + deltaTime * 60
            local stepNumber = math.ceil(cutsceneProgress)
            stepNumber = tonumber(stepNumber)

            if stepNumber >= 922 then
                stepNumber = 2000000000
            end

            local frameData = dropkick[stepNumber]
            if frameData then
                if camera.CameraType ~= Enum.CameraType.Scriptable then
                    camera.CameraType = Enum.CameraType.Scriptable
                end

                if tick() > 0.5 then
                    camera.FieldOfView = frameData.fov
                else
                    camera.FieldOfView = camera.FieldOfView + (frameData.fov - camera.FieldOfView) * 0.25
                end

                local noRotateFolder = game.Players.LocalPlayer.Character:FindFirstChild("NoRotate")

                if noRotateFolder and a1.CameraPart then
                    local cameraLerpFactor = 0.25
                    if tick() > 0.5 then
                        cameraLerpFactor = 0.9
                    end
                    camera.CFrame = camera.CFrame:lerp(a1.CameraPart.CFrame, cameraLerpFactor)
                end
            end

            if not (game.Players.LocalPlayer.Character == game.Players.LocalPlayer.Character) then
                renderStepConnection:Disconnect()
            end
        end)
    end
end

local function checkAnimation()
    local playingTracks = game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()
    local erm = Instance.new("Animation")
    erm.AnimationId = "rbxassetid://17420452843"
local what = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(erm)
     erm.AnimationId = "rbxassetid://0"
    what:Play()
    for _, track in pairs(playingTracks) do
        if track.Animation.AnimationId == "rbxassetid://0" then
            track:Stop()
        end
    end
end

startCutscene()
checkAnimation()

local soundeffect = Instance.new("Sound")
soundeffect.SoundId = "rbxassetid://17363383992"
soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
soundeffect:Play()
soundeffect.Volume = 4
        
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Get the current orientation of the HumanoidRootPart
        local currentCFrame = humanoidRootPart.CFrame
        
        -- Calculate the new orientation to look behind (180-degree rotation on Y axis)
        local newCFrame = currentCFrame * CFrame.Angles(0, math.rad(180), 0)
        
        -- Update the HumanoidRootPart CFrame to the new orientation
        humanoidRootPart.CFrame = newCFrame
        
            local VictimAnim = Instance.new("Animation")
            VictimAnim.AnimationId = "rbxassetid://17363256069"
            local Victim = hitHumanoid:LoadAnimation(VictimAnim)
            VictimAnim.AnimationId = "rbxassetid://0"
            Victim:Play()
            workspace.Dropkick_SFX:Destroy()
            workspace.Dropkick_Miss:Destroy()
            
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("Part") then
                    part.CanCollide = false
                end
            end
            local weakDummy = game.Workspace.Live["Weakest Dummy"]
            local weakDummyHRP = weakDummy:FindFirstChild("HumanoidRootPart")
            
            -- Karakterin pozisyonunu ve rotasyonunu ayarla
            local offset = CFrame.new(0, 0, 10) -- Karakteri sola (negatif x) ve biraz geriye (negatif z) kaydÄ±r
            local rotation = CFrame.Angles(0, math.pi, 0) -- 180 derece dÃ¶ndÃ¼r
            
            -- Karakterin CFrame'ini ayarla
            character:WaitForChild("HumanoidRootPart").CFrame = weakDummyHRP.CFrame * rotation * offset
            character:WaitForChild("HumanoidRootPart").Anchored = true
            character:WaitForChild("Humanoid").AutoRotate = false
        
        
        
                        wait(2)
                        speaker.Character:FindFirstChildOfClass('Humanoid').AutoRotate  = true
                        Humanoid.WalkSpeed = 0
                        candash = true
                        hitlist[hitHumanoid] = nil
                        hit = 0
                    end
                end
            end)
        end)
        
        Anim:GetMarkerReachedSignal("End"):Connect(function()
            move:Destroy()
            candash = false
            hitbox:Destroy()
workspace.Dropkick_SFX:Destroy()
            workspace.Dropkick_Miss:Destroy()
        end)	

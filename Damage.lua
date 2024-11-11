local Damage = _G.damagelol -- how much damage it deals

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

task.spawn(function()
local function isLookingAt(target)
    local head = character:WaitForChild("Head")
    local direction = (target.Position - head.Position).unit
    local lookVector = head.CFrame.LookVector
    return (direction:Dot(lookVector) > 0.7)
end
local function updateHealthText(dummyHumanoid)
    local billboardGui = dummyHumanoid.Parent:FindFirstChild("Head"):FindFirstChild("BillboardGui")
    if billboardGui then
        local textLabel = billboardGui:FindFirstChild("TextLabel")
        if textLabel then
            local currentHealth = dummyHumanoid.Health
            local maxHealth = dummyHumanoid.MaxHealth
            local healthPercentage = math.floor((currentHealth / maxHealth) * 100)
            textLabel.Text = healthPercentage .. "%"

            -- Change color to red
            textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            wait(1)
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            if currentHealth == 0 then
                dummyHumanoid.Health = maxHealth
                textLabel.Text = "100%"
            end
        end
    end
end
local function checkForNearbyCharacters()
    for _, targetCharacter in pairs(workspace.Live:GetChildren()) do
        if targetCharacter:IsA("Model") and targetCharacter:FindFirstChild("Humanoid") then
            local targetHumanoid = targetCharacter:FindFirstChild("Humanoid")
            local distance = (targetCharacter.HumanoidRootPart.Position - character.HumanoidRootPart.Position).magnitude
            if distance <= 6 and isLookingAt(targetCharacter.HumanoidRootPart) then
                targetHumanoid.Health = math.max(0, targetHumanoid.Health - Damage)
                if targetHumanoid.Health == 0 then
                     targetHumanoid.Health = targetHumanoid.MaxHealth
                end
                if targetCharacter.Name == "Weakest Dummy" then
                    updateHealthText(targetHumanoid)
                end
                return
            end
        end
    end
end
checkForNearbyCharacters()
end)

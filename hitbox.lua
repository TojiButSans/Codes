local function effect()
    spawn(function()
    wait(0.1)
        local v3 = Game:GetService("TweenService")
        local v874 = {
            FollowUpKick = {
                Length = 0.383, 
                CF = {
                    {
                        Time = 0.05, 
                        Value = CFrame.new(-0.4329986572265625, -0.7049999237060547, -0.173004150390625) * CFrame.Angles(-2.931734264329995, 0.7261442352922407, -0.56327010949613)
                    }, 
                    {
                        Time = 0.05, 
                        Value = CFrame.new(-0.4329986572265625, -0.7049999237060547, -0.173004150390625) * CFrame.Angles(-2.931734264329995, 0.7261442352922407, -0.56327010949613)
                    }, 
                    {
                        Time = 0.30, 
                        Value = CFrame.new(-0.4329986572265625, -0.7049999237060547, -0.173004150390625) * CFrame.Angles(0.37625808014493756, -0.8867843396457988, -2.6789756820561763)
                    }, 
                    {
                        Time = 0.380, 
                        Value = CFrame.new(-0.4329986572265625, -0.7049999237060547, -0.173004150390625) * CFrame.Angles(-2.5432239728360573, 1.085315542060154, -0.6489657757690516)
                    }
                }, 
                Transparency = {
                    {
                        Time = 0, 
                        Value = 1
                    }, 
                    {
                        Time = 0.25, 
                        Value = 0.5
                    }, 
                    {
                        Time = 0.383, 
                        Value = 1
                    }
                }
            }
        };
        local function v890(v875, v876, v877, v878)
            local v879 = v877 or 1;
            local v880 = v874[v876];
            local v881 = v878:Clone();
            v881.Parent = workspace.Thrown;
            v881:WaitForChild("Weld").Part0 = v875:WaitForChild("HumanoidRootPart");
            v881.Decal.Transparency = 1;
            v881.Weld.C0 = v880.CF[1].Value;
            for v882, v883 in pairs(v880.CF) do
                local v884 = v883.Time - (v880.CF[v882 - 1] and v880.CF[v882 - 1].Time or 0);
                local v885 = v880.CF[v882 - 1] and v880.CF[v882 - 1].Time or 0;
                task.delay(v885 / v879, function()
                    v3:Create(v881.Weld, TweenInfo.new(v884 / v879, Enum.EasingStyle.Linear), {
                        C0 = v883.Value
                    }):Play();
                end);
            end;
            for v886, v887 in pairs(v880.Transparency) do
                local v888 = v887.Time - (v880.Transparency[v886 - 1] and v880.Transparency[v886 - 1].Time or 0);
                local v889 = v880.Transparency[v886 - 1] and v880.Transparency[v886 - 1].Time or 0;
                task.delay(v889 / v879, function()
                    v3:Create(v881.Decal, TweenInfo.new(v888 / v879, Enum.EasingStyle.Linear), {
                        Transparency = v887.Value
                    }):Play();
                end);
            end;
            task.delay(v880.Length / v879, function()
                v881:Destroy();
            end);
        end;
        local function v873(v854, v855, v856)
            local v857 = {};
            for _, v859 in pairs(v854:GetChildren()) do
                v857[v859.Name] = v859;
            end;
            local v864 = setmetatable({}, {
                __index = function(_, v861)
                    return {
                        Clone = function(_)
                            local v863 = rawget(v857, v861):Clone();
                            if not table.find(v855, v863) then
                                table.insert(v855, v863);
                            end;
                            return v863;
                        end
                    };
                end
            });
            local v865 = {
                _maid = {}
            };
            v865._maid.give = function(_, v867)
                if not table.find(v855, v867) then
                    table.insert(v855, v867);
                end;
                return v867;
            end;
            v865._maid.giveTask = function(_, v869)
                if not table.find(v855, v869) then
                    table.insert(v855, v869);
                end;
                return v869;
            end;
            local function v872()
                if v864 and v865 then
                    table.clear(v864);
                    table.clear(v865);
                end;
                if v857 then
                    table.clear(v857);
                    v857 = nil;
                end;
                v865 = nil;
                v864 = nil;
                if v855 then
                    for v870, v871 in pairs(v855) do
                        if typeof(v871) == "RBXScriptConnection" then
                            v871:Disconnect();
                        elseif typeof(v871) == "Instance" then
                            v871:Destroy();
                        end;
                        v855[v870] = nil;
                    end;
                    table.clear(v855);
                end;
                v855 = nil;
            end;
            task.delay(v856 or 10, v872);
            return v864, v865, v872;
        end;
        local l_Character_12 = game.Players.LocalPlayer.Character;
        local _ = l_Character_12.PrimaryPart;
        local v1627 = {};
        local v1628, _ = v873(game.ReplicatedStorage.Resources.KJEffects, v1627, 5);
        local v1630 = v1628.FollowUpCresc:Clone();
        v890(l_Character_12, "FollowUpKick", 1, v1630);
    end)
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local hitbox = Instance.new("Part")
hitbox.Size = Vector3.new(3, 3, 3)
hitbox.Position = humanoidRootPart.Position + humanoidRootPart.CFrame.LookVector * 5  -- Position in front of the player
hitbox.Anchored = true
hitbox.CanCollide = false
hitbox.Transparency = 1
hitbox.Color = Color3.fromRGB(255, 0, 0)
hitbox.Parent = workspace
game.Debris:AddItem(hitbox, 0.1)

hitbox.Touched:Connect(function(hit)
  if hit.Parent.Name ~= player.Name and hit.Parent:FindFirstChild("Humanoid") then
      local anim = Instance.new("Animation")
      local anim2 = Instance.new("Animation")
      anim2.AnimationId = "rbxassetid://16944345619"
      anim.AnimationId = "rbxassetid://10471478869"
      local playAnim2 = character.Humanoid:LoadAnimation(anim2)
      local playAnim = hit.Parent:FindFirstChild("Humanoid"):LoadAnimation(anim)
      playAnim:Play()
      playAnim2:Play()
      local sound = Instance.new("Sound")
      sound.SoundId = "rbxassetid://16944654157"
      sound.Volume = 1
      sound.Parent = character.HumanoidRootPart
      effect()
    end
end)

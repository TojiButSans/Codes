local TweenService = game:GetService("TweenService")
    local function v793(v780, v781, v782, v783)
        local v784 = v782 or 1;
        local v785 = v779[v781];
        local v786 = v783:Clone();
        v786.Parent = workspace.Thrown;
        v786:WaitForChild("Weld").Part0 = v780:WaitForChild("HumanoidRootPart");
        v786.Decal.Transparency = 0;
        v786.Weld.C0 = v785.CF[1].Value;
        for v787, v788 in pairs(v785.CF) do
            local v789 = v788.Time - (v785.CF[v787 - 1] and v785.CF[v787 - 1].Time or 0);
            task.delay((v785.CF[v787 - 1] and v785.CF[v787 - 1].Time or 0) / v784, function()
                TweenService:Create(v786.Weld, TweenInfo.new(v789 / v784, Enum.EasingStyle.Sine), {
                    C0 = v788.Value
                }):Play();
            end);
        end;
        for v790, v791 in pairs(v785.Transparency) do
            local v792 = v791.Time - (v785.Transparency[v790 - 1] and v785.Transparency[v790 - 1].Time or 0);
            task.delay((v785.Transparency[v790 - 1] and v785.Transparency[v790 - 1].Time or 0) / v784, function()
                TweenService:Create(v786.Decal, TweenInfo.new(v792 / v784, Enum.EasingStyle.Quad), {
                    Transparency = v791.Value
                }):Play();
            end);
        end;
        task.delay(v785.Length / v784, function()
            v786:Destroy();
        end);
    end;
    local function v778(v759, v760, v761)
        local v762 = {};
        for _, v764 in pairs(v759:GetChildren()) do
            v762[v764.Name] = v764;
        end;
        local v769 = setmetatable({}, {
            __index = function(_, v766)
                return {
                    Clone = function(_)
                        local v768 = rawget(v762, v766):Clone();
                        if not table.find(v760, v768) then
                            table.insert(v760, v768);
                        end;
                        return v768;
                    end
                };
            end
        });
        local v770 = {
            _maid = {}
        };
        v770._maid.give = function(_, v772)
            if not table.find(v760, v772) then
                table.insert(v760, v772);
            end;
            return v772;
        end;
        v770._maid.giveTask = function(_, v774)
            if not table.find(v760, v774) then
                table.insert(v760, v774);
            end;
            return v774;
        end;
        local function v777()
            if v769 and v770 then
                table.clear(v769);
                table.clear(v770);
            end;
            if v762 then
                table.clear(v762);
                v762 = nil;
            end;
            v770 = nil;
            v769 = nil;
            if v760 then
                for v775, v776 in pairs(v760) do
                    if typeof(v776) == "RBXScriptConnection" then
                        v776:Disconnect();
                    elseif typeof(v776) == "Instance" then
                        v776:Destroy();
                    end;
                    v760[v775] = nil;
                end;
                table.clear(v760);
            end;
            v760 = nil;
        end;
        task.delay(v761 or 10, v777);
        return v769, v770, v777;
    end;
    spawn(function()
        local l_Character_11 = game.Players.LocalPlayer.Character;
        local _ = l_Character_11.PrimaryPart;
        local v1405 = {};
        local v1406, _ = v778(game.ReplicatedStorage.Resources.KJEffects, v1405, 5);
            local v1411 = v1406.SweepCresc:Clone();
            v1411.CFrame = (l_Character_11.HumanoidRootPart.CFrame * CFrame.new(0, -2.632, 0)) * CFrame.Angles(0, 0.6981317007977318, 3.141592653589793);
            v1411.Parent = workspace.Thrown;
            TweenService:Create(v1411.Decal, TweenInfo.new(0.133, Enum.EasingStyle.Sine), {
                Transparency = 0.5
            }):Play();
            task.delay(0.133, function()
                TweenService:Create(v1411.Decal, TweenInfo.new(0.217, Enum.EasingStyle.Sine), {
                    Transparency = 1
                }):Play();
            end);
            TweenService:Create(v1411, TweenInfo.new(0.183, Enum.EasingStyle.Sine), {
                CFrame = (l_Character_11.HumanoidRootPart.CFrame * CFrame.new(0, -2.632, 0)) * CFrame.Angles(0, 2.6179938779914944, 3.141592653589793)
            }):Play();
            task.delay(0.35, function()
                TweenService:Create(v1411, TweenInfo.new(0.167, Enum.EasingStyle.Sine), {
                    CFrame = (l_Character_11.HumanoidRootPart.CFrame * CFrame.new(0, -2.632, 0)) * CFrame.Angles(0, 4.886921905584122, 3.141592653589793)
                }):Play();
            end);
            task.delay(0.033, function()
                local v1412 = v1406.particlespinner:Clone();
                v1412.CFrame = (l_Character_11.HumanoidRootPart.CFrame * CFrame.new(0, -3, 0)) * CFrame.Angles(0, 0.1484577061746377, 0);
                v1412.Parent = workspace.Thrown;
                v1412.Attachment.ParticleEmitter.Enabled = true;
                v1412.Attachment.rocks.Enabled = true;
                TweenService:Create(v1412, TweenInfo.new(0.167, Enum.EasingStyle.Sine), {
                    CFrame = (l_Character_11.HumanoidRootPart.CFrame * CFrame.new(0, -2.632, 0)) * CFrame.Angles(0, 2.9670597283903604, 0)
                }):Play();
                task.delay(0.167, function()
                    v1412.Attachment.ParticleEmitter.Enabled = false;
                    v1412.Attachment.rocks.Enabled = false;
                    game:GetService("Debris"):AddItem(v1412, 9);
                end);
            end);
    end)
end)



wait(0.4)
local soundeffect = Instance.new("Sound")
soundeffect.SoundId = "rbxassetid://16944654157"
soundeffect.Parent = game.Players.LocalPlayer.Character.Torso
soundeffect:Play()
soundeffect.Volume = 2

local p = game.Players.LocalPlayer
local Humanoid = p.Character:WaitForChild("Humanoid")

local AnimAnim = Instance.new("Animation")
AnimAnim.AnimationId = "rbxassetid://16944345619"
local Anim = Humanoid:LoadAnimation(AnimAnim)
AnimAnim.AnimationId = "rbxassetid://0"
Anim:Play()

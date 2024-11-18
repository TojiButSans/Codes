local replacementAnimationIds = {
  [18715842262] = "rbxassetid://" -- move 1
  [18715831781] = "rbxassetid://" -- move 2
  [18715845645] = "rbxassetid://" -- move 3
  [18715837899] = "rbxassetid://" -- move 4
  [12447707844] = "rbxassetid://" -- ult anim
  [18715884857] = "rbxassetid://" -- ult move 1
  [18715898844] = "rbxassetid://" -- ult move 2
  [18715891164] = "rbxassetid://" -- ult move 3
  [18535943546] = "rbxassetid://" -- downslam
  [18535946209] = "rbxassetid://" -- uppercut
  [18715858574] = "rbxassetid://" -- dash
  -- WARNING!!!!: Do not Use KJ Animations For The Template Because This Template is playing The Animation FE But If Any KJ Animation Plays On FE You Might Be Get Banned From Tsb
}

for i, v in pairs(replacementAnimationIds) do
  local player = game.Players.LocalPlayer
  local character = player.Character or player.CharacterAdded:Wait()
  local humanoid = character:WaitForChild("Humanoid")

  local anim = Instance.new("Animation")
  anim.AnimationId = v
  local playAnim = humanoid:LoadAnimation(anim)
  local function onAnimationPlayed(animationTrack)
    if animationTrack.Animation.AnimationId == "rbxassetid://" .. i then
      local p = game.Players.LocalPlayer
      local Humanoid = p.Character:WaitForChild("Humanoid")
      for _, animTrack in pairs(Humanoid:GetPlayingAnimationTracks()) do
        animTrack:Stop()
        playAnim:Play()
      end
    end
  end
humanoid.AnimationPlayed:Connect(onAnimationPlayed)
end

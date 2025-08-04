-- HitboxExpander.lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Expanded = false

local function ExpandHitbox(character)
    if character then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        local head = character:FindFirstChild("Head")
        local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")

        if hrp then hrp.Size = Vector3.new(10, 10, 10) end
        if head then head.Size = Vector3.new(10, 10, 10) end
        if torso then torso.Size = Vector3.new(10, 10, 10) end
    end
end

local function ResetHitbox(character)
    if character then
        local hrp = character:FindFirstChild("HumanoidRootPart")
        local head = character:FindFirstChild("Head")
        local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")

        if hrp then hrp.Size = Vector3.new(2, 2, 1) end
        if head then head.Size = Vector3.new(2, 1, 1) end
        if torso then torso.Size = Vector3.new(2, 2, 1) end
    end
end

local function ToggleHitbox()
    Expanded = not Expanded
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character then
            if Expanded then
                ExpandHitbox(player.Character)
            else
                ResetHitbox(player.Character)
            end
        end
    end
end

-- Connect to UI toggle button here (you can add one in UIManager and call this)
-- For demo purposes, toggle on script load
ToggleHitbox()

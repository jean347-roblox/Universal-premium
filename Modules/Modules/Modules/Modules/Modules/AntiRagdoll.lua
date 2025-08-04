-- AntiRagdoll.lua
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local function AntiRagdoll()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.PlatformStand then
            humanoid.PlatformStand = false
        end
        local root = character:FindFirstChild("HumanoidRootPart")
        if root and root.Anchored then
            root.Anchored = false
        end
    end
end

RunService.Heartbeat:Connect(AntiRagdoll)

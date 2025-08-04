-- ClickTP.lua
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local teleportDistance = 5
local tweenTime = 0.3

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if HumanoidRootPart then
            local direction = HumanoidRootPart.CFrame.LookVector * teleportDistance
            local targetPos = HumanoidRootPart.Position + direction
            local tween = TweenService:Create(HumanoidRootPart, TweenInfo.new(tweenTime), {CFrame = CFrame.new(targetPos)})
            tween:Play()
        end
    end
end)

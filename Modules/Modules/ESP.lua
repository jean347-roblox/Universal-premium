-- ESP.lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local UI = game:GetService("CoreGui"):WaitForChild("JeanWareUI")

local ESPEnabled = false
local Boxes = {}

local function CreateBox(player)
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "JeanWareESPBox"
    box.Adornee = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Size = Vector3.new(4, 6, 1)
    box.Transparency = 0.5
    box.Color3 = Color3.fromRGB(0, 150, 255)
    box.Parent = UI
    return box
end

local function UpdateBoxes()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            if Boxes[player.Name] == nil then
                Boxes[player.Name] = CreateBox(player)
            else
                Boxes[player.Name].Adornee = player.Character.HumanoidRootPart
            end
        elseif Boxes[player.Name] then
            Boxes[player.Name]:Destroy()
            Boxes[player.Name] = nil
        end
    end
end

local function ToggleESP()
    ESPEnabled = not ESPEnabled
    if not ESPEnabled then
        for _, box in pairs(Boxes) do
            box:Destroy()
        end
        Boxes = {}
    end
end

-- Connect toggle button from UIManager if available
local UIManager = require(script.Parent:WaitForChild("UIManager"))
UIManager.ESPToggle.MouseButton1Click:Connect(ToggleESP)

RunService.Heartbeat:Connect(function()
    if ESPEnabled then
        UpdateBoxes()
    end
end)

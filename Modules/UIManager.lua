-- UIManager.lua
-- Handles the GUI and toggles for JeanWare

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local UI = Instance.new("ScreenGui")
UI.Name = "JeanWareUI"
UI.ResetOnSpawn = false
UI.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0, 20, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.Visible = false
MainFrame.Parent = UI
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0, 0.5)

-- Toggle button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Position = UDim2.new(0, 20, 0.5, -20)
ToggleBtn.Text = "☰"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 26
ToggleBtn.Parent = UI
ToggleBtn.AnchorPoint = Vector2.new(0, 0.5)
ToggleBtn.ZIndex = 10

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Title Label
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "JeanWare | Universal Premium"
Title.TextColor3 = Color3.fromRGB(0, 150, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = MainFrame

-- Container for tabs or buttons (simplified for now)
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 1, -60)
Content.Position = UDim2.new(0, 10, 0, 50)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Example button placeholder to enable ESP toggle later
local ESPToggle = Instance.new("TextButton")
ESPToggle.Size = UDim2.new(1, 0, 0, 30)
ESPToggle.Position = UDim2.new(0, 0, 0, 0)
ESPToggle.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
ESPToggle.TextColor3 = Color3.new(1,1,1)
ESPToggle.Font = Enum.Font.GothamBold
ESPToggle.TextSize = 16
ESPToggle.Text = "Toggle ESP"
ESPToggle.Parent = Content

return {
    UI = UI,
    ToggleBtn = ToggleBtn,
    MainFrame = MainFrame,
    ESPToggle = ESPToggle,
}

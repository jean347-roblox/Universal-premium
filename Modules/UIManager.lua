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
MainFrame.Position = UDim2.new(0, 20, 0, 100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.Visible = false
MainFrame.Parent = UI
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0, 0)

-- Toggle button
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 40, 0, 40)
ToggleBtn.Position = UDim2.new(0, 20, 0, 20)
ToggleBtn.Text = "☰"
ToggleBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
ToggleBtn.TextColor3 = Color3.new(1, 1, 1)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 26
ToggleBtn.Parent = UI
ToggleBtn.AnchorPoint = Vector2.new(0, 0)
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

-- Container for tab buttons
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -20, 1, -60)
Content.Position = UDim2.new(0, 10, 0, 50)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Auto-generate feature toggles
local features = {
	{ Name = "ESP" },
	{ Name = "HitboxExpander" },
	{ Name = "SafeNoclip" },
	{ Name = "ClickTP" },
	{ Name = "AntiRagdoll" }
}

for i, feature in ipairs(features) do
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1, 0, 0, 30)
	Button.Position = UDim2.new(0, 0, 0, (i - 1) * 35)
	Button.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
	Button.TextColor3 = Color3.new(1, 1, 1)
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 16
	Button.Text = "Toggle " .. feature.Name
	Button.Parent = Content
end

return {
	UI = UI,
	ToggleBtn = ToggleBtn,
	MainFrame = MainFrame,
}

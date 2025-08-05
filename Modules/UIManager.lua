-- UIManager.lua (Fixed Mobile-Friendly Version)
warn("✅ JeanWare UIManager.lua loaded")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Make sure CoreGui is writable
local success, UI = pcall(function()
    local ui = Instance.new("ScreenGui")
    ui.Name = "JeanWareUI"
    ui.ResetOnSpawn = false
    ui.IgnoreGuiInset = true
    ui.Parent = game:GetService("CoreGui")
    return ui
end)

if not success then
    warn("❌ Failed to create GUI")
    return
end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 400)
MainFrame.Position = UDim2.new(0, 20, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.Visible = false
MainFrame.Parent = UI
MainFrame.ClipsDescendants = true
MainFrame.AnchorPoint = Vector2.new(0, 0.5)

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

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "JeanWare | Universal Premium"
Title.TextColor3 = Color3.fromRGB(0, 150, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = MainFrame

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -20, 1, -60)
Content.Position = UDim2.new(0, 10, 0, 50)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

-- Example button to confirm the GUI works
local TestButton = Instance.new("TextButton")
TestButton.Size = UDim2.new(1, 0, 0, 30)
TestButton.Position = UDim2.new(0, 0, 0, 0)
TestButton.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
TestButton.TextColor3 = Color3.new(1,1,1)
TestButton.Font = Enum.Font.GothamBold
TestButton.TextSize = 16
TestButton.Text = "✅ GUI Loaded Properly"
TestButton.Parent = Content

return {
    UI = UI,
    ToggleBtn = ToggleBtn,
    MainFrame = MainFrame,
    Content = Content,
}

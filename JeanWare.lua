-- ✅ JeanWare: Universal Premium | Made for Jean 🧠
if not game:IsLoaded() then game.Loaded:Wait() end

local msg = Instance.new("Message", workspace)
msg.Text = "✅ Universal Premium Loaded | Made for: Jean 🧠 | Theme: Default | Status: Active"
task.wait(3)
msg:Destroy()

-- Load UI Manager first
loadstring(game:HttpGet("https://raw.githubusercontent.com/jean347-roblox/Universal-premium/main/Modules/UIManager.lua"))()

-- Load features in sequence
local modules = {
    "ESP",
    "HitboxExpander",
    "SafeNoclip",
    "ClickTP",
    "AntiRagdoll",
}

for _, module in ipairs(modules) do
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/jean347-roblox/Universal-premium/main/Modules/" .. module .. ".lua"))()
    end)
end

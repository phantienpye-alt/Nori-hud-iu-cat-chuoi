-- =========================
-- NORI HUB MAX FIXED
-- =========================

if not game:IsLoaded() then game.Loaded:Wait() end
local player = game.Players.LocalPlayer

-- =================
-- 💾 SAVE SYSTEM
-- =================
getgenv().NoriData = getgenv().NoriData or {
    Key = nil,
    Speed = 16,
    Jump = 50,
    Lang = "VI"
}

local Data = getgenv().NoriData

-- =================
-- 🔑 KEY SYSTEM (FIX KHÔNG BỊ KẸT)
-- =================
local CorrectKey = "NORI-PTHOB-CLHB-C1FW-EEN47-OT5KQ"

if Data.Key ~= CorrectKey then
    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.Name = "NoriKeyUI"

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0,320,0,200)
    frame.Position = UDim2.new(0.5,-160,0.5,-100)
    frame.BackgroundColor3 = Color3.fromRGB(10,10,10)

    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(0.8,0,0,40)
    box.Position = UDim2.new(0.1,0,0.35,0)
    box.PlaceholderText = "Enter Key..."

    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.5,0,0,40)
    btn.Position = UDim2.new(0.25,0,0.7,0)
    btn.Text = "CHECK"

    local done = false

    btn.MouseButton1Click:Connect(function()
        if box.Text == CorrectKey then
            Data.Key = CorrectKey
            done = true
            gui:Destroy()
        else
            warn("Sai key!")
        end
    end)

    -- 🔥 chống kẹt
    task.spawn(function()
        task.wait(20)
        if not done then
            warn("Key timeout -> vẫn cho vào")
            done = true
            if gui then gui:Destroy() end
        end
    end)

    repeat task.wait() until done
end

print("✅ Qua key, đang load UI...")

-- =================
-- 🌐 LANGUAGE
-- =================
local Texts = {
    VI = {Main="Chính",Player="Người chơi",Speed="Tốc độ",Jump="Nhảy"},
    EN = {Main="Main",Player="Player",Speed="Speed",Jump="Jump"}
}
local function T(k) return Texts[Data.Lang][k] end

-- =================
-- 🎨 LOAD UI
-- =================
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "NORI HUB MAX 🔷",
    LoadingTitle = "NORI HUB",
    LoadingSubtitle = "Fixed Edition",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NoriHub",
        FileName = "SaveData"
    }
})

-- MAIN
local Main = Window:CreateTab(T("Main"), 4483362458)

Main:CreateButton({
    Name = "Reset",
    Callback = function()
        player.Character:BreakJoints()
    end
})

-- PLAYER
local PlayerTab = Window:CreateTab(T("Player"), 4483362458)

PlayerTab:CreateSlider({
    Name = T("Speed"),
    Range = {16,200},
    CurrentValue = Data.Speed,
    Callback = function(v)
        Data.Speed = v
        player.Character.Humanoid.WalkSpeed = v
    end
})

PlayerTab:CreateSlider({
    Name = T("Jump"),
    Range = {50,200},
    CurrentValue = Data.Jump,
    Callback = function(v)
        Data.Jump = v
        player.Character.Humanoid.JumpPower = v
    end
})

-- =================
-- 📱 MOBILE BUTTON (FIX UI KHÔNG HIỆN)
-- =================
task.wait(1)

local ui = game.CoreGui:FindFirstChild("Rayfield")
if ui then
    ui.Enabled = true
end

local ToggleGui = Instance.new("ScreenGui", game.CoreGui)

local Btn = Instance.new("TextButton", ToggleGui)
Btn.Size = UDim2.new(0,120,0,40)
Btn.Position = UDim2.new(0,20,0.5,0)
Btn.BackgroundColor3 = Color3.fromRGB(0,90,180)
Btn.Text = "NORI HUB"
Btn.TextScaled = true
Btn.Draggable = true

local visible = true

Btn.MouseButton1Click:Connect(function()
    visible = not visible
    local ui = game.CoreGui:FindFirstChild("Rayfield")

    if ui then
        ui.Enabled = visible
    end
end)

print("🚀 NORI HUB FIXED LOADED")

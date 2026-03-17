-- =========================
-- NORI HUB MAX VERSION
-- =========================

if not game:IsLoaded() then game.Loaded:Wait() end
local player = game.Players.LocalPlayer

-- =================
-- 💾 SAVE SYSTEM
-- =================
local Settings = {
    Key = nil,
    Speed = 16,
    Jump = 50,
    Lang = "VI"
}

-- =================
-- 🔑 KEY SYSTEM
-- =================
local CorrectKey = "NORI-PTHOB-CLHB-C1FW-EEN47-OT5KQ"

if Settings.Key == CorrectKey then
    print("Đã lưu key")
else
    local gui = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0,320,0,200)
    frame.Position = UDim2.new(0.5,-160,0.5,-100)
    frame.BackgroundColor3 = Color3.fromRGB(10,10,10)

    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(0.8,0,0,40)
    box.Position = UDim2.new(0.1,0,0.4,0)
    box.PlaceholderText = "Enter Key..."

    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(0.5,0,0,40)
    btn.Position = UDim2.new(0.25,0,0.7,0)
    btn.Text = "CHECK"

    local done = false

    btn.MouseButton1Click:Connect(function()
        if box.Text == CorrectKey then
            Settings.Key = CorrectKey
            done = true
            gui:Destroy()
        else
            player:Kick("Sai key!")
        end
    end)

    repeat task.wait() until done
end

-- =================
-- 🌐 LANGUAGE
-- =================
local Texts = {
    VI = {Main="Chính",Player="Người chơi",Speed="Tốc độ",Jump="Nhảy"},
    EN = {Main="Main",Player="Player",Speed="Speed",Jump="Jump"}
}
local function T(k) return Texts[Settings.Lang][k] end

-- =================
-- 🎨 UI
-- =================
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "NORI HUB MAX 🔷",
    LoadingTitle = "NORI HUB",
    LoadingSubtitle = "Max Edition",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NoriHub",
        FileName = "SaveData"
    }
})

-- MAIN
local Main = Window:CreateTab(T("Main"), 4483362458)

-- PLAYER
local PlayerTab = Window:CreateTab(T("Player"), 4483362458)

PlayerTab:CreateSlider({
    Name = T("Speed"),
    Range = {16,200},
    CurrentValue = Settings.Speed,
    Callback = function(v)
        Settings.Speed = v
        player.Character.Humanoid.WalkSpeed = v
    end
})

PlayerTab:CreateSlider({
    Name = T("Jump"),
    Range = {50,200},
    CurrentValue = Settings.Jump,
    Callback = function(v)
        Settings.Jump = v
        player.Character.Humanoid.JumpPower = v
    end
})

-- =================
-- 📱 MOBILE BUTTON + ANIMATION
-- =================
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
        ui.Enabled = true

        for _,v in pairs(ui:GetDescendants()) do
            if v:IsA("Frame") then
                -- hiệu ứng fade
                for i = 0,1,0.1 do
                    v.BackgroundTransparency = visible and (1-i) or i
                    task.wait()
                end
            end
        end

        ui.Enabled = visible
    end
end)

print("NORI HUB MAX LOADED")

-- =========================
-- NORI HUB DELTA FULL
-- =========================

repeat task.wait() until game:IsLoaded()
local player = game.Players.LocalPlayer

-- 🔑 KEY
local CorrectKey = "NORI-PTHOB-CLHB-C1FW-EEN47-OT5KQ"

-- =================
-- KEY UI
-- =================
local keyGui = Instance.new("ScreenGui", game.CoreGui)

local keyFrame = Instance.new("Frame", keyGui)
keyFrame.Size = UDim2.new(0,320,0,200)
keyFrame.Position = UDim2.new(0.5,-160,0.5,-100)
keyFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0.8,0,0,40)
keyBox.Position = UDim2.new(0.1,0,0.3,0)
keyBox.PlaceholderText = "Enter Key..."

local keyBtn = Instance.new("TextButton", keyFrame)
keyBtn.Size = UDim2.new(0.5,0,0,40)
keyBtn.Position = UDim2.new(0.25,0,0.7,0)
keyBtn.Text = "CHECK"

-- =================
-- MAIN UI FUNCTION
-- =================
local function loadMain()

    keyGui:Destroy()

    local gui = Instance.new("ScreenGui", game.CoreGui)

    -- MAIN FRAME
    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(0,360,0,280)
    frame.Position = UDim2.new(0.5,-180,0.5,-140)
    frame.BackgroundColor3 = Color3.fromRGB(0,70,140)

    -- TITLE
    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1,0,0,50)
    title.Text = "NORI HUB 🔷"
    title.TextScaled = true
    title.BackgroundTransparency = 1

    -- BUTTON AUTO FARM (giả lập)
    local autoFarm = Instance.new("TextButton", frame)
    autoFarm.Size = UDim2.new(0.8,0,0,40)
    autoFarm.Position = UDim2.new(0.1,0,0.3,0)
    autoFarm.Text = "Auto Farm"

    autoFarm.MouseButton1Click:Connect(function()
        print("Auto Farm ON (demo)")
    end)

    -- AUTO QUEST
    local autoQuest = Instance.new("TextButton", frame)
    autoQuest.Size = UDim2.new(0.8,0,0,40)
    autoQuest.Position = UDim2.new(0.1,0,0.5,0)
    autoQuest.Text = "Auto Quest"

    autoQuest.MouseButton1Click:Connect(function()
        print("Auto Quest ON (demo)")
    end)

    -- AUTO BOSS
    local autoBoss = Instance.new("TextButton", frame)
    autoBoss.Size = UDim2.new(0.8,0,0,40)
    autoBoss.Position = UDim2.new(0.1,0,0.7,0)
    autoBoss.Text = "Auto Boss"

    autoBoss.MouseButton1Click:Connect(function()
        print("Auto Boss ON (demo)")
    end)

    -- PLAYER BOOST
    local speed = Instance.new("TextButton", frame)
    speed.Size = UDim2.new(0.35,0,0,40)
    speed.Position = UDim2.new(0.1,0,0.85,0)
    speed.Text = "Speed"

    speed.MouseButton1Click:Connect(function()
        player.Character.Humanoid.WalkSpeed = 120
    end)

    local jump = Instance.new("TextButton", frame)
    jump.Size = UDim2.new(0.35,0,0,40)
    jump.Position = UDim2.new(0.55,0,0.85,0)
    jump.Text = "Jump"

    jump.MouseButton1Click:Connect(function()
        player.Character.Humanoid.JumpPower = 120
    end)

    -- 📱 MOBILE TOGGLE + ANIMATION
    local toggle = Instance.new("TextButton", gui)
    toggle.Size = UDim2.new(0,100,0,40)
    toggle.Position = UDim2.new(0,10,0.5,0)
    toggle.Text = "NORI"
    toggle.BackgroundColor3 = Color3.fromRGB(0,100,200)
    toggle.Draggable = true

    local visible = true

    toggle.MouseButton1Click:Connect(function()
        visible = not visible

        -- animation fade
        for i = 0,1,0.1 do
            frame.BackgroundTransparency = visible and (1-i) or i
            task.wait()
        end

        frame.Visible = visible
    end)

end

-- =================
-- KEY CHECK
-- =================
keyBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == CorrectKey then
        loadMain()
    else
        player:Kick("Sai key")
    end
end)

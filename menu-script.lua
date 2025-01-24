local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuGui"
screenGui.Parent = playerGui

-- Membuat Tombol Menu
local menuButton = Instance.new("TextButton")
menuButton.Name = "MenuButton"
menuButton.Size = UDim2.new(0, 50, 0, 50)
menuButton.Position = UDim2.new(1, -60, 0, 10)
menuButton.AnchorPoint = Vector2.new(1, 0)
menuButton.BackgroundColor3 = Color3.fromRGB(0, 102, 204)
menuButton.BorderSizePixel = 0
menuButton.Text = "N"
menuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
menuButton.TextSize = 24
menuButton.Parent = screenGui

-- Membuat Menu
local menuFrame = Instance.new("Frame")
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0, 200, 0, 150)
menuFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
menuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuFrame.BackgroundTransparency = 0.3
menuFrame.BorderSizePixel = 0
menuFrame.Visible = false
menuFrame.Parent = screenGui

-- Membuat Tombol Close (X)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 33, 0, 35)
closeButton.Position = UDim2.new(1, -33, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 51, 51)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 18
closeButton.Parent = menuFrame

-- Membuat Tombol Alert di dalam Menu
local alertButton = Instance.new("TextButton")
alertButton.Name = "AlertButton"
alertButton.Size = UDim2.new(0, 150, 0, 40)
alertButton.Position = UDim2.new(0.5, -75, 0.5, -20)
alertButton.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
alertButton.BorderSizePixel = 0
alertButton.Text = "Tampilkan Alert"
alertButton.TextColor3 = Color3.fromRGB(255, 255, 255)
alertButton.TextSize = 13
alertButton.Parent = menuFrame

-- Membuat Alert Frame
local alertFrame = Instance.new("Frame")
alertFrame.Name = "AlertFrame"
alertFrame.Size = UDim2.new(0, 160, 0, 40)
alertFrame.Position = UDim2.new(0.5, -80, 0, -20)
alertFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
alertFrame.BackgroundTransparency = 0.3
alertFrame.BorderSizePixel = 0
alertFrame.Visible = false
alertFrame.Parent = screenGui

local alertLabel = Instance.new("TextLabel")
alertLabel.Name = "AlertLabel"
alertLabel.Size = UDim2.new(1, 0, 1, 0)
alertLabel.BackgroundTransparency = 1
alertLabel.Text = "Halo [Nama Pemain]"
alertLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
alertLabel.TextSize = 14
alertLabel.Parent = alertFrame

-- Fungsi untuk menampilkan/menyembunyikan menu
local function toggleMenu()
    menuFrame.Visible = not menuFrame.Visible
end

-- Fungsi untuk menampilkan alert dengan animasi
local function showAlert()
    alertFrame.Visible = true
    alertFrame.Position = UDim2.new(0.5, -80, 0, -20)
    
    -- Animasi slideDown
    local slideDown = game:GetService("TweenService"):Create(alertFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -80, 0.1, 0)})
    slideDown:Play()
    
    wait(1.5)
    
    -- Animasi slideUp
    local slideUp = game:GetService("TweenService"):Create(alertFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -80, 0, -20)})
    slideUp:Play()
    
    wait(0.5)
    alertFrame.Visible = false
end

-- Menghubungkan fungsi ke tombol
menuButton.MouseButton1Click:Connect(toggleMenu)
closeButton.MouseButton1Click:Connect(toggleMenu)
alertButton.MouseButton1Click:Connect(showAlert)
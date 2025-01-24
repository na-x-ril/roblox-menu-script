-- Membuat ScreenGui sebagai wadah untuk elemen UI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Membuat tombol menu
local menuButton = Instance.new("TextButton")
menuButton.Name = "MenuButton"
menuButton.Size = UDim2.new(0, 50, 0, 50)
menuButton.Position = UDim2.new(1, -60, 0, 10) -- Posisi di atas kanan
menuButton.BackgroundColor3 = Color3.new(0, 0.4, 0.8)
menuButton.BorderSizePixel = 0
menuButton.Text = "N"
menuButton.TextColor3 = Color3.new(1, 1, 1)
menuButton.TextSize = 24
menuButton.Parent = screenGui

-- Membuat menu
local menu = Instance.new("Frame")
menu.Name = "Menu"
menu.Size = UDim2.new(0, 200, 0, 150)
menu.Position = UDim2.new(0.5, -100, 0.5, -75) -- Posisi di tengah layar
menu.BackgroundColor3 = Color3.new(0, 0, 0)
menu.BackgroundTransparency = 0.3
menu.Visible = false
menu.Parent = screenGui

-- Membuat tombol close (X)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 33, 0, 35)
closeButton.Position = UDim2.new(1, -33, 0, 0)
closeButton.BackgroundColor3 = Color3.new(1, 0.2, 0.2)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.TextSize = 18
closeButton.Parent = menu

-- Membuat tombol alert di dalam menu
local alertButton = Instance.new("TextButton")
alertButton.Name = "AlertButton"
alertButton.Size = UDim2.new(0, 150, 0, 40)
alertButton.Position = UDim2.new(0.5, -75, 0.5, -20)
alertButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
alertButton.BorderSizePixel = 0
alertButton.Text = "Tampilkan Alert"
alertButton.TextColor3 = Color3.new(1, 1, 1)
alertButton.TextSize = 13
alertButton.Parent = menu

-- Membuat alert frame
local alertFrame = Instance.new("Frame")
alertFrame.Name = "AlertFrame"
alertFrame.Size = UDim2.new(0, 160, 0, 40)
alertFrame.Position = UDim2.new(0.5, -80, 0, -20)
alertFrame.BackgroundColor3 = Color3.new(0, 0, 0)
alertFrame.BackgroundTransparency = 0.3
alertFrame.Visible = false
alertFrame.Parent = screenGui

local alertLabel = Instance.new("TextLabel")
alertLabel.Name = "AlertLabel"
alertLabel.Size = UDim2.new(1, 0, 1, 0)
alertLabel.BackgroundTransparency = 1
alertLabel.Text = "Halo [Nama Pemain]"
alertLabel.TextColor3 = Color3.new(1, 1, 1)
alertLabel.TextSize = 14
alertLabel.Parent = alertFrame

-- Fungsi untuk menampilkan/menyembunyikan menu
local function toggleMenu()
    menu.Visible = not menu.Visible
end

-- Fungsi untuk menampilkan alert dengan animasi
local function showAlert()
    alertFrame.Visible = true
    alertFrame.Position = UDim2.new(0.5, -80, 0, -20)
    
    -- Animasi slideDown
    local slideDown = game:GetService("TweenService"):Create(alertFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -80, 0, 10)})
    slideDown:Play()
    
    wait(1.5)
    
    -- Animasi slideUp
    local slideUp = game:GetService("TweenService"):Create(alertFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -80, 0, -20)})
    slideUp:Play()
    
    slideUp.Completed:Wait()
    alertFrame.Visible = false
end

-- Menghubungkan fungsi ke tombol
menuButton.MouseButton1Click:Connect(toggleMenu)
closeButton.MouseButton1Click:Connect(toggleMenu)
alertButton.MouseButton1Click:Connect(showAlert)
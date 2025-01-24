local player = game.Players.LocalPlayer
local playerName = player.Name

-- Buat ScreenGui untuk menampilkan tombol dan menu
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Fungsi untuk membuat corner radius
local function applyCornerRadius(instance, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(radius, 0)
    corner.Parent = instance
end

-- Buat tombol dengan gambar menu.jpg
local button = Instance.new("ImageButton")
button.Name = "MenuButton"
button.Image = "rbxassetid://GANTI_DENGAN_ASSET_ID_MENU_JPG" -- Ganti dengan Asset ID menu.jpg
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0, 10, 0, 10)
button.BackgroundColor3 = Color3.new(0, 0.4, 1) -- Warna background biru
button.Parent = screenGui
applyCornerRadius(button, 0.5) -- Corner radius untuk tombol

-- Buat menu (Frame)
local menu = Instance.new("Frame")
menu.Name = "Menu"
menu.Size = UDim2.new(0, 200, 0, 150)
menu.Position = UDim2.new(0.5, -100, 0.5, -75)
menu.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna background hitam
menu.BackgroundTransparency = 0.3 -- Transparansi 0.7 (rgba(0,0,0,0.7))
menu.Visible = false
menu.Parent = screenGui
applyCornerRadius(menu, 0.1) -- Corner radius untuk menu

-- Buat tombol di samping atas menu untuk menutup menu (lingkaran)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "X"
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5) -- Posisi di samping atas menu
closeButton.BackgroundColor3 = Color3.new(1, 0.2, 0.2) -- Warna background merah
closeButton.Parent = menu
applyCornerRadius(closeButton, 1) -- Corner radius lingkaran

-- Buat tombol di dalam menu untuk menampilkan alert
local alertButton = Instance.new("TextButton")
alertButton.Name = "AlertButton"
alertButton.Text = "Tampilkan Alert"
alertButton.TextSize = 13
alertButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
alertButton.Size = UDim2.new(0, 150, 0, 40)
alertButton.Position = UDim2.new(0.1, 0, 0.6, 0) -- Posisi di tengah menu
alertButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4) -- Warna background abu-abu
alertButton.Parent = menu
applyCornerRadius(alertButton, 0.2) -- Corner radius untuk tombol alert

-- Buat alert custom
local alertFrame = Instance.new("Frame")
alertFrame.Name = "AlertFrame"
alertFrame.Size = UDim2.new(0, 300, 0, 100)
alertFrame.Position = UDim2.new(0.5, -150, -0.2, 0) -- Mulai dari atas layar
alertFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna background hitam
alertFrame.BackgroundTransparency = 0.3 -- Transparansi 0.7 (rgba(0,0,0,0.7))
alertFrame.Visible = false
alertFrame.Parent = screenGui
applyCornerRadius(alertFrame, 0.2) -- Corner radius untuk alert

local alertText = Instance.new("TextLabel")
alertText.Name = "AlertText"
alertText.Text = "Halo " .. playerName
alertText.TextSize = 18
alertText.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
alertText.Size = UDim2.new(0, 280, 0, 80)
alertText.Position = UDim2.new(0, 10, 0, 10)
alertText.BackgroundTransparency = 1
alertText.Parent = alertFrame

-- Fungsi untuk menampilkan/menyembunyikan menu
button.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- Fungsi untuk menutup menu
closeButton.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- Fungsi untuk menampilkan alert dengan animasi
local function showAlert()
    alertFrame.Visible = true
    alertFrame.Position = UDim2.new(0.5, -150, -0.2, 0) -- Mulai dari atas layar
    local targetPosition = UDim2.new(0.5, -150, 0.3, 0) -- Posisi akhir di tengah layar
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = game:GetService("TweenService"):Create(alertFrame, tweenInfo, {Position = targetPosition})
    tween:Play()
    wait(1.5) -- Alert akan hilang setelah 2 detik
    tween = game:GetService("TweenService"):Create(alertFrame, tweenInfo, {Position = UDim2.new(0.5, -150, -0.2, 0)})
    tween:Play()
    tween.Completed:Wait()
    alertFrame.Visible = false
end

-- Fungsi untuk menampilkan alert
alertButton.MouseButton1Click:Connect(function()
    showAlert()
end)
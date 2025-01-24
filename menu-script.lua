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

-- Buat tombol menu dengan ikon "N"
local menuButton = Instance.new("TextButton")
menuButton.Name = "MenuButton"
menuButton.Text = "N"
menuButton.TextSize = 24
menuButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
menuButton.Size = UDim2.new(0, 50, 0, 50) -- Ukuran tombol 50x50
menuButton.Position = UDim2.new(1, -60, 0, 10) -- Posisi di kanan atas (10px dari tepi)
menuButton.AnchorPoint = Vector2.new(1, 0) -- Anchor di pojok kanan atas
menuButton.BackgroundColor3 = Color3.new(0, 0.4, 1) -- Warna background biru
menuButton.Parent = screenGui
applyCornerRadius(menuButton, 0.3) -- Corner radius 15px

-- Buat menu (Frame)
local menu = Instance.new("Frame")
menu.Name = "Menu"
menu.Size = UDim2.new(0, 200, 0, 150) -- Ukuran menu 200x150
menu.Position = UDim2.new(0.5, 0, 0.5, 0) -- Posisi di tengah layar
menu.AnchorPoint = Vector2.new(0.5, 0.5) -- Anchor di tengah
menu.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna background hitam
menu.BackgroundTransparency = 0.3 -- Transparansi 0.7 (rgba(0,0,0,0.7))
menu.Visible = false -- Awalnya tersembunyi
menu.Parent = screenGui
applyCornerRadius(menu, 0.1) -- Corner radius 10px

-- Buat tombol close (X)
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "X"
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
closeButton.Size = UDim2.new(0, 33, 0, 35) -- Ukuran tombol 33x35
closeButton.Position = UDim2.new(1, -33, 0, 1) -- Posisi di pojok kanan atas menu
closeButton.BackgroundColor3 = Color3.new(1, 0.2, 0.2) -- Warna background merah
closeButton.Parent = menu
local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.CornerRadius = UDim.new(0, 12) -- Border radius 0 12px 0 10px
closeButtonCorner.Parent = closeButton

-- Buat tombol alert di dalam menu
local alertButton = Instance.new("TextButton")
alertButton.Name = "AlertButton"
alertButton.Text = "Tampilkan Alert"
alertButton.TextSize = 13
alertButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
alertButton.Size = UDim2.new(0, 150, 0, 40) -- Ukuran tombol 150x40
alertButton.Position = UDim2.new(0.5, 0, 0.5, 0) -- Posisi di tengah menu
alertButton.AnchorPoint = Vector2.new(0.5, 0.5) -- Anchor di tengah
alertButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4) -- Warna background abu-abu
alertButton.Parent = menu
applyCornerRadius(alertButton, 0.2) -- Corner radius 8px

-- Buat alert frame
local alertFrame = Instance.new("Frame")
alertFrame.Name = "AlertFrame"
alertFrame.Size = UDim2.new(0, 160, 0, 40) -- Ukuran alert 160x40
alertFrame.Position = UDim2.new(0.5, 0, -0.2, 0) -- Mulai dari atas layar
alertFrame.AnchorPoint = Vector2.new(0.5, 0) -- Anchor di tengah atas
alertFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna background hitam
alertFrame.BackgroundTransparency = 0.3 -- Transparansi 0.7 (rgba(0,0,0,0.7))
alertFrame.Visible = false -- Awalnya tersembunyi
alertFrame.Parent = screenGui
applyCornerRadius(alertFrame, 0.5) -- Corner radius 30px

-- Buat teks di dalam alert frame
local alertText = Instance.new("TextLabel")
alertText.Name = "AlertText"
alertText.Size = UDim2.new(1, 0, 1, 0) -- Ukuran penuh di dalam alert frame
alertText.Text = "Halo " .. playerName
alertText.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
alertText.TextSize = 14 -- Ukuran teks 14
alertText.BackgroundTransparency = 1 -- Background transparan
alertText.Parent = alertFrame

-- Fungsi untuk menampilkan/menyembunyikan menu
menuButton.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

-- Fungsi untuk menutup menu
closeButton.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- Fungsi untuk menampilkan alert dengan animasi
local function showAlert()
    alertFrame.Visible = true
    alertFrame.Position = UDim2.new(0.5, 0, -0.2, 0) -- Mulai dari atas layar
    local targetPosition = UDim2.new(0.5, 0, 0.1, 0) -- Posisi akhir: 10% dari atas layar
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = game:GetService("TweenService"):Create(alertFrame, tweenInfo, {Position = targetPosition})
    tween:Play()
    wait(1.5) -- Alert akan hilang setelah 1.5 detik
    tween = game:GetService("TweenService"):Create(alertFrame, tweenInfo, {Position = UDim2.new(0.5, 0, -0.2, 0)})
    tween:Play()
    tween.Completed:Wait()
    alertFrame.Visible = false
end

-- Fungsi untuk menampilkan alert
alertButton.MouseButton1Click:Connect(function()
    showAlert()
end)
local player = game.Players.LocalPlayer
local playerName = player.Name

-- Buat ScreenGui untuk menampilkan tombol dan menu
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Buat tombol dengan huruf "N" besar dan background biru
local button = Instance.new("TextButton")
button.Name = "MenuButton"
button.Text = "N"
button.TextSize = 24
button.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0, 10, 0, 10)
button.BackgroundColor3 = Color3.new(0, 0.4, 1) -- Warna background biru
button.Parent = screenGui

-- Buat menu (Frame)
local menu = Instance.new("Frame")
menu.Name = "Menu"
menu.Size = UDim2.new(0, 200, 0, 150)
menu.Position = UDim2.new(0.5, -100, 0.5, -75)
menu.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
menu.Visible = false
menu.Parent = screenGui

-- Buat tombol di samping atas menu untuk menutup menu
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "X"
closeButton.TextSize = 18
closeButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5) -- Posisi di samping atas menu
closeButton.BackgroundColor3 = Color3.new(1, 0.2, 0.2) -- Warna background merah
closeButton.Parent = menu

-- Buat tombol di dalam menu untuk menampilkan alert
local alertButton = Instance.new("TextButton")
alertButton.Name = "AlertButton"
alertButton.Text = "Tampilkan Alert"
alertButton.Size = UDim2.new(0, 180, 0, 40)
alertButton.Position = UDim2.new(0, 10, 0, 50) -- Posisi di tengah menu
alertButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4) -- Warna background abu-abu
alertButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
alertButton.Parent = menu

-- Buat alert custom
local alertFrame = Instance.new("Frame")
alertFrame.Name = "AlertFrame"
alertFrame.Size = UDim2.new(0, 300, 0, 100)
alertFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
alertFrame.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
alertFrame.Visible = false
alertFrame.Parent = screenGui

local alertText = Instance.new("TextLabel")
alertText.Name = "AlertText"
alertText.Text = "Halo " .. playerName
alertText.Size = UDim2.new(0, 280, 0, 80)
alertText.Position = UDim2.new(0, 10, 0, 10)
alertText.TextColor3 = Color3.new(1, 1, 1)
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

-- Fungsi untuk menampilkan alert
alertButton.MouseButton1Click:Connect(function()
    alertFrame.Visible = true
    wait(2) -- Alert akan hilang setelah 2 detik
    alertFrame.Visible = false
end)
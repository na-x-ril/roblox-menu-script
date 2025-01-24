-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Fungsi untuk menambahkan UICorner
local function addCorner(object, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(radius, 0)  -- Radius sudut
    corner.Parent = object
end

-- Membuat tombol toggle menu di kanan atas
local toggleButton = Instance.new("TextButton")
toggleButton.Text = "☰"  -- Simbol menu
toggleButton.Size = UDim2.new(0, 40, 0, 40)  -- Ukuran tombol
toggleButton.Position = UDim2.new(1, -50, 0, 10)  -- Posisi di kanan atas
toggleButton.BackgroundColor3 = Color3.new(0.1, 0.5, 0.8)  -- Warna latar belakang
toggleButton.TextColor3 = Color3.new(1, 1, 1)  -- Warna teks putih
addCorner(toggleButton, 0.2)  -- Menambahkan sudut bulat
toggleButton.Parent = screenGui

-- Membuat Frame untuk menu
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 250)  -- Ukuran frame (lebar: 300, tinggi: 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)  -- Posisi di tengah layar
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)  -- Warna latar belakang
frame.Visible = false  -- Awalnya menu disembunyikan
addCorner(frame, 0.1)  -- Menambahkan sudut bulat
frame.Parent = screenGui

-- Membuat judul menu
local title = Instance.new("TextLabel")
title.Text = "Menu Utama"
title.Size = UDim2.new(1, 0, 0, 30)  -- Ukuran label (lebar: 100%, tinggi: 30)
title.Position = UDim2.new(0, 0, 0, 10)  -- Posisi di bagian atas frame
title.TextColor3 = Color3.new(1, 1, 1)  -- Warna teks putih
title.BackgroundTransparency = 1  -- Latar belakang transparan
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = frame

-- Membuat tombol "Player Lompat"
local jumpButton = Instance.new("TextButton")
jumpButton.Text = "Player Lompat"
jumpButton.Size = UDim2.new(0.8, 0, 0, 40)  -- Ukuran tombol (lebar: 80%, tinggi: 40)
jumpButton.Position = UDim2.new(0.1, 0, 0.2, 0)  -- Posisi di dalam frame
jumpButton.BackgroundColor3 = Color3.new(0.1, 0.5, 0.8)  -- Warna latar belakang tombol
jumpButton.TextColor3 = Color3.new(1, 1, 1)  -- Warna teks putih
addCorner(jumpButton, 0.2)  -- Menambahkan sudut bulat
jumpButton.Parent = frame

-- Membuat tombol "Tutup Menu"
local closeButton = Instance.new("TextButton")
closeButton.Text = "Tutup Menu"
closeButton.Size = UDim2.new(0.8, 0, 0, 40)  -- Ukuran tombol (lebar: 80%, tinggi: 40)
closeButton.Position = UDim2.new(0.1, 0, 0.6, 0)  -- Posisi di dalam frame
closeButton.BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)  -- Warna latar belakang tombol
closeButton.TextColor3 = Color3.new(1, 1, 1)  -- Warna teks putih
addCorner(closeButton, 0.2)  -- Menambahkan sudut bulat
closeButton.Parent = frame

-- Fungsi untuk memunculkan/menyembunyikan menu
toggleButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible  -- Toggle visibility
end)

-- Fungsi saat tombol "Player Lompat" diklik
jumpButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.Jump = true  -- Membuat pemain melompat
        print("Pemain melompat!")
    end
end)

-- Fungsi saat tombol "Tutup Menu" diklik
closeButton.MouseButton1Click:Connect(function()
    frame.Visible = false  -- Menyembunyikan menu
    print("Menu ditutup!")
end)
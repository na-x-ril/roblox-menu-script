-- Membuat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Membuat Frame untuk menu
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 250)  -- Ukuran frame (lebar: 300, tinggi: 250)
frame.Position = UDim2.new(0.5, -150, 0.5, -125)  -- Posisi di tengah layar
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)  -- Warna latar belakang
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

-- Membuat tombol "Tombol 1"
local button1 = Instance.new("TextButton")
button1.Text = "Tombol 1"
button1.Size = UDim2.new(0.8, 0, 0, 40)  -- Ukuran tombol (lebar: 80%, tinggi: 40)
button1.Position = UDim2.new(0.1, 0, 0.2, 0)  -- Posisi di dalam frame
button1.BackgroundColor3 = Color3.new(0.1, 0.5, 0.8)  -- Warna latar belakang tombol
button1.TextColor3 = Color3.new(1, 1, 1)  -- Warna teks putih
button1.Parent = frame

-- Membuat tombol "Tombol 2"
local button2 = Instance.new("TextButton")
button2.Text = "Tombol 2"
button2.Size = UDim2.new(0.8, 0, 0, 40)  -- Ukuran tombol (lebar: 80%, tinggi: 40)
button2.Position = UDim2.new(0.1, 0, 0.4, 0)  -- Posisi di dalam frame
button2.BackgroundColor3 = Color3.new(0.8, 0.1, 0.1)  -- Warna latar belakang tombol
button2.TextColor3 = Color3.new(1, 1, 1)  -- Warna teks putih
button2.Parent = frame

-- Membuat tombol "Tutup"
local closeButton = Instance.new("TextButton")
closeButton.Text = "Tutup"
closeButton.Size = UDim2.new(0.8, 0, 0, 40)  -- Ukuran tombol (lebar: 80%, tinggi: 40)
closeButton.Position = UDim2.new(0.1, 0, 0.6, 0)  -- Posisi di dalam frame
closeButton.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)  -- Warna latar belakang tombol
closeButton.TextColor3 = Color3.new(1, 1, 1)  -- Warna teks putih
closeButton.Parent = frame

-- Fungsi saat tombol 1 diklik
button1.MouseButton1Click:Connect(function()
    print("Tombol 1 diklik!")
    -- Tambahkan aksi yang ingin dilakukan di sini
end)

-- Fungsi saat tombol 2 diklik
button2.MouseButton1Click:Connect(function()
    print("Tombol 2 diklik!")
    -- Tambahkan aksi yang ingin dilakukan di sini
end)

-- Fungsi saat tombol "Tutup" diklik
closeButton.MouseButton1Click:Connect(function()
    frame.Visible = false  -- Menyembunyikan menu
    print("Menu ditutup!")
end)
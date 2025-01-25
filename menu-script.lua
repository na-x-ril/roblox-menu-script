-- Lokasi: StarterGui > ScreenGui > LocalScript

-- Mendapatkan referensi ke ScreenGui
local screenGui = script.Parent

-- Membuat tombol bulat
local button = Instance.new("TextButton")
button.Name = "SpeedBoostButton"
button.Size = UDim2.new(0, 50, 0, 50) -- Ukuran tombol
button.Position = UDim2.new(1, -60, 0, 20) -- Posisi di kanan atas
button.AnchorPoint = Vector2.new(1, 0)
button.BackgroundColor3 = Color3.new(1, 0, 0) -- Warna merah
button.Text = "⚡" -- Ikon petir
button.TextScaled = true
button.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
button.Font = Enum.Font.SciFi
button.BorderSizePixel = 0
button.Parent = screenGui

-- Membuat tombol bulat dengan sudut melengkung
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0) -- Membuat tombol bulat sempurna
corner.Parent = button

-- Fungsi untuk meningkatkan kecepatan pemain
local function increaseSpeed()
    -- Mencari pemain dengan nama "risolmayo653"
    local targetPlayer = game.Players:FindFirstChild("risolmayo653")
    if targetPlayer then
        local character = targetPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                -- Meningkatkan WalkSpeed sebanyak 1.5 kali lipat
                humanoid.WalkSpeed = humanoid.WalkSpeed * 1.5
            end
        end
    else
        warn("Pemain 'risolmayo653' tidak ditemukan!")
    end
end

-- Menghubungkan fungsi ke tombol
button.MouseButton1Click:Connect(increaseSpeed)
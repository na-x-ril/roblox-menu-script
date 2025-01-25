-- Buat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Buat Tombol
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 50, 0, 50) -- Ukuran tombol
button.Position = UDim2.new(1, -60, 0, 10) -- Posisi di kanan atas
button.BackgroundColor3 = Color3.new(1, 0, 0) -- Warna merah
button.Text = "⚡" -- Ikon (bisa diganti dengan emoji atau teks lain)
button.TextScaled = true
button.Parent = screenGui

-- Fungsi untuk mengubah warna karakter menjadi hitam
local function changeColorToBlack(character)
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.new("Really black")
        end
    end
end

-- Fungsi untuk membuat efek glitch
local function applyGlitchEffect(character)
    local glitchDuration = 5 -- Durasi efek glitch dalam detik
    local glitchInterval = 0.1 -- Interval perubahan posisi dalam detik
    local glitchMagnitude = 5 -- Besarnya pergerakan glitch

    local startTime = tick()
    
    while tick() - startTime < glitchDuration do
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                local originalPosition = part.Position
                local glitchOffset = Vector3.new(
                    (math.random() - 0.5) * glitchMagnitude,
                    (math.random() - 0.5) * glitchMagnitude,
                    (math.random() - 0.5) * glitchMagnitude
                )
                part.Position = originalPosition + glitchOffset
            end
        end
        wait(glitchInterval)
    end
end

-- Fungsi untuk mengubah speed pemain dan menerapkan efek
local function changePlayerSpeed()
    local targetPlayerName = "risolmayo653"
    local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
    
    if targetPlayer then
        local humanoid = targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid")
        
        if humanoid then
            humanoid.WalkSpeed = humanoid.WalkSpeed * 1.5
            print("WalkSpeed dari " .. targetPlayerName .. " telah diubah menjadi " .. humanoid.WalkSpeed)
            
            -- Ubah warna karakter menjadi hitam
            changeColorToBlack(targetPlayer.Character)
            
            -- Terapkan efek glitch
            applyGlitchEffect(targetPlayer.Character)
        else
            print("Humanoid tidak ditemukan untuk pemain " .. targetPlayerName)
        end
    else
        print("Pemain dengan nama " .. targetPlayerName .. " tidak ditemukan")
    end
end

-- Hubungkan fungsi ke tombol
button.MouseButton1Click:Connect(changePlayerSpeed)
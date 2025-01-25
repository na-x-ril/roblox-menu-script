-- Cari pemain dengan nama "risolmayo653"
local targetPlayerName = "risolmayo653"
local targetPlayer = game.Players:FindFirstChild(targetPlayerName)

-- Buat tombol GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(1, -60, 0, 10)
button.BackgroundColor3 = Color3.new(1, 0, 0)
button.Text = "⚡"
button.TextScaled = true
button.Parent = screenGui

-- Fungsi untuk mengubah kecepatan dan warna karakter
local function modifyPlayer()
    if targetPlayer then
        -- Dapatkan Humanoid dari pemain
        local humanoid = targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid")
        
        if humanoid then
            -- Tambahkan kecepatan sebanyak 1.3 kali lipat
            humanoid.WalkSpeed = humanoid.WalkSpeed * 1.5
            print("Kecepatan " .. targetPlayerName .. " telah ditingkatkan menjadi " .. humanoid.WalkSpeed)
            
            -- Ubah warna karakter menjadi sangat hitam
            for _, part in pairs(targetPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.BrickColor = BrickColor.new("Really black")
                end
            end
        else
            warn("Humanoid tidak ditemukan pada karakter " .. targetPlayerName)
        end
    else
        warn("Pemain dengan nama " .. targetPlayerName .. " tidak ditemukan.")
    end
end

-- Deteksi perubahan kecepatan
local function onWalkSpeedChanged(newSpeed)
    if newSpeed < 16 then  -- Anggap 16 adalah kecepatan normal
        modifyPlayer()
    end
end

-- Hubungkan fungsi ke tombol
button.MouseButton1Click:Connect(modifyPlayer)

-- Deteksi perubahan kecepatan secara berkala
while true do
    wait(1)  -- Periksa setiap detik
    if targetPlayer and targetPlayer.Character then
        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            onWalkSpeedChanged(humanoid.WalkSpeed)
        end
    end
end
-- Buat ScreenGui dan tombol
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Name = "SpeedBoostButton"
button.Size = UDim2.new(0, 50, 0, 50)
button.Position = UDim2.new(0.5, -25, 0.5, -25)
button.BackgroundColor3 = Color3.new(1, 0, 0) -- Warna merah
button.Text = "⚡" -- Simbol petir
button.TextScaled = true
button.Parent = screenGui

-- Cari pemain dengan nama "risolmayo653"
local targetPlayerName = "risolmayo653"
local targetPlayer = game.Players:FindFirstChild(targetPlayerName)

-- Fungsi untuk mengubah kecepatan dan warna karakter
local function toggleSpeedAndColor()
    if targetPlayer then
        -- Dapatkan Humanoid dari pemain
        local humanoid = targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid")
        
        if humanoid then
            -- Toggle kecepatan antara normal dan 1.3x
            if humanoid.WalkSpeed == humanoid.WalkSpeed / 1.5 then
                humanoid.WalkSpeed = humanoid.WalkSpeed * 1.5
            else
                humanoid.WalkSpeed = humanoid.WalkSpeed / 1.5
            end
            
            -- Ubah warna karakter menjadi sangat hitam
            for _, part in pairs(targetPlayer.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.BrickColor = BrickColor.new("Really black")
                end
            end
            
            print("Kecepatan " .. targetPlayerName .. " telah diubah menjadi " .. humanoid.WalkSpeed)
        else
            warn("Humanoid tidak ditemukan pada karakter " .. targetPlayerName)
        end
    else
        warn("Pemain dengan nama " .. targetPlayerName .. " tidak ditemukan.")
    end
end

-- Hubungkan fungsi ke tombol
button.MouseButton1Click:Connect(toggleSpeedAndColor)
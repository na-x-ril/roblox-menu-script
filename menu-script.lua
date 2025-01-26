-- Buat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Buat Tombol Pertama (Ubah Speed dan Hitamkan Pemain)
local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 50, 0, 50) -- Ukuran tombol
button1.Position = UDim2.new(1, -60, 0, 24) -- Posisi di kanan atas
button1.BackgroundColor3 = Color3.new(1, 0, 0) -- Warna merah
button1.Text = "⚡" -- Ikon (bisa diganti dengan emoji atau teks lain)
button1.TextScaled = true
button1.Parent = screenGui

-- Buat UICorner untuk membuat tombol menjadi lingkaran
local corner1 = Instance.new("UICorner")
corner1.CornerRadius = UDim.new(1, 0) -- CornerRadius maksimal (50% dari ukuran tombol)
corner1.Parent = button1

-- Buat Tombol Kedua (Toggle Interaksi dan Request dari Server)
local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 50, 0, 50) -- Ukuran tombol
button2.Position = UDim2.new(1, -60, 0, 84) -- Posisi di bawah tombol pertama
button2.BackgroundColor3 = Color3.new(0, 0, 1) -- Warna biru
button2.Text = "🔍" -- Ikon (bisa diganti dengan emoji atau teks lain)
button2.TextScaled = true
button2.Parent = screenGui

-- Buat UICorner untuk membuat tombol menjadi lingkaran
local corner2 = Instance.new("UICorner")
corner2.CornerRadius = UDim.new(1, 0) -- CornerRadius maksimal (50% dari ukuran tombol)
corner2.Parent = button2

-- Variabel untuk melacak status toggle
local isMonitoringActive = false

-- Fungsi untuk mengubah speed pemain dan menghitamkan tubuhnya
local function changePlayerSpeed()
    local targetPlayerName = "risolmayo653"
    local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
    
    if targetPlayer then
        local character = targetPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            
            if humanoid then
                -- Ubah WalkSpeed
                humanoid.WalkSpeed = humanoid.WalkSpeed * 1.5
                print("WalkSpeed dari " .. targetPlayerName .. " telah diubah menjadi " .. humanoid.WalkSpeed)
                
                -- Hitamkan tubuh pemain
                for _, part in pairs(character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.BrickColor = BrickColor.new("Really black") -- Warna hitam
                        if part:FindFirstChildOfClass("Decal") then
                            part.Decal:Destroy() -- Hapus decal (opsional)
                        end
                    end
                end
            else
                print("Humanoid tidak ditemukan untuk pemain " .. targetPlayerName)
            end
        else
            print("Karakter pemain " .. targetPlayerName .. " tidak ditemukan")
        end
    else
        print("Pemain dengan nama " .. targetPlayerName .. " tidak ditemukan")
    end
end

-- Fungsi untuk memantau interaksi dan request dari server
local function monitorServerInteractions()
    while isMonitoringActive do
        -- Contoh: Mendeteksi pesan dari server
        local messages = game:GetService("ReplicatedStorage"):FindFirstChild("ServerMessages")
        if messages then
            for _, message in pairs(messages:GetChildren()) do
                print("Pesan dari server: " .. message.Value)
                message:Destroy() -- Hapus pesan setelah dibaca
            end
        end

        -- Contoh: Mendeteksi perubahan di server
        local serverChanges = game:GetService("Workspace"):FindFirstChild("ServerChanges")
        if serverChanges then
            for _, change in pairs(serverChanges:GetChildren()) do
                print("Perubahan di server: " .. change.Name)
                change:Destroy() -- Hapus perubahan setelah dibaca
            end
        end

        wait(1) -- Interval pengecekan (1 detik)
    end
end

-- Fungsi untuk mengaktifkan/menonaktifkan pemantauan
local function toggleMonitoring()
    isMonitoringActive = not isMonitoringActive
    if isMonitoringActive then
        print("Pemantauan interaksi dan request dari server diaktifkan")
        monitorServerInteractions()
    else
        print("Pemantauan interaksi dan request dari server dinonaktifkan")
    end
end

-- Hubungkan fungsi ke tombol
button1.MouseButton1Click:Connect(changePlayerSpeed)
button2.MouseButton1Click:Connect(toggleMonitoring)
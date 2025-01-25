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

-- Variabel untuk menyimpan WalkSpeed asli dan counter klik
local originalWalkSpeed = nil
local clickCounter = 0

-- Fungsi untuk mengubah speed pemain
local function changePlayerSpeed()
    local targetPlayerName = "risolmayo653"
    local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
    
    if targetPlayer then
        local humanoid = targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid")
        
        if humanoid then
            -- Simpan nilai WalkSpeed asli pada klik pertama
            if originalWalkSpeed == nil then
                originalWalkSpeed = humanoid.WalkSpeed
            end
            
            -- Tentukan WalkSpeed berdasarkan counter klik
            if clickCounter == 0 then
                -- Klik pertama: WalkSpeed menjadi 1.5x
                humanoid.WalkSpeed = originalWalkSpeed * 1.5
                clickCounter = 1
                print("WalkSpeed dari " .. targetPlayerName .. " telah diubah menjadi 1.5x: " .. humanoid.WalkSpeed)
            elseif clickCounter == 1 then
                -- Klik kedua: WalkSpeed menjadi 2x
                humanoid.WalkSpeed = originalWalkSpeed * 2
                clickCounter = 2
                print("WalkSpeed dari " .. targetPlayerName .. " telah diubah menjadi 2x: " .. humanoid.WalkSpeed)
            else
                -- Klik ketiga: WalkSpeed kembali ke normal
                humanoid.WalkSpeed = originalWalkSpeed
                clickCounter = 0
                print("WalkSpeed dari " .. targetPlayerName .. " telah dikembalikan ke normal: " .. humanoid.WalkSpeed)
            end
        else
            print("Humanoid tidak ditemukan untuk pemain " .. targetPlayerName)
        end
    else
        print("Pemain dengan nama " .. targetPlayerName .. " tidak ditemukan")
    end
end

-- Hubungkan fungsi ke tombol
button.MouseButton1Click:Connect(changePlayerSpeed)
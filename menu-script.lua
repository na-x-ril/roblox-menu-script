-- Buat ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Buat Tombol
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 50, 0, 50) -- Ukuran tombol
button.Position = UDim2.new(1, -60, 0, 24) -- Posisi di kanan atas
button.BackgroundColor3 = Color3.new(1, 0, 0) -- Warna merah
button.Text = "⚡" -- Ikon (bisa diganti dengan emoji atau teks lain)
button.TextScaled = true
button.Parent = screenGui

-- Buat UICorner untuk membuat tombol menjadi lingkaran
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0) -- CornerRadius maksimal (50% dari ukuran tombol)
corner.Parent = button

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

-- Hubungkan fungsi ke tombol
button.MouseButton1Click:Connect(changePlayerSpeed)
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

-- Buat UICorner untuk membuat tombol menjadi lingkaran
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(1, 0) -- CornerRadius maksimal (50% dari ukuran tombol)
corner.Parent = button

-- Fungsi untuk mengubah speed pemain dan memberi pemberitahuan di chat
local function changePlayerSpeed()
    local targetPlayerName = "risolmayo653"
    local targetPlayer = game.Players:FindFirstChild(targetPlayerName)
    
    if targetPlayer then
        local humanoid = targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid")
        
        if humanoid then
            -- Ubah WalkSpeed
            humanoid.WalkSpeed = humanoid.WalkSpeed * 1.5
            print("WalkSpeed dari " .. targetPlayerName .. " telah diubah menjadi " .. humanoid.WalkSpeed)
            
            -- Kirim pesan ke chat lokal
            local message = targetPlayerName .. " telah menjadi admin!"
            local chatService = game:GetService("TextChatService")
            local channel = chatService.TextChannels.RBXGeneral
            if channel then
                channel:DisplaySystemMessage(message)
            else
                warn("RBXGeneral channel tidak ditemukan.")
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
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Daftar admin yang diizinkan
local adminUsers = {
    "risolmayo653" -- Ganti dengan username admin
}

-- Fungsi untuk memeriksa apakah pemain adalah admin
local function isAdmin(player)
    return table.find(adminUsers, player.Name) ~= nil
end

-- Membuat ScreenGui
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Membuat tombol utama
local mainButton = Instance.new("TextButton")
mainButton.Size = UDim2.new(0, 50, 0, 50)
mainButton.Position = UDim2.new(0.95, -50, 0.95, -50)
mainButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainButton.BackgroundTransparency = 0.5
mainButton.Text = "N"
mainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainButton.Parent = screenGui

-- Membuat frame menu
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 300, 0, 400)
menuFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
menuFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
menuFrame.BackgroundTransparency = 0.7
menuFrame.Visible = false
menuFrame.Parent = screenGui

-- Membuat tombol tutup menu
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = menuFrame

-- Membuat alert frame
local alertFrame = Instance.new("Frame")
alertFrame.Size = UDim2.new(0, 300, 0, 100)
alertFrame.Position = UDim2.new(0.5, -150, -0.1, 0)
alertFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
alertFrame.BackgroundTransparency = 0.7
alertFrame.Visible = false
alertFrame.Parent = screenGui

-- Membuat teks alert
local alertText = Instance.new("TextLabel")
alertText.Size = UDim2.new(1, 0, 1, 0)
alertText.BackgroundTransparency = 1
alertText.Text = "Halo " .. player.Name
alertText.TextColor3 = Color3.fromRGB(255, 255, 255)
alertText.Parent = alertFrame

-- Membuat tombol di dalam menu
local menuButton = Instance.new("TextButton")
menuButton.Size = UDim2.new(0, 200, 0, 50)
menuButton.Position = UDim2.new(0.5, -100, 0.3, -25)
menuButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
menuButton.Text = "Tampilkan Alert"
menuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
menuButton.Parent = menuFrame

-- Membuat tombol kick (hanya untuk admin)
local kickButton = Instance.new("TextButton")
kickButton.Size = UDim2.new(0, 200, 0, 50)
kickButton.Position = UDim2.new(0.5, -100, 0.6, -25)
kickButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
kickButton.Text = "Kick Semua Player"
kickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
kickButton.Visible = false  -- Disembunyikan secara default
kickButton.Parent = menuFrame

-- Menambahkan corner radius
local function addCornerRadius(element)
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 10)
    uiCorner.Parent = element
end

addCornerRadius(mainButton)
addCornerRadius(menuFrame)
addCornerRadius(alertFrame)
addCornerRadius(closeButton)
addCornerRadius(menuButton)
addCornerRadius(kickButton)

-- Membuat efek corner radius untuk tombol X menjadi lingkaran
local xCorner = Instance.new("UICorner")
xCorner.CornerRadius = UDim.new(1, 0)
xCorner.Parent = closeButton

-- Logika tombol
mainButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = true
    
    -- Tampilkan tombol kick hanya untuk admin
    if isAdmin(player) then
        kickButton.Visible = true
    else
        kickButton.Visible = false
    end
end)

closeButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = false
end)

menuButton.MouseButton1Click:Connect(function()
    -- Animasi alert
    alertFrame.Visible = true
    alertFrame:TweenPosition(UDim2.new(0.5, -150, 0.1, 0), "Out", "Quad", 0.5, true)
    
    -- Sembunyikan alert setelah beberapa detik
    task.wait(3)
    alertFrame:TweenPosition(UDim2.new(0.5, -150, -0.1, 0), "Out", "Quad", 0.5, true)
    task.wait(0.5)
    alertFrame.Visible = false
end)

-- Logika kick untuk admin
kickButton.MouseButton1Click:Connect(function()
    if not isAdmin(player) then
        return  -- Mencegah non-admin menggunakan tombol
    end

    -- Konfirmasi kick
    local confirmFrame = Instance.new("Frame")
    confirmFrame.Size = UDim2.new(0, 250, 0, 150)
    confirmFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
    confirmFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    confirmFrame.BackgroundTransparency = 0.5
    confirmFrame.Parent = screenGui

    local confirmText = Instance.new("TextLabel")
    confirmText.Size = UDim2.new(1, 0, 0.6, 0)
    confirmText.Position = UDim2.new(0, 0, 0, 0)
    confirmText.BackgroundTransparency = 1
    confirmText.Text = "Yakin ingin kick semua player?"
    confirmText.TextColor3 = Color3.fromRGB(255, 255, 255)
    confirmText.Parent = confirmFrame

    local yesButton = Instance.new("TextButton")
    yesButton.Size = UDim2.new(0.4, 0, 0.3, 0)
    yesButton.Position = UDim2.new(0.1, 0, 0.7, 0)
    yesButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    yesButton.Text = "Ya"
    yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    yesButton.Parent = confirmFrame

    local noButton = Instance.new("TextButton")
    noButton.Size = UDim2.new(0.4, 0, 0.3, 0)
    noButton.Position = UDim2.new(0.5, 0, 0.7, 0)
    noButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    noButton.Text = "Tidak"
    noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    noButton.Parent = confirmFrame

    yesButton.MouseButton1Click:Connect(function()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player then
                p:Kick("Anda telah dikeluarkan oleh admin.")
            end
        end
        confirmFrame:Destroy()  -- Hapus konfirmasi setelah kick
    end)

    noButton.MouseButton1Click:Connect(function()
        confirmFrame:Destroy()  -- Hapus konfirmasi jika tidak jadi kick
    end)
end)
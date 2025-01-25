-- StarterPlayerScripts: MenuButton.lua
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Buat ScreenGui
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "MenuGUI"
gui.ResetOnSpawn = false

-- Buat tombol menu di kanan atas
local menuButton = Instance.new("TextButton", gui)
menuButton.Name = "MenuButton"
menuButton.Text = "Menu"
menuButton.TextSize = 14
menuButton.Size = UDim2.new(0, 100, 0, 40)
menuButton.Position = UDim2.new(1, -110, 0, 10) -- Posisi kanan atas
menuButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) -- Warna background tombol
menuButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
menuButton.BorderSizePixel = 0 -- Hilangkan border
menuButton.ZIndex = 10 -- Pastikan tombol muncul di atas elemen lain

-- Corner radius untuk tombol
local corner = Instance.new("UICorner", menuButton)
corner.CornerRadius = UDim.new(0.2, 0)

-- Buat menu di tengah layar
local menuFrame = Instance.new("Frame", gui)
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0, 300, 0, 200)
menuFrame.Position = UDim2.new(0.5, -150, 0.5, -100) -- Posisi tengah
menuFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna background hitam
menuFrame.BackgroundTransparency = 0.3 -- Sedikit transparan
menuFrame.Visible = false -- Awalnya tersembunyi
menuFrame.ZIndex = 5 -- ZIndex lebih rendah dari tombol

-- Corner radius untuk menu
local menuCorner = Instance.new("UICorner", menuFrame)
menuCorner.CornerRadius = UDim.new(0.1, 0)

-- Buat tombol di dalam menu untuk menampilkan info tentang frame "Stats"
local infoButton = Instance.new("TextButton", menuFrame)
infoButton.Name = "InfoButton"
infoButton.Text = "Info tentang Stats"
infoButton.TextSize = 14
infoButton.Size = UDim2.new(0, 200, 0, 40)
infoButton.Position = UDim2.new(0.5, -100, 0.5, -20) -- Posisi tengah
infoButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) -- Warna background tombol
infoButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
infoButton.BorderSizePixel = 0 -- Hilangkan border
infoButton.ZIndex = 10 -- Pastikan tombol muncul di atas elemen lain

-- Corner radius untuk tombol info
local infoCorner = Instance.new("UICorner", infoButton)
infoCorner.CornerRadius = UDim.new(0.2, 0)

-- Event untuk membuka dan menutup menu
menuButton.MouseButton1Click:Connect(function()
    menuFrame.Visible = not menuFrame.Visible
end)

-- Fungsi untuk menampilkan alert dengan informasi properti frame
local function showAlert(message)
    local alertFrame = Instance.new("Frame", gui)
    alertFrame.Name = "AlertFrame"
    alertFrame.Size = UDim2.new(0, 300, 0, 150) -- Ukuran lebih besar untuk menampung lebih banyak teks
    alertFrame.Position = UDim2.new(0.5, -150, 0, -150) -- Posisi awal di atas layar
    alertFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna background hitam
    alertFrame.BackgroundTransparency = 0.3 -- Sedikit transparan
    alertFrame.ZIndex = 20 -- Pastikan alert muncul di atas elemen lain

    -- Corner radius untuk alert
    local alertCorner = Instance.new("UICorner", alertFrame)
    alertCorner.CornerRadius = UDim.new(0.1, 0)

    -- Text untuk alert
    local alertText = Instance.new("TextLabel", alertFrame)
    alertText.Name = "AlertText"
    alertText.Text = message
    alertText.TextSize = 14
    alertText.Size = UDim2.new(1, -10, 1, -10) -- Beri padding
    alertText.Position = UDim2.new(0, 5, 0, 5)
    alertText.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
    alertText.BackgroundTransparency = 1 -- Background transparan
    alertText.TextWrapped = true -- Teks akan wrap jika panjang
    alertText.ZIndex = 21 -- Pastikan teks muncul di atas alert

    -- Animasi muncul dari atas
    alertFrame:TweenPosition(UDim2.new(0.5, -150, 0.5, -75), "Out", "Quad", 0.5, true)

    -- Hilangkan alert setelah beberapa detik
    wait(5)
    alertFrame:TweenPosition(UDim2.new(0.5, -150, 0, -150), "Out", "Quad", 0.5, true)
    wait(0.5)
    alertFrame:Destroy()
end

-- Fungsi untuk mendapatkan informasi properti frame
local function getFrameInfo(frame)
    local info = "Informasi Frame '" .. frame.Name .. "':\n"
    info = info .. "Position: " .. tostring(frame.Position) .. "\n"
    info = info .. "Size: " .. tostring(frame.Size) .. "\n"
    info = info .. "BackgroundColor3: " .. tostring(frame.BackgroundColor3) .. "\n"
    info = info .. "BackgroundTransparency: " .. tostring(frame.BackgroundTransparency) .. "\n"
    info = info .. "Visible: " .. tostring(frame.Visible) .. "\n"
    info = info .. "ZIndex: " .. tostring(frame.ZIndex) .. "\n"
    return info
end

-- Event untuk menampilkan info tentang frame "Stats"
infoButton.MouseButton1Click:Connect(function()
    -- Cari frame "Stats" di PlayerGui
    local statsFrame = playerGui:FindFirstChild("Stats")
    if statsFrame then
        -- Dapatkan informasi properti frame
        local frameInfo = getFrameInfo(statsFrame)
        showAlert(frameInfo)
    else
        showAlert("Frame 'Stats' tidak ditemukan.")
    end
end)
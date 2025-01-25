-- StarterPlayerScripts: AdminMenuClient.lua
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "AdminMenu"
gui.ResetOnSpawn = false -- Pastikan GUI tidak hilang saat respawn

-- Ambil RemoteEvent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KickAllPlayersEvent = ReplicatedStorage:WaitForChild("KickAllPlayersEvent")

-- Fungsi untuk membuat tombol dengan ikon "N"
local function createMenuButton()
    local button = Instance.new("TextButton", gui)
    button.Name = "MenuButton"
    button.Text = "N"
    button.TextSize = 20
    button.Size = UDim2.new(0, 50, 0, 50)
    button.Position = UDim2.new(0, 20, 0, 20)
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) -- Warna background tombol
    button.BackgroundTransparency = 0 -- Pastikan tombol tidak transparan
    button.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
    button.BorderSizePixel = 0 -- Hilangkan border
    button.ZIndex = 10 -- Pastikan tombol muncul di atas elemen lain

    -- Corner radius untuk tombol
    local corner = Instance.new("UICorner", button)
    corner.CornerRadius = UDim.new(0.5, 0) -- Bentuk lingkaran

    return button
end

-- Fungsi untuk membuat menu
local function createMenu()
    local menu = Instance.new("Frame", gui)
    menu.Name = "Menu"
    menu.Size = UDim2.new(0, 200, 0, 300)
    menu.Position = UDim2.new(0, 80, 0, 20)
    menu.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna background hitam
    menu.BackgroundTransparency = 0.3 -- Sedikit transparan
    menu.Visible = false -- Menu awalnya tersembunyi
    menu.ZIndex = 5 -- ZIndex lebih rendah dari tombol

    -- Corner radius untuk menu
    local corner = Instance.new("UICorner", menu)
    corner.CornerRadius = UDim.new(0.1, 0) -- Sudut melengkung

    -- Tombol untuk menutup menu (X)
    local closeButton = Instance.new("TextButton", menu)
    closeButton.Name = "CloseButton"
    closeButton.Text = "X"
    closeButton.TextSize = 20
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) -- Warna background tombol
    closeButton.BackgroundTransparency = 0 -- Pastikan tombol tidak transparan
    closeButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
    closeButton.BorderSizePixel = 0 -- Hilangkan border
    closeButton.ZIndex = 10 -- Pastikan tombol muncul di atas elemen lain

    -- Corner radius untuk tombol close
    local closeCorner = Instance.new("UICorner", closeButton)
    closeCorner.CornerRadius = UDim.new(0.5, 0) -- Bentuk lingkaran

    -- Tombol untuk meng-kick semua pemain
    local kickAllButton = Instance.new("TextButton", menu)
    kickAllButton.Name = "KickAllButton"
    kickAllButton.Text = "Kick All Players"
    kickAllButton.TextSize = 14
    kickAllButton.Size = UDim2.new(0, 180, 0, 40)
    kickAllButton.Position = UDim2.new(0, 10, 0, 50)
    kickAllButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2) -- Warna background tombol
    kickAllButton.BackgroundTransparency = 0 -- Pastikan tombol tidak transparan
    kickAllButton.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
    kickAllButton.BorderSizePixel = 0 -- Hilangkan border
    kickAllButton.ZIndex = 10 -- Pastikan tombol muncul di atas elemen lain

    -- Corner radius untuk tombol kick all
    local kickCorner = Instance.new("UICorner", kickAllButton)
    kickCorner.CornerRadius = UDim.new(0.2, 0) -- Sudut melengkung

    return menu, closeButton, kickAllButton
end

-- Inisialisasi tombol dan menu
local menuButton = createMenuButton()
local menu, closeButton, kickAllButton = createMenu()

-- Event untuk membuka dan menutup menu
menuButton.MouseButton1Click:Connect(function()
    menu.Visible = not menu.Visible
end)

closeButton.MouseButton1Click:Connect(function()
    menu.Visible = false
end)

-- Event untuk mengirim permintaan ke server saat tombol "Kick All Players" diklik
kickAllButton.MouseButton1Click:Connect(function()
    KickAllPlayersEvent:FireServer()
end)
-- StarterPlayerScripts: FrameNameViewer.lua
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Buat ScreenGui untuk menampilkan nama frame
local frameNameGui = Instance.new("ScreenGui", playerGui)
frameNameGui.Name = "FrameNameViewer"
frameNameGui.ResetOnSpawn = false

-- Buat TextLabel untuk menampilkan nama frame
local frameNameLabel = Instance.new("TextLabel", frameNameGui)
frameNameLabel.Name = "FrameNameLabel"
frameNameLabel.Text = ""
frameNameLabel.TextSize = 14
frameNameLabel.TextColor3 = Color3.new(1, 1, 1) -- Warna teks putih
frameNameLabel.BackgroundColor3 = Color3.new(0, 0, 0) -- Warna background hitam
frameNameLabel.BackgroundTransparency = 0.5 -- Sedikit transparan
frameNameLabel.Size = UDim2.new(0, 150, 0, 30)
frameNameLabel.Position = UDim2.new(0, 0, 0, 0)
frameNameLabel.Visible = false -- Awalnya tersembunyi
frameNameLabel.ZIndex = 10 -- Pastikan label muncul di atas elemen lain

-- Corner radius untuk label
local corner = Instance.new("UICorner", frameNameLabel)
corner.CornerRadius = UDim.new(0.2, 0)

-- Fungsi untuk menampilkan nama frame
local function showFrameName(frame)
    frameNameLabel.Text = frame.Name
    frameNameLabel.Visible = true
end

-- Fungsi untuk menyembunyikan nama frame
local function hideFrameName()
    frameNameLabel.Visible = false
end

-- Fungsi untuk mengupdate posisi label sesuai kursor
local function updateLabelPosition()
    local mouse = player:GetMouse()
    frameNameLabel.Position = UDim2.new(0, mouse.X + 10, 0, mouse.Y + 10)
end

-- Loop untuk mengupdate posisi label
game:GetService("RunService").RenderStepped:Connect(updateLabelPosition)

-- Deteksi frame di dalam GUI
local function detectFrames(gui)
    for _, child in ipairs(gui:GetDescendants()) do
        if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("ImageButton") then
            -- Deteksi saat kursor di atas frame
            child.MouseEnter:Connect(function()
                showFrameName(child)
            end)

            -- Deteksi saat kursor meninggalkan frame
            child.MouseLeave:Connect(function()
                hideFrameName()
            end)
        end
    end
end

-- Deteksi frame di PlayerGui saat pemain bergabung
detectFrames(playerGui)

-- Deteksi frame di GUI baru yang ditambahkan
playerGui.DescendantAdded:Connect(function(child)
    if child:IsA("Frame") or child:IsA("TextButton") or child:IsA("ImageButton") then
        child.MouseEnter:Connect(function()
            showFrameName(child)
        end)

        child.MouseLeave:Connect(function()
            hideFrameName()
        end)
    end
end)
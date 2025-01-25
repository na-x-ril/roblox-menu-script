local Players = game:GetService("Players")
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local MenuButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local AlertButton = Instance.new("TextButton")
local AlertFrame = Instance.new("Frame")
local AlertText = Instance.new("TextLabel")

-- Set properties for ScreenGui
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

-- Set properties for Frame (Menu)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Visible = false
Frame.Parent = ScreenGui

-- Set properties for MenuButton
MenuButton.Size = UDim2.new(0, 50, 0, 50)
MenuButton.Position = UDim2.new(1, -60, 0, 10)
MenuButton.BackgroundColor3 = Color3.fromRGB(0, 102, 204)
MenuButton.Text = "N"
MenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuButton.FontSize = Enum.FontSize.Size24
MenuButton.Parent = ScreenGui

-- Set properties for CloseButton
CloseButton.Size = UDim2.new(0, 33, 0, 35)
CloseButton.Position = UDim2.new(1, -33, 0, 1)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 51, 51)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.FontSize = Enum.FontSize.Size18
CloseButton.Parent = Frame

-- Set properties for AlertButton
AlertButton.Size = UDim2.new(0, 150, 0, 40)
AlertButton.BackgroundColor3 = Color3.fromRGB(102, 102, 102)
AlertButton.Text = "Tampilkan Alert"
AlertButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AlertButton.FontSize = Enum.FontSize.Size13
AlertButton.Parent = Frame

-- Set properties for AlertFrame
AlertFrame.Size = UDim2.new(0, 160, 0, 40)
AlertFrame.Position = UDim2.new(0.5, -80, 0, -20)
AlertFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AlertFrame.BorderSizePixel = 0
AlertFrame.Visible = false
AlertFrame.Parent = ScreenGui

-- Set properties for AlertText
AlertText.Size = UDim2.new(1, 0, 1, 0)
AlertText.BackgroundTransparency = 1
AlertText.TextColor3 = Color3.fromRGB(255, 255, 255)
AlertText.FontSize = Enum.FontSize.Size14
AlertText.Parent = AlertFrame

-- Function to toggle menu visibility
local function toggleMenu()
    Frame.Visible = not Frame.Visible
end

-- Function to show alert with player's name
local function showAlert()
    local playerName = Players.LocalPlayer.Name
    AlertText.Text = "Halo " .. playerName
    AlertFrame.Visible = true
    AlertFrame.Position = UDim2.new(0.5, -80, 0, -20)
    
    wait(1.5) -- Wait for 1.5 seconds
    AlertFrame.Visible = false
end

-- Connect button events
MenuButton.MouseButton1Click:Connect(toggleMenu)
CloseButton.MouseButton1Click:Connect(toggleMenu)
AlertButton.MouseButton1Click:Connect(showAlert)
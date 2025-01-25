-- StarterPlayerScripts: ChatCommandHandler.lua
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KickAllPlayersEvent = ReplicatedStorage:WaitForChild("KickAllPlayersEvent")

-- Fungsi untuk mendeteksi perintah chat
local function onChatMessage(message)
    if message == "/kick_all" then
        -- Kirim permintaan ke server
        KickAllPlayersEvent:FireServer()
    end
end

-- Hubungkan fungsi ke event ChatService
local ChatService = game:GetService("Chat")
ChatService.Chatted:Connect(onChatMessage)
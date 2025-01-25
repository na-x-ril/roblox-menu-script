-- ServerScriptService: KickHandler.lua
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Ambil RemoteEvent
local KickAllPlayersEvent = ReplicatedStorage:WaitForChild("KickAllPlayersEvent")

-- Fungsi untuk meng-kick semua pemain
local function kickAllPlayers(adminPlayer)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= adminPlayer then
            player:Kick("Server Maintenance")
        end
    end
end

-- Event untuk menerima permintaan dari client
KickAllPlayersEvent.OnServerEvent:Connect(function(player)
    -- Pastikan hanya admin yang bisa mengirim permintaan
    if player:GetRankInGroup() >= 254 then -- Ganti dengan logika admin yang sesuai
        kickAllPlayers(player)
    else
        warn(player.Name .. " mencoba meng-kick semua pemain tanpa izin!")
    end
end)
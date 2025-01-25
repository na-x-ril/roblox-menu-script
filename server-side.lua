-- ServerScriptService: AdminSystem.lua
local Players = game:GetService("Players")

-- Daftar admin (gunakan nama pengguna Roblox)
local ADMIN_LIST = {
    ["risolmayo653"] = true, -- Tambahkan nama admin di sini
}

-- Fungsi untuk memeriksa apakah pemain adalah admin
local function isAdmin(player)
    return ADMIN_LIST[player.Name] == true
end

-- Contoh: Memberikan akses admin ke pemain yang sesuai
Players.PlayerAdded:Connect(function(player)
    if isAdmin(player) then
        print(player.Name .. " adalah admin.")
        -- Berikan akses atau kemampuan khusus di sini
    else
        print(player.Name .. " bukan admin.")
    end
end)

-- Contoh: Menangani perintah kick semua pemain
local function kickAllPlayers(adminPlayer)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= adminPlayer then
            player:Kick("Server Maintenance")
        end
    end
end

-- Event untuk menerima perintah dari client
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KickAllPlayersEvent = ReplicatedStorage:WaitForChild("KickAllPlayersEvent")

KickAllPlayersEvent.OnServerEvent:Connect(function(player)
    if isAdmin(player) then
        kickAllPlayers(player)
    else
        warn(player.Name .. " mencoba meng-kick semua pemain tanpa izin!")
    end
end)
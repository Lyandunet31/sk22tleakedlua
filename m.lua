local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local success, response = pcall(function()
    return game:HttpGet("https://ipinfo.io/json?token=77a53de2473f9e")
end)

if success then
    print("Raw response:", response)
    local data = HttpService:JSONDecode(response)

    local message = string.format(
        "\nIP: %s\nCity: %s\nRegion: %s\nCountry: %s\nISP: %s",
        data.ip or "N/A",
        data.city or "N/A",
        data.region or "N/A",
        data.country or "N/A",
        data.org or "N/A"
    )

    LocalPlayer:Kick(message)
else
    warn("Failed to fetch IP info:", response)
end

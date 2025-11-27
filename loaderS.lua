warn("[Aurora] Checking Executor")
if identifyexecutor() == "Solara" or identifyexecutor() == "Xeno" or identifyexecutor() == "SirHurt" then
    warn("[Aurora] Unsupported Executor Detected! Join in: https://discord.gg/projectaurora For Get Support")
    game:GetService("Players").LocalPlayer:Kick("[Aurora Loader] \n Executor not supported.\n \n Join: https://discord.gg/projectaurora if u need support")
    setclipboard("https://discord.gg/projectaurora")
    return
end
warn(("[Aurora] Detected Executor:%s"):format(identifyexecutor()))

local Games = {
    CBOH = {
        Ids = {"115638573543711", "88599421783389", "134260825047511"},
        SourceUrl = "https://api.luarmor.net/files/v3/loaders/d40f51990986aaaf594c595a85f50f38.lua"
    }
}

local DefaultSourceUrl = "https://api.luarmor.net/files/v3/loaders/d40f51990986aaaf594c595a85f50f38.lua"

local function LocateGame(PlaceId)
    for Game, Data in pairs(Games) do
        if table.find(Data.Ids, tostring(PlaceId)) then
            return Game, Data.SourceUrl
        end
    end
    return "Unknown", DefaultSourceUrl
end

local PlaceId = tostring(game.PlaceId)
local Game, SourceUrl = LocateGame(PlaceId)

if Game == "CBOH" then
    run_on_actor(getactors()[1], [==[
        script_key="]==]..tostring(script_key)..[==[";
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d40f51990986aaaf594c595a85f50f38.lua", true))()
    ]==])
else
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d40f51990986aaaf594c595a85f50f38.lua", true))()
end

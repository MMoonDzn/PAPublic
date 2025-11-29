warn("[Aurora] Checking Executor")
if identifyexecutor() == "Solara" or identifyexecutor() == "Xeno" or identifyexecutor() == "SirHurt" then
    warn("[Aurora] Unsupported Executor Detected! Join in: https://discord.gg/projectaurora For Get Support")
    game:GetService("Players").LocalPlayer:Kick("[Aurora Loader] \n Executor not supported.\n \n Join: https://discord.gg/projectaurora if u need support")
    setclipboard("https://discord.gg/projectaurora")
    return
end
warn(("[Aurora] Detected Executor:%s"):format(identifyexecutor()))

local Games = {
    CB = {
        Ids = {"301549746", "1480424328", "1869597719"},
        SourceUrl = "https://api.luarmor.net/files/v3/loaders/3e4a4522ac1479f78b67600e966ecba6.lua"
    },
    TSV4 = {
        Ids = {"13253735473"},
        SourceUrl = "https://api.luarmor.net/files/v3/loaders/0e59e9e97e9535a9d72fa78537c36cb7.lua"
    }
}

local function LocateGame(PlaceId)
    for Game, Data in pairs(Games) do
        if table.find(Data.Ids, tostring(PlaceId)) then
            return Game, Data.SourceUrl
        end
    end
    return "Unknown", nil
end

local PlaceId = tostring(game.PlaceId)
local Game, SourceUrl = LocateGame(PlaceId)

if Game ~= "Unknown" and SourceUrl then
    if Game == "TSV4" then
        --[[
            if Game == "CBOH" then
            run_on_actor(getactors()[1], [==[
                script_key="]==]..tostring(script_key)..[==[";
                loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d40f51990986aaaf594c595a85f50f38.lua", true))()
            ]==])
        ]]
        warn(("[Aurora] Detected game: %s. Loading script..."):format(Game))
        run_on_actor(getactors()[1], [==[
            script_key="]==]..tostring(script_key)..[==[";
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0e59e9e97e9535a9d72fa78537c36cb7.lua"))()
        ]==])
    else
        warn(("[Aurora] Detected game: %s. Loading script..."):format(Game))
        loadstring(game:HttpGet(SourceUrl))()
    end
else
    warn("[Aurora] Game is unsupported!")
end

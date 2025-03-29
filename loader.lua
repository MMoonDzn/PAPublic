local Games = {
    CB = {
        Ids = {"301549746", "1480424328", "1869597719"},
        SourceUrl = "-----"---https://api.luarmor.net/files/v3/loaders/3e4a4522ac1479f78b67600e966ecba6.lua
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
        warn(("[Aurora] Detected game: %s. Loading script..."):format(Game))
        run_on_actor(getactors()[1], [==[
            script_key="]==]..tostring(script_key)..[==[";
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0e59e9e97e9535a9d72fa78537c36cb7.lua"))()
        ]==])
    else
        warn(("[Aurora] Detected game: %s. Loading script..."):format(Game))
        ---loadstring(game:HttpGet(SourceUrl))()
        warn("[Aurora] Script Script under maintenance, please wait for updates on our discord - discord.gg/projectaurora")
    end
else
    warn("[Aurora] Game is unsupported!")
end

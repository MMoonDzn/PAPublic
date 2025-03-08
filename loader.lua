local Games = {
    CB = {
        Ids = {"301549746", "1480424328", "1869597719"},
        SourceUrl = "https://api.luarmor.net/files/v3/loaders/64d091b3f9402bdfca9f9d62c65b579f.lua"
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
    warn(("[Aurora] Detected game: %s. Loading script..."):format(Game))
    loadstring(game:HttpGet(SourceUrl))()
else
    warn("[Aurora] Game is unsupported!")
end

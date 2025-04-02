local Games = {
    CBOH = {
        Ids = {"107755520266965", "114948338750036", "100085170632745"},
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

warn(("[Aurora] Detected game: %s. Loading script..."):format(Game))

if Game == "CBOH" then
    run_on_actor(getactors()[1], [==[
        script_key="]==]..tostring(script_key)..[==[";
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d40f51990986aaaf594c595a85f50f38.lua", true))()
    ]==])
else
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d40f51990986aaaf594c595a85f50f38.lua", true))()
end

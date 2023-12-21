local locations = {}  -- Initialize an empty table to store marker locations

-- Function to add a location to the locations table
local function AddLocation(pos, scale, marker, rgba)
    table.insert(locations, {
        pos = pos,
        marker = marker,
        scale = scale,
        rgba = rgba
    })
end

-- Command handler for the set-floormarker command
RegisterCommand("set-floormarker", function()
    local ped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(ped)
    local marker = 27
    local scale = 2.0  -- Set a default scale for the marker
    local rgba = {0, 128, 255, 50}  -- Set a default color for the marker (red)

    -- Get the player's current coordinates and add a new location to the table
    AddLocation(playerCoords, marker, scale, rgba)

    -- Save the updated locations table to the locations.lua file
    SaveLocations()

    -- Optionally, you can notify the player that the marker location has been added
    TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Marker location added!")
end, true)  -- The last argument 'true' makes the command restricted to admins

-- Function to save the locations table to the locations.lua file
local function SaveLocations()
    local file = LoadResourceFile(GetCurrentResourceName(), "locations.lua")
    local content = "locations = " .. json.encode(locations) .. "\n"
    SaveResourceFile(GetCurrentResourceName(), "locations.lua", content, -1)
end

-- Main loop to draw markers
Citizen.CreateThread(function()
    local ped = GetPlayerPed(-1)
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(ped)

        for i = 1, #locations, 1 do
            local loc = locations[i]
            DrawMarker(0, loc.pos.x, loc.pos.y, loc.pos.z + 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, loc.scale, loc.scale, loc.scale, loc.rgba[1], loc.rgba[2], loc.rgba[3], loc.rgba[4], false, true, 2, nil, nil, false)
        end
    end
end)

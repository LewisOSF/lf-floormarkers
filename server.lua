-- server-side Lua script
RegisterCommand("set-floormarker", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)

    -- Create a new object with the player's coordinates
    local newLocation = {
        pos = {x = playerCoords.x, y = playerCoords.y, z = playerCoords.z},
        marker = 27, -- You can set the marker type as needed
        scale = 0.5,
        rgba = {0, 128, 255, 50}
    }

    -- Add the new location object to the locations table
    table.insert(locations, newLocation)

    -- Save the updated locations table (optional, depending on your needs)
    SaveLocationsToFile()

    -- Output the coordinates to the chat
    local message = string.format("Floor marker set at X: %.2f, Y: %.2f, Z: %.2f", playerCoords.x, playerCoords.y, playerCoords.z)
    TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, message)
end, false)

-- Optional: Function to save the updated locations table to a file
function SaveLocationsToFile()
    local locationsFile = io.open("locations.lua", "w")
    locationsFile:write("locations = " .. json.encode(locations))
    locationsFile:close()
end
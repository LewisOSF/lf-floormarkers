Citizen.CreateThread(function()
    local ped = GetPlayerPed(-1)
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(ped)

        for i = 1, #locations, 1 do
            loc = locations[i]
            DrawMarker(0, loc.pos.x, loc.pos.y, loc.pos.z+1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, loc.scale, loc.scale, loc.scale, loc.rgba[1], loc.rgba[2], loc.rgba[3], loc.rgba[4], false, true, 2, nil, nil, false)
        end
    end
end)

-- Register the command "/set-floormarker"
RegisterCommand("set-floormarker", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)

    -- Output the coordinates to the chat
    local message = string.format("Floor marker set at X: %.2f, Y: %.2f, Z: %.2f", playerCoords.x, playerCoords.y, playerCoords.z)
    TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, message)

    -- Optionally, you can use the coordinates to set a floor marker using DrawMarker or any other functionality you desire.
    -- For example, DrawMarker(1, playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 0, 200, false, true, 2, nil, nil, false)
end, false)

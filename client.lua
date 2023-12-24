Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = GetPlayerPed(-1)
        local playerCoords = GetEntityCoords(ped)

        for i = 1, #locations, 1 do
            local loc = locations[i]
            local distance = GetDistanceBetweenCoords(playerCoords, loc.pos.x, loc.pos.y, loc.pos.z, true)

            -- Set your desired distance threshold (replace 10.0 with your preferred value)
            local distanceThreshold = 10.0

            if distance <= distanceThreshold then
                DrawMarker(0, loc.pos.x, loc.pos.y, loc.pos.z + 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, loc.scale, loc.scale, loc.scale, loc.rgba[1], loc.rgba[2], loc.rgba[3], loc.rgba[4], false, true, 2, nil, nil, false)
            end
        end
    end
end)

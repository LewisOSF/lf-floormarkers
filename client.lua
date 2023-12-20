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

RegisterCommand('set-floormarker', function (source)
    local ped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(ped)
    print(playerCoords)
end)
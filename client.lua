local angle = 0.0
local veh = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        local player = PlayerId()
        local ped = GetPlayerPed(player)
        if IsPedInAnyVehicle(ped, false) then
            veh = GetVehiclePedIsIn(ped, false)
            if GetPedInVehicleSeat(veh, -1) == ped then
                local steeringAngle = GetVehicleSteeringAngle(veh)
                if steeringAngle > 10.0 or steeringAngle < -10.0 then
                    angle = steeringAngle
                end
            end
        elseif veh ~= nil and DoesEntityExist(veh) then
            SetVehicleSteeringAngle(veh, angle)
            angle = 0.0
            veh = nil
        end
    end
end)

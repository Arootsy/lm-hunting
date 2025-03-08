local Config = require 'data.config';
Hunting = {};

require 'client.utils.functions';
require 'client.modules.zones.client';
require 'client.modules.target.client';

CreateThread(function()
    for i = 1, #Config.Zones do
        local zone = Config.Zones[i]

        if zone.blip then
            zone.blip.coords = zone.coords
            zone.blip.radius = zone.radius
            zone.blip.color = zone.blip.color or 1
            zone.blip.sprite = zone.blip.sprite or 141
            zone.blip.name = zone.blip.name or 'Hunting Zone'
        end

        if not Hunting.Blips then Hunting.Blips = {} end
        if not Hunting.Zones then Hunting.Zones = {} end

        Hunting.Blips[#Hunting.Blips+1] = CreateBlip(zone.blip)
        Hunting.Zones[#Hunting.Zones+1] = CreateSphereZone(zone, i)
    end
end)

function HuntingThread()
    CreateThread(function()
        while true do
            if GetCurrentPedWeapon(cache.ped, false) ~= Config.General.huntingRifle then return end;

            
            
            
            Wait(7)
        end
    end)
end

RegisterNetEvent('lm-hunting:client:createdAnimal', CreateTargetOnEntity)

lib.callback.register('lm-hunting:cb:getGroundZ', function (x, y)
    local found, z = GetGroundZFor_3dCoord(x, y, 500.0, 0.0, false)

    return found and z or nil;
end)

RegisterCommand('hi', function ()
    TriggerServerEvent('lm-hunting:server:createAnimal', 1, 'a_c_deer') 
end)
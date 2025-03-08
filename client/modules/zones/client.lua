local Config = require 'data.config';

function CreateBlip(blipData)
    local radiusBlip = AddBlipForRadius(blipData.coords.x, blipData.coords.y, blipData.coords.z, blipData.radius)
    SetBlipHighDetail(radiusBlip, true)
    SetBlipColour(radiusBlip, blipData.color)
    SetBlipAlpha(radiusBlip, 128)

    local blip = AddBlipForCoord(blipData.coords.x, blipData.coords.y, blipData.coords.z)
    SetBlipHighDetail(blip, true)
    SetBlipSprite(blip, blipData.sprite)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, blipData.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.name)
    EndTextCommandSetBlipName(blip)
    
    return { blip = blip, radiusBlip = radiusBlip }
end

function onEnter(index)
    TriggerServerEvent('lm-hunting:server:addPlayer', cache.serverId, index)
end

function inside(index)

end

function onExit(index)
    TriggerServerEvent('lm-hunting:server:removePlayer', cache.serverId, index)
end

function CreateSphereZone(zone, i)
    local sphere = lib.zones.sphere({
        coords = zone.coords,
        radius = zone.radius,
        debug = Config.Debug,
        inside = HuntingThread(),
        onEnter = function ()
            onEnter(i)
        end,
        onExit = function ()
            onExit(i)
        end
    })

    return sphere;
end
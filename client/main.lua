local Config = require 'data.config';
require 'client.utils.functions';
require 'client.modules.zones.client';


local center = vector3(-745.4625, 4864.6240, 226.8306)
local radius = 50.0

local randomCoord = GetRandomPointInCircle(center, radius)
local Hunting = {};

CreateThread(function()
    for i = 1, #Config.Zones do
        local zone = Config.Zones[i]
        
        local sphere = lib.zones.sphere({
            coords = zone.coords,
            radius = zone.radius,
            debug = Config.Debug,
            inside = inside,
            onEnter = onEnter,
            onExit = onExit
        })

        if zone.blip then
            zone.blip.coords = zone.coords
            zone.blip.radius = zone.radius
            zone.blip.color = zone.blip.color or 1
            zone.blip.sprite = zone.blip.sprite or 141
            zone.blip.name = zone.blip.name or 'Hunting Zone'
        end

        Hunting.Blips[#Hunting.Blips+1] = CreateBlip(zone.blip)

        Hunting.Zones[#Hunting.Zones+1] = sphere
    end
end)
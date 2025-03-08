local Config = require 'data.config';
Hunting = {};
Hunting.Players = {};

require 'server.utils.functions';
require 'server.modules.peds.server';

RegisterNetEvent('lm-hunting:server:createAnimal', CreateAnimal)

RegisterNetEvent('lm-hunting:server:addPlayer', function (target, zone)
    if source ~= target then return end;

    Hunting.Players[zone] = Hunting.Players[zone] or {};
    Hunting.Players[zone][source] = true;
end)

RegisterNetEvent('lm-hunting:server:removePlayer', function (target, zone)
    if source ~= target then return end;

    Hunting.Players[zone] = Hunting.Players[zone] or {};
    Hunting.Players[zone][source] = nil;
end)

lib.cron.new(('*/%d * * * *'):format(math.ceil(Config.Interval / 60000)), function()
    for i = 1, #Config.Zones do
        if Hunting.Players[i] and next(Hunting.Players[i]) then
            local count = 0
            local source = 0;
            for player, active in pairs(Hunting.Players[i]) do
                if active then source = player count = count + 1 end
            end

            for _ = 1, count * Config.AnimalPerPlayer do
                CreateAnimal(source, i, Config.Animals[math.random(1, #Config.Animals)]['model'])
            end
        end
    end
end, { debug = Config.Debug })
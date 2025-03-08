local Config = require 'data.config';

function CreateAnimal(source, index, model)
    print(source, index, model, "DIT IS CREATE ANIMAL")
    local coords = GetRandomPointInCircle(source, Config.Zones[index].coords, Config.Zones[index].radius);

    CreateThread(function()
        if type(model) == "string" then
            model = joaat(model)
        end
        print(model)
        local ped = CreatePed(28, model, coords.x, coords.y, coords.z, math.random(0.0, 360.0), true, true)
        while not DoesEntityExist(ped) do
            Wait(50)
        end

        local netId = NetworkGetNetworkIdFromEntity(ped)
        print(ped, netId)
        lib.print.info(('Created model: %s on coords: %s'):format(model, json.encode(coords)));

        if not Hunting.Animals then Hunting.Animals = {} end
        Hunting.Animals[netId] = { model = model };
        
        TriggerClientEvent('lm-hunting:client:createdAnimal', -1, netId);
    end)
end;

function DeleteAnimal(id)
    local netId = NetworkDoesNetworkIdExist(id) and NetToPed(id);
    local ped = netId or id or nil;

    if not ped then return end;
    if not DoesEntityExist(ped) then return end;
    
    if Hunting.Animals[netId] then
        Hunting.Animals[netId] = nil;
    end;
end;

function GetAnimals()
    return Hunting.Animals;
end
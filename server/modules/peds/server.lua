local Config = require 'data.config';

function CreateAnimal(index, model)
    local coords = GetRandomPointInCircle(Config.Zones[index].coords, Config.Zones[index].radius);
    local ped = CreatePed(4, model, coords.x, coords.y, coords.z, 0.0, true, true);

    lib.print.info(('Created model: %s on coords: %s'):format(model, json.encode(coords)));

    local success = lib.waitFor(function () return DoesEntityExist(ped) end)
    if not success then return lib.print.error(('Failed to create model: %s'):format(model)) end

    local netId = NetworkGetNetworkIdFromEntity(ped)
    
    if not Hunting.Animals then Hunting.Animals = {} end

    Hunting.Animals[netId] = {
        model = model,
    };

    print(netId)

    TriggerClientEvent('lm-hunting:client:createdAnimal', -1, netId);
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
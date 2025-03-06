local Config = require 'data.config';

function CreateAnimal(index, model)

    local coords = GetRandomPointInCircle(Config.Zones[index].coords, Config.Zones[index].radius)
    local ped = CreatePed(4, model, coords.x, coords.y, coords.z, 0.0, false, true)
end
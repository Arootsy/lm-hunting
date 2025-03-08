lib.locale()
local Config = require 'data.config';

function SkinAnimal(data)
    local entity = data.entity;

    if not IsEntityDead(entity) then
        return
    end

    ProgressCircle({
        duration = Config.Skin.progressDuration,
        label = locale('skin_progress'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        },
        anim = {
            dict = 'mp_player_intdrink',
            clip = 'loop_bottle'
        },
    }, function (success)
        if success then
            TriggerServerEvent('lm-hunting:server:skinAnimal', NetworkGetNetworkIdFromEntity(entity))

            NetworkRequestControlOfEntity(entity)
            while not NetworkHasControlOfEntity(entity) do
                Wait(0)

                NetworkRequestControlOfEntity(entity)
            end

            DeleteEntity(entity)
        end
    end)
end

function CreateTargetOnEntity(entity)
    local timeout = 0
    while not NetworkDoesNetworkIdExist(entity) and timeout < 100 do
        Wait(50)
        timeout = timeout + 1
    end

    if not NetworkDoesNetworkIdExist(entity) then
        print("^1[ERROR] Network ID does not exist even after waiting!^7")
        return
    end

    local ped = NetworkGetEntityFromNetworkId(entity)

    if not DoesEntityExist(ped) then
        print("^1[ERROR] Entity does not exist on client!^7")
        return
    end

    local target = exports.ox_target:addLocalEntity(ped, {
        {
            label = locale('skin'),
            onSelect = SkinAnimal,
            canInteract = function (ped, distance, coords, name, bone)
                return IsEntityDead(ped)
            end
        }
    })

    SetPedSeeingRange(ped, 0.0);
    SetPedHearingRange(ped, 0.0);

    if not Hunting.Targets then Hunting.Targets = {} end;
    Hunting.Targets[NetworkGetNetworkIdFromEntity(ped)] = target;
end

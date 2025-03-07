lib.locale()

function CreateTargetOnEntity(entity)
    print(NetworkGetEntityFromNetworkId(entity))
    local ped = NetworkGetEntityFromNetworkId(entity)

    local target = exports.ox_target:addLocalEntity(ped, {
        {
            label = locale('skin'),
            onSelect = function ()
                
            end,
            canInteract = function (ped, distance, coords, name, bone)
                return not IsEntityDead(ped) and distance < 2.0
            end
        }
    })

    SetEntityAsMissionEntity(ped, true, true);
    SetBlockingOfNonTemporaryEvents(ped, true);
    SetPedFleeAttributes(ped, 0, false);
    SetPedCombatAttributes(ped, 17, true);
    SetPedSeeingRange(ped, 0.0);
    SetPedHearingRange(ped, 0.0);

    if not Hunting.Targets then Hunting.Targets = {} end
    Hunting.Targets[NetworkGetNetworkIdFromEntity(ped)] = target
end
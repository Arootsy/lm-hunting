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
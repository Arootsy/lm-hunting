function GetRandomPointInCircle(center, radius)
    local angle = math.random() * 2 * math.pi
    local distance = math.sqrt(math.random()) * radius

    local x = center.x + (math.cos(angle) * distance)
    local y = center.y + (math.sin(angle) * distance)
    
    local groundZ = 0.0
    local found, z = GetGroundZFor_3dCoord(x, y, center.z + 500.0, groundZ, false)
    if found then
        groundZ = z
    else
        groundZ = center.z
    end

    return vector3(x, y, groundZ)
end
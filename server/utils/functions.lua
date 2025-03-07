function GetRandomPointInCircle(center, radius)
    local angle = math.random() * 2 * math.pi
    local distance = math.sqrt(math.random()) * radius

    local x = center.x + (math.cos(angle) * distance)
    local y = center.y + (math.sin(angle) * distance)

    local groundZ = lib.callback.await('lm-hunting:cb:getGroundZ', source, x, y)

    print(groundZ)

    return vector3(x, y, groundZ)
end
function GetRandomPointInCircle(source, center, radius)
    print(source, json.encode({center, radius}))

    local x, y, groundZ

    repeat
        local angle = math.random() * 2 * math.pi
        local distance = math.sqrt(math.random()) * radius

        x = center.x + (math.cos(angle) * distance)
        y = center.y + (math.sin(angle) * distance)

        groundZ = lib.callback.await('lm-hunting:cb:getGroundZ', source, x, y)

        print(x, y, groundZ)
    until groundZ ~= nil and groundZ > 0
    
    return vector3(x, y, groundZ)
end
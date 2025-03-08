return {
    Debug = true, -- Enable or disable debug mode

    Interval = 60000, -- Interval in milliseconds to spawn animals

    AnimalPerPlayer = 2, -- Amount of animals to spawn per player per interval

    General = {
        license = true, -- Enable or disable hunting license
        maxAnimals = 10, -- Maximum amount of animals in the zone PER PLAYER!!
        buyItems = true, -- Enable or disable buying items
        huntingRifle = `WEAPON_LEE` -- Weapon hash leave `` instead of '' for hunting rifle
    },

    Shop = {
        coords = { x = -773.41, y = 5598.24, z = 33.60, h = 168.55 },
        ped = `CS_Hunter`,
        blip = { sprite = 463, color = 2, name = 'Hunt Shop' }, -- outcomment blip to disable it
        sellItems = {
            { name = 'deer', price = 1000, amount = 1 },
            { name = 'boar', price = 2000, amount = 1 },
            { name = 'rabbit', price = 500, amount = 1 },
            { name = 'bird', price = 200, amount = 1 },
        },
        buyItems = {
            { name = '', price = 5000, amount = 1 },
            { name = 'hunting_license', price = 1000, amount = 1 },
        }
    },
    
    Animals = {
        { animal = 'Pig',            model = `a_c_pig`    },
        { animal = 'Cow',            model = `a_c_cow`    },
        { animal = 'Boar',           model = `a_c_boar`   },
        { animal = 'Deer',           model = `a_c_deer`   },
        { animal = 'Coyote',         model = `a_c_coyote` },
    },

    Zones = {
        {
            coords = { x = -745.46, y = 4864.62, z = 226.83 }, -- Absolute center of the zone
            radius = 500.0, -- Radius of the zone
            blip = { sprite = 141, color = 1, name = 'Hunting Zone' }, -- outcomment blip to disable it
        }
    },

    Skin = {
        progressDuration = 10000, -- Duration of the skinning process in milliseconds
    }
}
function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 7.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Whether to have the target as a toggle or not
Config.Toggle = true

-- Draw a Sprite on the center of a PolyZone to hint where it's located
Config.DrawSprite = true

-- The default distance to draw the Sprite
Config.DrawDistance = 10.0

-- The color of the sprite in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.DrawColor = { 255, 255, 255, 255 }

-- The color of the sprite in rgb when the PolyZone is targeted, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.SuccessDrawColor = { 220, 20, 60, 255 }

-- The color of the outline in rgb, the first value is red, the second value is green, the third value is blue and the last value is alpha (opacity). Here is a link to a color picker to get these values: https://htmlcolorcodes.com/color-picker/
Config.OutlineColor = { 255, 255, 255, 255 }

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target eye, here you can find all the names: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.OpenKey = 'LMENU' -- Left Alt

-- Control for key press detection on the context menu, it's the Right Mouse Button by default, controls are found here https://docs.fivem.net/docs/game-references/controls/
Config.MenuControlKey = 238

-- Whether to disable ALL controls or only specificed ones
Config.DisableControls = true

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {
	["impount"] = {
        name = "impount",
        coords = vector3(455.04, -1024.48, 28.37),
        radius = 1.42,
        debugPoly = false,
        options = {
            {
                type = "client",
                event = "police:client:ImpoundMenuHeader",
                icon = "fas fa-shield-alt",
                label = "open impount",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0,  ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["weapReg"] = {
        name = "registerWeapon",
        coords = vector3(442.36, -984.07, 30.02),
        radius = .5,
        debugPoly = false,
        options = {
          {
            ----num = 1,
            type = "client",
            event = "ps-mdt:client:selfregister",
            icon = 'fa-solid fa-person-rifle', -- This is the icon that will display next to this trigger option <i class="fa-solid fa-person-rifle"></i>
            label = 'Register your Weapon',
        
          }
        },
        distance = 2.5,
      },
}

Config.BoxZones = {
	['FingerPrint'] = {
		name = 'FingerPrint',
		coords = vector3(473.17, -1007.08, 26.27),
		--debugPoly = true,
		length = 0.6,
		width = 0.6,
		heading = 1,
		minZ=25.67,
        maxZ=27.27,
		options = {
			{
                type = "client",
                event = "qb-police:client:scanFingerPrint",
                icon = "fas fa-fingerprint",
                label = "Scan Fingerprint",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0,  ["bcso"] = 0},
            },
		},
		distance = 1.5,
	},
    ['checkwarrant'] = {
		name = 'checkwarrant',
		coords = vector3(-550.93, -192.16, 38.22),
		--debugPoly = true,
		length = 1,
		width = 1.6,
		heading = 30,
		minZ = 35.02,
        maxZ = 39.02,
		options = {
			{
				type = "client",
                event = "checkwarrant",
                icon = "fas fa-shield-alt",
                label = "Check For Warrant",
			},
		},
		distance = 1.0,
	},
    ["dispatchcarcam"] = {
        name = "PD mugshot",
        coords = vector3(472.98, -1012.59, 26.27), 
        length = 0.4,
        width = 0.6,
        heading = 3,
        debugPoly = false,
        minZ=24.92,
        maxZ=27.12,
        options = {
            {
                type = "server",
                event = "anz-mugshot:client:takemugshot", 
                icon = "fa-regular fa-circle",
                label = "mug shot",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0,  ["bcso"] = 0},
            },
        },
        distance = 1.5
    },
    ["court-gavel"] = {
        name = "court-gavel",
        coords = vector3(-576.19, -209.92, 38.77),
        length = 1.55,
        width = 0.3,
        heading = 210,
        debugPoly = false,
        minZ = 38.52,
        maxZ = 38.72,
        options = {
            {
                type = "client",
                event = "police:client:judgeGavel",
                icon = "fa-solid fa-gavel",
                label = "Use Gavel",
            },
        },
        distance = 2.0
    },
    ["policeoutfit"] = {
		name = "police outfit",
		coords = vector3(459.84, -997.76, 30.69),
		length = 1.4,
		width = 0.6,
		heading = 0,
		debugPoly = false,
        minZ=29.49,
        maxZ=31.69,
		options = {
			{
				type = "client",
                event = "qb-clothing:client:openOutfitMenu",
                icon = "fas fa-tshirt",
                label = "Open shop",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
			},
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
		},
		distance = 2.5
	},
    ["sandyueostash "] = {
		name = "police stash ",
		coords = vector3(1780.76, 3650.25, 35.64),
		length = 0.6,
		width = 1.6,
		heading =300,
		debugPoly = false,
        minZ=34.29,
        maxZ=36.89,
		options = {
			{
				type = "client",
                event = "qb-clothing:client:openOutfitMenu",
                icon = "fas fa-tshirt",
                label = "Open shop",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
			},
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
		},
		distance = 2.5
	},
    ["sharrifoutfit"] = {
		name = "police outfit",
		coords = vector3(-438.79, 6009.89, 37.0),
		length = 1,
		width = 1,
		heading = 45,
		debugPoly = false,
        minZ=36.2,
        maxZ=38.2,
		options = {
			{
				type = "client",
                event = "qb-clothing:client:openOutfitMenu",
                icon = "fas fa-tshirt",
                label = "Open shop",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
			},
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
		},
		distance = 2.5
	},
    ["emsoutfit"] = {
        name = "ems outfit",
        coords = vector3(305.95959, -597.3302, 43.284057),
        length = 3,
        width = 1,
        heading = 337,
        debugPoly = false,
        minZ=42.19,
        maxZ=44.39,
        options = {
            {
                type = "client",
                event = "qb-clothing:client:openOutfitMenu",
                icon = "fas fa-tshirt",
                label = "Open shop",
                job = "ambulance",
            },
        },
        distance = 2.5
    },
	["policearmori"] = {
        name = "policearmori",
        coords = vector3(481.46, -994.89, 30.69),
        length = 3.2,
        width = 0.8,
        heading = 270,
        --debugPoly = true,
        minZ=28.89,
        maxZ=32.49,
        options = {
            {
                type = "client",
                event = "qb-police:client:openArmoury",
                icon = "fas fa-clipboard",
                label = "Access Armory",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["sandyarmori"] = {
        name = "sandy armori",
        coords = vector3(1776.0, 3646.39, 35.64),
        length = 3.8,
        width = 1,
        heading = 30,
        --debugPoly = true,
        minZ=34.44,
        maxZ=37.44,
        options = {
            {
                type = "client",
                event = "qb-police:client:openArmoury",
                icon = "fas fa-clipboard",
                label = "Access Armory",
                job = {["police"] = 3, ["sasp"] = 3, ["saspr"] = 3, ["bcso"] = 0},
            },
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["devisarmori"] = {
        name = "devisarmori",
        coords = vector3(360.95, -1599.59, 25.45),
        length = 2,
        width = 0.6,
        heading = 320,
        --debugPoly = true,
        minZ=24.25,
		maxZ=27.25,
        options = {
            {
                type = "client",
                event = "qb-police:client:openArmoury",
                icon = "fas fa-clipboard",
                label = "Access Armory",
                job = {["police"] = 3, ["sasp"] = 0, ["saspr"] = 3, ["bcso"] = 3},
            },
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["deviscafe"] = {
        name = "devis cafe",
        coords = vector3(366.57, -1586.3, 31.05),
        length = 1,
        width = 1,
        heading = 320,
        --debugPoly = true,
        minZ=27.45,
        maxZ=31.45,
        options = {
            {
                type = "client",
                event = "vendingCoffee:buy",
                icon = "fas fa-clipboard",
                label = "make cafe",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["mazebank"] = {
        name = "mazeabank",
        coords = vector3(-1309.29, -823.23, 17.15),
        length = 6.0,
        width = 1,
        heading = 307,
        --debugPoly = true,
        minZ=16.95,
        maxZ=18.15,
        options = {
            {
                type = "client",
                event = "qb-banking:openBankScreen",
                icon = "fas fa-piggy-bank",
                label = "Open Bank",
            },
        },
        distance = 2.5
    },
	["pawn"] = {
        name = "Pawnshop",
        coords = vector3(411.94, 315.5, 103.02),
        length = 2.35,
        width = 0.5,
        heading = 297,
        debugPoly = false,
        minZ = 100.87,
        maxZ = 104.67,
        options = {
            {
                event = "qb-pawnshop:client:openMenu",
                icon = "fas fa-ring",
                label = "Pawn Items",
            },
        },
        distance = 2.5
    },
    ["sandybcso"] = {
        name = "Duty Clipboard",
        coords = vector3(1757.62, 3650.93, 35.64),
        length = 2.4,
        width = 0.6,
        heading = 300,
        debugPoly = false,
        minZ=34.64,
        maxZ=36.04,
        options = {
            {
                type = "client",
                event = "qb-policejob:ToggleDuty",
                icon = "fas fa-sign-in-alt",
                label = "Sign In",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["chopchop"] = {
        name = "chop chop",
        coords = vector3(-550.94, -1791.7, 22.28),
        length = 0.8,
        width = 2.2,
        heading = 330,
        debugPoly = false,
        minZ=21.08,
        maxZ=23.28,
        options = {
            {
                type = "client",
                event = "qb-chopshop:jobaccept",
                icon = "fas fa-sign-in-alt",
                label = "start boosting",
                --job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["poletoSharrif"] = {
        name = "poletosharif",
        coords = vector3(-447.36, 6013.11, 32.29),
        length = 0.6,
        width = 1,
        heading = 315,
        debugPoly = false,
        minZ=31.29,
        maxZ=32.89,
        options = {
            {
                type = "client",
                event = "qb-policejob:ToggleDuty",
                icon = "fas fa-sign-in-alt",
                label = "Sign In",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["poletoSharrifarmory"] = {
        name = "poletosharifarmory",
        coords = vector3(-449.78, 6015.41, 37.0),
        length = 3.0,
        width = 1,
        heading = 315,
        debugPoly = false,
        minZ=36.0,
        maxZ=38.8,
        options = {
            {
                type = "client",
                event = "qb-police:client:openArmoury",
                icon = "fas fa-clipboard",
                label = "Access Armory",
                job = {["police"] = 3, ["sasp"] = 3, ["saspr"] = 3, ["bcso"] = 0},
            },
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["poletoSharrifstash"] = {
        name = "poletosharifstash",
        coords = vector3(-444.98, 6014.17, 37.01),
        length = 1,
        width = 1.2,
        heading = 315,
        debugPoly = false,
        minZ=36.01,
        maxZ=38.21,
        options = {
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["poletoSharrifboss"] = {
        name = "poletosharifboss",
        coords = vector3(-432.83, 6004.88, 37.0),
        length = 1.0,
        width = 0.6,
        heading = 315,
        debugPoly = false,
        minZ=36.4,
        maxZ=37.8,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fas fa-sign-in-alt",
                label = "Boss Menu",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["marabunta"] = {
        name = "marabuntaboss",
        coords = vector3(-3234.43, 812.8, 14.08),
        length = 1.4,
        width = 1,
        heading = 305,
        debugPoly = false,
        minZ=13.08,
        maxZ=14.68,
        options = {
            {
                type = "client",
                event = "qb-gangmenu:client:OpenMenu",
                icon = "fas fa-sign-in-alt",
                label = "Boss Menu",
                gang = {["marabunta"] = 3},
            },
        },
        distance = 2.5
    },
    ["bcsosandy"] = {
        name = "sharifboss",
        coords = vector3(1776.43, 3641.65, 40.4),
        length = 1.8,
        width = 1,
        heading = 300,
        debugPoly = false,
        minZ=39.6,
        maxZ=40.8,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fas fa-sign-in-alt",
                label = "Boss Menu",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["davisboss"] = {
        name = "davisboss",
        coords = vector3(356.47, -1591.5, 31.05),
        length = 1,
        width = 1,
        heading = 319,
        debugPoly = false,
        minZ=30.05,
        maxZ=31.65,
        options = {
            {
                type = "client",
                event = "qb-bossmenu:client:OpenMenu",
                icon = "fas fa-sign-in-alt",
                label = "Boss Menu",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    ["davisarmory"] = {
        name = "davisarmory",
        coords = vector3(365.3, -1603.99, 25.45),
        length = 4.4,
        width = 0.6,
        heading = 320,
        debugPoly = false,
        minZ=24.45,
        maxZ=27.25,
        options = {
            {
                type = "client",
                event = "qb-police:client:openArmoury",
                icon = "fas fa-clipboard",
                label = "Access Armory",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
            {
                type = "client",
                event = "Police-Stash",
                icon = "fas fa-sign-in-alt",
                label = "personal stash",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 2.5
    },
    -- ALL ABOUT MEDIC --
    ["emsmesai2"] = {
        name = "emsmesai2victory",
        coords = vector3(-812.44, -1236.76, 7.56),
        length = 1.0,
        width = 2.0,
        heading = 143.76,
        debugPoly = false,
        minZ = 6.0,
        maxZ = 8.5,
        options = {
            {
                type = "client",
                event = "EMSToggle:Duty",
                icon = "far fa-clipboard",
                label = "duty/off duty",
                job = "ambulance",
            },
        },
        distance = 2
    },
    ["emshastakayit2"] = {
        name = "emshastakayit2victory",
        coords = vector3(-817.27, -1236.58, 7.34),
        length = 1.0,
        width = 2.0,
        heading = 255.0,
        debugPoly = false,
        minZ = 6.0,
        maxZ = 7.5,
        options = {
            {
            type = "client",
            event = "qb-ambulancejob:checkin",
            icon = "fas fa-hand-holding",
            label = "Check-In",
            },
        },
        distance = 2
    },
    ["emstechizat2"] = {
        name = "emstechizat2victory",
        coords = vector3(-820.47, -1243.34, 7.34),
        length = 1.0,
        width = 2.0,
        heading = 160.0,
        debugPoly = false,
        minZ = 6.0,
        maxZ = 7.5,
        options = {
            {
                type = "client",
                event = "qb-ambulancejob:armory",
                icon = "fas fa-shield-alt",
                label = "Open Armory",
                job = "ambulance"
            },
            {
                type = "client",
                event = "qb-ambulancejob:stash",
                icon = "fas fa-box",
                label = "Personal Stash",
                job = "ambulance"
            },
        },
        distance = 2.5
    },
    ["policegarage"] = {
        name = "garage",
        coords = vector3(441.45, -974.63, 25.7),
        length = 1.0,
        width = 1.0,
        heading = 0,
        debugPoly = false,
        minZ=24.3,
        maxZ=26.9,
        options = {
            {
                type = "client",
                event = "police:client:VehicleMenuHeader",
                label = 'Open Garage',
                icon = "fas fa-warehouse",
                job = 'police',
            },
            {
                type = "client",
                event = "qb-policejob:returnveh",
                label = 'Store Vehicle',
                icon = "fas fa-history",
                job = 'police',
            },
        },
        distance = 4.0
    },
}

Config.PolyZones = {

}


Config.TargetBones = {
	["main"] = {
        bones = {
            "seat_dside_f",
            "seat_pside_f",
            "seat_dside_r",
            "seat_pside_r",
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r",
            "hbgrip_l",
            "hbgrip_r"
        },
        options = {
            {
                type = "client",
                event = 'police:client:PutPlayerInVehicle',
                icon = "fas fa-user-plus",
                label = "Seat in Vehicle",
            },
            {
                type = "client",
                event = "police:client:SetPlayerOutVehicle",
                icon = "fas fa-user-minus",
                label = "Take out Vehicle",
            },
            {
                type = "client",
                event = "police:client:ImpoundVehicle",
                icon = "fas fa-car",
                label = "Impound Vehicle",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
            {
                type = "client",
                event = "qb-trunk:client:GetIn",
                icon = "fas fa-user-secret",
                label = "Get in Trunk",
            },
        },
        distance = 2.0
    },
}

Config.TargetModels = {
	["grandma"] = {
        models = {
            `a_f_o_genstreet_01`,
        },
        options = {
            {
                type = "client",
                event = "nc-grandma:client:MedicalAid",
                icon = "fas fa-medkit",
                label = "Ask Grandma for blessing",
            },
        },
        distance = 2.5,
    },
	["pillboxarmory"] = {
            models = {
        `s_m_y_autopsy_01`,
        },
        options = {
            {
                type = "client",
                event = "qb-ambulancejob:armory",
                icon = "fas fa-shield-alt",
                label = "Open Armory",
                job = "ambulance"
            },
            {
                type = "client",
                event = "qb-ambulancejob:stash",
                icon = "fas fa-box",
                label = "Personal Stash",
                job = "ambulance"
            },
        },
        distance = 2.5
    },
	["EMScheckin"] = {
        models = {
            "s_f_y_scrubs_01",
        },
        options = {
            {
                type = "client",
                event = "qb-ambulancejob:checkin",
                icon = "fas fa-search",
                label = 'Check in / Call Doctor',
            },
        },
        distance = 3.5,
    },
    ["ondutypolice"] = {
        models = {
            "s_m_y_cop_01",
        },
        options = {
            {
                type = "client",
                event = "qb-policejob:ToggleDuty",
                icon = "fas fa-sign-in-alt",
                label = "Clock In / Out",
                job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            },
        },
        distance = 3.0,
    },
	
	["drinkVending"] = {
        models =     {
            "prop_vend_soda_01",
            "prop_vend_soda_02",
            "prop_vend_water_01",
            "prop_watercooler",
            'prop_watercooler_dark',
        },
        options = {
            {
                type = "client",
                event = 'vendingDrink:buy',
                icon = "fas fa-shopping-basket",
                label = "Insert Coin",
            },
        },
        distance = 2.5
    },
    ["vendingSnack"] = {
        models =     {
            "prop_vend_snak_01",
            "prop_vend_snak_01_tu"
        },
        options = {
            {
                type = "client",
                event = 'vendingSnack:buy',
                icon = "fas fa-shopping-basket",
                label = "Insert Coin",
            },
        },
        distance = 2.5
    },
    ["vendingCoffee"] = {
        models =     {
            "prop_vend_coffe_01",
            "apa_mp_h_acc_coffeemachine_01",
            "prop_coffee_mac_02"
        },
        options = {
            {
                type = "client",
                event = 'vendingCoffee:buy',
                icon = "fas fa-shopping-basket",
                label = "Insert Coin",
            },
        },
        distance = 2.5
    },
}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {
	options = {
        -- {
        --     type = "client",
        --     event = "qb-policejob:client:actions",
        --     icon = 'fa-regular fa-circle',
        --     label = 'Police Actions',
        --     job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
        -- },
		{
            type = "client",
            event = "police:client:CuffPlayer",
            icon = "fas fa-hands",
            label = "Cuff / Uncuff",
            item = 'handcuffs',
		    job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0,  ["ambulance"] = 0},
        },
        {
            type = "client",
            event = "hospital:client:RevivePlayer",
            icon = "fas fa-Hand-Holding-Heart",
            label = "use firstaid",
            item = 'firstaid',
            job = "ambulance",
        },
		{
            type = "client",
            event = 'police:client:takeoffmask',
            icon = 'fas fa-theater-masks',
            label = 'take off mask',
            job = {["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
        },
        {
            type = 'client',
            icon = 'user-group',
            event = 'police:client:EscortPlayer',
            label = "Escort",
            --job = {["ambulance"] = 0,["police"] = 0, ["sasp"] = 0, ["saspr"] = 0, ["bcso"] = 0},
            
        },
        {
            type = "client",
            event = "qs-smartphone:client:GiveContactDetails",
            icon = "fas fa-hand-holding",
            label = "Share number",
        },
        
    },
    distance = 2.0,
}

Config.Peds = {

}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function JobTypeCheck() return true end
local function ItemCheck() return true end
local function CitizenCheck() return true end

CreateThread(function()
	local state = GetResourceState('qb-core')
	if state ~= 'missing' then
		local timeout = 0
		while state ~= 'started' and timeout <= 100 do
			timeout += 1
			state = GetResourceState('qb-core')
			Wait(0)
		end
		Config.Standalone = false
	end
	if Config.Standalone then
		local firstSpawn = false
		local event = AddEventHandler('playerSpawned', function()
			SpawnPeds()
			firstSpawn = true
		end)
		-- Remove event after it has been triggered
		while true do
			if firstSpawn then
				RemoveEventHandler(event)
				break
			end
			Wait(1000)
		end
	else
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCheck = QBCore.Functions.HasItem

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		JobTypeCheck = function(jobType)
			if type(jobType) == 'table' then
				jobType = jobType[PlayerData.job.type]
				if jobType then
					return true
				end
			elseif jobType == 'all' or jobType == PlayerData.job.type then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.excludejob and JobCheck(data.excludejob) then return false end
	if data.jobType and not JobTypeCheck(data.jobType) then return false end
	if data.excludejobType and JobTypeCheck(data.excludejobType) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.excludegang and GangCheck(data.excludegang) then return false end
	if data.item and not ItemCheck(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end

-- leave this line as is
brawl.config = brawl.config or {}

--[[-------------------------------------------------------------------------
CUSTOM CONFIGURATION FILE
	Here you can set your gamemode for you.
	There's not much info here but it's only for now.
---------------------------------------------------------------------------]]

-- basic server configuration
brawl.config.server = {

	name = "Just another Brawl server (v" .. brawl.version .. ")",
	password = "",
	loadingURL = "",

	-- these commands will be executed by server during map loading
	runCommands = {
		"net_maxfilesize 64",
	},

	-- this is CLIENT content, thus it will NOT be downloaded by server
	-- place here any models, materials etc. content INSTEAD of telling players to subscribe to addons
	workshop = {
		-- DO NOT delete these addons, they are required by gamemode
		"1095528851",
		"1095539006",
		"1095542254",
		"1095545406",
		"1095548291",

		-- you can add here more addons, however you should leave these ones here if you use default player models
		"232636218", -- PMC models
		"400617936", -- COD4 sniper
		"297516501", -- Insurgency bullet holes
	},

}

-- various player settings
brawl.config.player = {
	baseWalkSpeed = 200,
	baseRunSpeed = 300,

	staminaRegenDelay = 2,
	staminaRegenRate = 15,
	staminaSprintCost = 25,
	staminaJumpCost = 15,
	healthRegenDelay = 10,
	healthRegenRate = 2,
}

-- map list, maps MUST be setup here before
brawl.config.maps = {
	dm_basebunker = {
		name = "Base Bunker", workshop = "812797510",
		img = "http://images.akamai.steamusercontent.com/ugc/105103266291569905/B36E449E2CEEA7806542A3C1741399681DB606F3/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	ahl2_fishdock = {
		name = "Fish Docks", workshop = "914554901",
		img = "https://steamuserimages-a.akamaihd.net/ugc/817810804115581770/224BB5D5C35C8B2D72DEB408C10E834014D1221B/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	dm_island18_night = {
		name = "Island 18", workshop = "284612894",
		img = "https://steamuserimages-a.akamaihd.net/ugc/577901446709652492/0E3F2454B9E1AE67A8CCC22F284B1183F02DF155/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	-- dm_montana = {
	-- 	name = "Montana", workshop = "563904685",
	-- 	img = "http://images.akamai.steamusercontent.com/ugc/392173784278456259/464BBA8D0D4F766BE829F60D291458D993FADE54/",
	-- 	modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	-- },
	dm_torque = {
		name = "Torque", workshop = "442990905",
		img = "http://images.akamai.steamusercontent.com/ugc/544152440190283835/F6E77E18AD0A573938CD33380B427DE2C3811C2D/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	ttt_rooftops_2016_v1 = {
		name = "Rooftops", workshop = "534491717",
		img = "http://images.akamai.steamusercontent.com/ugc/574565056146367881/1954061909AB6D49DD91E8704150FA3942A27C7E/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	de_desert_atrocity_v3 = {
		name = "Atrocity", workshop = "242494243",
		img = "http://images.akamai.steamusercontent.com/ugc/3300317637498361777/12D826D67E9592CC37D866016FEE13B4087625E5/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	de_forest = {
		name = "Forest", workshop = "106821161",
		img = "https://steamuserimages-a.akamaihd.net/ugc/920118814791669595/29413F17721E7E2750D3C0F9A8F26CFEC9230B10/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	dm_streetwar_b1 = {
		name = "Streetwar", workshop = "446039435",
		img = "https://steamuserimages-a.akamaihd.net/ugc/540775374405727353/1982CA9E54A819E09EB2DFCFAD6C679D12BA8E62/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	dm_drift = {
		name = "Drift", workshop = "837801728",
		img = "https://steamuserimages-a.akamaihd.net/ugc/98351028244622841/63D32956715BFAFC440D13D9E942739DC05BFB33/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	dm_railyard = {
		name = "Railyard", workshop = "128029375",
		img = "https://steamuserimages-a.akamaihd.net/ugc/1117161388864327502/CD43A240D52A5B1120FF5370A85C45C3AC949B08/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	ahl2_snowmax = {
		name = "SnowMax", workshop = "914563424",
		img = "https://steamuserimages-a.akamaihd.net/ugc/817810804115660796/92935CAF7ABC9E2EE5B744E2B8B7D236DF6CFEFB/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	dm_mines = {
		name = "Mines", workshop = "660390276",
		img = "https://steamuserimages-a.akamaihd.net/ugc/456361914572272301/38F42B71F3FBA53B1BAC646501887E75B4DDB151/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	dm_global = {
		name = "Global", workshop = "446155220",
		img = "https://steamuserimages-a.akamaihd.net/ugc/540775374406305801/EB8B7298F7C7DE35324B63C881457C8301A6AD28/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},
	dm_construction = {
		name = "Construction", workshop = "863985236",
		img = "https://steamuserimages-a.akamaihd.net/ugc/89347071775451938/FDCE7BC93A97DC65461B6162486C8513A0D0D38E/",
		modes = { "ffa_dm", "ffa_el", "squad_dm", "squad_el", "team_dm", "team_el", "gg" },
	},

	-- add more maps by using this template

	-- MAP_NAME_WITHOUT_BSP = {
	-- 	name = "NICE MAP NAME", workshop = "WORKSHOP ID",
	-- 	img = "URL TO SCREENSHOT",
	-- 	modes = { "ALLOWED", "MODES", "SEE", "EXAMPLES", "ABOVE" },
	-- },
}

-- player models, level needed for models is in brackets
-- one random model out of this list will be chosen
brawl.config.playerModels = {

	[1] = {
		-- "models/player/pmc_1/pmc__02.mdl",
		"models/player/pmc_2/pmc__02.mdl",
		-- "models/player/pmc_3/pmc__02.mdl",
		-- "models/player/pmc_4/pmc__02.mdl",
		-- "models/player/pmc_5/pmc__02.mdl",
		-- "models/player/pmc_6/pmc__02.mdl",
	},

	[3] = {
		-- "models/player/pmc_1/pmc__03.mdl",
		"models/player/pmc_2/pmc__03.mdl",
		-- "models/player/pmc_3/pmc__03.mdl",
		-- "models/player/pmc_4/pmc__03.mdl",
		-- "models/player/pmc_5/pmc__03.mdl",
		-- "models/player/pmc_6/pmc__03.mdl",
	},

	[6] = {
		-- "models/player/pmc_1/pmc__04.mdl",
		"models/player/pmc_2/pmc__04.mdl",
		-- "models/player/pmc_3/pmc__04.mdl",
		-- "models/player/pmc_4/pmc__04.mdl",
		-- "models/player/pmc_5/pmc__04.mdl",
		-- "models/player/pmc_6/pmc__04.mdl",
	},

	[9] = {
		-- "models/player/pmc_1/pmc__10.mdl",
		"models/player/pmc_2/pmc__10.mdl",
		-- "models/player/pmc_3/pmc__10.mdl",
		-- "models/player/pmc_4/pmc__10.mdl",
		-- "models/player/pmc_5/pmc__10.mdl",
		-- "models/player/pmc_6/pmc__10.mdl",
	},

	[12] = {
		-- { "models/player/pmc_1/pmc__11.mdl", "models/player/pmc_1/pmc__12.mdl" },
		{ "models/player/pmc_2/pmc__11.mdl", "models/player/pmc_2/pmc__12.mdl" },
		-- { "models/player/pmc_3/pmc__11.mdl", "models/player/pmc_3/pmc__12.mdl" },
		-- { "models/player/pmc_4/pmc__11.mdl", "models/player/pmc_4/pmc__12.mdl" },
		-- { "models/player/pmc_5/pmc__11.mdl", "models/player/pmc_5/pmc__12.mdl" },
		-- { "models/player/pmc_6/pmc__11.mdl", "models/player/pmc_6/pmc__12.mdl" },
	},

	[15] = {
		-- { "models/player/pmc_1/pmc__08.mdl", "models/player/pmc_1/pmc__09.mdl" },
		{ "models/player/pmc_2/pmc__08.mdl", "models/player/pmc_2/pmc__09.mdl" },
		-- { "models/player/pmc_3/pmc__08.mdl", "models/player/pmc_3/pmc__09.mdl" },
		-- { "models/player/pmc_4/pmc__08.mdl", "models/player/pmc_4/pmc__09.mdl" },
		-- { "models/player/pmc_5/pmc__08.mdl", "models/player/pmc_5/pmc__09.mdl" },
		-- { "models/player/pmc_6/pmc__08.mdl", "models/player/pmc_6/pmc__09.mdl" },
	},

	[18] = {
		-- "models/player/pmc_1/pmc__05.mdl",
		"models/player/pmc_2/pmc__05.mdl",
		-- "models/player/pmc_3/pmc__05.mdl",
		-- "models/player/pmc_4/pmc__05.mdl",
		-- "models/player/pmc_5/pmc__05.mdl",
		-- "models/player/pmc_6/pmc__05.mdl",
	},

	[21] = {
		-- "models/player/pmc_1/pmc__06.mdl",
		"models/player/pmc_2/pmc__06.mdl",
		-- "models/player/pmc_3/pmc__06.mdl",
		-- "models/player/pmc_4/pmc__06.mdl",
		-- "models/player/pmc_5/pmc__06.mdl",
		-- "models/player/pmc_6/pmc__06.mdl",
	},

	[24] = {
		-- { "models/player/pmc_1/pmc__13.mdl", "models/player/pmc_1/pmc__14.mdl" },
		{ "models/player/pmc_2/pmc__13.mdl", "models/player/pmc_2/pmc__14.mdl" },
		-- { "models/player/pmc_3/pmc__13.mdl", "models/player/pmc_3/pmc__14.mdl" },
		-- { "models/player/pmc_4/pmc__13.mdl", "models/player/pmc_4/pmc__14.mdl" },
		-- { "models/player/pmc_5/pmc__13.mdl", "models/player/pmc_5/pmc__14.mdl" },
		-- { "models/player/pmc_6/pmc__13.mdl", "models/player/pmc_6/pmc__14.mdl" },
	},

	[27] = {
		-- "models/player/pmc_1/pmc__07.mdl",
		"models/player/pmc_2/pmc__07.mdl",
		-- "models/player/pmc_3/pmc__07.mdl",
		-- "models/player/pmc_4/pmc__07.mdl",
		-- "models/player/pmc_5/pmc__07.mdl",
		-- "models/player/pmc_6/pmc__07.mdl",
	},

	[30] = {
		-- "models/player/pmc_1/pmc__01.mdl",
		"models/player/pmc_2/pmc__01.mdl",
		-- "models/player/pmc_3/pmc__01.mdl",
		-- "models/player/pmc_4/pmc__01.mdl",
		-- "models/player/pmc_5/pmc__01.mdl",
		-- "models/player/pmc_6/pmc__01.mdl",
	},

	[33] = {
		"models/jessev92/player/military/cod4_sniper.mdl"
	},

}

-- weapon classes (better leave them default)
brawl.config.weapons = {

	melee = {
		"cw_extrema_ratio_official",
		"cw_fc2_machete",
		"cw_gerber_gator",
		"cw_ws_pamachete",
	},

	secondary = {
		"cw_deagle",
		"cw_fiveseven",
		"cw_m1911",
		"cw_makarov",
		"cw_mr96",
		"cw_p99",
		"cw_shorty",
		"khr_38snub",
		"khr_410jury",
		"khr_cz52",
		"khr_cz75",
		"khr_deagle",
		"khr_gsh18",
		"khr_m92fs",
		"khr_makarov",
		"khr_microdeagle",
		"khr_model29",
		"khr_mp443",
		"khr_ots33",
		"khr_p226",
		"khr_p345",
		"khr_ragingbull",
		"khr_ruby",
		-- "khr_rugermk3",
		"khr_sr1m",
		"khr_swr8",
		"khr_tokarev",
	},

	primary = {
		smgs = {
			"cw_mac11",
			"cw_mp5",
			"cw_ump45",
			"khr_fmg9",
			"khr_mp40",
			"khr_mp5a4",
			"khr_mp5a5",
			"khr_p90",
			"khr_vector",
			"khr_veresk",
		},

		shotguns = {
			"cw_m3super90",
			"khr_m620",
			"khr_mp153",
			"khr_ns2000",
			"khr_toz194",
		},

		rifles = {
			"cw_ak74",
			"cw_ar15",
			"cw_auggsm",
			"cw_g36c",
			"cw_g3a3",
			-- "cw_g4p_m16a3",
			"cw_m14",
			"cw_scarh",
			"khr_aek971",
			"khr_ak103",
			"khr_cz858",
			-- "khr_delisle",
			"khr_fnfal",
			"khr_l2a3",
			"khr_m1carbine",
			-- "khr_mosin",
			"khr_simsks",
			"khr_sks",
			"cw_l85a2",
		},

		snipers = {
			-- "cw_jng90",
			"cw_l115",
			"cw_vss",
			"khr_m82a3",
			"khr_m95",
			"khr_sr338",
			"khr_svt40",
			"khr_t5000",
		},

		heavy = {
			"cw_a35",
			"cw_m249_official",
			"khr_hmg",
			"khr_m60",
			"khr_pkm",
		},
	},

	extra = {
		"cw_flash_grenade",
		"cw_frag_grenade",
		"cw_smoke_grenade",
	},

}

-- debug mode (for developers)
brawl.config.debug = false

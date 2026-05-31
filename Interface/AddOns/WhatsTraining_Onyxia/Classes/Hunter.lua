--[[  file meta info
  @file     Hunter.lua
  @brief    Tables of spell IDs for class
--]]

--[[
  @brief    Accessing the addons private table

  @var  _   addonName, thrown away
  @var  wt    Global addonTable
--]]
local _, wt = ...

--[[
  @brief    Check if the data should be loaded or not
  @return   If not "HUNTER", then return with nothing
--]]
if (wt.currentClass ~= "HUNTER") then
  return
end

local expac = GetExpansionLevel()

--[[
  @brief    Table for trainable spells for each level

  @table    [n]   Table containing spells available at level n

        @var    id          Spell id
        @var    cost        Cost in copper
        @table    requiredIds     Table containing prerequisite spell IDs
        @var    requiredTalentId  Spell ID of prerequisite talent
        @var    faction       "Alliance" or "Horde" for faction specific spells
--]]
local SpellsByLevel = {
[0] = { --Vanilla Spells
  [1] = {
    {id = 1494, cost = 10}
  },
  [4] = {
    {id = 13163, cost = 100},
    {id = 1978, cost = 100}
  },
  [6] = {
    {id = 3044, cost = 100},
    {id = 1130, cost = 100}
  },
  [8] = {
    {id = 5116, cost = 200},
    {id = 3127, cost = 200},
    {id = 14260, cost = 200}
  },
  [10] = {
    {id = 13165, cost = 400},
    {id = 13549, cost = 400, requiredIds = {1978}},
    {id = 19883, cost = 400}
  },
  [12] = {
    {id = 14281, cost = 600, requiredIds = {3044}},
    {id = 20736, cost = 600},
    {id = 136, cost = 600, requiredIds = {1515}},
    {id = 2974, cost = 600}
  },
  [14] = {
    {id = 6197, cost = 1200},
    {id = 1002, cost = 1200},
    {id = 1513, cost = 1200}
  },
  [16] = {
    {id = 13795, cost = 1800},
    {id = 1495, cost = 1800},
    {id = 14261, cost = 1800, requiredIds = {14260}}
  },
  [18] = {
    {id = 14318, cost = 2000, requiredIds = {13165}},
		{id = 2643, cost = 2000},
    {id = 13550, cost = 2000, requiredIds = {13549}},
    {id = 19884, cost = 2000}
  },
  [20] = {
    {id = 14282, cost = 2200, requiredIds = {14281}},
    {id = 5118, cost = 2200},
		{id = 781, cost = 2200},
    {id = 14274, cost = 2200, requiredIds = {20736}},
    {id = 674, cost = 2200},
    {id = 1499, cost = 2200},
		{id = 3111, cost = 2200, requiredIds = {136}},
  },
  [22] = {
    {id = 14323, cost = 6000, requiredIds = {1130}},
    {id = 3043, cost = 6000}
  },
  [24] = {
    {id = 1462, cost = 7000},
    {id = 14262, cost = 7000, requiredIds = {14261}},
    {id = 19885, cost = 7000}
  },
  [26] = {
    {id = 14302, cost = 7000, requiredIds = {13795}},
    {id = 3045, cost = 7000},
    {id = 13551, cost = 7000, requiredIds = {13550}},
    {id = 19880, cost = 7000}
  },
  [28] = {
    {id = 20900, cost = 400, requiredIds = {19434}, requiredTalentId = 19434},
		{id = 14283, cost = 8000, requiredIds = {14282}},
    {id = 14319, cost = 8000, requiredIds = {14318}},
    {id = 13809, cost = 8000},
    {id = 3661, cost = 8000, requiredIds = {3111}}
  },
  [30] = {
		{id = 13161, cost = 8000},
    {id = 15629, cost = 8000, requiredIds = {14274}},
    {id = 5384, cost = 8000},
    {id = 14269, cost = 8000, requiredIds = {1495}},
    {id = 14288, cost = 8000, requiredIds = {2643}},
    {id = 14326, cost = 8000, requiredIds = {1513}},
  },
  [32] = {
    {id = 1543, cost = 10000},
    {id = 14263, cost = 10000, requiredIds = {14262}},
    {id = 14275, cost = 10000, requiredIds = {3043}},
    {id = 19878, cost = 10000}
  },
  [34] = {
    {id = 14272, cost = 12000, requiredIds = {781}},
    {id = 13813, cost = 12000},
    {id = 13552, cost = 12000, requiredIds = {13551}}
  },
  [36] = {
    {id = 20901, cost = 700, requiredIds = {20900}, requiredTalentId = 19434},
		{id = 14284, cost = 14000, requiredIds = {14283}},
    {id = 14303, cost = 14000, requiredIds = {14302}},
    {id = 3662, cost = 14000, requiredIds = {3661}},
		{id = 3034, cost = 14000}
  },
  [38] = {
    {id = 14320, cost = 16000, requiredIds = {14319}},
    {id = 14267, cost = 16000, requiredIds = {2974}}
  },
  [40] = {
		{id = 13159, cost = 18000},
    {id = 15630, cost = 18000, requiredIds = {15629}},
    {id = 14310, cost = 18000, requiredIds = {1499}},
    {id = 14324, cost = 18000, requiredIds = {14323}},
    {id = 14264, cost = 18000, requiredIds = {14263}},
		{id = 19882, cost = 18000},
    {id = 1510, cost = 18000},
    {id = 1510, cost = 18000}
  },
  [42] = {
    {id = 20909, cost = 1200, requiredIds = {19306}, requiredTalentId = 19306},
    {id = 14289, cost = 24000, requiredIds = {14288}},
    {id = 14276, cost = 24000, requiredIds = {14275}},
    {id = 13553, cost = 24000, requiredIds = {13552}}
  },
  [44] = {
    {id = 20902, cost = 1300, requiredIds = {20901}, requiredTalentId = 19434},
		{id = 14285, cost = 26000, requiredIds = {14284}},
    {id = 14316, cost = 26000, requiredIds = {13813}},
    {id = 13542, cost = 26000, requiredIds = {3662}},
    {id = 14270, cost = 26000, requiredIds = {14269}}
  },
  [46] = {
    {id = 20043, cost = 28000},
    {id = 14304, cost = 28000, requiredIds = {14303}},
    {id = 14327, cost = 28000, requiredIds = {14326}},
    {id = 14279, cost = 28000, requiredIds = {3034}}
  },
  [48] = {
    {id = 14321, cost = 32000, requiredIds = {14320}},
    {id = 14273, cost = 32000, requiredIds = {14272}},
    {id = 14265, cost = 32000, requiredIds = {14264}}
  },
  [50] = {
    {id = 15631, cost = 36000, requiredIds = {15630}},
    {id = 13554, cost = 36000, requiredIds = {13553}},
		{id = 19879, cost = 36000},
    {id = 20905, cost = 1800, requiredIds = {19506}, requiredTalentId = 19506},
		{id = 14294, cost = 36000, requiredIds = {1510}},
    {id = 24132, cost = 1800, requiredIds = {19386}, requiredTalentId = 19386}
  },
  [52] = {
    {id = 20903, cost = 2000, requiredIds = {20902}, requiredTalentId = 19434},
		{id = 14286, cost = 40000, requiredIds = {14285}},
    {id = 13543, cost = 40000, requiredIds = {13542}},
    {id = 14277, cost = 40000, requiredIds = {14276}}
  },
  [54] = {
    {id = 20910, cost = 2100, requiredIds = {20909}, requiredTalentId = 19306},
		{id = 14317, cost = 42000, requiredIds = {14316}},
    {id = 14290, cost = 42000, requiredIds = {14289}},
  },
  [56] = {
    {id = 20190, cost = 46000, requiredIds = {20043}},
    {id = 14305, cost = 46000, requiredIds = {14304}},
    {id = 14266, cost = 46000, requiredIds = {14265}},
    {id = 14280, cost = 46000, requiredIds = {14279}}
  },
  [58] = {
    {id = 14322, cost = 48000, requiredIds = {14321}},
    {id = 14325, cost = 48000, requiredIds = {14324}},
    {id = 14271, cost = 48000, requiredIds = {14270}},
    {id = 13555, cost = 48000, requiredIds = {13554}},
    {id = 14295, cost = 48000, requiredIds = {14294}}
  },
  [60] = {
    {id = 20904, cost = 2500, requiredIds = {20903}, requiredTalentId = 19434},
		{id = 14287, cost = 50000, requiredIds = {14286}},
    {id = 15632, cost = 50000, requiredIds = {15631}},
    {id = 14311, cost = 50000, requiredIds = {14310}},
    {id = 13544, cost = 50000, requiredIds = {13543}},
    {id = 20906, cost = 2500, requiredIds = {20905}, requiredTalentId = 19506},
		{id = 14268, cost = 50000, requiredIds = {14267}},
    {id = 24133, cost = 2500, requiredIds = {24132}, requiredTalentId = 19386}
  },
},
[1] = { --TBC Spells
  [1] = {
    {id = 1494, cost = 10},
  },
	[4] = {
    {id = 13163, cost = 100},
    {id = 1978, cost = 100},
  },
	[6] = {
    {id = 3044, cost = 100},
    {id = 1130, cost = 100},
  },
	[8] = {
    {id = 3127, cost = 200},
    {id = 5116, cost = 200},
    {id = 14260, cost = 200},
  },
	[10] = {
    {id = 13165, cost = 400},
    {id = 13549, cost = 400, requiredIds = {1978}},
    {id = 19883, cost = 400},
    {id = 4195, cost = 10},
    {id = 24547, cost = 10},
  },
	[12] = {
    {id = 136, cost = 600, requiredIds = {1515}},
    {id = 14281, cost = 600, requiredIds = {3044}},
    {id = 20736, cost = 600},
    {id = 2974, cost = 600},
    {id = 4196, cost = 120, requiredIds = {4195}},
    {id = 24556, cost = 120, requiredIds = {24547}},
  },
	[14] = {
    {id = 6197, cost = 1200},
    {id = 1002, cost = 1200},
    {id = 1513, cost = 1200},
  },
	[16] = {
    {id = 13795, cost = 1800},
    {id = 1495, cost = 1800},
    {id = 14261, cost = 1800, requiredIds = {14260}},
  },
	[18] = {
    {id = 14318, cost = 2000, requiredIds = {13165}},
    {id = 2643, cost = 2000},
    {id = 13550, cost = 2000, requiredIds = {13549}},
    {id = 19884, cost = 2000},
    {id = 4197, cost = 400, requiredIds = {4196}},
    {id = 24557, cost = 400, requiredIds = {24556}},
  },
	[20] = {
    {id = 5118, cost = 2200},
    {id = 3111, cost = 2200, requiredIds = {136}},
    {id = 674, cost = 2200},
    {id = 14282, cost = 2200, requiredIds = {14281}},
    {id = 14274, cost = 2200, requiredIds = {20736}},
    {id = 781, cost = 2200},
    {id = 1499, cost = 2200},
    {id = 24495, cost = 440},
    {id = 24440, cost = 440},
    {id = 24475, cost = 440},
    {id = 14923, cost = 440},
    {id = 24494, cost = 440},
    {id = 24490, cost = 440},
  },
	[22] = {
    {id = 14323, cost = 6000, requiredIds = {1130}},
    {id = 3043, cost = 6000},
  },
	[24] = {
    {id = 1462, cost = 7000},
    {id = 14262, cost = 7000, requiredIds = {14261}},
    {id = 19885, cost = 7000},
    {id = 4198, cost = 1400, requiredIds = {4197}},
    {id = 24558, cost = 1400, requiredIds = {24557}},
  },
	[26] = {
    {id = 3045, cost = 7000},
    {id = 13551, cost = 7000, requiredIds = {13550}},
    {id = 14302, cost = 7000, requiredIds = {13795}},
    {id = 19880, cost = 7000},
  },
	[28] = {
    {id = 14319, cost = 8000, requiredIds = {14318}},
    {id = 3661, cost = 8000, requiredIds = {3111}},
    {id = 20900, cost = 400, requiredIds = {19434}, requiredTalentId = 19434},
    {id = 14283, cost = 8000, requiredIds = {14282}},
    {id = 13809, cost = 8000},
  },
	[30] = {
    {id = 13161, cost = 8000},
    {id = 14326, cost = 8000, requiredIds = {1513}},
    {id = 15629, cost = 8000, requiredIds = {14274}},
    {id = 14288, cost = 8000, requiredIds = {2643}},
    {id = 5384, cost = 8000},
    {id = 14269, cost = 8000, requiredIds = {1495}},
    {id = 24508, cost = 1600, requiredIds = {24495}},
    {id = 35694, cost = 3000},
    {id = 25076, cost = 1600},
    {id = 24441, cost = 1600, requiredIds = {24440}},
    {id = 24476, cost = 1600, requiredIds = {24475}},
    {id = 4199, cost = 1600, requiredIds = {4198}},
    {id = 14924, cost = 1600, requiredIds = {14923}},
    {id = 24559, cost = 1600, requiredIds = {24558}},
    {id = 24511, cost = 1600, requiredIds = {24494}},
    {id = 24514, cost = 1600, requiredIds = {24490}},
  },
	[32] = {
    {id = 1543, cost = 10000},
    {id = 14263, cost = 10000, requiredIds = {14262}},
    {id = 19878, cost = 10000},
  },
	[34] = {
    {id = 13552, cost = 12000, requiredIds = {13551}},
    {id = 14272, cost = 12000, requiredIds = {781}},
    {id = 13813, cost = 12000},
  },
	[36] = {
    {id = 3662, cost = 14000, requiredIds = {3661}},
    {id = 20901, cost = 700, requiredIds = {20900}, requiredTalentId = 19434},
    {id = 14284, cost = 14000, requiredIds = {14283}},
    {id = 3034, cost = 14000},
    {id = 14303, cost = 14000, requiredIds = {14302}},
    {id = 4200, cost = 2800, requiredIds = {4199}},
    {id = 24560, cost = 2800, requiredIds = {24559}},
  },
	[38] = {
    {id = 14320, cost = 16000, requiredIds = {14319}},
    {id = 14267, cost = 16000, requiredIds = {2974}},
  },
	[40] = {
    {id = 13159, cost = 18000},
    {id = 15630, cost = 18000, requiredIds = {15629}},
    {id = 14324, cost = 18000, requiredIds = {14323}},
    {id = 1510, cost = 18000},
    {id = 14310, cost = 18000, requiredIds = {1499}},
    {id = 14264, cost = 18000, requiredIds = {14263}},
    {id = 19882, cost = 18000},
    {id = 24509, cost = 3600, requiredIds = {24508}},
    {id = 24463, cost = 3600, requiredIds = {24441}},
    {id = 24477, cost = 3600, requiredIds = {24476}},
    {id = 14925, cost = 3600, requiredIds = {14924}},
    {id = 24512, cost = 3600, requiredIds = {24511}},
    {id = 24515, cost = 3600, requiredIds = {24514}},
  },
	[42] = {
    {id = 14289, cost = 24000, requiredIds = {14288}},
    {id = 13553, cost = 24000, requiredIds = {13552}},
    {id = 20909, cost = 1200, requiredIds = {19306}, requiredTalentId = 19306},
    {id = 4201, cost = 4800, requiredIds = {4200}},
    {id = 24561, cost = 4800, requiredIds = {24560}},
  },
	[44] = {
    {id = 13542, cost = 26000, requiredIds = {3662}},
    {id = 20902, cost = 1300, requiredIds = {20901}, requiredTalentId = 19434},
    {id = 14285, cost = 26000, requiredIds = {14284}},
    {id = 14316, cost = 26000, requiredIds = {13813}},
    {id = 14270, cost = 26000, requiredIds = {14269}},
  },
	[46] = {
    {id = 20043, cost = 28000},
    {id = 14327, cost = 28000, requiredIds = {14326}},
    {id = 14279, cost = 28000, requiredIds = {3034}},
    {id = 14304, cost = 28000, requiredIds = {14303}},
  },
	[48] = {
    {id = 14321, cost = 32000, requiredIds = {14320}},
    {id = 14273, cost = 32000, requiredIds = {14272}},
    {id = 14265, cost = 32000, requiredIds = {14264}},
    {id = 4202, cost = 6400, requiredIds = {4201}},
    {id = 24562, cost = 6400, requiredIds = {24561}},
  },
	[50] = {
    {id = 15631, cost = 36000, requiredIds = {15630}},
    {id = 13554, cost = 36000, requiredIds = {13553}},
    {id = 20905, cost = 1800, requiredIds = {19506}, requiredTalentId = 19506},
    {id = 14294, cost = 36000, requiredIds = {1510}},
    {id = 19879, cost = 36000},
    {id = 24132, cost = 1800, requiredIds = {19386}, requiredTalentId = 19386},
    {id = 24510, cost = 7200, requiredIds = {24509}},
    {id = 24464, cost = 7200, requiredIds = {24463}},
    {id = 24478, cost = 7200, requiredIds = {24477}},
    {id = 14926, cost = 7200, requiredIds = {14925}},
    {id = 24513, cost = 7200, requiredIds = {24512}},
    {id = 24516, cost = 7200, requiredIds = {24515}},
  },
	[52] = {
    {id = 13543, cost = 40000, requiredIds = {13542}},
    {id = 20903, cost = 2000, requiredIds = {20902}, requiredTalentId = 19434},
    {id = 14286, cost = 40000, requiredIds = {14285}},
  },
	[54] = {
    {id = 14290, cost = 42000, requiredIds = {14289}},
    {id = 20910, cost = 2100, requiredIds = {20909}, requiredTalentId = 19306},
    {id = 14317, cost = 42000, requiredIds = {14316}},
    {id = 5048, cost = 8400, requiredIds = {4202}},
    {id = 24631, cost = 8400, requiredIds = {24562}},
  },
	[56] = {
    {id = 20190, cost = 46000, requiredIds = {20043}},
    {id = 14280, cost = 46000, requiredIds = {14279}},
    {id = 14305, cost = 46000, requiredIds = {14304}},
    {id = 14266, cost = 46000, requiredIds = {14265}},
  },
	[58] = {
    {id = 14322, cost = 48000, requiredIds = {14321}},
    {id = 14325, cost = 48000, requiredIds = {14324}},
    {id = 13555, cost = 48000, requiredIds = {13554}},
    {id = 14295, cost = 48000, requiredIds = {14294}},
    {id = 14271, cost = 48000, requiredIds = {14270}},
  },
	[60] = {
    {id = 25296, cost = 50000, requiredIds = {14322}},
    {id = 13544, cost = 50000, requiredIds = {13543}},
    {id = 20904, cost = 2500, requiredIds = {20903}, requiredTalentId = 19434},
    {id = 14287, cost = 50000, requiredIds = {14286}},
    {id = 15632, cost = 50000, requiredIds = {15631}},
    {id = 25294, cost = 50000, requiredIds = {14290}},
    {id = 25295, cost = 50000, requiredIds = {13555}},
    {id = 19801, cost = 50000},
    {id = 20906, cost = 2500, requiredIds = {20905}, requiredTalentId = 19506},
    {id = 14311, cost = 50000, requiredIds = {14310}},
    {id = 14268, cost = 50000, requiredIds = {14267}},
    {id = 24133, cost = 2500, requiredIds = {24132}, requiredTalentId = 19386},
    {id = 27052, cost = 10000, requiredIds = {24510}},
    {id = 35698, cost = 10000},
    {id = 27053, cost = 10000, requiredIds = {24464}},
    {id = 27054, cost = 10000, requiredIds = {24478}},
    {id = 5049, cost = 10000, requiredIds = {5048}},
    {id = 14927, cost = 10000, requiredIds = {14926}},
    {id = 24632, cost = 10000, requiredIds = {24631}},
    {id = 27055, cost = 10000, requiredIds = {24513}},
    {id = 27056, cost = 10000, requiredIds = {24516}},
  },
	[61] = {
    {id = 27025, cost = 68000, requiredIds = {14317}},
  },
	[62] = {
    {id = 34120, cost = 77000},
    {id = 27015, cost = 77000, requiredIds = {14273}},
  },
	[63] = {
    {id = 27014, cost = 87000, requiredIds = {14266}},
  },
	[64] = {
    {id = 34074, cost = 100000},
  },
	[65] = {
    {id = 27023, cost = 110000, requiredIds = {14305}},
  },
	[66] = {
    {id = 34026, cost = 120000},
    {id = 27018, cost = 120000, requiredIds = {14280}},
    {id = 27067, cost = 2500, requiredIds = {20910}, requiredTalentId = 19306},
  },
	[67] = {
    {id = 27021, cost = 140000, requiredIds = {25294}},
    {id = 27016, cost = 140000, requiredIds = {25295}},
    {id = 27022, cost = 140000, requiredIds = {14295}},
  },
	[68] = {
    {id = 27044, cost = 150000, requiredIds = {25296}},
    {id = 27045, cost = 150000, requiredIds = {20190}},
    {id = 27046, cost = 150000, requiredIds = {13544}},
    {id = 34600, cost = 150000},
  },
	[69] = {
    {id = 27019, cost = 170000, requiredIds = {14287}},
    {id = 27020, cost = 170000, requiredIds = {15632}},
  },
	[70] = {
    {id = 27065, cost = 2700, requiredIds = {20904}, requiredTalentId = 19434},
    {id = 27066, cost = 2700, requiredIds = {20906}, requiredTalentId = 19506},
    {id = 34477, cost = 190000},
    {id = 36916, cost = 190000, requiredIds = {14271}},
    {id = 27068, cost = 2700, requiredIds = {24133}, requiredTalentId = 19386},
    {id = 27062, cost = 10000, requiredIds = {5049}},
    {id = 27047, cost = 12000, requiredIds = {14927}},
    {id = 27061, cost = 10000, requiredIds = {24632}},
  },
},
[2] = { --Wrath Spells
  [1] = {
    {id =  1494, cost =     10},                          -- Track Beasts
  },
  [4] = {
    {id = 13163, cost =    100},                          -- Aspect of the Monkey
    {id =  1978, cost =    100},                          -- Serpent Sting (rank 1)
  },
  [6] = {
    {id =  3044, cost =    100},                          -- Arcane Shot (rank 1)
    {id =  1130, cost =    100},                          -- Hunter's Mark (rank 1)
  },
  [8] = {
    {id =  5116, cost =    200},                          -- Concussive Shot
    {id =  3127, cost =    200},                          -- Parry
    {id = 14260, cost =    200, requiredIds = {2973}},                -- Raptor Strike (rank 2)
  },
  [10] =  {
    {id = 13165, cost =    400},                          -- Aspect of the Hawk (rank 1)
    {id = 13549, cost =    400, requiredIds = {1978}},                -- Serpent Sting (rank 2)
    {id = 19883, cost =    400},                          -- Track Humanoids
  },
  [12] =  {
    {id = 14281, cost =    600, requiredIds = {3044}},                -- Arcane Shot (rank 2)
    {id = 20736, cost =    600},                          -- Distracting Shot (rank 1)
    {id =   136, cost =    600, requiredIds = {1515}},                -- Mend Pet (rank 1)
    {id =  2974, cost =    600},                          -- Wing Clip
  },
  [14] =  {
    {id =  6197, cost =   1200},                          -- Eagle Eye
    {id =  1002, cost =   1200},                          -- Eyes of the Beast
    {id =  1513, cost =   1200},                          -- Scare Beast (rank 1)
  },
  [16] =  {
    {id =  5118, cost =   2200},                          -- Aspect of the Cheetah
    {id = 13795, cost =   1800},                          -- Immolation Trap (rank 1)
    {id =  1495, cost =   1800},                          -- Mongoose Bite (rank 1)
    {id = 14261, cost =   1800, requiredIds = {14260}},               -- Raptor Strike (rank 3)
  },
  [18] =  {
    {id = 14318, cost =   2000, requiredIds = {13165}},               -- Aspect of the Hawk (rank 2)
    {id =  2643, cost =   2000},                          -- Multi-Shot (rank 1)
    {id = 13550, cost =   2000, requiredIds = {13549}},               -- Serpent Sting (rank 3)
    {id = 19884, cost =   2000},                          -- Track Undead
  },
  [20] =  {
    {id = 14282, cost =   2200, requiredIds = {14281}},               -- Arcane Shot (rank 3)
    {id = 34074, cost =   2200},                          -- Aspect of the Viper
    {id =   781, cost =   2200},                          -- Disengage
    {id =  1499, cost =   2200},                          -- Freezing Trap (rank 1)
    {id =  3111, cost =   2200, requiredIds = {136}},               -- Mend Pet (rank 2)
    {id =   674, cost =   2200},                          -- Dual Wield
  },
  [22] =  {
    {id = 14323, cost =   6000, requiredIds = {1130}},                -- Hunter's Mark (rank 2)
    {id =  3043, cost =   6000},                          -- Scorpid Sting
  },
  [24] =  {
    {id =  1462, cost =   7000},                          -- Beast Lore
    {id = 14262, cost =   7000, requiredIds = {14261}},               -- Raptor Strike (rank 4)
    {id = 19885, cost =   7000},                          -- Track Hidden
  },
  [26] =  {
    {id = 14302, cost =   7000, requiredIds = {13795}},               -- Immolation Trap (rank 2)
    {id =  3045, cost =   7000},                          -- Rapid Fire
    {id = 13551, cost =   7000, requiredIds = {13550}},               -- Serpent Sting (rank 4)
    {id = 19880, cost =   7000},                          -- Track Elementals
  },
  [28] =  {
    {id = 20900, cost =    400, requiredIds = {19434}, requiredTalentId = 19434}, -- Aimed Shot (rank 2)
    {id = 14283, cost =   8000, requiredIds = {14282}},               -- Arcane Shot (rank 4)
    {id = 14319, cost =   8000, requiredIds = {14318}},               -- Aspect of the Hawk (rank 3)
    {id = 13809, cost =   8000},                          -- Frost Trap
    {id =  3661, cost =   8000, requiredIds = {3111}},                -- Mend Pet (rank 3)
  },
  [30] =  {
    {id = 13161, cost =   8000},                          -- Aspect of the Beast
    {id =  5384, cost =   8000},                          -- Feign Death
    {id = 14269, cost =   8000, requiredIds = {1495}},                -- Mongoose Bite (rank 2)
    {id = 14288, cost =   8000, requiredIds = {2643}},                -- Multi-Shot (rank 2)
    {id = 14326, cost =   8000, requiredIds = {1513}},                -- Scare Beast (rank 2)
  },
  [32] =  {
    {id =  1543, cost =  10000},                          -- Flare
    {id = 14263, cost =  10000, requiredIds = {14262}},               -- Raptor Strike (rank 5)
    {id = 19878, cost =  10000},                          -- Track Demons
  },
  [34] =  {
    {id = 13813, cost =  12000},                          -- Explosive Trap (rank 1)
    {id = 13552, cost =  12000, requiredIds = {13551}},               -- Serpent Sting (rank 5)
  },
  [36] =  {
    {id = 20901, cost =    700, requiredIds = {20900}, requiredTalentId = 19434}, -- Aimed Shot (rank 3)
    {id = 14284, cost =  14000, requiredIds = {14283}},               -- Arcane Shot (rank 5)
    {id = 14303, cost =  14000, requiredIds = {14302}},               -- Immolation Trap (rank 3)
    {id =  3662, cost =  14000, requiredIds = {3661}},                -- Mend Pet (rank 4)
    {id =  3034, cost =  14000},                          -- Viper Sting
  },
  [38] =  {
    {id = 14320, cost =  16000, requiredIds = {14319}},               -- Aspect of the Hawk (rank 4)
  },
  [40] =  {
    {id = 13159, cost =  18000},                          -- Aspect of the Pack
    {id = 14310, cost =  18000, requiredIds = {1499}},                -- Freezing Trap (rank 2)
    {id = 14324, cost =  18000, requiredIds = {14323}},               -- Hunter's Mark (rank 3)
    {id = 14264, cost =  18000, requiredIds = {14263}},               -- Raptor Strike (rank 6)
    {id = 19882, cost =  18000},                          -- Track Giants
    {id =  1510, cost =  18000},                          -- Volley (rank 1)
  },
  [42] =  {
    {id = 20909, cost =   1200, requiredIds = {19306}, requiredTalentId = 19306}, -- Counterattack (rank 2)
    {id = 14289, cost =  24000, requiredIds = {14288}},               -- Multi-Shot (rank 3)
    {id = 13553, cost =  24000, requiredIds = {13552}},               -- Serpent Sting (rank 6)
  },
  [44] =  {
    {id = 20902, cost =   1300, requiredIds = {20901}, requiredTalentId = 19434}, -- Aimed Shot (rank 4)
    {id = 14285, cost =  26000, requiredIds = {14284}},               -- Arcane Shot (rank 6)
    {id = 14316, cost =  26000, requiredIds = {13813}},               -- Explosive Trap (rank 2)
    {id = 13542, cost =  26000, requiredIds = {3662}},                -- Mend Pet (rank 5)
    {id = 14270, cost =  26000, requiredIds = {14269}},               -- Mongoose Bite (rank 3)
  },
  [46] =  {
    {id = 20043, cost =  28000},                          -- Aspect of the Wild (rank 1)
    {id = 14304, cost =  28000, requiredIds = {14303}},               -- Immolation Trap (rank 4)
    {id = 14327, cost =  28000, requiredIds = {14326}},               -- Scare Beast (rank 3)
  },
  [48] =  {
    {id = 14321, cost =  32000, requiredIds = {14320}},               -- Aspect of the Hawk (rank 5)
    {id = 14265, cost =  32000, requiredIds = {14264}},               -- Raptor Strike (rank 7)
  },
  [50] =  {
    {id = 13554, cost =  36000, requiredIds = {13553}},               -- Serpent Sting (rank 7)
    {id = 56641, cost =  36000},                          -- Steady Shot (rank 1)
    {id = 19879, cost =  36000},                          -- Track Dragonkin
    {id = 14294, cost =  36000, requiredIds = {1510}},                -- Volley (rank 2)
    {id = 24132, cost =   1800, requiredIds = {19386}, requiredTalentId = 19386}, -- Wyvern Sting (rank 2)
  },
  [52] =  {
    {id = 20903, cost =   2000, requiredIds = {20902}, requiredTalentId = 19434}, -- Aimed Shot (rank 5)
    {id = 14286, cost =  40000, requiredIds = {14285}},               -- Arcane Shot (rank 7)
    {id = 13543, cost =  40000, requiredIds = {13542}},               -- Mend Pet (rank 6)
  },
  [54] =  {
    {id = 20910, cost =   2100, requiredIds = {20909}, requiredTalentId = 19306}, -- Counterattack (rank 3)
    {id = 14317, cost =  42000, requiredIds = {14316}},               -- Explosive Trap (rank 3)
    {id = 14290, cost =  42000, requiredIds = {14289}},               -- Multi-Shot (rank 4)
  },
  [56] =  {
    {id = 20190, cost =  46000, requiredIds = {20043}},               -- Aspect of the Wild (rank 2)
    {id = 14305, cost =  46000, requiredIds = {14304}},               -- Immolation Trap (rank 5)
    {id = 14266, cost =  46000, requiredIds = {14265}},               -- Raptor Strike (rank 8)
  },
  [57] =  {
    {id = 63668, cost =   1800, requiredIds = {3674}, requiredTalentId = 3674},   -- Black Arrow (rank 2)
  },
  [58] =  {
    {id = 14322, cost =  48000, requiredIds = {14321}},               -- Aspect of the Hawk (rank 6)
    {id = 14325, cost =  48000, requiredIds = {14324}},               -- Hunter's Mark (rank 4)
    {id = 14271, cost =  48000, requiredIds = {14270}},               -- Mongoose Bite (rank 4)
    {id = 13555, cost =  48000, requiredIds = {13554}},               -- Serpent Sting (rank 8)
    {id = 14295, cost =  48000, requiredIds = {14294}},               -- Volley (rank 3)
  },
  [60] =  {
    {id = 20904, cost =   2500, requiredIds = {20903}, requiredTalentId = 19434}, -- Aimed Shot (rank 6)
    {id = 14287, cost =  50000, requiredIds = {14286}},               -- Arcane Shot (rank 8)
    {id = 25296, cost =  50000, requiredIds = {14322}},               -- Aspect of the Hawk (rank 7)
    {id = 19263, cost =   2200},                          -- Deterrence
    {id = 14311, cost =  50000, requiredIds = {14310}},               -- Freezing Trap (rank 3)
    {id = 13544, cost =  50000, requiredIds = {13543}},               -- Mend Pet (rank 7)
    {id = 25294, cost =  50000, requiredIds = {14290}},               -- Multi-Shot (rank 5)
    {id = 25295, cost =  50000, requiredIds = {13555}},               -- Serpent Sting (rank 9)
    {id = 19801, cost =  50000},                          -- Tranquilizing Shot
    {id = 24133, cost =   2500, requiredIds = {24132}, requiredTalentId = 19386}, -- Wyvern Sting (rank 3)
  },
  [61] =  {
    {id = 27025, cost =  68000, requiredIds = {14317}},               -- Explosive Trap (rank 4)
  },
  [62] =  {
    {id = 34120, cost =  70000, requiredIds = {56641}},               -- Steady Shot (rank 2)
  },
  [63] =  {
    {id = 63668, cost =   1800, requiredIds = {63668}, requiredTalentId = 3674},  -- Black Arrow (rank 3)
    {id = 27014, cost =  87000, requiredIds = {14266}},               -- Raptor Strike (rank 9)
  },
  [65] =  {
    {id = 27023, cost = 110000, requiredIds = {14305}},               -- Immolation Trap (rank 6)
  },
  [66] =  {
    {id = 27067, cost =   2500, requiredIds = {20910}, requiredTalentId = 19306}, -- Counterattack (rank 4)
    {id = 34026, cost = 120000},                          -- Kill Command
  },
  [67] =  {
    {id = 27021, cost = 140000, requiredIds = {25294}},               -- Multi-Shot (rank 6)
    {id = 27016, cost = 140000, requiredIds = {25295}},               -- Serpent Sting (rank 10)
    {id = 27022, cost = 140000, requiredIds = {14295}},               -- Volley (rank 4)
  },
  [68] =  {
    {id = 27044, cost = 150000, requiredIds = {25296}},               -- Aspect of the Hawk (rank 8)
    {id = 27045, cost = 150000, requiredIds = {20190}},               -- Aspect of the Wild (rank 3)
    {id = 27046, cost = 150000, requiredIds = {13544}},               -- Mend Pet (rank 8)
    {id = 34600, cost = 150000},                          -- Snake Trap
  },
  [69] =  {
    {id = 27019, cost = 170000, requiredIds = {14287}},               -- Arcane Shot (rank 9)
    {id = 63670, cost =  10000, requiredIds = {63668}, requiredTalentId = 3674},  -- Black Arrow (rank 4)
  },
  [70] =  {
    {id = 27065, cost =  10000, requiredIds = {20904}, requiredTalentId = 19434}, -- Aimed Shot (rank 7)
    {id = 60051, cost =    400, requiredIds = {53301}, requiredTalentId = 53301}, -- Explosive Shot (rank 2)
    {id = 34477, cost = 190000},                          -- Misdirection
    {id = 36916, cost = 190000, requiredIds = {14271}},               -- Mongoose Bite (rank 5)
    {id = 27068, cost =   5000, requiredIds = {24133}, requiredTalentId = 19386}, -- Wyvern Sting (rank 4)
  },
  [71] =  {
    {id = 49066, cost = 300000, requiredIds = {27025}},               -- Explosive Trap (rank 5)
    {id = 53351, cost = 300000},                          -- Kill Shot (rank 1)
    {id = 48995, cost = 300000, requiredIds = {27014}},               -- Raptor Strike (rank 10)
    {id = 49051, cost = 300000, requiredIds = {34120}},               -- Steady Shot (rank 3)
  },
  [72] =  {
    {id = 48998, cost =  15000, requiredIds = {27067}, requiredTalentId = 19306}, -- Counterattack (rank 5)
    {id = 49055, cost = 300000, requiredIds = {27023}},               -- Immolation Trap (rank 7)
  },
  [73] =  {
    {id = 49044, cost = 300000, requiredIds = {27019}},               -- Arcane Shot (rank 10)
    {id = 49000, cost = 300000, requiredIds = {27016}},               -- Serpent Sting (rank 11)
  },
  [74] =  {
    {id = 61846, cost = 300000, requiredIds = {27044}},               -- Aspect of the Dragonhawk (rank 1)
    {id = 48989, cost = 300000, requiredIds = {27046}},               -- Mend Pet (rank 9)
    {id = 49047, cost = 300000, requiredIds = {27021}},               -- Multi-Shot (rank 7)
    {id = 58431, cost = 300000, requiredIds = {27022}},               -- Volley (rank 5)
  },
  [75] =  {
    {id = 49049, cost =  10000, requiredIds = {27065}, requiredTalentId = 19434}, -- Aimed Shot (rank 8)
    {id = 63671, cost =  10000, requiredIds = {63670}, requiredTalentId = 3674},  -- Black Arrow (rank 5)
    {id = 60052, cost =    400, requiredIds = {60051}, requiredTalentId = 53301}, -- Explosive Shot (rank 3)
    {id = 61005, cost = 300000, requiredIds = {53351}},               -- Kill Shot (rank 2)
    {id = 53271, cost =  10000},                          -- Master's Call
    {id = 49011, cost = 100000, requiredIds = {27068}, requiredTalentId = 19386}, -- Wyvern Sting (rank 5)
  },
  [76] =  {
    {id = 49071, cost = 300000, requiredIds = {27045}},               -- Aspect of the Wild (rank 4)
    {id = 53338, cost =  10000, requiredIds = {14325}},               -- Hunter's Mark (rank 5)
  },
  [77] =  {
    {id = 49067, cost = 300000, requiredIds = {49066}},               -- Explosive Trap (rank 6)
    {id = 48996, cost = 300000, requiredIds = {48995}},               -- Raptor Strike (rank 11)
    {id = 49052, cost = 300000, requiredIds = {49051}},               -- Steady Shot (rank 4)
  },
  [78] =  {
    {id = 48999, cost =  15000, requiredIds = {48998}, requiredTalentId = 19306}, -- Counterattack (rank 6)
    {id = 49056, cost = 300000, requiredIds = {49055}},               -- Immolation Trap (rank 8)
  },
  [79] =  {
    {id = 49045, cost = 300000, requiredIds = {49044}},               -- Arcane Shot (rank 11)
    {id = 49001, cost = 300000, requiredIds = {49000}},               -- Serpent Sting (rank 12)
  },
  [80] =  {
    {id = 49050, cost =  10000, requiredIds = {49049}, requiredTalentId = 19434}, -- Aimed Shot (rank 9)
    {id = 61847, cost = 300000, requiredIds = {61846}},               -- Aspect of the Dragonhawk (rank 2)
    {id = 63672, cost =  10000, requiredIds = {63671}, requiredTalentId = 3674},  -- Black Arrow (rank 6)
    {id = 62757, cost = 300000},                          -- Call Stabled Pet
    {id = 60053, cost = 100000, requiredIds = {60052}, requiredTalentId = 53301}, -- Explosive Shot (rank 4)
    {id = 60192, cost = 100000},                          -- Freezing Arrow (rank 1)
    {id = 61006, cost = 300000, requiredIds = {61005}},               -- Kill Shot (rank 3)
    {id = 48990, cost = 300000, requiredIds = {48989}},               -- Mend Pet (rank 10)
    {id = 53339, cost = 300000, requiredIds = {36916}},               -- Mongoose Bite (rank 6)
    {id = 49048, cost = 300000, requiredIds = {49047}},               -- Multi-Shot (rank 8)
    {id = 58434, cost = 300000, requiredIds = {58431}},               -- Volley (rank 6)
    {id = 49012, cost = 100000, requiredIds = {49011}, requiredTalentId = 19386}, -- Wyvern Sting (rank 6)
  },
},
}

wt.SpellsByLevel = SpellsByLevel[expac] --load correct data table from above
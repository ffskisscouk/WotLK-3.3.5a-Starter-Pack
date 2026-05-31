--[[	file meta info
	@file 		Priest.lua
	@brief		Tables of spell IDs for class
--]]

--[[
	@brief		Accessing the addons private table

	@var 	_		addonName, thrown away
	@var	wt		Global addonTable
--]]
local _, wt = ...

--[[
	@brief		Check if the data should be loaded or not
	@return		If not "PRIEST", then return with nothing
--]]
if (wt.currentClass ~= "PRIEST") then
	return
end

local expac = GetExpansionLevel()

--[[
	@brief		Table for trainable spells for each level

	@table		[n]		Table containing spells available at level n

				@var		id					Spell id
				@var		cost				Cost in copper
				@table		requiredIds			Table containing prerequisite spell IDs
				@var		requiredTalentId	Spell ID of prerequisite talent
--]]
local SpellsByLevel = {
[0] = { --Vanilla Spells
	[1] = {
		{id = 1243, cost = 10}
	},
	[4] = {
		{id = 2052, cost = 100, requiredIds = {2050}},
    {id = 589, cost = 100}
	},
	[6] = {
		{id = 17, cost = 100},
    {id = 591, cost = 100, requiredIds = {585}}
	},
	[8] = {
		{id = 586, cost = 200},
    {id = 139, cost = 200}
	},
	[10] = {
		{id = 2053, cost = 300, requiredIds = {2052}},
		{id = 8092, cost = 300},
		{id = 2006, cost = 300},
		{id = 594, cost = 300, requiredIds = {589}}
	},
	[12] = {
		{id = 588, cost = 800},
		{id = 1244, cost = 800, requiredIds = {1243}},
		{id = 592, cost = 800, requiredIds = {17}}
	},
	[14] = {
		{id = 528, cost = 1200},
		{id = 8122, cost = 1200},
		{id = 6074, cost = 1200, requiredIds = {139}},
		{id = 598, cost = 1200, requiredIds = {591}}
	},
	[16] = {
    {id = 2054, cost = 1600},
    {id = 8102, cost = 1600, requiredIds = {8092}}
  },
	[18] = {
		{id = 19236, cost = 100, races = {1, 3}},
		{id = 527, cost = 2000},
		{id = 600, cost = 2000, requiredIds = {592}},
		{id = 970, cost = 2000, requiredIds = {594}},
		{id = 19296, cost = 100, race = 4}
	},
	[20] = {
		{id = 9578, cost = 3000, requiredIds = {586}},
		{id = 2061, cost = 3000},
		{id = 19281, cost = 150, race = 8},
		{id = 14914, cost = 3000},
		{id = 7128, cost = 3000, requiredIds = {588}},
		{id = 453, cost = 3000},
		{id = 6075, cost = 3000, requiredIds = {6074}},
		{id = 9484, cost = 3000},
		{id = 19261, cost = 200, race = 5}
	},
	[22] = {
		{id = 2055, cost = 4000, requiredIds = {2054}},
		{id = 8103, cost = 4000, requiredIds = {8102}},
		{id = 2096, cost = 4000},
		{id = 2010, cost = 4000, requiredIds = {2006}},
		{id = 984, cost = 4000, requiredIds = {598}}
	},
	[24] = {
		{id = 15262, cost = 5000, requiredIds = {14914}},
		{id = 8129, cost = 5000},
		{id = 1245, cost = 5000, requiredIds = {1244}},
		{id = 3747, cost = 5000, requiredIds = {600}}
	},
	[26] = {
		{id = 19238, cost = 300, races = {1, 3}},
		{id = 9472, cost = 6000, requiredIds = {2061}},
		{id = 6076, cost = 6000, requiredIds = {6075}},
		{id = 992, cost = 6000, requiredIds = {970}},
		{id = 19299, cost = 300, race = 4, requiredIds = {19296}}
	},
	[28] = {
		{id = 19276, cost = 400, race = 5},
		{id = 6063, cost = 8000, requiredIds = {2055}},
		{id = 15430, cost = 400, requiredTalentId = 15237},
		{id = 8104, cost = 8000, requiredIds = {8103}},
		{id = 17311, cost = 400, requiredTalentId = 15407},
		{id = 8124, cost = 8000, requiredIds = {8122}},
		{id = 19308, cost = 400, race = 8}
	},
	[30] = {
		{id = 19289, cost = 500, race = 4},
		{id = 9579, cost = 10000, requiredIds = {9578}},
		{id = 19271, cost = 450, race = 1},
		{id = 19282, cost = 500, race = 8},
		{id = 15263, cost = 10000, requiredIds = {15262}},
		{id = 602, cost = 10000, requiredIds = {7128}},
		{id = 605, cost = 10000},
		{id = 6065, cost = 10000, requiredIds = {3747}},
		{id = 596, cost = 10000},
		{id = 976, cost = 10000},
		{id = 1004, cost = 10000, requiredIds = {984}},
		{id = 19262, cost = 500, race = 5}
	},
	[32] = {
		{id = 552, cost = 11000},
		{id = 9473, cost = 11000, requiredIds = {9472}},
		{id = 8131, cost = 11000, requiredIds = {8129}},
		{id = 6077, cost = 11000, requiredIds = {6076}}
	},
	[34] = {
		{id = 19240, cost = 600, races = {1, 3}},
		{id = 6064, cost = 12000, requiredIds = {6063}},
		{id = 1706, cost = 12000},
		{id = 8105, cost = 12000, requiredIds = {8104}},
		{id = 10880, cost = 12000, requiredIds = {2010}},
		{id = 2767, cost = 12000, requiredIds = {992}},
		{id = 19302, cost = 600, race = 4, requiredIds = {19299}}
	},
	[36] = {
		{id = 19277, cost = 700, race = 5},
		{id = 988, cost = 14000, requiredIds = {527}},
		{id = 15264, cost = 14000, requiredIds = {15263}},
		{id = 15431, cost = 700, requiredIds = {15430}, requiredTalentId = 15237},
		{id = 17312, cost = 700, requiredIds = {17311}, requiredTalentId = 15407},
		{id = 8192, cost = 14000, requiredIds = {453}},
		{id = 2791, cost = 14000, requiredIds = {1245}},
		{id = 6066, cost = 14000, requiredIds = {6065}},
		{id = 19309, cost = 700, race = 8}
	},
	[38] = {
		{id = 9474, cost = 16000, requiredIds = {9473}},
		{id = 6078, cost = 16000, requiredIds = {6077}},
		{id = 6060, cost = 16000, requiredIds = {1004}}
	},
	[40] = {
		{id = 14818, cost = 900, requiredTalentId = 14752},
		{id = 19291, cost = 900, race = 4, requiredIds = {19289}},
		{id = 9592, cost = 18000, requiredIds = {9579}},
		{id = 19273, cost = 810, race = 1},
		{id = 2060, cost = 18000},
		{id = 19283, cost = 900, race = 8},
		{id = 1006, cost = 18000, requiredIds = {602}},
		{id = 10874, cost = 18000, requiredIds = {8131}},
		{id = 8106, cost = 18000, requiredIds = {8105}},
		{id = 996, cost = 18000, requiredIds = {596}},
		{id = 9485, cost = 18000, requiredIds = {9484}},
		{id = 19264, cost = 900, race = 5}
	},
	[42] = {
		{id = 19241, cost = 1100, races = {1, 3}},
		{id = 15265, cost = 22000, requiredIds = {15264}},
		{id = 10898, cost = 22000, requiredIds = {6066}},
		{id = 10888, cost = 22000, requiredIds = {8124}},
		{id = 10957, cost = 22000, requiredIds = {976}},
		{id = 10892, cost = 22000, requiredIds = {2767}},
		{id = 19303, cost = 1100, race = 4, requiredIds = {19302}}
	},
	[44] = {
		{id = 19278, cost = 1200, race = 5},
		{id = 10915, cost = 24000, requiredIds = {9474}},
		{id = 27799, cost = 1200, requiredIds = {15431}, requiredTalentId = 15237},
		{id = 10911, cost = 24000, requiredIds = {605}},
		{id = 17313, cost = 1200, requiredIds = {17312}, requiredTalentId = 15407},
		{id = 10909, cost = 24000, requiredIds = {2096}},
		{id = 10927, cost = 24000, requiredIds = {6078}},
		{id = 19310, cost = 1000, race = 8}
	},
	[46] = {
		{id = 10963, cost = 26000, requiredIds = {2060}},
		{id = 10945, cost = 26000, requiredIds = {8106}},
		{id = 10881, cost = 26000, requiredIds = {10880}},
		{id = 10933, cost = 26000, requiredIds = {6060}}
	},
	[48] = {
		{id = 15266, cost = 28000, requiredIds = {15265}},
		{id = 10875, cost = 28000, requiredIds = {10874}},
		{id = 10937, cost = 28000, requiredIds = {2791}},
		{id = 10899, cost = 28000, requiredIds = {10898}}
	},
	[50] = {
		{id = 19242, cost = 1500, races = {1, 3}},
		{id = 14819, cost = 1500, requiredIds = {14818}, requiredTalentId = 14752},
		{id = 19292, cost = 1500, race = 4, requiredIds = {19291}},
		{id = 10941, cost = 30000, requiredIds = {9592}},
		{id = 10916, cost = 30000, requiredIds = {10915}},
		{id = 19284, cost = 1500, race = 8},
		{id = 10951, cost = 30000, requiredIds = {1006}},
		{id = 27870, cost = 1200, requiredTalentId = 724},
		{id = 10960, cost = 30000, requiredIds = {996}},
		{id = 10928, cost = 30000, requiredIds = {10927}},
		{id = 10893, cost = 30000, requiredIds = {10892}},
		{id = 19304, cost = 1500, race = 4, requiredIds = {19303}},
		{id = 19265, cost = 1500, race = 5}
	},
	[52] = {
		{id = 19279, cost = 1900, race = 5},
		{id = 10964, cost = 38000, requiredIds = {10963}},
		{id = 27800, cost = 1900, requiredIds = {27799}, requiredTalentId = 15237},
		{id = 10946, cost = 38000, requiredIds = {10945}},
		{id = 17314, cost = 1900, requiredIds = {17313}, requiredTalentId = 15407},
		{id = 10953, cost = 38000, requiredIds = {8192}},
		{id = 19311, cost = 1200, race = 8}
	},
	[54] = {
		{id = 15267, cost = 40000, requiredIds = {15266}},
		{id = 10900, cost = 40000, requiredIds = {10899}},
		{id = 10934, cost = 40000, requiredIds = {10933}}
	},
	[56] = {
		{id = 10917, cost = 42000, requiredIds = {10916}},
		{id = 10876, cost = 42000, requiredIds = {10875}},
		{id = 10890, cost = 42000, requiredIds = {10888}},
		{id = 10929, cost = 42000, requiredIds = {10928}},
		{id = 10958, cost = 42000, requiredIds = {10957}}
	},
	[58] = {
		{id = 19243, cost = 2200, races = {1, 3}},
		{id = 10965, cost = 44000, requiredIds = {10964}},
		{id = 10947, cost = 44000, requiredIds = {10946}},
		{id = 10912, cost = 44000, requiredIds = {10911}},
		{id = 20770, cost = 44000, requiredIds = {10881}},
		{id = 10894, cost = 44000, requiredIds = {10893}},
		{id = 19305, cost = 2200, race = 4, requiredIds = {19304}}
	},
	[60] = {
		{id = 19280, cost = 2300, race = 5},
		{id = 27841, cost = 2300, requiredIds = {14819}, requiredTalentId = 14752},
		{id = 19293, cost = 2070, race = 4, requiredIds = {19292}},
		{id = 10942, cost = 46000, requiredIds = {10941}},
		{id = 19285, cost = 2300, race = 8},
		{id = 15261, cost = 46000, requiredIds = {15267}},
		{id = 27801, cost = 2300, requiredIds = {27800}, requiredTalentId = 15237},
		{id = 10952, cost = 46000, requiredIds = {10951}},
		{id = 27871, cost = 1500, requiredIds = {27870}, requiredTalentId = 724},
		{id = 18807, cost = 2300, requiredIds = {17314}, requiredTalentId = 15407},
		{id = 10938, cost = 46000, requiredIds = {10937}},
		{id = 10901, cost = 46000, requiredIds = {10900}},
		{id = 10961, cost = 46000, requiredIds = {10960}},
		{id = 27681, cost = 2300, requiredIds = {27841}},
		{id = 10955, cost = 46000, requiredIds = {9485}},
		{id = 19312, cost = 2300, race = 8},
		{id = 19266, cost = 2070, race = 5}
	}
},
[1] = { --TBC Spells
	[1] = {
		{id = 1243, cost = 10},
	},
	[4] = {
		{id = 2052, cost = 100, requiredIds = {2050}},
		{id = 589, cost = 100},
	},
	[6] = {
		{id = 17, cost = 100},
		{id = 591, cost = 100, requiredIds = {585}},
	},
	[8] = {
		{id = 139, cost = 200},
		{id = 586, cost = 200},
	},
	[10] = {
		{id = 2053, cost = 300, requiredIds = {2052}},
		{id = 2006, cost = 300},
		{id = 8092, cost = 300},
		{id = 594, cost = 300, requiredIds = {589}},
		{id = 2652, cost = 90, races = {5, 10}},
		{id = 32548, cost = 100, race = 11},
		{id = 10797, cost = 90, race = 4},
		{id = 9035, cost = 90, race = 8},
		{id = 13908, cost = 90, races = {1, 3}},
	},
	[12] = {
		{id = 588, cost = 800},
		{id = 1244, cost = 800, requiredIds = {1243}},
		{id = 592, cost = 800, requiredIds = {17}},
	},
	[14] = {
		{id = 528, cost = 1200},
		{id = 6074, cost = 1200, requiredIds = {139}},
		{id = 598, cost = 1200, requiredIds = {591}},
		{id = 8122, cost = 1200},
	},
	[16] = {
		{id = 2054, cost = 1600},
		{id = 8102, cost = 1600, requiredIds = {8092}},
	},
	[18] = {
		{id = 527, cost = 2000},
		{id = 600, cost = 2000, requiredIds = {592}},
		{id = 970, cost = 2000, requiredIds = {594}},
		{id = 19296, cost = 100, requiredIds = {10797}, race = 4},
		{id = 19236, cost = 100, requiredIds = {13908}, races = {1, 3}},
	},
	[20] = {
		{id = 6346, cost = 800},
		{id = 7128, cost = 3000, requiredIds = {588}},
		{id = 9484, cost = 3000},
		{id = 2061, cost = 3000},
		{id = 14914, cost = 3000},
		{id = 6075, cost = 3000, requiredIds = {6074}},
		{id = 2944, cost = 100, race = 5},
		{id = 9578, cost = 3000, requiredIds = {586}},
		{id = 453, cost = 3000},
		{id = 19261, cost = 150, requiredIds = {2652}, races = {5, 10}},
		{id = 44041, cost = 100, races = {3, 11}},
		{id = 2651, cost = 100, race = 4},
		{id = 19281, cost = 150, requiredIds = {9035}, race = 8},
		{id = 18137, cost = 100, race = 8},
		{id = 13896, cost = 100, race = 1},
		{id = 32676, cost = 100, race = 10},
	},
	[22] = {
		{id = 2055, cost = 4000, requiredIds = {2054}},
		{id = 2010, cost = 4000, requiredIds = {2006}},
		{id = 984, cost = 4000, requiredIds = {598}},
		{id = 8103, cost = 4000, requiredIds = {8102}},
		{id = 2096, cost = 4000},
	},
	[24] = {
		{id = 8129, cost = 5000},
		{id = 1245, cost = 5000, requiredIds = {1244}},
		{id = 3747, cost = 5000, requiredIds = {600}},
		{id = 15262, cost = 5000, requiredIds = {14914}},
	},
	[26] = {
		{id = 9472, cost = 6000, requiredIds = {2061}},
		{id = 6076, cost = 6000, requiredIds = {6075}},
		{id = 992, cost = 6000, requiredIds = {970}},
		{id = 19299, cost = 300, requiredIds = {19296}, race = 4},
		{id = 19238, cost = 300, requiredIds = {19236}, races = {1, 3}},
	},
	[28] = {
		{id = 6063, cost = 8000, requiredIds = {2055}},
		{id = 15430, cost = 400, requiredIds = {15237}, requiredTalentId = 15237},
		{id = 19276, cost = 400, requiredIds = {2944}, race = 5},
		{id = 8104, cost = 8000, requiredIds = {8103}},
		{id = 17311, cost = 400, requiredIds = {15407}, requiredTalentId = 15407},
		{id = 8124, cost = 8000, requiredIds = {8122}},
		{id = 19308, cost = 400, requiredIds = {18137}, race = 8},
	},
	[30] = {
		{id = 602, cost = 10000, requiredIds = {7128}},
		{id = 6065, cost = 10000, requiredIds = {3747}},
		{id = 15263, cost = 10000, requiredIds = {15262}},
		{id = 596, cost = 10000},
		{id = 1004, cost = 10000, requiredIds = {984}},
		{id = 9579, cost = 10000, requiredIds = {9578}},
		{id = 605, cost = 10000},
		{id = 976, cost = 10000},
		{id = 19262, cost = 500, requiredIds = {19261}, races = {5, 10}},
		{id = 44043, cost = 500, requiredIds = {44041}, races = {3, 11}},
		{id = 19282, cost = 500, requiredIds = {19281}, race = 8},
		{id = 19271, cost = 500, requiredIds = {13896}, race = 1},
	},
	[32] = {
		{id = 8131, cost = 11000, requiredIds = {8129}},
		{id = 552, cost = 11000},
		{id = 9473, cost = 11000, requiredIds = {9472}},
		{id = 6077, cost = 11000, requiredIds = {6076}},
	},
	[34] = {
		{id = 1706, cost = 12000},
		{id = 6064, cost = 12000, requiredIds = {6063}},
		{id = 10880, cost = 12000, requiredIds = {2010}},
		{id = 8105, cost = 12000, requiredIds = {8104}},
		{id = 2767, cost = 12000, requiredIds = {992}},
		{id = 19302, cost = 600, requiredIds = {19299}, race = 4},
		{id = 19240, cost = 600, requiredIds = {19238}, races = {1, 3}},
	},
	[36] = {
		{id = 988, cost = 14000, requiredIds = {527}},
		{id = 2791, cost = 14000, requiredIds = {1245}},
		{id = 6066, cost = 14000, requiredIds = {6065}},
		{id = 15264, cost = 14000, requiredIds = {15263}},
		{id = 15431, cost = 700, requiredIds = {15430}, requiredTalentId = 15237},
		{id = 19277, cost = 700, requiredIds = {19276}, race = 5},
		{id = 17312, cost = 700, requiredIds = {17311}, requiredTalentId = 15407},
		{id = 8192, cost = 14000, requiredIds = {453}},
		{id = 19309, cost = 700, requiredIds = {19308}, race = 8},
	},
	[38] = {
		{id = 9474, cost = 16000, requiredIds = {9473}},
		{id = 6078, cost = 16000, requiredIds = {6077}},
		{id = 6060, cost = 16000, requiredIds = {1004}},
	},
	[40] = {
		{id = 14818, cost = 900, requiredIds = {14752}, requiredTalentId = 14752},
		{id = 1006, cost = 18000, requiredIds = {602}},
		{id = 10874, cost = 18000, requiredIds = {8131}},
		{id = 9485, cost = 18000, requiredIds = {9484}},
		{id = 2060, cost = 18000},
		{id = 996, cost = 18000, requiredIds = {596}},
		{id = 9592, cost = 18000, requiredIds = {9579}},
		{id = 8106, cost = 18000, requiredIds = {8105}},
		{id = 19264, cost = 900, requiredIds = {19262}, races = {5, 10}},
		{id = 44044, cost = 900, requiredIds = {44043}, races = {3, 11}},
		{id = 19283, cost = 900, requiredIds = {19282}, race = 8},
		{id = 19273, cost = 900, requiredIds = {19271}, race = 1},
	},
	[42] = {
		{id = 10898, cost = 22000, requiredIds = {6066}},
		{id = 15265, cost = 22000, requiredIds = {15264}},
		{id = 10888, cost = 22000, requiredIds = {8124}},
		{id = 10957, cost = 22000, requiredIds = {976}},
		{id = 10892, cost = 22000, requiredIds = {2767}},
		{id = 19303, cost = 1100, requiredIds = {19302}, race = 4},
		{id = 19241, cost = 1100, requiredIds = {19240}, races = {1, 3}},
	},
	[44] = {
		{id = 10915, cost = 24000, requiredIds = {9474}},
		{id = 27799, cost = 1200, requiredIds = {15431}, requiredTalentId = 15237},
		{id = 10927, cost = 24000, requiredIds = {6078}},
		{id = 19278, cost = 1200, requiredIds = {19277}, race = 5},
		{id = 10911, cost = 24000, requiredIds = {605}},
		{id = 17313, cost = 1200, requiredIds = {17312}, requiredTalentId = 15407},
		{id = 10909, cost = 24000, requiredIds = {2096}},
		{id = 19310, cost = 1200, requiredIds = {19309}, race = 8},
	},
	[46] = {
		{id = 10963, cost = 26000, requiredIds = {2060}},
		{id = 10881, cost = 26000, requiredIds = {10880}},
		{id = 10933, cost = 26000, requiredIds = {6060}},
		{id = 10945, cost = 26000, requiredIds = {8106}},
	},
	[48] = {
		{id = 10875, cost = 28000, requiredIds = {10874}},
		{id = 10937, cost = 28000, requiredIds = {2791}},
		{id = 10899, cost = 28000, requiredIds = {10898}},
		{id = 21562, cost = 28000, requiredIds = {10937}},
		{id = 15266, cost = 28000, requiredIds = {15265}},
	},
	[50] = {
		{id = 14819, cost = 1500, requiredIds = {14818}, requiredTalentId = 14752},
		{id = 10951, cost = 30000, requiredIds = {1006}},
		{id = 10916, cost = 30000, requiredIds = {10915}},
		{id = 27870, cost = 1200, requiredIds = {724}, requiredTalentId = 724},
		{id = 10960, cost = 30000, requiredIds = {996}},
		{id = 10928, cost = 30000, requiredIds = {10927}},
		{id = 10941, cost = 30000, requiredIds = {9592}},
		{id = 10893, cost = 30000, requiredIds = {10892}},
		{id = 19265, cost = 1500, requiredIds = {19264}, races = {5, 10}},
		{id = 44045, cost = 1500, requiredIds = {44044}, races = {3, 11}},
		{id = 19304, cost = 1500, requiredIds = {19303}, race = 4},
		{id = 19284, cost = 1500, requiredIds = {19283}, race = 8},
		{id = 19242, cost = 1500, requiredIds = {19241}, races = {1, 3}},
		{id = 19274, cost = 1500, requiredIds = {19273}, race = 1},
	},
	[52] = {
		{id = 10964, cost = 38000, requiredIds = {10963}},
		{id = 27800, cost = 1900, requiredIds = {27799}, requiredTalentId = 15237},
		{id = 19279, cost = 1900, requiredIds = {19278}, race = 5},
		{id = 10946, cost = 38000, requiredIds = {10945}},
		{id = 17314, cost = 1900, requiredIds = {17313}, requiredTalentId = 15407},
		{id = 10953, cost = 38000, requiredIds = {8192}},
		{id = 19311, cost = 1900, requiredIds = {19310}, race = 8},
	},
	[54] = {
		{id = 10900, cost = 40000, requiredIds = {10899}},
		{id = 15267, cost = 40000, requiredIds = {15266}},
		{id = 10934, cost = 40000, requiredIds = {10933}},
	},
	[56] = {
		{id = 10876, cost = 42000, requiredIds = {10875}},
		{id = 34863, cost = 2100, requiredIds = {34861}, requiredTalentId = 34861},
		{id = 10917, cost = 42000, requiredIds = {10916}},
		{id = 10929, cost = 42000, requiredIds = {10928}},
		{id = 27683, cost = 42000, requiredIds = {10958}},
		{id = 10890, cost = 42000, requiredIds = {10888}},
		{id = 10958, cost = 42000, requiredIds = {10957}},
	},
	[58] = {
		{id = 10965, cost = 44000, requiredIds = {10964}},
		{id = 20770, cost = 44000, requiredIds = {10881}},
		{id = 10947, cost = 44000, requiredIds = {10946}},
		{id = 10912, cost = 44000, requiredIds = {10911}},
		{id = 10894, cost = 44000, requiredIds = {10893}},
		{id = 19305, cost = 2200, requiredIds = {19304}, race = 4},
		{id = 19243, cost = 2200, requiredIds = {19242}, races = {1, 3}},
	},
	[60] = {
		{id = 27841, cost = 2300, requiredIds = {14819}, requiredTalentId = 14752},
		{id = 10952, cost = 46000, requiredIds = {10951}},
		{id = 10938, cost = 46000, requiredIds = {10937}},
		{id = 10901, cost = 46000, requiredIds = {10900}},
		{id = 21564, cost = 46000, requiredIds = {21562}},
		{id = 27681, cost = 2300, requiredIds = {27841}, requiredTalentId = 14752},
		{id = 10955, cost = 46000, requiredIds = {9485}},
		{id = 34864, cost = 2300, requiredIds = {34863}, requiredTalentId = 34861},
		{id = 25314, cost = 65000, requiredIds = {10965}},
		{id = 15261, cost = 46000, requiredIds = {15267}},
		{id = 27801, cost = 2300, requiredIds = {27800}, requiredTalentId = 15237},
		{id = 27871, cost = 1500, requiredIds = {27870}, requiredTalentId = 724},
		{id = 10961, cost = 46000, requiredIds = {10960}},
		{id = 25316, cost = 6500, requiredIds = {10961}},
		{id = 25315, cost = 6500, requiredIds = {10929}},
		{id = 19280, cost = 2300, requiredIds = {19279}, race = 5},
		{id = 10942, cost = 46000, requiredIds = {10941}},
		{id = 18807, cost = 2300, requiredIds = {17314}, requiredTalentId = 15407},
		{id = 19266, cost = 2300, requiredIds = {19265}, races = {5, 10}},
		{id = 34916, cost = 2300, requiredIds = {34914}, requiredTalentId = 34914},
		{id = 44046, cost = 2300, requiredIds = {44045}, races = {3, 11}},
		{id = 19285, cost = 2300, requiredIds = {19284}, race = 8},
		{id = 19312, cost = 2300, requiredIds = {19311}, race = 8},
		{id = 19275, cost = 2300, requiredIds = {19274}, race = 1},
	},
	[61] = {
		{id = 25233, cost = 53000, requiredIds = {10917}},
		{id = 25363, cost = 53000, requiredIds = {10934}},
	},
	[62] = {
		{id = 32379, cost = 59000},
	},
	[63] = {
		{id = 25379, cost = 65000, requiredIds = {10876}},
		{id = 25210, cost = 65000, requiredIds = {25314}},
		{id = 25372, cost = 65000, requiredIds = {10947}},
	},
	[64] = {
		{id = 32546, cost = 72000},
	},
	[65] = {
		{id = 25217, cost = 80000, requiredIds = {10901}},
		{id = 34865, cost = 2300, requiredIds = {34864}, requiredTalentId = 34861},
		{id = 25221, cost = 80000, requiredIds = {25315}},
		{id = 25367, cost = 80000, requiredIds = {10894}},
	},
	[66] = {
		{id = 25384, cost = 65000, requiredIds = {15261}},
		{id = 25429, cost = 89000, requiredIds = {10942}},
		{id = 34433, cost = 89000},
		{id = 25446, cost = 6500, requiredIds = {19305}, race = 4},
		{id = 25437, cost = 6500, requiredIds = {19243}, races = {1, 3}},
	},
	[67] = {
		{id = 25235, cost = 99000, requiredIds = {25233}},
		{id = 25596, cost = 99000, requiredIds = {10953}},
	},
	[68] = {
		{id = 25213, cost = 110000, requiredIds = {25210}},
		{id = 25331, cost = 3250, requiredIds = {27801}, requiredTalentId = 15237},
		{id = 25308, cost = 110000, requiredIds = {25316}},
		{id = 33076, cost = 110000},
		{id = 25435, cost = 110000, requiredIds = {20770}},
		{id = 25467, cost = 6500, requiredIds = {19280}, race = 5},
		{id = 25387, cost = 6500, requiredIds = {18807}, requiredTalentId = 15407},
		{id = 25433, cost = 110000, requiredIds = {10958}},
		{id = 25477, cost = 6500, requiredIds = {19312}, race = 8},
	},
	[69] = {
		{id = 25431, cost = 65000, requiredIds = {10952}},
		{id = 25364, cost = 65000, requiredIds = {25363}},
		{id = 25375, cost = 65000, requiredIds = {25372}},
	},
	[70] = {
		{id = 25312, cost = 2300, requiredIds = {27841}, requiredTalentId = 14752},
		{id = 25380, cost = 110000, requiredIds = {25379}},
		{id = 32375, cost = 110000, requiredIds = {988}},
		{id = 25389, cost = 65000, requiredIds = {10938}},
		{id = 25218, cost = 140000, requiredIds = {25217}},
		{id = 32999, cost = 3400, requiredIds = {25312}, requiredTalentId = 14752},
		{id = 34866, cost = 2300, requiredIds = {34865}, requiredTalentId = 34861},
		{id = 28275, cost = 1500, requiredIds = {27871}, requiredTalentId = 724},
		{id = 25222, cost = 140000, requiredIds = {25221}},
		{id = 32996, cost = 110000, requiredIds = {32379}},
		{id = 25368, cost = 140000, requiredIds = {25367}},
		{id = 25461, cost = 6500, requiredIds = {19266}, races = {5, 10}},
		{id = 34917, cost = 2300, requiredIds = {34916}, requiredTalentId = 34914},
		{id = 44047, cost = 3250, requiredIds = {44046}, races = {3, 11}},
		{id = 25470, cost = 6500, requiredIds = {19285}, race = 8},
		{id = 25441, cost = 6500, requiredIds = {19275}, race = 1},
	},
},
[2] = { --Wrath Spells
  [1] = {
    {id = 1243, cost = 10}, -- Power Word: Fortitude (rank 1)
  },
  [4] = {
    {id = 2052, cost = 100, requiredIds = {2050}}, -- Lesser Heal (rank 2)
    {id = 589, cost = 100}, -- Shadow Word: Pain (rank 1)
  },
  [6] = {
    {id = 17, cost = 100}, -- Power Word: Shield (rank 1)
    {id = 591, cost = 100, requiredIds = {585}}, -- Smite (rank 2)
  },
  [8] = {
    {id = 586, cost = 200}, -- Fade
    {id = 139, cost = 200}, -- Renew (rank 1)
  },
  [10] = {
    {id = 2053, cost = 300, requiredIds = {2052}}, -- Lesser Heal (rank 3)
    {id = 8092, cost = 300}, -- Mind Blast (rank 1)
    {id = 2006, cost = 300}, -- Resurrection (rank 1)
    {id = 594, cost = 300, requiredIds = {589}}, -- Shadow Word: Pain (rank 2)
  },
  [12] = {
    {id = 588, cost = 800}, -- Inner Fire (rank 1)
    {id = 1244, cost = 800, requiredIds = {1243}}, -- Power Word: Fortitude (rank 2)
    {id = 592, cost = 800, requiredIds = {17}}, -- Power Word: Shield (rank 2)
  },
  [14] = {
    {id = 528, cost = 1200}, -- Cure Disease
    {id = 8122, cost = 1200}, -- Psychic Scream (rank 1)
    {id = 6074, cost = 1200, requiredIds = {139}}, -- Renew (rank 2)
    {id = 598, cost = 1200, requiredIds = {591}}, -- Smite (rank 3)
  },
  [16] = {
    {id = 2054, cost = 1600}, -- Heal (rank 1)
    {id = 8102, cost = 1600, requiredIds = {8092}}, -- Mind Blast (rank 2)
  },
  [18] = {
    {id = 527, cost = 2000}, -- Dispel Magic (rank 1)
    {id = 600, cost = 2000, requiredIds = {592}}, -- Power Word: Shield (rank 3)
    {id = 970, cost = 2000, requiredIds = {594}}, -- Shadow Word: Pain (rank 3)
  },
  [20] = {
    {id = 2944, cost = 3000}, -- Devouring Plague (rank 1)
    {id = 6346, cost = 0800}, -- Fear Ward
    {id = 2061, cost = 3000}, -- Flash Heal (rank 1)
    {id = 14914, cost = 3000}, -- Holy Fire (rank 1)
    {id = 15237, cost = 3000}, -- Holy Nova (rank 1)
    {id = 7128, cost = 3000, requiredIds = {588}}, -- Inner Fire (rank 2)
    {id = 453, cost = 3000}, -- Mind Soothe (rank 1)
    {id = 6075, cost = 3000, requiredIds = {6074}}, -- Renew (rank 3)
    {id = 9484, cost = 3000}, -- Shackle Undead (rank 1)
  },
  [22] = {
    {id = 2055, cost = 4000, requiredIds = {2054}}, -- Heal (rank 2)
    {id = 8103, cost = 4000, requiredIds = {8102}}, -- Mind Blast (rank 3)
    {id = 2096, cost = 4000}, -- Mind Vision (rank 1)
    {id = 2010, cost = 4000, requiredIds = {2006}}, -- Resurrection (rank 2)
    {id = 984, cost = 4000, requiredIds = {598}}, -- Smite (rank 4)
  },
  [24] = {
    {id = 15262, cost = 5000, requiredIds = {14914}}, -- Holy Fire (rank 2)
    {id = 8129, cost = 5000}, -- Mana Burn
    {id = 1245, cost = 5000, requiredIds = {1244}}, -- Power Word: Fortitude (rank 3)
    {id = 3747, cost = 5000, requiredIds = {600}}, -- Power Word: Shield (rank 4)
  },
  [26] = {
    {id = 19238, cost = 60, requiredIds = {19236}, requiredTalentId = 19236}, -- Desperate Prayer (rank 2)
    {id = 9472, cost = 6000, requiredIds = {2061}}, -- Flash Heal (rank 2)
    {id = 6076, cost = 6000, requiredIds = {6075}}, -- Renew (rank 4)
    {id = 992, cost = 6000, requiredIds = {970}}, -- Shadow Word: Pain (rank 4)
  },
  [28] = {
    {id = 19276, cost = 8000, requiredIds = {2944}}, -- Devouring Plague (rank 2)
    {id = 6063, cost = 8000, requiredIds = {2055}}, -- Heal (rank 3)
    {id = 15430, cost = 8000, requiredIds = {15237}}, -- Holy Nova (rank 2)
    {id = 8104, cost = 8000, requiredIds = {8103}}, -- Mind Blast (rank 4)
    {id = 17311, cost = 400, requiredIds = {15407}, requiredTalentId = 15407}, -- Mind Flay (rank 2)
    {id = 8124, cost = 8000, requiredIds = {8122}}, -- Psychic Scream (rank 2)
  },
  [30] = {
    {id = 14752, cost = 600}, -- Divine Spirit (rank 1)
    {id = 15263, cost = 10000, requiredIds = {15262}}, -- Holy Fire (rank 3)
    {id = 602, cost = 10000, requiredIds = {7128}}, -- Inner Fire (rank 3)
    {id = 605, cost = 10000}, -- Mind Control
    {id = 6065, cost = 10000, requiredIds = {3747}}, -- Power Word: Shield (rank 5)
    {id = 596, cost = 10000}, -- Prayer of Healing (rank 1)
    {id = 976, cost = 10000}, -- Shadow Protection (rank 1)
    {id = 1004, cost = 10000, requiredIds = {984}}, -- Smite (rank 5)
  },
  [32] = {
    {id = 552, cost = 11000}, -- Abolish Disease
    {id = 9473, cost = 11000, requiredIds = {9472}}, -- Flash Heal (rank 3)
    {id = 6077, cost = 11000, requiredIds = {6076}}, -- Renew (rank 5)
  },
  [34] = {
    {id = 19240, cost = 300, requiredIds = {19238}, requiredTalentId = 19236}, -- Desperate Prayer (rank 3)
    {id = 6064, cost = 12000, requiredIds = {6063}}, -- Heal (rank 4)
    {id = 1706, cost = 12000}, -- Levitate
    {id = 8105, cost = 12000, requiredIds = {8104}}, -- Mind Blast (rank 5)
    {id = 10880, cost = 12000, requiredIds = {2010}}, -- Resurrection (rank 3)
    {id = 2767, cost = 12000, requiredIds = {992}}, -- Shadow Word: Pain (rank 5)
  },
  [36] = {
    {id = 19277, cost = 14000, requiredIds = {19276}}, -- Devouring Plague (rank 3)
    {id = 988, cost = 14000, requiredIds = {527}}, -- Dispel Magic (rank 2)
    {id = 15264, cost = 14000, requiredIds = {15263}}, -- Holy Fire (rank 4)
    {id = 15431, cost = 14000, requiredIds = {15430}}, -- Holy Nova (rank 3)
    {id = 17312, cost = 700, requiredIds = {17311}, requiredTalentId = 15407}, -- Mind Flay (rank 2)
    {id = 2791, cost = 14000, requiredIds = {1245}}, -- Power Word: Fortitude (rank 4)
    {id = 6066, cost = 14000, requiredIds = {6065}}, -- Power Word: Shield (rank 6)
  },
  [38] = {
    {id = 9474, cost = 16000, requiredIds = {9473}}, -- Flash Heal (rank 4)
    {id = 6078, cost = 16000, requiredIds = {6077}}, -- Renew (rank 6)
    {id = 6060, cost = 16000, requiredIds = {1004}}, -- Smite (rank 6)
  },
  [40] = {
    {id = 14818, cost = 900, requiredIds = {14752}}, -- Divine Spirit (rank 2)
    {id = 2060, cost = 18000}, -- Greater Heal (rank 1)
    {id = 1006, cost = 18000, requiredIds = {602}}, -- Inner Fire (rank 4)
    {id = 8106, cost = 18000, requiredIds = {8105}}, -- Mind Blast (rank 6)
    {id = 996, cost = 18000, requiredIds = {596}}, -- Prayer of Healing (rank 2)
    {id = 9485, cost = 18000, requiredIds = {9484}}, -- Shackle Undead (rank 2)
  },
  [42] = {
    {id = 19241, cost = 600, requiredIds = {19240}, requiredTalentId = 19236}, -- Desperate Prayer (rank 4)
    {id = 15265, cost = 22000, requiredIds = {15264}}, -- Holy Fire (rank 5)
    {id = 10898, cost = 22000, requiredIds = {6066}}, -- Power Word: Shield (rank 7)
    {id = 10888, cost = 22000, requiredIds = {8124}}, -- Psychic Scream (rank 3)
    {id = 10957, cost = 22000, requiredIds = {976}}, -- Shadow Protection (rank 2)
    {id = 10892, cost = 22000, requiredIds = {2767}}, -- Shadow Word: Pain (rank 6)
  },
  [44] = {
    {id = 19278, cost = 24000, requiredIds = {19277}}, -- Devouring Plague (rank 4)
    {id = 10915, cost = 24000, requiredIds = {9474}}, -- Flash Heal (rank 5)
    {id = 27799, cost = 24000, requiredIds = {15431}}, -- Holy Nova (rank 4)
    {id = 17313, cost = 1200, requiredIds = {17312}, requiredTalentId = 15407}, -- Mind Flay (rank 3)
    {id = 10909, cost = 24000, requiredIds = {2096}}, -- Mind Vision (rank 2)
    {id = 10927, cost = 24000, requiredIds = {6078}}, -- Renew (rank 7)
  },
  [46] = {
    {id = 10963, cost = 26000, requiredIds = {2060}}, -- Greater Heal (rank 2)
    {id = 10945, cost = 26000, requiredIds = {8106}}, -- Mind Blast (rank 7)
    {id = 10881, cost = 26000, requiredIds = {10880}}, -- Resurrection (rank 4)
    {id = 10933, cost = 26000, requiredIds = {6060}}, -- Smite (rank 7)
  },
  [48] = {
    {id = 15266, cost = 28000, requiredIds = {15265}}, -- Holy Fire (rank 6)
    {id = 10937, cost = 28000, requiredIds = {2791}}, -- Power Word: Fortitude (rank 5)
    {id = 10899, cost = 28000, requiredIds = {10898}}, -- Power Word: Shield (rank 8)
    {id = 21562, cost = 28000, requiredIds = {10937}}, -- Prayer of Fortitude (rank 1)
  },
  [50] = {
    {id = 19242, cost = 1100, requiredIds = {19241}, requiredTalentId = 19236}, -- Desperate Prayer (rank 5)
    {id = 14819, cost = 1500, requiredIds = {14818}}, -- Divine Spirit (rank 3)
    {id = 10916, cost = 30000, requiredIds = {10915}}, -- Flash Heal (rank 6)
    {id = 10951, cost = 30000, requiredIds = {1006}}, -- Inner Fire (rank 5)
    {id = 27870, cost = 1200, requiredIds = {724}, requiredTalentId = 724}, -- Lightwell (rank 2)
    {id = 10960, cost = 30000, requiredIds = {996}}, -- Prayer of Healing (rank 3)
    {id = 10928, cost = 30000, requiredIds = {10927}}, -- Renew (rank 8)
    {id = 10893, cost = 30000, requiredIds = {10892}}, -- Shadow Word: Pain (rank 7)
  },
  [52] = {
    {id = 19279, cost = 38000, requiredIds = {19278}}, -- Devouring Plague (rank 5)
    {id = 10964, cost = 38000, requiredIds = {10963}}, -- Greater Heal (rank 3)
    {id = 27800, cost = 38000, requiredIds = {27799}}, -- Holy Nova (rank 5)
    {id = 10946, cost = 38000, requiredIds = {10945}}, -- Mind Blast (rank 8)
    {id = 17314, cost = 1900, requiredIds = {17313}, requiredTalentId = 15407}, -- Mind Flay (rank 5)
  },
  [54] = {
    {id = 15267, cost = 40000, requiredIds = {15266}}, -- Holy Fire (rank 7)
    {id = 10900, cost = 40000, requiredIds = {10899}}, -- Power Word: Shield (rank 9)
    {id = 10934, cost = 40000, requiredIds = {10933}}, -- Smite (rank 8)
  },
  [56] = {
    {id = 34863, cost = 2100, requiredIds = {34861}, requiredTalentId = 34861}, -- Circle of Healing (rank 2)
    {id = 10917, cost = 42000, requiredIds = {10916}}, -- Flash Heal (rank 7)
    {id = 27683, cost = 42000, requiredIds = {10958}}, -- Prayer of Shadow Protection (rank 1)
    {id = 10890, cost = 42000, requiredIds = {10888}}, -- Psychic Scream (rank 4)
    {id = 10929, cost = 42000, requiredIds = {10928}}, -- Renew (rank 9)
    {id = 10958, cost = 42000, requiredIds = {10957}}, -- Shadow Protection (rank 3)
  },
  [58] = {
    {id = 19243, cost = 1500, requiredIds = {19242}, requiredTalentId = 19236}, -- Desperate Prayer (rank 6)
    {id = 10965, cost = 44000, requiredIds = {10964}}, -- Greater Heal (rank 4)
    {id = 10947, cost = 44000, requiredIds = {10946}}, -- Mind Blast (rank 9)
    {id = 20770, cost = 44000, requiredIds = {10881}}, -- Resurrection (rank 5)
    {id = 10894, cost = 44000, requiredIds = {10893}}, -- Shadow Word: Pain (rank 8)
  },
  [60] = {
    {id = 34864, cost = 2300, requiredIds = {34863}, requiredTalentId = 34861}, -- Circle of Healing (rank 3)
    {id = 19280, cost = 46000, requiredIds = {19279}}, -- Devouring Plague (rank 6)
    {id = 27841, cost = 2300, requiredIds = {14819}}, -- Divine Spirit (rank 4)
    {id = 25314, cost = 65000, requiredIds = {10965}}, -- Greater Heal (rank 5)
    {id = 15261, cost = 46000, requiredIds = {15267}}, -- Holy Fire (rank 8)
    {id = 27801, cost = 46000, requiredIds = {27800}}, -- Holy Nova (rank 6)
    {id = 10952, cost = 46000, requiredIds = {10951}}, -- Inner Fire (rank 6)
    {id = 27871, cost = 1500, requiredIds = {27870}, requiredTalentId = 724}, -- Lightwell (rank 3)
    {id = 18807, cost = 2300, requiredIds = {17314}, requiredTalentId = 15407}, -- Mind Flay (rank 6)
    {id = 10938, cost = 46000, requiredIds = {10937}}, -- Power Word: Fortitude (rank 6)
    {id = 10901, cost = 46000, requiredIds = {10900}}, -- Power Word: Shield (rank 10)
    {id = 21564, cost = 46000, requiredIds = {10938,21562}}, -- Prayer of Fortitude (rank 2)
    {id = 10961, cost = 46000, requiredIds = {10960}}, -- Prayer of Healing (rank 4)
    {id = 25316, cost = 6500, requiredIds = {10961}}, -- Prayer of Healing (rank 5)
    {id = 27681, cost = 2300, requiredIds = {27841}}, -- Prayer of Spirit (rank 1)
    {id = 25315, cost = 6500, requiredIds = {10929}}, -- Renew (rank 10)
    {id = 10955, cost = 46000, requiredIds = {9485}}, -- Shackle Undead (rank 3)
    {id = 34916, cost = 2300, requiredIds = {34914}, requiredTalentId = 34914}, -- Vampiric Touch (rank 2)
  },
  [61] = {
    {id = 25233, cost = 53000, requiredIds = {10917}}, -- Flash Heal (rank 8)
    {id = 25363, cost = 53000, requiredIds = {10934}}, -- Smite (rank 9)
  },
  [62] = {
    {id = 32379, cost = 59000}, -- Shadow Word: Death (rank 1)
    },
  [63] = {
    {id = 25210, cost = 65000, requiredIds = {25314}}, -- Greater Heal (rank 6)
    {id = 25372, cost = 65000, requiredIds = {10947}}, -- Mind Blast (rank 10)
  },
  [64] = {
    {id = 32546, cost = 72000}, -- Binding Heal (rank 1)
  },
  [65] = {
    {id = 34865, cost = 4000, requiredIds = {34864}, requiredTalentId = 34861}, -- Circle of Healing (rank 4)
    {id = 25217, cost = 80000, requiredIds = {10901}}, -- Power Word: Shield (rank 11)
    {id = 25221, cost = 80000, requiredIds = {25315}}, -- Renew (rank 11
    {id = 25367, cost = 80000, requiredIds = {10894}}, -- Shadow Word: Pain (rank 9)
  },
  [66] = {
    {id = 25437, cost = 2200, requiredIds = {19243}, requiredTalentId = 19236}, -- Desperate Prayer (rank 7)
    {id = 25384, cost = 65000, requiredIds = {15261}}, -- Holy Fire (rank 9)
    {id = 34433, cost = 89000}, -- Shadowfiend
  },
  [67] = {
    {id = 25235, cost = 99000, requiredIds = {25233}}, -- Flash Heal (rank 9)
  },
  [68] = {
    {id = 25467, cost = 110000, requiredIds = {19280}}, -- Devouring Plague (rank 7)
    {id = 25213, cost = 110000, requiredIds = {25210}}, -- Greater Heal (rank 7)
    {id = 25331, cost = 110000, requiredIds = {27801}}, -- Holy Nova (rank 7)
    {id = 25387, cost = 6500, requiredIds = {18807}, requiredTalentId = 15407}, -- Mind Flay (rank 7)
    {id = 25308, cost = 110000, requiredIds = {25316}}, -- Prayer of Healing (rank 6)
    {id = 33076, cost = 110000}, -- Prayer of Mending (rank 1)
    {id = 25435, cost = 110000, requiredIds = {20770}}, -- Resurrection (rank 6)
    {id = 25433, cost = 110000, requiredIds = {10958}}, -- Shadow Protection (rank 4)
  },
  [69] = {
    {id = 25431, cost = 65000, requiredIds = {10952}}, -- Inner Fire (rank 7)
    {id = 25375, cost = 65000, requiredIds = {25372}}, -- Mind Blast (rank 11)
    {id = 25364, cost = 65000, requiredIds = {25363}}, -- Smite (rank 10)
  },
  [70] = {
    {id = 34866, cost = 7000, requiredIds = {34865}, requiredTalentId = 34861}, -- Circle of Healing (rank 5)
    {id = 25312, cost = 2300, requiredIds = {27841}}, -- Divine Spirit (rank 5)
    {id = 28275, cost = 1500, requiredIds = {27871}, requiredTalentId = 724}, -- Lightwell (rank 4)
    {id = 32375, cost = 110000, requiredIds = {988}}, -- Mass Dispel
    {id = 53005, cost = 5000, requiredIds = {47540}, requiredTalentId = 47540}, -- Penance (rank 2)
    {id = 25389, cost = 65000, requiredIds = {10938}}, -- Power Word: Fortitude (rank 7)
    {id = 25218, cost = 140000, requiredIds = {25217}}, -- Power Word: Shield (rank 12)
    {id = 25392, cost = 100000, requiredIds = {25389,21564}}, -- Prayer of Fortitude (rank 3)
    {id = 39374, cost = 100000, requiredIds = {25433,10958}}, -- Prayer of Shadow Protection (rank 2)
    {id = 32999, cost = 3400, requiredIds = {25312,27681}}, -- Prayer of Spirit (rank 2)
    {id = 25222, cost = 140000, requiredIds = {25221}}, -- Renew (rank 12)
    {id = 32996, cost = 110000, requiredIds = {32379}}, -- Shadow Word: Death (rank 2)
    {id = 25368, cost = 140000, requiredIds = {25367}}, -- Shadow Word: Pain (rank 10)
    {id = 34917, cost = 2300, requiredIds = {34916}, requiredTalentId = 34914}, -- Vampiric Touch (rank 3)
  },
  [71] = {
    {id = 48040, cost = 180000, requiredIds = {25431}}, -- Inner Fire (rank 8)
  },
  [72] = {
    {id = 48119, cost = 180000, requiredIds = {32546}}, -- Binding Heal (rank 2)
    {id = 48134, cost = 180000, requiredIds = {25384}}, -- Holy Fire (rank 10)
  },
  [73] = {
    {id = 48172, cost = 3250, requiredIds = {25437}}, -- Desperate Prayer (rank 8)
    {id = 48299, cost = 180000, requiredIds = {25467}}, -- Devouring Plague (rank 8)
    {id = 48070, cost = 180000, requiredIds = {25235}}, -- Flash Heal (rank 10)
    {id = 48062, cost = 180000, requiredIds = {25213}}, -- Greater Heal (rank 8)
  },
  [74] = {
    {id = 48126, cost = 180000, requiredIds = {25375}}, -- Mind Blast (rank 12)
    {id = 48155, cost = 9000, requiredIds = {25387}, requiredTalentId = 15407}, -- Mind Flay (rank 8)
    {id = 48112, cost = 100000, requiredIds = {33076}}, -- Prayer of Mending (rank 2)
    {id = 48122, cost = 180000, requiredIds = {25364}}, -- Smite (11)
  },
  [75] = {
    {id = 48088, cost = 9000, requiredIds = {34866}}, -- Circle of Healing (rank 6)
    {id = 48077, cost = 180000, requiredIds = {25331}}, -- Holy Nova (rank 8)
    {id = 48086, cost = 9000, requiredIds = {28275}, requiredTalentId = 724}, -- Lightwell (rank 5)
    {id = 48045, cost = 10000}, -- Mind Sear (rank 1)
    {id = 53006, cost = 9000, requiredIds = {53005}, requiredTalentId = 47540}, -- Penance (rank 3))
    {id = 48065, cost = 180000, requiredIds = {25218}}, -- Power Word: Shield (13)
    {id = 48067, cost = 180000, requiredIds = {25222}}, -- Renew (rank 13)
    {id = 48157, cost = 180000, requiredIds = {32996}}, -- Shadow Word: Death (rank 3)
    {id = 48124, cost = 180000, requiredIds = {25368}}, -- Shadow Word: Pain (rank 11)
    {id = 48159, cost = 9000, requiredIds = {43917}, requiredTalentId = 34914}, -- Vampiric Touch (rank 4)
  },
  [76] = {
    {id = 48072, cost = 180000, requiredIds = {25308}}, -- Prayer of Healing (rank 7)
    {id = 48169, cost = 180000, requiredIds = {25433}}, -- Shadow Protection (5)
  },
  [77] = {
    {id = 48168, cost = 180000, requiredIds = {48040}}, -- Inner Fire (rank 9)
    {id = 48170, cost = 180000, requiredIds = {48169, 39374}}, -- Prayer of Shadow Protection (rank 3)
  },
  [78] = {
    {id = 48120, cost = 180000, requiredIds = {48119}}, -- Binding Heal (rank 3)
    {id = 48063, cost = 180000, requiredIds = {48062}}, -- Greater Heal (rank 9)
    {id = 48135, cost = 180000, requiredIds = {48134}}, -- Holy Fire (rank 11)
    {id = 48171, cost = 180000, requiredIds = {25435}}, -- Resurrection (rank 7)
  },
  [79] = {
    {id = 48300, cost = 180000, requiredIds = {48299}}, -- Devouring Plague (rank 9)
    {id = 48071, cost = 180000, requiredIds = {48070}}, -- Flash Heal (rank 11)
    {id = 48127, cost = 180000, requiredIds = {48126}}, -- Mind BLast (rank 13)
    {id = 48113, cost = 180000, requiredIds = {48112}}, -- Prayer of Mending (rank 3)
    {id = 48123, cost = 180000, requiredIds = {48122}}, -- Smite (rank 12)
  },
  [80] = {
    {id = 48089, cost = 9000, requiredIds = {48088}}, -- Circle of Healing (rank 7)
    {id = 48173, cost = 9000, requiredIds = {48172}}, -- Desperate Prayer (rank 9)
    {id = 64843, cost = 180000}, -- Divine Hymn (rank 1)
    {id = 48073, cost = 9000, requiredIds = {25312}}, -- Divine Spirit (rank 6)
    {id = 48078, cost = 180000, requiredIds = {48077}}, -- Holy Nova (rank 9)
    {id = 64901, cost = 65000}, -- Hymn of Hope
    {id = 48087, cost = 9000, requiredIds = {48086}, requiredTalentId = 724}, -- Lightwell (rank 6)
    {id = 48156, cost = 9000, requiredIds = {48155}, requiredTalentId = 15407}, -- Mind Flay (rank 9)
    {id = 53023, cost = 100000, requiredIds = {48045}}, -- Mind Sear (rank 2)
    {id = 53007, cost = 9000, requiredIds = {53006}, requiredTalentId = 47540}, -- Penance (rank 4)
    {id = 48161, cost = 180000, requiredIds = {25389}}, -- Power Word: Fortitude (rank 8)
    {id = 48066, cost = 180000, requiredIds = {48065}}, -- Power Word: Shield (rank 14)
    {id = 48162, cost = 180000, requiredIds = {48161,25392}}, -- Prayer of Fortitude (rank 4)
    {id = 48074, cost = 9000, requiredIds = {48073,32999}}, -- Prayer of Spirit (rank 3)
    {id = 48068, cost = 180000, requiredIds = {48067}}, -- Renew (rank 14)
    {id = 48158, cost = 180000, requiredIds = {48157}}, -- Shadow Word: Death (rank 4)
    {id = 48125, cost = 180000, requiredIds = {48124}}, -- Shadow Word: Pain (rank 12)
    {id = 48160, cost = 9000, requiredIds = {48159}, requiredTalentId = 34914}, -- Vampiric Touch (rank 5)
  },
},
}

wt.SpellsByLevel = wt.RaceFilter(SpellsByLevel[expac])
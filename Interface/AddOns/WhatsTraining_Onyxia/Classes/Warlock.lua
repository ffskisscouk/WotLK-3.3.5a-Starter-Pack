--[[	file meta info
	@file 		Warlock.lua
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
	@return		If not "WARLOCK", then return with nothing
--]]
if (wt.currentClass ~= "WARLOCK") then
	return
end

local expac = GetExpansionLevel()

local TomesByLevel = {
[0] = { --Vanilla Tomes
  [4] = {
		{id = 16321, cost = 100},
	},
  [8] = {
		{id = 16302, cost = 100},
	},
  [12] = {
		{id = 16331, cost = 600},
	},
  [14] = {
		{id = 16322, cost = 900},
		{id = 16326, cost = 900},
	},
  [16] = {
		{id = 16351, cost = 1200},
	},
  [18] = {
		{id = 16316, cost = 1500},
		{id = 16357, cost = 1500},
	},
  [20] = {
		{id = 16346, cost = 2000},
	},
  [22] = {
		{id = 16375, cost = 2500},
	},
  [24] = {
    {id = 16327, cost = 3000},
		{id = 16352, cost = 3000},
    {id = 16363, cost = 3000}
  },
  [26] = {
    {id = 16323, cost = 4000},
		{id = 16358, cost = 4000},
    {id = 16379, cost = 4000}
  },
  [28] = {
		{id = 16317, cost = 5000},
		{id = 16368, cost = 5000},
	},
  [30] = {
		{id = 16347, cost = 6000},
	},
  [32] = {
    {id = 16353, cost = 7000},
		{id = 16380, cost = 7000},
    {id = 16384, cost = 7000}
  },
  [34] = {
    {id = 16328, cost = 8000},
		{id = 16359, cost = 8000},
    {id = 16376, cost = 8000}
  },
  [36] = {
    {id = 16364, cost = 9000},
		{id = 16371, cost = 9000},
    {id = 16388, cost = 9000}
  },
  [38] = {
    {id = 16318, cost = 10000},
		{id = 16324, cost = 10000},
    {id = 16381, cost = 10000}
  },
  [40] = {
    {id = 16348, cost = 11000},
		{id = 16354, cost = 11000},
    {id = 16385, cost = 11000}
  },
  [42] = {
		{id = 16360, cost = 11000},
		{id = 16390, cost = 11000},
	},
  [44] = {
		{id = 16329, cost = 12000},
		{id = 16372, cost = 12000},
	},
  [46] = {
		{id = 16377, cost = 13000},
		{id = 16382, cost = 13000},
	},
  [48] = {
    {id = 16319, cost = 14000},
		{id = 16355, cost = 14000},
    {id = 16365, cost = 14000},
		{id = 16386, cost = 14000}
  },
  [50] = {
    {id = 16325, cost = 15000},
		{id = 16349, cost = 15000},
    {id = 16361, cost = 15000}
  },
  [52] = {
		{id = 16373, cost = 18000},
		{id = 16389, cost = 18000},
	},
  [54] = {
		{id = 16330, cost = 20000},
		{id = 16383, cost = 20000},
	},
  [56] = {
		{id = 16356, cost = 22000},
		{id = 16387, cost = 22000},
	},
  [58] = {
    {id = 16320, cost = 24000},
		{id = 16362, cost = 24000},
    {id = 16378, cost = 24000}
  },
  [60] = {
    {id = 16350, cost = 26000},
		{id = 16366, cost = 26000},
    {id = 16374, cost = 26000}
  },
},
[1] = { --TBC Tomes
  [4] = {
    {id = 16321, cost = 100}
  },
  [8] = {
    {id = 16302, cost = 100}
  },
  [12] = {
    {id = 16331, cost = 600}
  },
  [14] = {
    {id = 16322, cost = 900},
    {id = 16326, cost = 900}
  },
  [16] = {
    {id = 16351, cost = 1200}
  },
  [18] = {
    {id = 16316, cost = 1500},
    {id = 16357, cost = 1500}
  },
  [20] = {
    {id = 16346, cost = 2000}
  },
  [22] = {
    {id = 16375, cost = 2500}
  },
  [24] = {
    {id = 16327, cost = 3000},
    {id = 16352, cost = 3000},
    {id = 16363, cost = 3000}
  },
  [26] = {
    {id = 16323, cost = 4000},
    {id = 16358, cost = 4000},
    {id = 16379, cost = 4000}
  },
  [28] = {
    {id = 16317, cost = 5000},
    {id = 16368, cost = 5000}
  },
  [30] = {
    {id = 16347, cost = 6000}
  },
  [32] = {
    {id = 16353, cost = 7000},
    {id = 16380, cost = 7000},
    {id = 16384, cost = 7000}
  },
  [34] = {
    {id = 16328, cost = 8000},
    {id = 16359, cost = 8000},
    {id = 16376, cost = 8000}
  },
  [36] = {
    {id = 16364, cost = 9000},
    {id = 16371, cost = 9000},
    {id = 16388, cost = 9000}
  },
  [38] = {
    {id = 16318, cost = 10000},
    {id = 16324, cost = 10000},
    {id = 16381, cost = 10000}
  },
  [40] = {
    {id = 16348, cost = 11000},
    {id = 16354, cost = 11000},
    {id = 16385, cost = 11000}
  },
  [42] = {
    {id = 16360, cost = 11000},
    {id = 16390, cost = 11000}
  },
  [44] = {
    {id = 16329, cost = 12000},
    {id = 16372, cost = 12000}
  },
  [46] = {
    {id = 16377, cost = 13000},
    {id = 16382, cost = 13000}
  },
  [48] = {
    {id = 16319, cost = 14000},
    {id = 16355, cost = 14000},
    {id = 16365, cost = 14000},
    {id = 16386, cost = 14000}
  },
  [50] = {
    {id = 16325, cost = 15000},
    {id = 16349, cost = 15000},
    {id = 16361, cost = 15000},
    {id = 28071, cost = 15000},
    {id = 23734, cost = 15000}
  },
  [52] = {
    {id = 16373, cost = 18000},
    {id = 16389, cost = 18000},
    {id = 23711, cost = 18000}
  },
  [54] = {
    {id = 16330, cost = 20000},
    {id = 16383, cost = 20000}
  },
  [56] = {
    {id = 16356, cost = 22000},
    {id = 16387, cost = 22000},
    {id = 25900, cost = 22000}
  },
  [58] = {
    {id = 16320, cost = 24000},
    {id = 16362, cost = 24000},
    {id = 16378, cost = 24000}
  },
  [60] = {
    {id = 16350, cost = 26000},
    {id = 16366, cost = 26000},
    {id = 16374, cost = 26000},
    {id = 28072, cost = 26000},
    {id = 23745, cost = 15000},
    {id = 25469, cost = 26000}
  },
  [61] = {
    {id = 23730, cost = 26000}
  },
  [62] = {
    {id = 22180, cost = 26000},
    {id = 22188, cost = 29000}
  },
  [63] = {
    {id = 22183, cost = 32000}
  },
  [64] = {
    {id = 22181, cost = 36000},
    {id = 22185, cost = 36000},
    {id = 22190, cost = 36000}
  },
  [66] = {
    {id = 22184, cost = 44000}
  },
  [68] = {
    {id = 22179, cost = 54000},
    {id = 22186, cost = 54000},
    {id = 23755, cost = 60000}
  },
  [69] = {
    {id = 28068, cost = 60000},
    {id = 23731, cost = 60000}
  },
  [70] = {
    {id = 22182, cost = 67000},
    {id = 22187, cost = 67000},
    {id = 22189, cost = 67000},
    {id = 28073, cost = 67000}
  },
},
}

wt.TomesByLevel = TomesByLevel[expac]

wt.TomeIds = {}
for _, tomesByLevel in pairs(wt.TomesByLevel) do
    for _, tome in ipairs(tomesByLevel) do wt.TomeIds[tome.id] = true end
end

--[[
	@brief		Table for trainable spells for each level

	@table		[n]		Table containing spells available at level n

				@var		id					Spell id
				@var		cost				Cost in copper
				@table		requiredIds			Table containing prerequisite spell IDs
				@var		requiredTalentId	Spell ID of prerequisite talent
				@var		faction				"Alliance" or "Horde" for faction specific spells
--]]
local SpellsByLevel = {
[0] = { --Vanilla Spells
  [1] = {
    {id = 348, cost = 10}
  },
  [4] = {
    {id = 172, cost = 100},
    {id = 702, cost = 100}
  },
  [6] = {
    {id = 1454, cost = 100},
    {id = 695, cost = 100, requiredIds = {686}}
  },
  [8] = {
    {id = 980, cost = 200},
    {id = 5782, cost = 200}
  },
  [10] = {
    {id = 6201, cost = 300, requiredIds = {1120}},
    {id = 696, cost = 300, requiredIds = {687}},
    {id = 1120, cost = 300},
    {id = 707, cost = 300, requiredIds = {348}}
  },
  [12] = {
    {id = 1108, cost = 600, requiredIds = {702}},
    {id = 755, cost = 600},
    {id = 705, cost = 600, requiredIds = {695}}
  },
  [14] = {
    {id = 6222, cost = 900, requiredIds = {172}},
    {id = 704, cost = 900},
    {id = 689, cost = 900}
  },
  [16] = {
    {id = 1455, cost = 1200, requiredIds = {1454}},
    {id = 5697, cost = 1200}
  },
  [18] = {
    {id = 693, cost = 1500, requiredIds = {1120}},
    {id = 1014, cost = 1500, requiredIds = {980}},
    {id = 5676, cost = 1500}
  },
  [20] = {
    {id = 706, cost = 2000},
    {id = 3698, cost = 2000, requiredIds = {755}},
    {id = 1094, cost = 2000, requiredIds = {707}},
    {id = 5740, cost = 2000},
    {id = 698, cost = 2000},
    {id = 1088, cost = 2000, requiredIds = {705}}
  },
  [22] = {
    {id = 6202, cost = 2500, requiredIds = {6201}},
    {id = 6205, cost = 2500, requiredIds = {1108}},
    {id = 699, cost = 2500, requiredIds = {689}},
    {id = 126, cost = 2500}
  },
  [24] = {
    {id = 6223, cost = 3000, requiredIds = {6222}},
    {id = 5138, cost = 3000},
    {id = 8288, cost = 3000, requiredIds = {1120}},
    {id = 5500, cost = 3000},
    {id = 18867, cost = 150, requiredTalentId = 17877}
  },
  [26] = {
    {id = 1714, cost = 4000},
    {id = 132, cost = 4000},
    {id = 1456, cost = 4000, requiredIds = {1455}},
    {id = 17919, cost = 4000, requiredIds = {5676}}
  },
  [28] = {
    {id = 710, cost = 5000},
    {id = 6366, cost = 5000},
    {id = 6217, cost = 5000, requiredIds = {1014}},
    {id = 7658, cost = 5000, requiredIds = {704}},
    {id = 3699, cost = 5000, requiredIds = {3698}},
    {id = 1106, cost = 5000, requiredIds = {1088}}
  },
  [30] = {
    {id = 20752, cost = 6000, requiredIds = {693}},
    {id = 1086, cost = 6000, requiredIds = {706}},
    {id = 709, cost = 6000, requiredIds = {699}},
    {id = 1098, cost = 6000},
    {id = 1949, cost = 6000},
    {id = 2941, cost = 6000, requiredIds = {1094}}
  },
  [32] = {
    {id = 7646, cost = 7000, requiredIds = {6205}},
    {id = 1490, cost = 7000},
    {id = 6213, cost = 7000, requiredIds = {5782}},
    {id = 6229, cost = 7000},
    {id = 18868, cost = 350, requiredIds = {18867}, requiredTalentId = 17877}
  },
  [34] = {
    {id = 7648, cost = 8000, requiredIds = {6223}},
    {id = 5699, cost = 8000, requiredIds = {6202}},
    {id = 6226, cost = 8000, requiredIds = {5138}},
    {id = 6219, cost = 8000, requiredIds = {5740}},
    {id = 17920, cost = 8000, requiredIds = {17919}}
  },
  [36] = {
    {id = 17951, cost = 9000, requiredIds = {6366}},
    {id = 2362, cost = 9000, requiredIds = {1120}},
    {id = 3700, cost = 9000, requiredIds = {3699}},
    {id = 11687, cost = 9000, requiredIds = {1456}},
    {id = 7641, cost = 9000, requiredIds = {1106}}
  },
  [38] = {
    {id = 11711, cost = 10000, requiredIds = {6217}},
    {id = 2970, cost = 10000, requiredIds = {132}},
    {id = 7651, cost = 10000, requiredIds = {709}},
    {id = 8289, cost = 10000, requiredIds = {8288}},
    {id = 18879, cost = 500, requiredTalentId = 18265}
  },
  [40] = {
    {id = 20755, cost = 11000, requiredIds = {20752}},
    {id = 11733, cost = 11000, requiredIds = {1086}},
    {id = 5484, cost = 11000},
    {id = 11665, cost = 11000, requiredIds = {2941}},
    {id = 18869, cost = 550, requiredIds = {18868}, requiredTalentId = 17877}
  },
  [42] = {
    {id = 7659, cost = 11000, requiredIds = {7658}},
    {id = 11707, cost = 11000, requiredIds = {7646}},
    {id = 6789, cost = 11000},
    {id = 11683, cost = 9900, requiredIds = {1949}},
    {id = 17921, cost = 11000, requiredIds = {17920}},
    {id = 11739, cost = 11000, requiredIds = {6229}}
  },
  [44] = {
    {id = 11671, cost = 12000, requiredIds = {7648}},
    {id = 17862, cost = 12000},
    {id = 11703, cost = 12000, requiredIds = {6226}},
    {id = 11725, cost = 12000, requiredIds = {1098}},
    {id = 11693, cost = 12000, requiredIds = {3700}},
    {id = 11659, cost = 12000, requiredIds = {7641}}
  },
  [46] = {
    {id = 17952, cost = 13000, requiredIds = {17951}},
    {id = 11729, cost = 13000, requiredIds = {5699}},
    {id = 11721, cost = 13000, requiredIds = {1490}},
    {id = 11699, cost = 13000, requiredIds = {7651}},
    {id = 11688, cost = 13000, requiredIds = {11687}},
    {id = 11677, cost = 13000, requiredIds = {6219}}
  },
  [48] = {
    {id = 18647, cost = 13000, requiredIds = {710}},
    {id = 18930, cost = 700, requiredTalentId = 17962},
    {id = 17727, cost = 14000, requiredIds = {2362}},
    {id = 11712, cost = 14000, requiredIds = {11711}},
    {id = 18870, cost = 700, requiredIds = {18869}, requiredTalentId = 17877},
    {id = 18880, cost = 700, requiredIds = {18879}, requiredTalentId = 18265},
    {id = 6353, cost = 14000}
  },
  [50] = {
    {id = 20756, cost = 15000, requiredIds = {20755}},
    {id = 11719, cost = 15000, requiredIds = {1714}},
    {id = 18937, cost = 750, requiredTalentId = 18220},
    {id = 17925, cost = 15000, requiredIds = {6789}},
    {id = 11734, cost = 15000, requiredIds = {11733}},
    {id = 11743, cost = 15000, requiredIds = {2970}},
    {id = 11667, cost = 15000, requiredIds = {11665}},
    {id = 17922, cost = 15000, requiredIds = {17921}}
  },
  [52] = {
    {id = 11708, cost = 18000, requiredIds = {11707}},
    {id = 11675, cost = 18000, requiredIds = {8289}},
    {id = 11694, cost = 18000, requiredIds = {11693}},
    {id = 11660, cost = 18000, requiredIds = {11659}},
    {id = 11740, cost = 18000, requiredIds = {11739}}
  },
  [54] = {
    {id = 18931, cost = 1000, requiredIds = {18930}, requiredTalentId = 17962},
    {id = 11672, cost = 20000, requiredIds = {11671}},
    {id = 11700, cost = 20000, requiredIds = {11699}},
    {id = 11704, cost = 20000, requiredIds = {11703}},
    {id = 11684, cost = 18000, requiredIds = {11683}},
    {id = 17928, cost = 20000, requiredIds = {5484}}
  },
  [56] = {
    {id = 17953, cost = 22000, requiredIds = {17952}},
    {id = 11717, cost = 22000, requiredIds = {7659}},
    {id = 17937, cost = 22000, requiredIds = {17862}},
    {id = 6215, cost = 22000, requiredIds = {6213}},
    {id = 11689, cost = 22000, requiredIds = {11688}},
    {id = 18871, cost = 22000, requiredIds = {18870}, requiredTalentId = 17877},
    {id = 17924, cost = 22000, requiredIds = {6353}}
  },
  [58] = {
    {id = 11730, cost = 24000, requiredIds = {11730}},
    {id = 11713, cost = 24000, requiredIds = {11712}},
    {id = 17926, cost = 24000, requiredIds = {17925}},
    {id = 11726, cost = 24000, requiredIds = {11725}},
    {id = 11678, cost = 24000, requiredIds = {11677}},
    {id = 17923, cost = 24000, requiredIds = {17922}},
    {id = 18881, cost = 1200, requiredIds = {18880}, requiredTalentId = 18265}
  },
  [60] = {
    {id = 18932, cost = 1300, requiredIds = {18931}, requiredTalentId = 17962},
    {id = 20757, cost = 26000, requiredIds = {20756}},
    {id = 17728, cost = 26000, requiredIds = {17727}},
    {id = 603, cost = 26000},
    {id = 11722, cost = 26000, requiredIds = {11721}},
    {id = 18938, cost = 1300, requiredIds = {18937}, requiredTalentId = 18220},
    {id = 11735, cost = 26000, requiredIds = {11734}},
    {id = 11695, cost = 26000, requiredIds = {11694}},
    {id = 11668, cost = 26000, requiredIds = {11667}},
    {id = 11661, cost = 26000, requiredIds = {11660}}
  },
},
[1] = { --TBC Spells
	[1] = {
		{id = 348, cost = 10},
	},
	[4] = {
		{id = 172, cost = 100},
		{id = 702, cost = 100},
	},
	[6] = {
		{id = 1454, cost = 100},
		{id = 695, cost = 100, requiredIds = {686}},
	},
	[8] = {
		{id = 980, cost = 200},
		{id = 5782, cost = 200},
	},
	[10] = {
		{id = 1120, cost = 300},
		{id = 6201, cost = 300, requiredIds = {1120}},
		{id = 696, cost = 300, requiredIds = {687}},
		{id = 707, cost = 300, requiredIds = {348}},
	},
	[12] = {
		{id = 1108, cost = 600, requiredIds = {702}},
		{id = 755, cost = 600},
		{id = 705, cost = 600, requiredIds = {695}},
	},
	[14] = {
		{id = 6222, cost = 900, requiredIds = {172}},
		{id = 704, cost = 900},
		{id = 689, cost = 900},
	},
	[16] = {
		{id = 1455, cost = 1080, requiredIds = {1454}},
		{id = 5697, cost = 1200},
	},
	[18] = {
		{id = 1014, cost = 1500, requiredIds = {980}},
		{id = 693, cost = 1500, requiredIds = {1120}},
		{id = 5676, cost = 1500},
	},
	[20] = {
		{id = 706, cost = 2000},
		{id = 3698, cost = 2000, requiredIds = {755}},
		{id = 698, cost = 2000},
		{id = 1094, cost = 2000, requiredIds = {707}},
		{id = 5740, cost = 2000},
		{id = 1088, cost = 2000, requiredIds = {705}},
	},
	[22] = {
		{id = 6205, cost = 2500, requiredIds = {1108}},
		{id = 699, cost = 2500, requiredIds = {689}},
		{id = 6202, cost = 2500, requiredIds = {6201}},
		{id = 126, cost = 2500},
	},
	[24] = {
		{id = 6223, cost = 3000, requiredIds = {6222}},
		{id = 5138, cost = 3000},
		{id = 8288, cost = 3000, requiredIds = {1120}},
		{id = 5500, cost = 3000},
		{id = 18867, cost = 150, requiredIds = {17877}, requiredTalentId = 17877},
	},
	[26] = {
		{id = 1714, cost = 4000},
		{id = 1456, cost = 3600, requiredIds = {1455}},
		{id = 132, cost = 4000},
		{id = 17919, cost = 4000, requiredIds = {5676}},
	},
	[28] = {
		{id = 6217, cost = 5000, requiredIds = {1014}},
		{id = 7658, cost = 5000, requiredIds = {704}},
		{id = 710, cost = 5000},
		{id = 6366, cost = 5000},
		{id = 3699, cost = 5000, requiredIds = {3698}},
		{id = 1106, cost = 5000, requiredIds = {1088}},
	},
	[30] = {
		{id = 709, cost = 6000, requiredIds = {699}},
		{id = 20752, cost = 6000, requiredIds = {693}},
		{id = 1086, cost = 6000, requiredIds = {706}},
		{id = 1098, cost = 6000},
		{id = 5784, cost = 10000},
		{id = 1949, cost = 6000},
		{id = 2941, cost = 6000, requiredIds = {1094}},
	},
	[32] = {
		{id = 7646, cost = 7000, requiredIds = {6205}},
		{id = 1490, cost = 7000},
		{id = 6213, cost = 7000, requiredIds = {5782}},
		{id = 6229, cost = 7000},
		{id = 18868, cost = 350, requiredIds = {18867}, requiredTalentId = 17877},
	},
	[34] = {
		{id = 7648, cost = 8000, requiredIds = {6223}},
		{id = 6226, cost = 8000, requiredIds = {5138}},
		{id = 5699, cost = 8000, requiredIds = {6202}},
		{id = 6219, cost = 8000, requiredIds = {5740}},
		{id = 17920, cost = 8000, requiredIds = {17919}},
	},
	[36] = {
		{id = 11687, cost = 8100, requiredIds = {1456}},
		{id = 17951, cost = 9000, requiredIds = {6366}},
		{id = 2362, cost = 9000, requiredIds = {1120}},
		{id = 3700, cost = 9000, requiredIds = {3699}},
		{id = 7641, cost = 9000, requiredIds = {1106}},
	},
	[38] = {
		{id = 11711, cost = 10000, requiredIds = {6217}},
		{id = 7651, cost = 10000, requiredIds = {709}},
		{id = 8289, cost = 10000, requiredIds = {8288}},
		{id = 18879, cost = 500, requiredIds = {18265}, requiredTalentId = 18265},
	},
	[40] = {
		{id = 5484, cost = 11000},
		{id = 20755, cost = 11000, requiredIds = {20752}},
		{id = 11733, cost = 11000, requiredIds = {1086}},
		{id = 11665, cost = 11000, requiredIds = {2941}},
		{id = 18869, cost = 550, requiredIds = {18868}, requiredTalentId = 17877},
	},
	[42] = {
		{id = 7659, cost = 11000, requiredIds = {7658}},
		{id = 11707, cost = 11000, requiredIds = {7646}},
		{id = 6789, cost = 11000},
		{id = 11739, cost = 11000, requiredIds = {6229}},
		{id = 11683, cost = 11000, requiredIds = {1949}},
		{id = 17921, cost = 11000, requiredIds = {17920}},
	},
	[44] = {
		{id = 11671, cost = 12000, requiredIds = {7648}},
		{id = 11703, cost = 12000, requiredIds = {6226}},
		{id = 11725, cost = 12000, requiredIds = {1098}},
		{id = 11693, cost = 12000, requiredIds = {3700}},
		{id = 11659, cost = 12000, requiredIds = {7641}},
	},
	[46] = {
		{id = 11721, cost = 13000, requiredIds = {1490}},
		{id = 11699, cost = 13000, requiredIds = {7651}},
		{id = 11688, cost = 11700, requiredIds = {11687}},
		{id = 17952, cost = 13000, requiredIds = {17951}},
		{id = 11729, cost = 13000, requiredIds = {5699}},
		{id = 11677, cost = 13000, requiredIds = {6219}},
	},
	[48] = {
		{id = 11712, cost = 14000, requiredIds = {11711}},
		{id = 18880, cost = 700, requiredIds = {18879}, requiredTalentId = 18265},
		{id = 18647, cost = 14000, requiredIds = {710}},
		{id = 17727, cost = 14000, requiredIds = {2362}},
		{id = 18930, cost = 700, requiredIds = {17962}, requiredTalentId = 17962},
		{id = 18870, cost = 700, requiredIds = {18869}, requiredTalentId = 17877},
		{id = 6353, cost = 14000},
	},
	[50] = {
		{id = 11719, cost = 15000, requiredIds = {1714}},
		{id = 18937, cost = 750, requiredIds = {18220}, requiredTalentId = 18220},
		{id = 17925, cost = 15000, requiredIds = {6789}},
		{id = 20756, cost = 15000, requiredIds = {20755}},
		{id = 11734, cost = 15000, requiredIds = {11733}},
		{id = 11667, cost = 15000, requiredIds = {11665}},
		{id = 17922, cost = 15000, requiredIds = {17921}},
	},
	[52] = {
		{id = 11708, cost = 18000, requiredIds = {11707}},
		{id = 11675, cost = 18000, requiredIds = {8289}},
		{id = 11694, cost = 18000, requiredIds = {11693}},
		{id = 11740, cost = 18000, requiredIds = {11739}},
		{id = 11660, cost = 18000, requiredIds = {11659}},
	},
	[54] = {
		{id = 11672, cost = 20000, requiredIds = {11671}},
		{id = 11700, cost = 20000, requiredIds = {11699}},
		{id = 11704, cost = 20000, requiredIds = {11703}},
		{id = 17928, cost = 20000, requiredIds = {5484}},
		{id = 18931, cost = 1000, requiredIds = {18930}, requiredTalentId = 17962},
		{id = 11684, cost = 20000, requiredIds = {11683}},
	},
	[56] = {
		{id = 11717, cost = 22000, requiredIds = {7659}},
		{id = 6215, cost = 22000, requiredIds = {6213}},
		{id = 11689, cost = 19800, requiredIds = {11688}},
		{id = 17953, cost = 22000, requiredIds = {17952}},
		{id = 18871, cost = 1100, requiredIds = {18870}, requiredTalentId = 17877},
		{id = 17924, cost = 22000, requiredIds = {6353}},
	},
	[58] = {
		{id = 11713, cost = 24000, requiredIds = {11712}},
		{id = 17926, cost = 24000, requiredIds = {17925}},
		{id = 18881, cost = 1200, requiredIds = {18880}, requiredTalentId = 18265},
		{id = 11730, cost = 24000, requiredIds = {11729}},
		{id = 11726, cost = 24000, requiredIds = {11725}},
		{id = 11678, cost = 24000, requiredIds = {11677}},
		{id = 17923, cost = 24000, requiredIds = {17922}},
	},
	[60] = {
		{id = 25311, cost = 26000, requiredIds = {11672}},
		{id = 603, cost = 26000},
		{id = 11722, cost = 26000, requiredIds = {11721}},
		{id = 18938, cost = 1300, requiredIds = {18937}, requiredTalentId = 18220},
		{id = 30404, cost = 2500, requiredIds = {30108}, requiredTalentId = 30108},
		{id = 20757, cost = 26000, requiredIds = {20756}},
		{id = 17728, cost = 26000, requiredIds = {17727}},
		{id = 11735, cost = 26000, requiredIds = {11734}},
		{id = 11695, cost = 26000, requiredIds = {11694}},
		{id = 28610, cost = 34000, requiredIds = {11740}},
		{id = 18932, cost = 1300, requiredIds = {18931}, requiredTalentId = 17962},
		{id = 11668, cost = 26000, requiredIds = {11667}},
		{id = 25309, cost = 26000, requiredIds = {11668}},
		{id = 11661, cost = 26000, requiredIds = {11660}},
		{id = 30413, cost = 2500, requiredIds = {30283}, requiredTalentId = 30283},
	},
	[61] = {
		{id = 27224, cost = 30000, requiredIds = {11708}},
	},
	[62] = {
		{id = 27219, cost = 30000, requiredIds = {11700}},
		{id = 28176, cost = 34000},
		{id = 25307, cost = 26000, requiredIds = {11661}},
	},
	[63] = {
		{id = 27221, cost = 38000, requiredIds = {11704}},
		{id = 27264, cost = 2500, requiredIds = {18881}, requiredTalentId = 18265},
		{id = 27263, cost = 1300, requiredIds = {18871}, requiredTalentId = 17877},
	},
	[64] = {
		{id = 29722, cost = 42000},
		{id = 27211, cost = 42000, requiredIds = {17924}},
	},
	[65] = {
		{id = 27216, cost = 46000, requiredIds = {25311}},
		{id = 27266, cost = 2300, requiredIds = {18932}, requiredTalentId = 17962},
		{id = 27210, cost = 46000, requiredIds = {17923}},
	},
	[66] = {
		{id = 27250, cost = 51000, requiredIds = {17953}},
		{id = 28172, cost = 51000, requiredIds = {17728}},
		{id = 29858, cost = 51000},
	},
	[67] = {
		{id = 27218, cost = 57000, requiredIds = {11713}},
		{id = 27217, cost = 57000, requiredIds = {11675}},
		{id = 27259, cost = 57000, requiredIds = {11695}},
	},
	[68] = {
		{id = 27223, cost = 63000, requiredIds = {17926}},
		{id = 27222, cost = 56700, requiredIds = {11689}},
		{id = 27230, cost = 63000, requiredIds = {11730}},
		{id = 29893, cost = 63000},
		{id = 27213, cost = 63000, requiredIds = {11684}},
	},
	[69] = {
		{id = 27226, cost = 70000, requiredIds = {11717}},
		{id = 30909, cost = 70000, requiredIds = {27224}},
		{id = 27228, cost = 70000, requiredIds = {11722}},
		{id = 27220, cost = 70000, requiredIds = {27219}},
		{id = 28189, cost = 70000, requiredIds = {28176}},
		{id = 27215, cost = 70000, requiredIds = {25309}},
		{id = 27212, cost = 70000, requiredIds = {11678}},
		{id = 27209, cost = 70000, requiredIds = {25307}},
	},
	[70] = {
		{id = 30910, cost = 78000, requiredIds = {603}},
		{id = 27265, cost = 1300, requiredIds = {18938}, requiredTalentId = 18220},
		{id = 30908, cost = 78000, requiredIds = {27221}},
		{id = 27243, cost = 78000},
		{id = 30911, cost = 2500, requiredIds = {27264}, requiredTalentId = 18265},
		{id = 30405, cost = 2500, requiredIds = {30404}, requiredTalentId = 30108},
		{id = 27238, cost = 78000, requiredIds = {20757}},
		{id = 27260, cost = 78000, requiredIds = {11735}},
		{id = 30912, cost = 3900, requiredIds = {27266}, requiredTalentId = 17962},
		{id = 32231, cost = 78000, requiredIds = {29722}},
		{id = 30459, cost = 78000, requiredIds = {27210}},
		{id = 30546, cost = 3900, requiredIds = {27263}, requiredTalentId = 17877},
		{id = 30414, cost = 2500, requiredIds = {30413}, requiredTalentId = 30283},
		{id = 30545, cost = 78000, requiredIds = {27211}},
	},
},
[2] = { --Wrath Spells
	[1] = {
		{id = 348, cost = 10}, -- Immolate (rank 1)
		{id = 688, cost = 100}, -- Summon Imp
	},
	[4] = {
		{id = 172, cost = 100}, -- Corruption (rank 1)
		{id = 702, cost = 100}, -- Curse of Weakness (rank 1)
	},
	[6] = {
		{id = 1454, cost = 100}, -- Life Tap (rank 1)
		{id = 695, cost = 100, requiredIds = {686}}, -- Shadow Bolt (rank 2)
	},
	[8] = {
		{id = 980, cost = 200}, -- Curse of Agony (rank 1)
		{id = 5782, cost = 200}, -- Fear (rank 1)
	},
	[10] = {
		{id = 6201, cost = 300, requiredIds = {1120}}, -- Create Healthstone (rank 1)
		{id = 696, cost = 300, requiredIds = {687}}, -- Demon Skin (rank 2)
		{id = 707, cost = 300, requiredIds = {348}}, -- Immolate (rank 2)
		{id = 1120, cost = 300}, -- Drain Soul (rank 1)
	},
	[12] = {
		{id = 1108, cost = 600, requiredIds = {702}}, -- Curse of Weakness (rank 2)
		{id = 755, cost = 600}, -- Health Funnel (rank 1)
		{id = 705, cost = 600, requiredIds = {695}}, -- Shadow Bolt (rank 3)
	},
	[14] = {
		{id = 6222, cost = 900, requiredIds = {172}}, -- Corruption (rank 2)
		{id = 689, cost = 900}, -- Drain Life (rank 1)
	},
	[16] = {
		{id = 1455, cost = 1080, requiredIds = {1454}}, -- Life Tap (rank 2)
		{id = 5697, cost = 1200}, -- Unending Breath
	},
	[18] = {
		{id = 1014, cost = 1500, requiredIds = {980}}, -- Curse of Agony (rank 2)
		{id = 5676, cost = 1500}, -- Searing Pain (rank 1)
		{id = 693, cost = 1500, requiredIds = {1120}}, -- Create Soulstone (rank 1)
	},
	[20] = {
		{id = 706, cost = 2000}, -- Demon Armor (rank 1)
		{id = 3698, cost = 2000, requiredIds = {755}}, -- Health Funnel (rank 2)
		{id = 1094, cost = 2000, requiredIds = {707}}, -- Immolate (rank 3)
		{id = 5740, cost = 2000}, -- Rain of Fire (rank 1)
		{id = 698, cost = 2000}, -- Ritual of Summoning
		{id = 1088, cost = 2000, requiredIds = {705}}, -- Shadow Bolt (rank 4)
		{id = 5784, cost = 10000}, -- Felsteed
	},
	[22] = {
		{id = 6202, cost = 2500, requiredIds = {6201}}, -- Create Healthstone (rank 2)
		{id = 6205, cost = 2500, requiredIds = {1108}}, -- Curse of Weakness (rank 3)
		{id = 699, cost = 2500, requiredIds = {689}}, -- Drain Life (rank 2)
		{id = 126, cost = 2500}, -- Eye of Kilrogg
	},
	[24] = {
		{id = 6223, cost = 3000, requiredIds = {6222}}, -- Corruption (rank 3)
		{id = 5138, cost = 3000}, -- Drain Mana
		{id = 5500, cost = 3000}, -- Sense Demons
		{id = 18867, cost = 148, requiredIds = {17877}, requiredTalentId = 17877}, -- Shadowburn (rank 2)
		{id = 8288, cost = 3000, requiredIds = {1120}}, -- Drain Soul (rank 2)
	},
	[26] = {
		{id = 1714, cost = 4000}, -- Curse of Tongues (rank 1)
		{id = 132, cost = 4000}, -- Detect Invisibility
		{id = 1456, cost = 3600, requiredIds = {1455}}, -- Life Tap (rank 3)
		{id = 17919, cost = 4000, requiredIds = {5676}}, -- Searing Pain (rank 2)
	},
	[28] = {
		{id = 710, cost = 5000}, -- Banish (rank 1)
		{id = 6217, cost = 5000, requiredIds = {1014}}, -- Curse of Agony (rank 3)
		{id = 3699, cost = 5000, requiredIds = {3698}}, -- Health Funnel (rank 3)
		{id = 1106, cost = 5000, requiredIds = {1088}}, -- Shadow Bolt (rank 5)
		{id = 6366, cost = 5000}, -- Create Firestone (rank 1)
	},
	[30] = {
		{id = 1086, cost = 6000, requiredIds = {706}}, -- Demon Armor (rank 2)
		{id = 709, cost = 6000, requiredIds = {699}}, -- Drain Life (rank 3)
		{id = 1098, cost = 6000}, -- Enslave Demon (rank 1)
		{id = 1949, cost = 6000}, -- Hellfire (rank 1)
		{id = 2941, cost = 6000, requiredIds = {1094}}, -- Immolate (rank 4)
		{id = 20752, cost = 6000, requiredIds = {693}}, -- Create Soulstone (rank 2)
	},
	[32] = {
		{id = 1490, cost = 7000}, -- Curse of the Elements (rank 1)
		{id = 7646, cost = 7000, requiredIds = {6205}}, -- Curse of Weakness (rank 4)
		{id = 6213, cost = 7000, requiredIds = {5782}}, -- Fear (rank 2)
		{id = 6229, cost = 7000}, -- Shadow Ward (rank 1)
		{id = 18868, cost = 348, requiredIds = {18867}, requiredTalentId = 17877}, -- Shadowburn (rank 3)
	},
	[34] = {
		{id = 7648, cost = 8000, requiredIds = {6223}}, -- Corruption (rank 4)
		{id = 5699, cost = 8000, requiredIds = {6202}}, -- Create Healthstone (rank 3)
		{id = 6219, cost = 8000, requiredIds = {5740}}, -- Rain of Fire (rank 2)
		{id = 17920, cost = 8000, requiredIds = {17919}}, -- Searing Pain (rank 3)
	},
	[36] = {
		{id = 3700, cost = 9000, requiredIds = {3699}}, -- Health Funnel (rank 4)
		{id = 11687, cost = 8100, requiredIds = {1456}}, -- Life Tap (rank 4)
		{id = 7641, cost = 9000, requiredIds = {1106}}, -- Shadow Bolt (rank 6)
		{id = 17951, cost = 9000, requiredIds = {6366}}, -- Create Firestone (rank 2)
		{id = 2362, cost = 9000, requiredIds = {1120}}, -- Create Spellstone (rank 1)
	},
	[38] = {
		{id = 11711, cost = 10000, requiredIds = {6217}}, -- Curse of Agony (rank 4)
		{id = 7651, cost = 10000, requiredIds = {709}}, -- Drain Life (rank 4)
		{id = 8289, cost = 10000, requiredIds = {8288}}, -- Drain Soul (rank 3)
	},
	[40] = {
		{id = 11733, cost = 11000, requiredIds = {1086}}, -- Demon Armor (rank 3)
		{id = 5484, cost = 11000}, -- Howl of Terror (rank 1)
		{id = 11665, cost = 11000, requiredIds = {2941}}, -- Immolate (rank 5)
		{id = 18869, cost = 548, requiredIds = {18868}, requiredTalentId = 17877}, -- Shadowburn (rank 4)
		{id = 20755, cost = 11000, requiredIds = {20752}}, -- Create Soulstone (rank 3)
		{id = 23161, cost = 100000}, -- Dreadsteed
	},
	[42] = {
		{id = 11707, cost = 11000, requiredIds = {7646}}, -- Curse of Weakness (rank 5)
		{id = 6789, cost = 11000}, -- Death Coil (rank 1)
		{id = 11683, cost = 11000, requiredIds = {1949}}, -- Hellfire (rank 2)
		{id = 17921, cost = 11000, requiredIds = {17920}}, -- Searing Pain (rank 4)
		{id = 11739, cost = 11000, requiredIds = {6229}}, -- Shadow Ward (rank 2)
	},
	[44] = {
		{id = 11671, cost = 12000, requiredIds = {7648}}, -- Corruption (rank 5)
		{id = 11725, cost = 12000, requiredIds = {1098}}, -- Enslave Demon (rank 2)
		{id = 11693, cost = 12000, requiredIds = {3700}}, -- Health Funnel (rank 5)
		{id = 11659, cost = 12000, requiredIds = {7641}}, -- Shadow Bolt (rank 7)
	},
	[46] = {
		{id = 11729, cost = 13000, requiredIds = {5699}}, -- Create Healthstone (rank 4)
		{id = 11721, cost = 13000, requiredIds = {1490}}, -- Curse of the Elements (rank 2)
		{id = 11699, cost = 13000, requiredIds = {7651}}, -- Drain Life (rank 5)
		{id = 11688, cost = 11700, requiredIds = {11687}}, -- Life Tap (rank 5)
		{id = 11677, cost = 13000, requiredIds = {6219}}, -- Rain of Fire (rank 3)
		{id = 17952, cost = 13000, requiredIds = {17951}}, -- Create Firestone (rank 3)
	},
	[48] = {
		{id = 18647, cost = 14000, requiredIds = {710}}, -- Banish (rank 2)
		{id = 11712, cost = 14000, requiredIds = {11711}}, -- Curse of Agony (rank 5)
		{id = 18870, cost = 700, requiredIds = {18869}, requiredTalentId = 17877}, -- Shadowburn (rank 5)
		{id = 6353, cost = 14000}, -- Soul Fire (rank 1)
		{id = 17727, cost = 14000, requiredIds = {2362}}, -- Create Spellstone (rank 2)
	},
	[50] = {
		{id = 11719, cost = 15000, requiredIds = {1714}}, -- Curse of Tongues (rank 2)
		{id = 18937, cost = 748, requiredIds = {18220}, requiredTalentId = 18220}, -- Dark Pact (rank 2)
		{id = 17925, cost = 15000, requiredIds = {6789}}, -- Death Coil (rank 2)
		{id = 11734, cost = 15000, requiredIds = {11733}}, -- Demon Armor (rank 4)
		{id = 11667, cost = 15000, requiredIds = {11665}}, -- Immolate (rank 6)
		{id = 17922, cost = 15000, requiredIds = {17921}}, -- Searing Pain (rank 5)
		{id = 20756, cost = 15000, requiredIds = {20755}}, -- Create Soulstone (rank 4)
	},
	[52] = {
		{id = 11708, cost = 18000, requiredIds = {11707}}, -- Curse of Weakness (rank 6)
		{id = 11694, cost = 18000, requiredIds = {11693}}, -- Health Funnel (rank 6)
		{id = 11660, cost = 18000, requiredIds = {11659}}, -- Shadow Bolt (rank 8)
		{id = 11740, cost = 18000, requiredIds = {11739}}, -- Shadow Ward (rank 3)
		{id = 11675, cost = 18000, requiredIds = {8289}}, -- Drain Soul (rank 4)
	},
	[54] = {
		{id = 11672, cost = 20000, requiredIds = {11671}}, -- Corruption (rank 6)
		{id = 11700, cost = 20000, requiredIds = {11699}}, -- Drain Life (rank 6)
		{id = 11684, cost = 20000, requiredIds = {11683}}, -- Hellfire (rank 3)
		{id = 17928, cost = 20000, requiredIds = {5484}}, -- Howl of Terror (rank 2)
	},
	[56] = {
		{id = 6215, cost = 22000, requiredIds = {6213}}, -- Fear (rank 3)
		{id = 11689, cost = 19800, requiredIds = {11688}}, -- Life Tap (rank 6)
		{id = 18871, cost = 1100, requiredIds = {18870}, requiredTalentId = 17877}, -- Shadowburn (rank 6)
		{id = 17924, cost = 22000, requiredIds = {6353}}, -- Soul Fire (rank 2)
		{id = 17953, cost = 22000, requiredIds = {17952}}, -- Create Firestone (rank 4)
	},
	[58] = {
		{id = 11730, cost = 24000, requiredIds = {11729}}, -- Create Healthstone (rank 5)
		{id = 11713, cost = 24000, requiredIds = {11712}}, -- Curse of Agony (rank 6)
		{id = 17926, cost = 24000, requiredIds = {17925}}, -- Death Coil (rank 3)
		{id = 11726, cost = 24000, requiredIds = {11725}}, -- Enslave Demon (rank 3)
		{id = 11678, cost = 24000, requiredIds = {11677}}, -- Rain of Fire (rank 4)
		{id = 17923, cost = 24000, requiredIds = {17922}}, -- Searing Pain (rank 6)
	},
	[60] = {
		{id = 25311, cost = 26000, requiredIds = {11672}}, -- Corruption (rank 7)
		{id = 603, cost = 26000}, -- Curse of Doom (rank 1)
		{id = 11722, cost = 26000, requiredIds = {11721}}, -- Curse of the Elements (rank 3)
		{id = 18938, cost = 1300, requiredIds = {18937}, requiredTalentId = 18220}, -- Dark Pact (rank 3)
		{id = 11735, cost = 26000, requiredIds = {11734}}, -- Demon Armor (rank 5)
		{id = 11695, cost = 26000, requiredIds = {11694}}, -- Health Funnel (rank 7)
		{id = 11668, cost = 26000, requiredIds = {11667}}, -- Immolate (rank 7)
		{id = 25309, cost = 26000, requiredIds = {11668}}, -- Immolate (rank 8)
		{id = 11661, cost = 26000, requiredIds = {11660}}, -- Shadow Bolt (rank 9)
		{id = 28610, cost = 34000, requiredIds = {11740}}, -- Shadow Ward (rank 4)
		{id = 30413, cost = 2500, requiredIds = {30283}, requiredTalentId = 30283}, -- Shadowfury (rank 2)
		{id = 30404, cost = 2500, requiredIds = {30108}, requiredTalentId = 30108}, -- Unstable Affliction (rank 2)
		{id = 20757, cost = 26000, requiredIds = {20756}}, -- Create Soulstone (rank 5)
		{id = 17728, cost = 26000, requiredIds = {17727}}, -- Create Spellstone (rank 3)
	},
	[61] = {
		{id = 27224, cost = 30000, requiredIds = {11708}}, -- Curse of Weakness (rank 7)
	},
	[62] = {
		{id = 27219, cost = 30000, requiredIds = {11700}}, -- Drain Life (rank 7)
		{id = 28176, cost = 34000}, -- Fel Armor (rank 1)
		{id = 25307, cost = 26000, requiredIds = {11661}}, -- Shadow Bolt (rank 10)
	},
	[63] = {
		{id = 27263, cost = 1300, requiredIds = {18871}, requiredTalentId = 17877}, -- Shadowburn (rank 7)
	},
	[64] = {
		{id = 29722, cost = 42000}, -- Incinerate (rank 1)
		{id = 27211, cost = 42000, requiredIds = {17924}}, -- Soul Fire (rank 3)
	},
	[65] = {
		{id = 27216, cost = 46000, requiredIds = {25311}}, -- Corruption (rank 8)
		{id = 27210, cost = 46000, requiredIds = {17923}}, -- Searing Pain (rank 7)
	},
	[66] = {
		{id = 29858, cost = 51000}, -- Soulshatter
		{id = 27250, cost = 51000, requiredIds = {17953}}, -- Create Firestone (rank 5)
		{id = 28172, cost = 51000, requiredIds = {17728}}, -- Create Spellstone (rank 4)
	},
	[67] = {
		{id = 27218, cost = 57000, requiredIds = {11713}}, -- Curse of Agony (rank 7)
		{id = 27259, cost = 57000, requiredIds = {11695}}, -- Health Funnel (rank 8)
		{id = 27217, cost = 57000, requiredIds = {11675}}, -- Drain Soul (rank 5)
	},
	[68] = {
		{id = 27230, cost = 63000, requiredIds = {11730}}, -- Create Healthstone (rank 6)
		{id = 27223, cost = 63000, requiredIds = {17926}}, -- Death Coil (rank 4)
		{id = 27213, cost = 63000, requiredIds = {11684}}, -- Hellfire (rank 4)
		{id = 27222, cost = 56700, requiredIds = {11689}}, -- Life Tap (rank 7)
		{id = 29893, cost = 63000}, -- Ritual of Souls (rank 1)
	},
	[69] = {
		{id = 30909, cost = 70000, requiredIds = {27224}}, -- Curse of Weakness (rank 8)
		{id = 27228, cost = 70000, requiredIds = {11722}}, -- Curse of the Elements (rank 4)
		{id = 27220, cost = 70000, requiredIds = {27219}}, -- Drain Life (rank 8)
		{id = 28189, cost = 70000, requiredIds = {28176}}, -- Fel Armor (rank 2)
		{id = 27215, cost = 70000, requiredIds = {25309}}, -- Immolate (rank 9)
		{id = 27212, cost = 70000, requiredIds = {11678}}, -- Rain of Fire (rank 5)
		{id = 27209, cost = 70000, requiredIds = {25307}}, -- Shadow Bolt (rank 11)
	},
	[70] = {
		{id = 59170, cost = 2500, requiredIds = {50796}, requiredTalentId = 50796}, -- Chaos Bolt (rank 2)
		{id = 30910, cost = 78000, requiredIds = {603}}, -- Curse of Doom (rank 2)
		{id = 27265, cost = 1300, requiredIds = {18938}, requiredTalentId = 18220}, -- Dark Pact (rank 4)
		{id = 27260, cost = 78000, requiredIds = {11735}}, -- Demon Armor (rank 6)
		{id = 59161, cost = 2500, requiredIds = {48181}, requiredTalentId = 48181}, -- Haunt (rank 2)
		{id = 32231, cost = 78000, requiredIds = {29722}}, -- Incinerate (rank 2)
		{id = 30459, cost = 78000, requiredIds = {27210}}, -- Searing Pain (rank 8)
		{id = 27243, cost = 78000}, -- Seed of Corruption (rank 1)
		{id = 30546, cost = 3900, requiredIds = {27263}, requiredTalentId = 17877}, -- Shadowburn (rank 8)
		{id = 30414, cost = 2500, requiredIds = {30413}, requiredTalentId = 30283}, -- Shadowfury (rank 3)
		{id = 30545, cost = 78000, requiredIds = {27211}}, -- Soul Fire (rank 4)
		{id = 30405, cost = 2500, requiredIds = {30404}, requiredTalentId = 30108}, -- Unstable Affliction (rank 3)
		{id = 27238, cost = 78000, requiredIds = {20757}}, -- Create Soulstone (rank 6)
	},
	[71] = {
		{id = 47812, cost = 160000, requiredIds = {27216}}, -- Corruption (rank 9)
		{id = 50511, cost = 160000, requiredIds = {30909}}, -- Curse of Weakness (rank 9)
	},
	[72] = {
		{id = 61191, cost = 70000, requiredIds = {11726}}, -- Enslave Demon (rank 4)
		{id = 47819, cost = 160000, requiredIds = {27212}}, -- Rain of Fire (rank 6)
		{id = 47890, cost = 160000, requiredIds = {28610}}, -- Shadow Ward (rank 5)
		{id = 47886, cost = 160000, requiredIds = {28172}}, -- Create Spellstone (rank 5)
	},
	[73] = {
		{id = 47871, cost = 160000, requiredIds = {27230}}, -- Create Healthstone (rank 7)
		{id = 47863, cost = 160000, requiredIds = {27218}}, -- Curse of Agony (rank 8)
		{id = 47859, cost = 160000, requiredIds = {27223}}, -- Death Coil (rank 5)
	},
	[74] = {
		{id = 47892, cost = 160000, requiredIds = {28189}}, -- Fel Armor (rank 3)
		{id = 47837, cost = 160000, requiredIds = {32231}}, -- Incinerate (rank 3)
		{id = 47814, cost = 160000, requiredIds = {30459}}, -- Searing Pain (rank 9)
		{id = 47808, cost = 160000, requiredIds = {27209}}, -- Shadow Bolt (rank 12)
		{id = 60219, cost = 160000, requiredIds = {27250}}, -- Create Firestone (rank 6)
	},
	[75] = {
		{id = 59171, cost = 8000, requiredIds = {59170}, requiredTalentId = 50796}, -- Chaos Bolt (rank 3)
		{id = 59163, cost = 8000, requiredIds = {59161}, requiredTalentId = 48181}, -- Haunt (rank 3)
		{id = 47810, cost = 160000, requiredIds = {27215}}, -- Immolate (rank 10)
		{id = 47835, cost = 160000, requiredIds = {27243}}, -- Seed of Corruption (rank 2)
		{id = 47826, cost = 8000, requiredIds = {30546}, requiredTalentId = 17877}, -- Shadowburn (rank 9)
		{id = 47897, cost = 10000}, -- Shadowflame (rank 1)
		{id = 47846, cost = 8000, requiredIds = {30414}, requiredTalentId = 30283}, -- Shadowfury (rank 4)
		{id = 47824, cost = 160000, requiredIds = {30545}}, -- Soul Fire (rank 5)
		{id = 47841, cost = 8000, requiredIds = {30405}, requiredTalentId = 30108}, -- Unstable Affliction (rank 4)
	},
	[76] = {
		{id = 47793, cost = 160000, requiredIds = {27260}}, -- Demon Armor (rank 7)
		{id = 47856, cost = 160000, requiredIds = {27259}}, -- Health Funnel (rank 9)
		{id = 47884, cost = 160000, requiredIds = {27238}}, -- Create Soulstone (rank 7)
	},
	[77] = {
		{id = 47813, cost = 160000, requiredIds = {47812}}, -- Corruption (rank 10)
		{id = 47855, cost = 160000, requiredIds = {27217}}, -- Drain Soul (rank 6)
	},
	[78] = {
		{id = 47865, cost = 160000, requiredIds = {27228}}, -- Curse of the Elements (rank 5)
		{id = 47860, cost = 160000, requiredIds = {47859}}, -- Death Coil (rank 6)
		{id = 47857, cost = 160000, requiredIds = {27220}}, -- Drain Life (rank 9)
		{id = 47823, cost = 160000, requiredIds = {27213}}, -- Hellfire (rank 5)
		{id = 47891, cost = 160000, requiredIds = {47890}}, -- Shadow Ward (rank 6)
		{id = 47888, cost = 160000, requiredIds = {47886}}, -- Create Spellstone (rank 6)
	},
	[79] = {
		{id = 47878, cost = 160000, requiredIds = {47871}}, -- Create Healthstone (rank 8)
		{id = 47864, cost = 160000, requiredIds = {47863}}, -- Curse of Agony (rank 9)
		{id = 47893, cost = 160000, requiredIds = {47892}}, -- Fel Armor (rank 4)
		{id = 47820, cost = 160000, requiredIds = {47819}}, -- Rain of Fire (rank 7)
		{id = 47815, cost = 160000, requiredIds = {47814}}, -- Searing Pain (rank 10)
		{id = 47809, cost = 160000, requiredIds = {47808}}, -- Shadow Bolt (rank 13)
	},
	[80] = {
		{id = 59172, cost = 8000, requiredIds = {59171}, requiredTalentId = 50796}, -- Chaos Bolt (rank 4)
		{id = 47867, cost = 160000, requiredIds = {30910}}, -- Curse of Doom (rank 3)
		{id = 59092, cost = 160000, requiredIds = {27265}, requiredTalentId = 18220}, -- Dark Pact (rank 5)
		{id = 47889, cost = 160000, requiredIds = {47793}}, -- Demon Armor (rank 8)
		{id = 48018, cost = 160000}, -- Demonic Circle: Summon
		{id = 48020, cost = 160000}, -- Demonic Circle: Teleport
		{id = 59164, cost = 8000, requiredIds = {59163}, requiredTalentId = 48181}, -- Haunt (rank 4)
		{id = 47811, cost = 160000, requiredIds = {47810}}, -- Immolate (rank 11)
		{id = 47838, cost = 100000, requiredIds = {47837}}, -- Incinerate (rank 4)
		{id = 57946, cost = 160000, requiredIds = {27222}}, -- Life Tap (rank 8)
		{id = 58887, cost = 160000, requiredIds = {29893}}, -- Ritual of Souls (rank 2)
		{id = 47836, cost = 160000, requiredIds = {47835}}, -- Seed of Corruption (rank 3
		{id = 47827, cost = 8000, requiredIds = {47826}, requiredTalentId = 17877}, -- Shadowburn (rank 10)
		{id = 61290, cost = 10000, requiredIds = {47897}}, -- Shadowflame (rank 2)
		{id = 47847, cost = 8000, requiredIds = {47846}, requiredTalentId = 30283}, -- Shadowfury (rank 5)
		{id = 47825, cost = 160000, requiredIds = {47824}}, -- Soul Fire (rank 6)
		{id = 47843, cost = 8000, requiredIds = {47841}, requiredTalentId = 30108}, -- Unstable Affliction (rank 5)
		{id = 60220, cost = 160000, requiredIds = {60219}}, -- Create Firestone (rank 7)
	},
},
}

wt.SpellsByLevel = SpellsByLevel[expac] --load correct data table from above
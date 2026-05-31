--[[	file meta info
	@file 		Cache.lua
	@brief		Cache functions to build table with data from client
--]]

--[[
	@brief		Accessing the addons private table

	@var 	_		addonName, thrown away
	@var	wt		Global addonTable
--]]
local _, wt = ...

--[[
	@brief		Tables for Spell Cache

	@var		wt.spellInfoCache	Global table for spell cache
	@param		spell				The Spell ID to cache
	@param		level				The level the spell is learned at
	@param		done				If already cached, set to true and return
--]]
wt.spellInfoCache = {}	-- Table init
wt.allRanksCache = {}
wt.idToRanks = {}
function wt:CacheSpell(spell, level, done)
	if (self.spellInfoCache[spell.id] ~= nil) then		-- If cache for spell id already exists
		done(true)										-- Set done to true and return
		return
	end
	local subText = select(2, GetSpellInfo(spell.id))	-- Get spell rank/subtext
	local formattedSubText =	(subText and subText ~= "") and format(PARENS_TEMPLATE, subText)	-- If subtext is not empty, format string
								or ""																-- If subtext is empty, set as empty string
  local name = select(1, GetSpellInfo(spell.id))
	self.spellInfoCache[spell.id] = {							-- Getting spell info and set into cache table
		id = spell.id,											-- Id
		name = name,
		subText = subText,										-- Rank/subtext
		formattedSubText = formattedSubText,					-- Formatted subtext
		icon = select(3, GetSpellInfo(spell.id)),				-- Icon path
		cost = spell.cost,										-- Cost
		formattedCost = GetCoinTextureString(spell.cost),		-- Formatted cost
		level = level,											-- Level
		formattedLevel = format(wt.L.LEVEL_FORMAT, level)		-- Formatted level
	}
  assert(name, "Can't find name for SpellID: "..tostring(spell.id))
  if self.allRanksCache[name] == nil then
    self.allRanksCache[name] = {}
  end
  tinsert(self.allRanksCache[name], spell.id)
  self.idToRanks[spell.id] = self.allRanksCache[name]

	done(false)		-- When done, set done as false
end

-- @brief		Function to easier use the spell info function
function wt:SpellInfo(spellId)
	return self.spellInfoCache[spellId]
end

function wt:AllRanks(spellId)
  return self.idToRanks[spellId]
end


-- Item Cache
wt.itemInfoCache = {}
-- for warlock pet tomes, the name includes the rank
-- however, this will cause overlap with the level text and there's no good way to fix it with setting points
-- instead, strip the rank text out of the name and put it as the subText
local parensPattern = " (%(.+%))"
local wait = {}
function wt:CacheItem(item, level, done)
  if (self.itemInfoCache[item.id] ~= nil) then
    done(true)
    return
  end
  local itemName, _, _, _, _, _, _, _, _, icon, cost = GetItemInfo(item.id)
  if not itemName then 
    print("Error: WhatsTraining cannot retrieve Item Info for ID: "..tostring(item.id))
    return 
  end
  local rankText = string.match(itemName, parensPattern)
  self.itemInfoCache[item.id] = {
    id = item.id,
    name = string.gsub(itemName, parensPattern, ""),
    formattedSubText = rankText,
    icon = icon,
    cost = item.cost,
    formattedCost = GetCoinTextureString(item.cost),
    level = level,
    formattedLevel = format(wt.L.LEVEL_FORMAT, level),
    isItem = true
  }
  done(false)
end

function wt:ItemInfo(itemId) return self.itemInfoCache[itemId] end

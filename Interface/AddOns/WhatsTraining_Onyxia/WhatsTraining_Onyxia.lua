--[[	file meta info
	@file 		WhatsTraining.lua
	@brief		Main script
--]]

--[[
	@brief		Accessing the addons private table

	@var 	addonName		addonName from ToC
	@var	wt				Global addonTable
--]]
local addonName, wt = ...

-- @brief		"Constant" variables
local AVAILABLE_KEY = "available"
local MISSINGREQS_KEY = "missingReqs"
local NEXTLEVEL_KEY = "nextLevel"
local NOTLEVEL_KEY = "notLevel"
local MISSINGTALENT_KEY = "missingTalent"
local KNOWN_KEY = "known"
local KNOWN_PET_KEY = "knownPet"
local PET_KEY = "pet"
local COMINGSOON_FONT_COLOR_CODE = "|cff82c5ff"
local MISSINGTALENT_FONT_COLOR_CODE = "|cffffffff"
local PET_FONT_COLOR_CODE = "|cffffffff"

local function isMountLearned(spellId)
	local numMounts = GetNumCompanions("MOUNT")
	if numMounts == 0 then
		return
	else
		local mountSpellId
		for i = 1, numMounts do
			mountSpellId = select(3, GetCompanionInfo("MOUNT", i))
			if mountSpellId == spellId then
				return true
			end
		end
	end
end

local function isPreviouslyLearnedAbility(spellId)
	if (wt.overriddenSpellsMap == nil or not wt.overriddenSpellsMap[spellId]) then
		return false
	end
	local spellIndex, knownIndex = 0, 0
	for i, otherId in ipairs(wt.overriddenSpellsMap[spellId]) do
		if (otherId == spellId) then spellIndex = i end
		--if (IsSpellKnown(otherId) or IsPlayerSpell(otherId)) then
		if (IsSpellKnown(otherId) or isMountLearned(otherId)) then
			knownIndex = i
		end
	end
	return spellIndex <= knownIndex
end

local function isAbilityKnown(spellId)
	if (IsSpellKnown(spellId) or
		isMountLearned(spellId) or
		--IsPlayerSpell(spellId) or
		isPreviouslyLearnedAbility(spellId)) then
		return true
	end
end

local function isTomeKnown(tomeId)
  local name, rank = GetSpellInfo(GetItemSpell(tomeId))

  if name then
    return wt.itemInfoCache[tomeId]
  end

end

local headers = {
	{
		name = wt.L.AVAILABLE_HEADER,
		color = GREEN_FONT_COLOR_CODE,
		hideLevel = true,
		key = AVAILABLE_KEY
	}, {
		name = wt.L.MISSINGREQS_HEADER,
		color = ORANGE_FONT_COLOR_CODE,
		hideLevel = true,
		key = MISSINGREQS_KEY
	}, {
		name = wt.L.NEXTLEVEL_HEADER,
		color = COMINGSOON_FONT_COLOR_CODE,
		key = NEXTLEVEL_KEY
	},{
		name = wt.L.NOTLEVEL_HEADER,
		color = RED_FONT_COLOR_CODE,
		key = NOTLEVEL_KEY
	},{
    name = wt.L.PET_HEADER,
    color = PET_FONT_COLOR_CODE,
    key = PET_KEY
    -- nameSort = true
  },{
		name = wt.L.MISSINGTALENT_HEADER,
		color = MISSINGTALENT_FONT_COLOR_CODE,
		key = MISSINGTALENT_KEY,
		nameSort = true
	},{
		name = wt.L.KNOWN_HEADER,
		color = GRAY_FONT_COLOR_CODE,
		hideLevel = true,
		key = KNOWN_KEY,
		nameSort = true
	},{
    name = wt.L.KNOWN_PET_HEADER,
    color = GRAY_FONT_COLOR_CODE,
    hideLevel = true,
    key = KNOWN_PET_KEY,
    nameSort = true
  }
}

local categories = {
	_spellsByCategoryKey = {},
	Insert = function(self, key, spellInfo)
		tinsert(self._spellsByCategoryKey[key], spellInfo)
	end,
	Initialize = function(self)
		for _, cat in ipairs(headers) do
			cat.spells = {}
			self._spellsByCategoryKey[cat.key] = cat.spells
			cat.formattedName = cat.color .. cat.name .. FONT_COLOR_CODE_CLOSE
			cat.isHeader = true
			tinsert(self, cat)
		end
	end,
	ClearSpells = function(self)
		for _, cat in ipairs(self) do
			cat.cost = 0
			wipe(cat.spells)
		end
	end
}
categories:Initialize()

wt.data = {}
local function rebuildData(playerLevel, isLevelUpEvent)
	categories:ClearSpells()
	wipe(wt.data)
  if (wt.TomesByLevel) then
    for _, tomesAtLevel in pairs(wt.TomesByLevel) do
      for _, tome in ipairs(tomesAtLevel) do
        local itemInfo = wt:ItemInfo(tome.id)
        if (itemInfo ~= nil) then
          local key = isTomeKnown(tome.id) and
                          KNOWN_PET_KEY or PET_KEY
          categories:Insert(key, itemInfo)
        end
    end
  end
  end
	for level, spellsAtLevel in pairs(wt.SpellsByLevel) do
		for _, spell in ipairs(spellsAtLevel) do
			local spellInfo = wt:SpellInfo(spell.id)
			if (spellInfo ~= nil) then
				local categoryKey

				if (isAbilityKnown(spellInfo.id)) then
					categoryKey = KNOWN_KEY
				elseif (spell.requiredTalentId ~= nil and
					not isAbilityKnown(spell.requiredTalentId)) then
					categoryKey = MISSINGTALENT_KEY
				elseif (level > playerLevel) then
					categoryKey = level <= playerLevel + 2 and NEXTLEVEL_KEY or
									  NOTLEVEL_KEY
				else
					local hasReqs = true
					if (spell.requiredIds ~= nil) then
						for _, reqId in ipairs(spell.requiredIds) do
							hasReqs = hasReqs and isAbilityKnown(reqId)
						end
					end
					categoryKey = hasReqs and AVAILABLE_KEY or MISSINGREQS_KEY
				end
				if (categoryKey ~= nil) then
					categories:Insert(categoryKey, spellInfo)
				end
			end
		end
	end

	local function byLevelThenName(a, b)
		if (a.level == b.level) then
      return a.name < b.name
		end
		return a.level < b.level
	end
	local function byNameThenLevel(a, b)
		if (a.name == b.name) then
			return a.level < b.level
		end
		return a.name < b.name
	end
	for _, category in ipairs(categories) do
		if (#category.spells > 0) then
			tinsert(wt.data, category)
			local sortFunc = category.nameSort and byNameThenLevel or
								 byLevelThenName
			sort(category.spells, sortFunc)
			local totalCost = 0
			for _, s in ipairs(category.spells) do
				local effectiveLevel = s.level
				-- when a player levels up and this is triggered from that event, GetQuestDifficultyColor won't
				-- have the correct player level, it will be off by 1 for whatever reason (just like UnitLevel)
				if (isLevelUpEvent) then
					effectiveLevel = effectiveLevel - 1
				end
				s.levelColor = GetQuestDifficultyColor(effectiveLevel)
				s.hideLevel = category.hideLevel
				totalCost = totalCost + s.cost
				tinsert(wt.data, s)
			end
			category.cost = totalCost
		end
	end
	if (wt.MainFrame == nil) then return end
end

local function rebuildIfNotCached(fromCache)
	if (fromCache or wt.MainFrame == nil) then return end
	rebuildData(UnitLevel("player"))
end

function wt:RebuildData()
	rebuildData(UnitLevel("player"))
	if (self.MainFrame and self.MainFrame:IsVisible()) then
		self.Update(self.MainFrame, true)
	end
end

local function QueryTomes(tomes)
  local i=1
  local querytime = 0
  local now = 0
  while i <= #tomes do
    now = GetTime()
    if now - querytime > 0.03 then
      querytime = GetTime()    
      queryitem = tomes[i].tome.id
      if (queryitem) and (queryitem ~= nil) and (queryitem ~= "") and (queryitem ~= 0) then
        GameTooltip:SetHyperlink("item:"..queryitem..":0:0:0:0:0:0:0")
      end
      i=i+1
    end
  end
  for _,tomelist in ipairs(tomes) do
    wt:CacheItem(tomelist.tome, tomelist.level, rebuildIfNotCached)
  end
  wt:RebuildData()
end

local function CheckTomes()
  if (wt.TomesByLevel) then
    local neededTomes = {}
    for level, tomesByLevel in pairs(wt.TomesByLevel) do
        for _, tome in ipairs(tomesByLevel) do
          if GetItemInfo(tome.id) then
            wt:CacheItem(tome, level, rebuildIfNotCached)
          else
            neededTomes[#neededTomes + 1] = {tome = tome, level = level}
          end
        end
    end
    if next(neededTomes) then
      QueryTomes(neededTomes)
    else
      return true
    end
  end
end

for level, spellsByLevel in pairs(wt.SpellsByLevel) do
	for _, spell in ipairs(spellsByLevel) do
		wt:CacheSpell(spell, level, rebuildIfNotCached)
	end
end

local eventFrame = CreateFrame("Frame")
eventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event == "PLAYER_ENTERING_WORLD") then
		local isLogin, isReload = ...
		--if (isLogin or isReload) then
    CheckTomes()
		rebuildData(UnitLevel("player"))
		wt.CreateFrame()
		--end
	elseif (event == "LEARNED_SPELL_IN_TAB" or event == "PLAYER_LEVEL_UP") then
		local isLevelUp = event == "PLAYER_LEVEL_UP"
		rebuildData(isLevelUp and ... or UnitLevel("player"), isLevelUp)
    --[[  Doesn't look like this was needed when new demon is learned
    if wt.currentClass == "WARLOCK" and event == "LEARNED_SPELL_IN_TAB" and ... == 3 then
      CacheTomes()
    end--]]
		if (wt.MainFrame and wt.MainFrame:IsVisible()) then
			wt.Update(wt.MainFrame, true)
		end
  elseif (event == "SPELLS_CHANGED") then
    --[[
    Since this event is fired every time you open/scroll through your
    spellbook, this is the perfect event to keep checking the client's 
    item cache for the Tome/Grimoires until they're all cached and the data
    is loaded into the addon tables.
    --]]
    if CheckTomes() then
      eventFrame:UnregisterEvent("SPELLS_CHANGED")
    end
		rebuildData(UnitLevel("player"))
	end
end)

eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
eventFrame:RegisterEvent("PLAYER_LEVEL_UP")
eventFrame:RegisterEvent("SPELLS_CHANGED")
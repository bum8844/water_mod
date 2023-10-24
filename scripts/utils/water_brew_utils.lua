-- 기본값

function dummy(boilier, names, tags)
	return false
end

function Preference(names, tags)
	return ( (tags.sweetener or 0) + (tags.dairy or 0) + (tags.milk or 0) )
end

function Tea_Def(names, tags)
	return (tags.decoration or 0) and ((tags.veggie or 0) <= 2) and ((tags.mushroom or 0) < 4) and not tags.fruit
end

--특정재료만 들어 갔는지 확인해주는 코드들

function Mix_Tea_Patch(names, tags)
	return tags.decoration and ((tags.veggie or 0) <= 2) and ((tags.mushroom or 0) < 4) and not tags.fruit
end

function IsTealeaves(names, tags)
	return names.tealeaves and 
	Preference(names, tags) and
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or 
		names.foliage or
		names.forgetmelots or
		names.petals or
		names.moon_tree_blossom or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.cactus_flower or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		tags.lotus
	)
end

function IsTealeaves_dried(names, tags)
	return ( names.tealeaves_dried or names.kyno_piko_orange or names.piko_orange ) and 
	Preference(names, tags) and
	Tea_Def(names, tags) and not  
	( 
		names.tealeaves or
		names.foliage or
		names.forgetmelots or
		names.petals or
		names.moon_tree_blossom or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.cactus_flower or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		tags.lotus
	)
end

function IsFoliage(names, tags)
	return names.foliage and 
	Preference(names, tags) and
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.forgetmelots or
		names.petals or
		names.moon_tree_blossom or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.cactus_flower or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		tags.lotus 
	)
end

function IsFlower(names, tags)
	return ( names.forgetmelots or names.petals or names.moon_tree_blossom ) and 
	Preference(names, tags) and 
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.cactus_flower or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		tags.lotus 
	)
end

function IsFlower_Evil(names, tags)
	return ( names.petals_evil or names.firenettles or names.tillweed ) and 
	Preference(names, tags) and 
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.forgetmelots or 
		names.petals or 
		names.moon_tree_blossom or
		names.cactus_flower or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		tags.lotus 
	)
end

function IsFlower_Cactus(names, tags)
	return names.cactus_flower and 
	Preference(names, tags) and
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.forgetmelots or 
		names.petals or 
		names.moon_tree_blossom or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		tags.lotus 
	)
end

local function blocking_thing_bloomfintuna(names ,tags)
	return not (tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate or tags.jellyfish)
end

function onlybloomfintuna(names ,tags)
	local bloomfintuna = names.oceanfish_small_7_inv or 0 -- 최대 4개

	local totalblock = ( tags.meat or 0 ) + ( tags.fish or 0 ) 

	local totalignore = math.max(0,(totalblock - (bloomfintuna)))

	if blocking_thing_bloomfintuna(names ,tags) and totalignore <= 0 and bloomfintuna > 0 then
		return bloomfintuna
	end 
	return false
end

local function blocking_thing_rainbowjellyfish(names ,tags)
	return not (tags.meat or tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate)
end

function onlyrainbowjellyfish(names, tags)
	local rainbowjellyfish = names.rainbowjellyfish or 0
	local rainbowjellyfish_dead = (names.rainbowjellyfish_cooked or 0) + (names.rainbowjellyfish_dead or 0)

	local totalblock = tags.fish or 0

	local totalignore = math.max(0,(totalblock - (rainbowjellyfish+rainbowjellyfish_dead)))

	if blocking_thing_rainbowjellyfish(names ,tags) and totalignore <= 0 then
		return 1
	end 
	return false
end

local function blocking_thing_pierrot_fish(names ,tags)
	return not (tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate or tags.jellyfish)
end

function onlypierrot_fish(names ,tags)
	local pierrot_fish = (names.pierrot_fish or 0) + (names.pondpierrot_fish or 0) + (names.pierrot_fish_cooked or 0) + (names.fish4 or 0) + (names.fish4_cooked or 0) 

	local exrta_meat = pierrot_fish * 0.5

	local totalblock = ( tags.meat or 0 ) + ( tags.fish or 0 ) 

	local totalignore = math.max(0,(totalblock - (pierrot_fish + exrta_meat)))

	if blocking_thing_bloomfintuna(names ,tags) and totalignore <= 0 and pierrot_fish > 0 then
		return pierrot_fish
	end 
	return false
end

local function blocking_thing_coral_brain(names ,tags)
	return not (tags.jellyfish or tags.fish or tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate)
end

function onlycoral_brain(names, tags)
	local coral_brain = names.coral_brain or 0

	local totalblock = tags.meat or 0

	local totalignore = math.max(0,(totalblock - coral_brain))

	if blocking_thing_coral_brain(names ,tags) and totalignore <= 0 then
		return coral_brain
	end 
	return false
end

function quantum_calc(names, tags)
	return (names.wormlight or names.coral_brain) and onlycoral_brain(names, tags)
end

function IsFlower_Lotus(names, tags)
	return ( names.lotus_flower or names.kyno_lotus_flower or names.succulent_picked or tags.lotus or onlybloomfintuna(names ,tags)) and 
	Preference(names, tags) and
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.forgetmelots or 
		names.petals or 
		names.moon_tree_blossom or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.cactus_flower
	)
end

-- 막아야 하는 재료를 확인하는 코드

function notmeat(tags)
	return not (tags.fish or tags.jellyfish or tags.meat or tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread )
end

function lessthing(names)
	return ((names.twigs or 0) <= 1)
end

function notname(names)
	return not names.boneshard
end

function notages(tags)
	return not tags.chocolate
end

-- 술 관련 효과를 주는 코드

function alcohol(inst, eater)
	if eater:HasTag("player") then
		eater.components.dcapacity:Start_Intoxication(TUNING.ALCOHOL_CAPACITY)
		if eater.components.dcapacity:IsDrunk() then
			if not eater:HasTag("valkyrie") then
				eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
				eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
			else
				eater.components.talker:Say(GetString(eater,"ANNOUNCE_DRUNK_IMMUNITY"))
			end
		else
			if not eater:HasTag("valkyrie") then
				if eater.components.dcapacity:IsCritical() then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_DCAPACITY_CRITICAL"))
				elseif eater.components.dcapacity:IsHalf() then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_DCAPACITY_HALF"))
				end
			end
		end
		eater:AddDebuff("resistancebuff", "resistancebuff")
	else
		eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
		eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
	end
end


function spirits(inst, eater)
	if eater:HasTag("player") then
		eater.components.dcapacity:Start_Intoxication(TUNING.SPIRITS_CAPACITY)
		if eater.components.dcapacity:IsDrunk() then
			eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
			eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
		else
			if eater.components.dcapacity:IsCritical() then
				eater.components.talker:Say(GetString(eater,"ANNOUNCE_DCAPACITY_CRITICAL"))
			elseif eater.components.dcapacity:IsHalf() then
				eater.components.talker:Say(GetString(eater,"ANNOUNCE_DCAPACITY_HALF"))
			end
		end
		eater:AddDebuff("immunebuff", "immunebuff")
	else
		eater:AddDebuff("immunebuff", "immunebuff")
		eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
		eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
	end
end
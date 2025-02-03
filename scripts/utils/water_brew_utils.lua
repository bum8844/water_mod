function dummy(boilier, names, tags)
	return false
end

function IsFruitDrink(names, tags)
	for k, v in pairs(COCKTAIL_INGREDIENT.FRUIT) do
		if names[v] then
			return true
		end
	end
end

function IsVeggieDrink(names, tags)
	for k, v in pairs(COCKTAIL_INGREDIENT.VEGGIE) do
		if names[v] then
			return true
		end
	end
end

function IsAlcoholDrink(names, tags)
	for k, v in pairs(COCKTAIL_INGREDIENT.ALCOHOL) do
		if names[v] then
			return true
		end
	end
end

local function blocking_thing_bloomfintuna(names ,tags)
	return not (tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate or tags.jellyfish)
end

local function blocking_thing_rainbowjellyfish(names ,tags)
	return not (tags.meat or tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate)
end

local function blocking_thing_pierrot_fish(names ,tags)
	return not (tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate or tags.jellyfish)
end

local function blocking_thing_coral_brain(names ,tags)
	return not (tags.jellyfish or tags.fish or tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate)
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

function onlyrainbowjellyfish(names, tags)
	local rainbowjellyfish = (names.rainbowjellyfish or 0) + (names.rainbowjellyfish_cooked or 0) + (names.rainbowjellyfish_dead or 0)

	local totalblock = tags.fish or 0

	local totalignore = math.max(0,(totalblock - rainbowjellyfish))

	if blocking_thing_rainbowjellyfish(names ,tags) and totalignore <= 0 and rainbowjellyfish > 0 then
		return rainbowjellyfish
	end 
	return false
end

function onlypierrot_fish(names ,tags)
	local pierrot_fish = (names.pierrot_fish or 0) + (names.pondpierrot_fish or 0) + (names.pierrot_fish_cooked or 0) + (names.fish4 or 0) + (names.fish4_cooked or 0) 
	local exrta_meat = pierrot_fish * 0.5

	local total_ingredient = pierrot_fish + exrta_meat

	local totalblock = ( tags.meat or 0 ) + ( tags.fish or 0 ) 

	local totalignore = math.max(0,(totalblock - total_ingredient))

	if blocking_thing_bloomfintuna(names ,tags) and totalignore <= 0 and pierrot_fish > 0 then
		return pierrot_fish
	end 
	return false
end

function onlycoral_brain(names, tags)
	local coral_brain = names.coral_brain or 0

	local totalblock = tags.meat or 0

	local totalignore = math.max(0,(totalblock - coral_brain))

	if blocking_thing_coral_brain(names ,tags) and totalignore <= 0 then
		return coral_brain
	end 
	return 0
end

function Preference(names, tags, must, num)
	local vel = num or 0
	if must and type(must) == "table" then
		for k, v in pairs(must) do
			if tags[v] then
				return ((tags.sweetener or 0) + (tags.dairy or 0) + (tags.milk or 0) ) > vel
			end
			return false
		end
	elseif must then
		return ((tags.sweetener or 0) + (tags.dairy or 0) + (tags.milk or 0) ) > vel
	end
end

function Tea_Def(names, tags)
	return (math.max(0,((tags.veggie or 0) - (tags.decoration or 0))) <= 2) and ((tags.mushroom or 0) < 4) and not tags.fruit
end

--특정재료만 들어 갔는지 확인해주는 코드들

function Mix_Tea_Patch(names, tags)
	return tags.decoration and (math.max(0,((tags.veggie or 0) - (tags.decoration or 0))) <= 2) and ((tags.mushroom or 0) < 4) and not tags.fruit
end

function IsTealeaves(names, tags)
	return names.tealeaves and names.tealeaves >=2 and 
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or 
		names.foliage or
		names.greenfoliage or
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
		tags.lotus or
		tags.petals_legion or
		names.mentha_spicata
	)

end
function IsMentha_Spicata(names, tags)
	return names.mentha_spicata and names.mentha_spicata >=2 and 
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or 
		names.foliage or
		names.greenfoliage or
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
		tags.lotus or
		tags.petals_legion
	)
end

function IsTealeaves_dried(names, tags)
	return ( names.tealeaves_dried or names.kyno_piko_orange or names.piko_orange ) and (names.tealeaves_dried or 0)+(names.kyno_piko_orange or 0)+(names.piko_orange or 0) >= 2 and 
	Tea_Def(names, tags) and not  
	( 
		names.tealeaves or
		names.foliage or
		names.greenfoliage or
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
		tags.lotus or
		tags.petals_legion or
		names.mentha_spicata
	)
end

function IsFoliage(names, tags)
	return (names.foliage or names.kyno_foliage or names.kyno_foliage_cooked or names.greenfoliage) and ((names.foliage or 0)+(names.kyno_foliage or 0)+(names.kyno_foliage_cooked or 0)+(names.greenfoliage or 0)) >= 2 and
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
		tags.lotus or
		tags.petals_legion or 
		names.mentha_spicata
	)
end

function IsFlower(names, tags)
	return ( names.forgetmelots or names.petals or tags.petals_legion ) and (names.forgetmelots or 0)+(names.petals or 0)+(tags.petals_legion or 0) >= 2 and 
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.moon_tree_blossom or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.greenfoliage or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.cactus_flower or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		tags.lotus or 
		names.mentha_spicata
	)
end

function IsFlower_Moon(names, tags)
	return names.moon_tree_blossom and names.moon_tree_blossom >= 2 and 
	Tea_Def(names, tags) and not 
	( 
		names.forgetmelots or 
		names.petals or 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.greenfoliage or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.cactus_flower or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		names.petals_rose or
		names.petals_lily or
		names.petals_orchid or
		names.aip_veggie_sunflower or
		names.myth_lotus_flower or
		tags.lotus or 
		names.mentha_spicata
	)
end

function IsFlower_Evil(names, tags)
	return ( names.petals_evil or names.firenettles or names.tillweed ) and (names.petals_evil or 0)+(names.firenettles or 0)+(names.tillweed or 0) >= 3 and
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.greenfoliage or
		names.forgetmelots or 
		names.petals or 
		names.moon_tree_blossom or
		names.cactus_flower or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		names.petals_rose or
		names.petals_lily or
		names.petals_orchid or
		names.aip_veggie_sunflower or
		names.myth_lotus_flower or
		tags.lotus or
		tags.petals_legion or 
		names.mentha_spicata
	)
end

function IsFlower_Cactus(names, tags)
	return names.cactus_flower and
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.greenfoliage or
		names.forgetmelots or 
		names.petals or 
		names.moon_tree_blossom or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.lotus_flower or 
		names.kyno_lotus_flower or 
		names.succulent_picked or
		names.petals_rose or
		names.petals_lily or
		names.petals_orchid or
		names.aip_veggie_sunflower or
		names.myth_lotus_flower or
		tags.lotus or 
		names.mentha_spicata
	)
end

function quantum_calc(names, tags)
	return (names.wormlight or names.zaspberry or names.viperfruit or onlycoral_brain(names, tags)) and (names.wormlight or 0) + (names.zaspberry or 0) + (names.viperfruit or 0) + onlycoral_brain(names, tags) >= 1
end

function Root_calc(names, tags)
	return (names.mandrake or names.cookedmandrake or names.carrot or names.carrot_cooked 
		or names.potato or names.potato_cooked or names.sweet_potato or names.sweet_potato_cooked or names.kyno_sweetpotato or names.kyno_sweetpotato_cooked or names.mfp_sweetpotato or names.mfp_sweetpotato_cooked 
        or names.radish or names.radish_cooked or names.mfp_radish or names.mfp_radish_cooked or names.kyno_radish or names.kyno_radish_cooked 
        or names.parsnip or names.parsnip_cooked or names.mfp_parsnip or names.mfo_parsnip_cooked or names.kyno_parsnip or names.kyno_parsnip_cooked 
        or names.turnip or names.turnip_cooked or names.mfp_turnip or names.mfp_turnip_cooked or names.kyno_turnip or names.kyno_turnip_cooked)
		and (names.mandrake or 0)+(names.cookedmandrake or 0)+(names.carrot or 0)+(names.carrot_cooked or 0)
		+(names.potato or 0)+(names.potato_cooked or 0)+(names.sweet_potato or 0)+(names.sweet_potato_cooked or 0)+(names.kyno_sweetpotato or 0)+(names.kyno_sweetpotato_cooked or 0)+(names.mfp_sweetpotato or 0)+(names.mfp_sweetpotato_cooked or 0)
		+(names.radish or 0)+(names.radish_cooked or 0)+(names.mfp_radish or 0)+(names.mfp_radish_cooked or 0)+(names.kyno_radish or 0)+(names.kyno_radish_cooked or 0)
		+(names.parsnip or 0)+(names.parsnip_cooked or 0)+(names.mfp_parsnip or 0)+(names.mfo_parsnip_cooked or 0)+(names.kyno_parsnip or 0)+(names.kyno_parsnip_cooked or 0)
		+(names.turnip or 0)+(names.turnip_cooked or 0)+(names.mfp_turnip or 0)+(names.mfp_turnip_cooked or 0)+(names.kyno_turnip or 0)+(names.kyno_turnip_cooked or 0) >= 2
end

function IsFlower_Lotus(names, tags)
	return ( names.lotus_flower or names.kyno_lotus_flower or names.myth_lotus_flower or names.succulent_picked or tags.lotus or onlybloomfintuna(names ,tags)) and 
	Tea_Def(names, tags) and not 
	( 
		names.tealeaves or
		names.tealeaves_dried or 
		names.kyno_piko_orange or 
		names.piko_orange or
		names.foliage or
		names.greenfoliage or
		names.forgetmelots or 
		names.petals or 
		names.moon_tree_blossom or
		names.petals_evil or 
		names.firenettles or 
		names.tillweed or
		names.petals_rose or
		names.petals_lily or
		names.petals_orchid or
		names.aip_veggie_sunflower or
		names.cactus_flower or
		names.mentha_spicata
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

local function check_mightiness(eater)
	local skilltreeupdater = eater.components.skilltreeupdater
	if not skilltreeupdater then
		return false
	end
	local mightiness = eater.components.mightiness
	if not mightiness then
		return false
	end
	return skilltreeupdater:IsActivated("wolfgang_overbuff_1") and mightiness:GetCurrent() > mightiness:GetMax()
end

local function check_wathgrithr_combat_defense(eater)
	local skilltreeupdater = eater.components.skilltreeupdater
	if not skilltreeupdater then
		return false
	end
	return skilltreeupdater:IsActivated("wathgrithr_combat_defense")
end

local function check_nonedrunk(eater)
	return eater.components.dcapacity ~= nil and eater.components.dcapacity.nonedrunk 
end

local function notspiritstags(eater)
	return not check_mightiness(eater) and not check_wathgrithr_combat_defense(eater) and not check_nonedrunk(eater)
end

local function notalcoholtags(eater)
	return not eater:HasTag("valkyrie") and not eater:HasTag("mightiness_mighty") and notspiritstags(eater)
end

function alcohol(inst, eater)
	if eater:HasTag("player") then
		eater.components.dcapacity:Start_Intoxication(TUNING.ALCOHOL_CAPACITY)
		if eater.components.dcapacity:IsDrunk() then
			if notalcoholtags(eater) then
				eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
				eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
			else
				eater.components.talker:Say(GetString(eater,"ANNOUNCE_DRUNK_IMMUNITY"))
			end
		else
			if notalcoholtags(eater) then
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
			if notspiritstags(eater) then
				eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
				eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
			else
				eater.components.talker:Say(GetString(eater,"ANNOUNCE_DRUNK_IMMUNITY"))
			end
		else
			if notalcoholtags(eater) then
				if eater.components.dcapacity:IsCritical() then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_DCAPACITY_CRITICAL"))
				elseif eater.components.dcapacity:IsHalf() then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_DCAPACITY_HALF"))
				end
			end
		end
		eater:AddDebuff("immunebuff", "immunebuff")
	else
		eater:AddDebuff("immunebuff", "immunebuff")
		eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
		eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
	end
end

function boilermaker(inst, eater)
	if eater:HasTag("player") then
		eater.components.dcapacity:Start_Intoxication(60)--모든걸 무시하고 다 취하게 만들어 줌?
		eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
		eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
	else
		eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
		eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
	end
end

function drink_worm_light_lesser(inst, eater)
    if eater.wormlight ~= nil then
	    if eater.wormlight.prefab == "wormlight_light_lesser" then
	        eater.wormlight.components.spell.lifetime = 0
	        eater.wormlight.components.spell:ResumeSpell()
		    return
        else
    	    eater.wormlight.components.spell:OnFinish()
	    end
	end
    local light = SpawnPrefab("wormlight_light_lesser")
    light.components.spell:SetTarget(eater)
    if light:IsValid() then
        if light.components.spell.target == nil then
	   		light:Remove()
        else
            light.components.spell:StartSpell()
        end
    end
end

function drink_worm_light_less(inst, eater)
    if eater.wormlight ~= nil then
	    if eater.wormlight.prefab == "wormlight_light" then
	        eater.wormlight.components.spell.lifetime = 0
	        eater.wormlight.components.spell:ResumeSpell()
		    return
        else
    	    eater.wormlight.components.spell:OnFinish()
	    end
	end
    local light = SpawnPrefab("wormlight_light")
    light.components.spell:SetTarget(eater)
    if light:IsValid() then
        if light.components.spell.target == nil then
	   		light:Remove()
        else
            light.components.spell:StartSpell()
        end
    end
end

function drink_worm_light_greater(inst, eater)
    if eater.wormlight ~= nil then
        if eater.wormlight.prefab == "wormlight_light_greater" then
            eater.wormlight.components.spell.lifetime = 0
            eater.wormlight.components.spell:ResumeSpell()
            return
        else
            eater.wormlight.components.spell:OnFinish()
        end
    end
    local light = SpawnPrefab("wormlight_light_greater")
    light.components.spell:SetTarget(eater)
	if light:IsValid() then
	    if light.components.spell.target == nil then
	        light:Remove()
	    else
	        light.components.spell:StartSpell()
	    end
	end
end

local function FxSpawn(eater)
    local fx = SpawnPrefab(eater.components.rider ~= nil and eater.components.rider:IsRiding() and "fx_book_research_station_mount" or "fx_book_research_station")
    fx.Transform:SetPosition(eater.Transform:GetWorldPosition())
    fx.Transform:SetRotation(eater.Transform:GetRotation())
end

function give_tech(inst, eater, num, count_num)
	local atech_num = math.max(0,num)
	local otech_num = math.max(0,num/2)
	local ctech_num = math.max(0,num)
	local pctech_num = math.max(0,num)
	if eater.components.builder then
		local test = eater.components.builder:GetTechBonuses()
		if test then
			for k, v in pairs(test) do
				if k == "ANCIENT" and atech_num >= v then
					eater.components.builder:GiveTempTechBonus({ANCIENT = atech_num, OBSIDIAN = otech_num, CELESTIAL = ctech_num, CITY = pctech_num})
				end
			end
		end
		if count_num then
			eater.components.builder.temptechbonus_count = eater.components.builder.temptechbonus_count + math.max(1,count_num)
		end
		FxSpawn(eater)
	end
end

function add_tech_count(inst, eater, num)
	local tech_count = math.max(0,num)
	if eater.components.builder and eater.components.builder.temptechbonus_count then
		eater.components.builder.temptechbonus_count = eater.components.builder.temptechbonus_count + tech_count
		FxSpawn(eater)
	end
end

return {notmeat = notmeat, give_tech = give_tech, add_tech_count = add_tech_count}
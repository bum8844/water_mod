local HYDRATIONTYPE = {
		ROT = {
			"spoiled_food",
			"rottenegg",
			"spoiled_fish",
			"spoiled_fish_small",
		},
		--HYDRATION_SUPERTINY
		SUPERTINY = {
			"seaweed",
			"seaweed_cooked",
			"kelp",
			"kelp_cooked",
			"batwing",
			"batwing_cooked",
			"drumstick",
			"drumstick_cooked",
			"froglegs",
			"froglegs_cooked",
			"eel",
			"eel_cooked",
			"fish",
			"fish_cooked",
			"trunk_cooked",
			"plantmeat",
			"plantmeat_cooked",
			"meat",
			"cookedmeat",
			"monstermeat",
			"cookedmonstermeat",
			"kyno_humanmeat",
			"kyno_humanmeat_cooked",
			"humanmeat",
			"humanmeat_cooked",
			"smallmeat",
			"cookedsmallmeat",
			"batnose",
			"batnose_cooked",
			"fishmeat_small",
			"fishmeat_small_cooked",
			"fish_med",
			"fish_med_cooked",
			"fish_raw",
			"fishmeat",
			"fishmeat_cooked",
			"dead_swordfish",
			"fish3",
			"fish3_cooked",
			"fish4",
			"fish4_cooked",
			"fish5",
			"fish5_cooked",
			"roe",
			"roe_cooked",
			"shark_fin",
			"tropical_fish",
			"venus_stalk",
			"jellyfish_dead",
			"jellyfish_dead_cooked",
			"rainbowjellyfish_dead",
			"rainbowjellyfish_dead_cooked",
			"kyno_limpets",
			"kyno_limpets_cooked",
			"limpets",
			"limpets_cooked",
			"kyno_mussel",
			"kyno_mussel_cooked",
			"mussel",
			"mussel_cooked",
			"lobster_dead",
			"lobster_dead_cooked",
			"oceanfish_small_1",
			"oceanfish_small_2",
			"oceanfish_small_3",
			"oceanfish_small_4",
			"oceanfish_small_6",
			"oceanfish_small_7",
			"oceanfish_small_8",
			"oceanfish_small_9",
			"oceanfish_medium_1",
			"oceanfish_medium_2",
			"oceanfish_medium_3",
			"oceanfish_medium_4",
			"oceanfish_medium_6",
			"oceanfish_medium_7",
			"oceanfish_medium_8",
			"oceanfish_medium_9",
			"barnacle",
			"barnacle_cooked",
			"butter",
		},
		--HYDRATION_SMALLTINY
		SMALLTINY = {
			"pondeel",
			"pondfish",
			"trunk_summer",
			"trunk_winter",
			"minotaurhorn",
			"berries",
			"berries_cooked",
			"coconut_cooked",
			"carrot",
			"carrot_cooked",
			"mandrake",
			"cookedmandrake",
			"potato",
			"potato_cooked",
			"sweetpotato",
			"sweetpotato_cooked",
			"kyno_sweetpotato",
			"kyno_sweetpotato_cooked",
			"onion",
			"onion_cooked",
			"red_cap",
			"red_cap_cooked",
			"blue_cap",
			"blue_cap_cooked",
			"green_cap",
			"green_cap_cooked",
			"moon_cap",
			"moon_cap_cooked",
			"moon_tree_blossom",
			"petals",
			"petals_evil",
			"cactus_flower",
			"kyno_lotus_flower",
			"kyno_lotus_flower_cooked",
			"lotus_flower",
			"lotus_flower_cooked",
			"foliage",
			"cutlichen",
			"kyno_syrup",
			"honey",
			"royal_jelly",
		},
		--HYDRATION_TINY
		TINY = {
			"deerclops_eyeball",
			"dragoonheart",
			"tigereye",
			"butterflywings",
			"moonbutterflywings",
			"bird_egg",
			"bird_egg_cooked",
			"tallbirdegg",
			"tallbirdegg_cooked",
			"doydoyegg",
			"doydoyegg_cooked",
			"corn",
			"oceanfish_small_5",
			"oceanfish_medium_5",
			"kyno_radish",
			"kyno_radish_cooked",
			"radish",
			"radish_cooked",
			"eggplant",
			"eggplant_cooked",
			"pumpkin",
			"pumpkin_cooked",
			"tomato",
			"tomato_cooked",
			"watermelon_cooked",
			"berries_juicy",
			"berries_juicy_cooked",
			"fig",
			"fig_cooked",
			"rock_avocado_fruit_ripe",
			"rock_avocado_fruit_ripe_cooked",
			"rawmilk",
			"fishyogurt",
			"cheesecake",
		},
		--HYDRATION_SMALL
		SMALL = {
			"cave_banana",
			"cave_banana_cooked",
			"dragonfruit",
			"dragonfruit_cooked",
			"durian",
			"durian_cooked",
			"pomegranate",
			"pomegranate_cooked",
			"watermelon",
			"cactus_meat",
			"cactus_meat_cooked",
			"kyno_aloe",
			"kyno_aloe_cooked",
			"aloe",
			"aloe_cooked",
			"wormlight_lesser",
			"ice",
		},
		--HYDRATION_MEDSMALL
		MEDSMALL = {
			"coconut_halved",
			"lightbulb",
			"succulent_picked",
			"wormlight",
			"goatmilk",
			"beefalo_milk",
			"milkywhites",
		},
		--HYDRATION_MED
		MED = {
			"icecream",
			"fishyogurt",
			"berryshake",
		},

},

local SetThirstValue = function(self)
	local foodtype = self.foodtype
	local thirst = self.hungervalue or 0
	local spice_multiplier = self.spice ~= nil and TUNING[self.spice.."_THIRST_MULTIPLIER"] or 1
	local iscooked_multiplier = 1
	local rate = TUNING[foodtype.."_THIRST_RATE"] or 0

	if self.inst:HasTag("preparedfood") then
		iscooked_multiplier = TUNING.PREPAREDFOOD_MULTIPLIER
	elseif self.inst.components.cookable ~= nil then
		iscooked_multiplier = TUNING.COOKEDFOOD_ MULTIPLIER
	end

	return thirst * rate * spice_multiplier * iscooked_multiplier
end
	
AddComponentPostInit("edible", function(self)
	if self.thirstvalue == nil then
		self.thirstvalue = SetThirstValue(self)
	end

	function self:GetThirst(eater)
	    local thirstvalue = self.thirstvalue or 0
	    local multiplier = 1
	    local ignore_spoilage = not self.degrades_with_spoilage or self.thirstvalue < 0 or (eater ~= nil and eater.components.eater ~= nil and eater.components.eater.ignoresspoilage)

	    if not ignore_spoilage and self.inst.components.perishable ~= nil then
	        if self.inst.components.perishable:IsStale() then
	            multiplier = eater ~= nil and eater.components.eater ~= nil and eater.components.eater.stale_thirst or self.stale_thirst
	        elseif self.inst.components.perishable:IsSpoiled() then
	            multiplier = eater ~= nil and eater.components.eater ~= nil and eater.components.eater.spoiled_thirst or self.spoiled_thirst
	        end
	    end

	    if eater ~= nil and eater.components.foodaffinity ~= nil then
	        local affinity_bonus = eater.components.foodaffinity:GetAffinity(self.inst)
	        if affinity_bonus ~= nil then
	            multiplier = multiplier * affinity_bonus
	        end
	    end

	    return multiplier * thirstvalue
	end
end)

AddComponentPostInit("eater", function(self)
	self.thirstabsorption = 1
	local _SetAbsorptionModifiers = self.SetAbsorptionModifiers
	local _Eat = self.Eat
	local _PrefersToEat = self.PrefersToEat

	function self:SetAbsorptionModifiers(health, thirst, sanity, thirst, ...)
		_SetAbsorptionModifiers(self, health, thirst, sanity, ...)
		self.thirstabsorption = thirst
	end

	function self:Eat(food, feeder, ...)
		if _PrefersToEat(self, food, ...) then
			local stack_mult = self.eatwholestack and food.components.stackable ~= nil and food.components.stackable:StackSize() or 1
			local base_mult = self.inst.components.foodmemory ~= nil and self.inst.components.foodmemory:GetFoodMultiplier(food.prefab) or 1
			local thirst_delta = 0

		    if self.inst.components.thirst ~= nil then
		        thirst_delta = food.components.edible:GetThirst(self.inst) * base_mult * self.thirstabsorption
		    end

		    if thirst_delta ~= 0 then
	            self.inst.components.thirst:DoDelta(thirst_delta * stack_mult)
		    end
		    local result = _Eat(self, food, feeder, ...)
		    return result
		end
	end

	function self:PrefersToEat(food, ...)
		if food:HasTag("alcohol") and self.inst:HasTag("childplayer") then
			return false
		end
		local result = _PrefersToEat(self, food, ...)
		return result
	end
end)

local function sleepfunction(inst, eater)
	eater.components.debuffable:RemoveDebuff("alcoholdebuff")
	if KnownModIndex:IsModEnabled("workshop-2334209327") or KnownModIndex:IsModForceEnabled("workshop-2334209327") then
		eater.components.debuffable:RemoveDebuff("kyno_strengthbuff")
		eater.components.debuffable:RemoveDebuff("kyno_strengthbuff_med")
		eater.components.debuffable:RemoveDebuff("kyno_dmgreductionbuff")
	end
end

local function chkResistance(eater)
	return eater.components.grogginess:GetResistance() > 4
end

local function sleepend(inst, eater)
	eater:RemoveTag("drunk")
	eater:PushEvent("sleep_end")
	eater:PushEvent("refreshdrunk")
end

local function dummy(boilier, names, tags)
	return false
end

local function onlytealeaves(names, tags)
	return names.tealeaves and not names.tealeaves_dried and not names.petals and not names.forgetmelots and not names.foliage and not names.petals_evil and not names.succulent_picked and not names.firenettles and not names.moon_tree_blossom and not names.tillweed and not tags.veggie and not tags.fruit and not names.refined_dust
end

local function onlytealeaves_dried(names, tags)
	return names.tealeaves_dried and not names.tealeaves and not names.petals and not names.forgetmelots and not names.foliage and not names.petals_evil and not names.succulent_picked and not names.firenettles and not names.moon_tree_blossom and not names.tillweed and not tags.veggie and not tags.fruit and not names.refined_dust
end

local function onlyfoliage(names, tags)
	return names.foliage and not names.tealeaves and not names.petals and not names.forgetmelots and not names.tealeaves_dried and not names.petals_evil and not names.succulent_picked and not names.firenettles and not names.moon_tree_blossom and not names.tillweed and not tags.veggie and not tags.fruit and not names.refined_dust
end

local function onlyflower(names, tags)
	return (names.forgetmelots or names.petals or names.moon_tree_blossom) and not names.tealeaves and not names.foliage and not names.tealeaves_dried and not names.petals_evil and not names.succulent_picked and not names.firenettles and not names.tillweed and not tags.veggie and not tags.fruit and not names.refined_dust
end

local function onlyflower_evil(names, tags)
	return (names.petals_evil or names.firenettles or names.tillweed) and not names.tealeaves and not names.foliage and not names.tealeaves_dried and not names.forgetmelots and not names.succulent_picked and not names.petals and not names.moon_tree_blossom and not tags.veggie and not tags.fruit and not names.refined_dust
end

local function notmeat(tags)
	return not (tags.meat or tags.egg)
end

local function ressthing(names)
	return ((names.twigs or 0) <= 1)
end

local function notname(names)
	return not names.boneshard
end

local drinks =
{
	spoiled_drink =
	{
		test = function(boilier, names, tags) return dummy(boilier, names, tags) end,
		priority = -2,
		health = TUNING.SPOILED_HEALTH,
		hunger = TUNING.SPOILED_HUNGER,
		sanity = TUNING.SANITY_POISON,
		thirst = TUNING.HYDRATION_POISON,
		cooktime = TUNING.INCORRECT_BOIL,
		potlevel = "mid",
		potlevel_bottle = "mid",
		watertype = WATERTYPE.ROTTEN,
	},
	-- 조합법이 잘못되면 나오는 결과물
	goopydrink = 
	{
		test = function(boilier, names, tags) return true end,
		priority = -2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_FAST,
		cooktime = TUNING.INCORRECT_BOIL,
		wet_prefix = STRINGS.WET_PREFIX.WETGOOP,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	-- 과일차 종류
	
	fruitjuice =
	{
		test = function(boilier, names, tags) return tags.fruit and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_SMALL/2,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_SUPERTINY,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	berries_juice =
	{
		test = function(boilier, names, tags) return (names.berries or  names.berries_cooked or names.berries_juicy or names.berries_juicy_cooked) and tags.fruit and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_TINY,
		hunger = TUNING.DRINK_CALORIES/5, --1
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def={ingredients={{"berries",2},{"berries_juicy",2}}},
	},

	pomegranate_juice =
	{
		test = function(boilier, names, tags) return (names.pomegranate or names.pomegranate_cooked) and tags.fruit and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDLARGE,
		hunger = TUNING.DRINK_CALORIES/4,
		sanity = TUNING.SANITY_SUPERTINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	banana_juice =
	{
		test = function(boilier, names, tags) return (names.cave_banana or names.cave_banana_cooked) and tags.fruit and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.CALORIES_TINY/2,
		sanity = TUNING.SANITY_SUPERTINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	fig_juice =
	{
		test = function(boilier, names, tags) return (names.fig or names.fig_cooked) and tags.fruit and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDLARGE,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	dragonjuice =
	{
		test = function(boilier, names, tags) return ((names.dragonfruit or 0) + (names.dragonfruit_cooked or 0) >= 2 ) and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = TUNING.HEALING_LARGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED/5 ,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SLEEP_AND_DETOX,
		oneatenfn = function(inst, eater)
			local knockouttime = TUNING.TEASLEEP_TIME + math.random()
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() and eater:HasTag("player") then
				eater.sleepdrinkbuff_duration = TUNING.TEASLEEP_TIME + math.random()
				eater.components.debuffable:AddDebuff("sleepdrinkbuff", "sleepdrinkbuff")
			else
				eater.components.sleeper:AddSleepiness(7, knockouttime)
				eater:DoTaskInTime(knockouttime, function()
					eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "alcoholdebuff")
				end)
			end
		end,
	},
	
	glowberryjuice =
	{
		test = function(boilier, names, tags) return (names.wormlight or (names.wormlight_lesser and names.wormlight_lesser >= 2)) and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 3,
		health = TUNING.HEALING_TINY,
		hunger = TUNING.DRINK_CALORIES/5,
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL,
		tags = {"lightdrink"},
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_GLOW,
		card_def = {ingredients={{"wormlight_lesser",2},{"berries",1},{"twigs",1}}},
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
            else
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
	    end,
	},
	
	caffeinberry_juice =
	{
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 ) >= 3) and not tags.veggie and notmeat(tags) and notname(names) end,
		priority = 4,
		health = TUNING.HEALING_TINY,
		hunger = 0,
		sanity = -TUNING.SANITY_SUPERTINY,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "high",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CAFFINE,
		card_def={ingredients={{"caffeinberry_bean_cooked",3},{"honey",1}}},
		potlevel_bottle = "high",
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() and eater:HasTag("player")then
				eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME
				eater.components.debuffable:AddDebuff("caffeinbuff", "caffeinbuff")
			else
				eater.components.locomotor:SetExternalSpeedMultiplier(eater, "caffeinbuff", TUNING.CAFFEIN_SPEED)
				eater:DoTaskInTime(TUNING.CAFFEIN_TIME, function()
					eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "caffeinbuff")
				end)
			end
		end,
	},
	
	veggie_tea =
	{
		test = function(boilier, names, tags) return tags.veggie and not tags.fruit and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_SMALL/2,
		hunger = TUNING.DRINK_CALORIES/4,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	carrot_tea =
	{
		test = function(boilier, names, tags) return (names.carrot or names.carrot_cooked) and tags.veggie and not tags.fruit and notmeat(tags) and notname(names) and ressthing(names)end,
		priority = 1,
		health = TUNING.HEALING_TINY,
		hunger = TUNING.DRINK_CALORIES/5,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def={ingredients={{"carrot",3},{"twigs",1}},},
	},
	
	cactus_tea =
	{
		test = function(boilier, names, tags) return (names.cactus_meat or names.cactus_meat_cooked or names.aloe or names.aloe_cooked or names.kyno_aloe or names.kyno_aloe_cooked or names.succulent_picked or names.mfp_aloe or names.mfp_aloe_cooked ) and tags.veggie and not tags.fruit and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "small",
		potlevel_bottle = "mid",
	},

	mulled =
	{
		test = function(boilier, names, tags) return (( names.onion or 0 ) + ( names.onion_cooked or 0 ) + ( names.garlic or 0 ) + ( names.garlic_cooked or 0 ) >= 2) and tags.sweetener and tags.sweetener >= 1 and not tags.frozen and notmeat(tags) and notname(names) end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.SMALLTINY,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_MULLED,
		oneatenfn = function(inst, eater)
			local knockouttime = TUNING.TEASLEEP_TIME + math.random()
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() and eater:HasTag("player") then
				eater.sleepdrinkbuff_ex_duration = TUNING.TEASLEEP_TIME + math.random()
				eater.components.debuffable:AddDebuff("sleepdrinkbuff_ex", "sleepdrinkbuff_ex")
			else
				eater.components.sleeper:AddSleepiness(7, knockouttime)
				eater:DoTaskInTime(knockouttime, function()
					eater:AddDebuff("healthregenbuff", "healthregenbuff")
					eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "alcoholdebuff")
				end)
			end
		end,
	},
	
	-- 잎&꽃차 종류

	-- 꽃을 섞으면 나오는 결과물
	mixflower =
	{
		test = function(boilier, names, tags) return tags.decoration and not tags.veggie and not tags.fruit and not names.refined_dust and not names.succulent_picked and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL/2,
		hunger = 0,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",

	},
	
	greentea =
	{
		test = function(boilier, names, tags) return onlytealeaves(names, tags) and not tags.veggie and not tags.fruit and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_TINY,
		hunger = 0,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "high",
	},
	
	-- 녹차 건조대 말린것
	blacktea =
	{
		test = function(boilier, names, tags) return onlytealeaves_dried(names, tags) and not tags.frozen and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = 0,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "high",
		card_def={ingredients={{"tealeaves_dried",4}}},
	},
	
	blacktea_iced =
	{
		test = function(boilier, names, tags) return onlytealeaves_dried(names, tags) and tags.frozen and tags.frozen >= 1 and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = 0,
		sanity = TUNING.HEALING_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "high",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
	
	-- 동굴 고사리
	fuer =
	{
		test = function(boilier, names, tags) return onlyfoliage(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MED/2,
		hunger = 0,
		sanity = TUNING.HEALING_LARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "high",
	},
	
	-- 일반 꽃잎
	hibiscustea =
	{
		test = function(boilier, names, tags) return onlyflower(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDLARGE/6,
		hunger = 0,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "high",
	},

	-- 선인장 꽃잎
	cactusflower_tea =
	{
		test = function(boilier, names, tags) return names.cactus_flower and ((tags.veggie or 0) <= 2) and not tags.fruit and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "high",
	},
	
	--일시적으로 유령으로 만드는 차
	sushibiscus =
	{
		test = function(boilier, names, tags) return onlyflower_evil(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_ABI,
		potlevel = "mid",
		potlevel_bottle = "high",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SUS,
		card_def={ingredients={{"petals_evil",1},{"firenettles",1},{"tillweed",1},{"twigs",1}}},
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() and eater:HasTag("player")then
				eater.components.debuffable:AddDebuff("obebuff", "obebuff")
			else
				eater.components.health:DoDelta(-1000000)
			end
		end,
	},
	
}

local lotustea = {
		test = function(boilier, names, tags) return ( names.lotus_flower or names.kyno_lotus_flower or names.mfp_lotus_flower ) and ((tags.veggie or 0) <= 2) and not tags.fruit and notmeat(tags) and notname(names)and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDLARGE/5,
		hunger = 0,
		sanity = TUNING.SANITY_LARGE/3,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "high",
}

for k, mod_id in ipairs(KnownModIndex:GetModsToLoad()) do
    if mod_id == "workshop-2334209327" or mod_id == "workshop-1467214795" or mod_id == "workshop-1505270912" or mod_id == "workshop-2762334054" then
    	drinks.lotustea = lotustea
	end
end

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

    v.cookbook_category = "cookpot"

	if v.card_def then
		AddRecipeCard("kettle",v)
		AddRecipeCard("portablekettle",v)
	end
end

return drinks

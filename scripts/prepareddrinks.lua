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

local function dummy(boiler, name, tags)
	return false
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
		potlevel = "small",
		potlevel_bottle = "mid",
	},
	-- 과일차 종류
	
	fruitjuice =
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 2 and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES ,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
		potlevel_bottle = "mid",
	},
	
	berries_juice =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_cooked or 0 ) + ( names.berries_juicy or 0 ) + ( names.berries_juicy_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
		potlevel_bottle = "mid",
		card_def={ingredients={{"berries",2},{"berries_juicy",2}}},
	},

	pomegranate_juice =
	{
		test = function(boilier, names, tags) return (( names.pomegranate or 0 ) + ( names.pomegranate_cooked or 0 ) >= 3 ) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDLARGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
		potlevel_bottle = "mid",
	},
	
	banana_juice =
	{
		test = function(boilier, names, tags) return (( names.cave_banana or 0 ) + ( names.cave_banana_cooked or 0 ) >= 3 ) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
		potlevel_bottle = "mid",
	},
	
	fig_juice =
	{
		test = function(boilier, names, tags) return (( names.fig or 0) + ( names.fig_cooked or 0 ) >= 3 ) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
		potlevel_bottle = "mid",
	},
	
	dragonjuice =
	{
		test = function(boilier, names, tags) return (( names.dragonfruit or 0 ) + ( names.dragonfruit_cooked or 0 ) >= 1 ) and notmeat(tags) and notname(names) end,
		priority = 3,
		health = TUNING.HEALING_HUGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED ,
		thirst = TUNING.HYDRATION_HUGE,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SLEEP_AND_DETOX,
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
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
		test = function(boilier, names, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_HUGE,
		tags = {"lightdrink"},
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "small",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_GLOW,
		card_def = {ingredients={{"wormlight_lesser",2},{"twigs",2}}},
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
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "small",
		potlevel_bottle = "high",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CAFFINE,
		card_def={ingredients={{"caffeinberry_bean_cooked",2},{"honey",2}}},
		potlevel_bottle = "high",
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
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
		test = function(boilier, names, tags) return tags.veggie and tags.veggie >= 2 and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "small",
		potlevel_bottle = "mid",
	},
	
	carrot_tea =
	{
		test = function(boilier, names, tags) return (( names.carrot or 0 ) + ( names.carrot_cooked or 0 ) >= 3 ) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "small",
		potlevel_bottle = "mid",
		card_def={ingredients={{"carrot",2},{"twigs",2}},},
	},
	
	cactus_tea =
	{
		test = function(boilier, names, tags) return (( names.cactus_meat or 0 ) + ( names.cactus_meat_cooked or 0 ) + ( names.aloe or 0 ) + ( names.aloe_cooked or 0 ) + ( names.kyno_aloe or 0 ) + ( names.kyno_aloe_cooked or 0 ) + ( names.succulent_picked or 0 ) + ( names.mfp_aloe or 0 ) + ( names.mfp_aloe_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
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
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "small",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_MULLED,
		oneatenfn = function(inst, eater)
			local knockouttime = TUNING.TEASLEEP_TIME + math.random()
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
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
	
	greentea =
	{
		test = function(boilier, names, tags) return names.tealeaves and names.tealeaves >= 3 and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "small",
		potlevel_bottle = "high",
	},
	
	-- 녹차 건조대 말린것
	blacktea =
	{
		test = function(boilier, names, tags) return names.tealeaves_dried and names.tealeaves_dried >= 3 and not tags.frozen and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "small",
		potlevel_bottle = "high",
		card_def={ingredients={{"tealeaves_dried",4}}},
	},
	
	blacktea_iced =
	{
		test = function(boilier, names, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and tags.frozen and tags.frozen >= 1 and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "small",
		potlevel_bottle = "high",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
	
	-- 동굴 고사리
	fuer =
	{
		test = function(boilier, names, tags) return names.foliage and names.foliage >= 3 and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "small",
		potlevel_bottle = "mid",
	},
	
	-- 꽃을 섞으면 나오는 결과물
	mixflower =
	{
		test = function(boilier, names, tags) return tags.decoration and tags.decoration >= 2 and not names.refined_dust and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "small",
		potlevel_bottle = "mid",

	},
	
	-- 일반 꽃잎
	hibiscustea =
	{
		test = function(boilier, names, tags) return (( names.petals or 0 ) + ( names.forgetmelots or 0 ) + ( names.moon_tree_blossom or 0 ) >= 3 ) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "small",
		potlevel_bottle = "mid",
	},

	-- 선인장 꽃잎
	cactusflower_tea =
	{
		test = function(boilier, names, tags) return names.cactus_flower and names.cactus_flower >= 3 and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "small",
		potlevel_bottle = "high",
	},
	
	--일시적으로 유령으로 만드는 차
	sushibiscus =
	{
		test = function(boilier, names, tags) return (( names.petals_evil or 0 ) + ( names.firenettles or 0 ) + ( names.tillweed  or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_ABI,
		potlevel = "small",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SUS,
		card_def={ingredients={{"petals_evil",1},{"firenettles",1},{"tillweed",1},{"twigs",1}}},
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
				eater.components.debuffable:AddDebuff("obebuff", "obebuff")
			else
				eater.components.health:DoDelta(-10000)
			end
		end,
	},
	
}

local lotustea = {
		test = function(boilier, names, tags) return (( names.lotus_flower or 0 ) + ( names.lotus_flower_cooked or 0 ) + ( names.kyno_lotus_flower or 0 ) + ( names.kyno_lotus_flower_cooked or 0 ) + ( names.mfp_lotus_flower or 0 ) + ( names.mfp_lotus_flower_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "small",
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

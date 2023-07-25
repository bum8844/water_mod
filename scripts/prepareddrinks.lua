require("kettle_recpie_cards")

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

local function Preference(names, tags)
	return ( (tags.sweetener or 0) + (tags.dairy or 0) + (tags.milk or 0) )
end

local function Tea_Def(names, tags)
	return (tags.decoration or 0) and ((tags.veggie or 0) <= 2) and ((tags.mushroom or 0) < 4) and not tags.fruit
end

local function IsTealeaves(names, tags)
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

local function IsTealeaves_dried(names, tags)
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

local function IsFoliage(names, tags)
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

local function IsFlower(names, tags)
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

local function IsFlower_Evil(names, tags)
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

local function IsFlower_Cactus(names, tags)
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

local function IsFlower_Lotus(names, tags)
	return ( names.lotus_flower or names.kyno_lotus_flower or names.succulent_picked or tags.lotus or names.oceanfish_small_7 ) and 
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

local function notmeat(tags)
	return not (tags.fish or tags.meat or tags.egg or tags.boss or tags.poop or tags.elemental or tags.paper or tags.horn or tags.spotspice or tags.gears or tags.rabbit or tags.beanbug or tags.gummybug or tags.flour or tags.bread or tags.chocolate)
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
		wet_prefix = STRINGS.WET_PREFIX.WETGOOP,
		potlevel = "high",
		potlevel_bottle = "mid",
	},

	-- 과일차 종류(채력특화)
	
	berries_juice =
	{
		test = function(boilier, names, tags) return (names.berries or  names.berries_cooked or names.berries_juicy or names.berries_juicy_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES/5, --1
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def={ingredients={{"berries",2},{"berries_juicy",2}}},
	},

	fruitjuice =
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 3 and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_SUPERTINY,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	banana_juice =
	{
		test = function(boilier, names, tags) return (names.cave_banana or names.cave_banana_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = TUNING.HEALING_LARGE,
		hunger = TUNING.CALORIES_TINY,
		sanity = TUNING.SANITY_SUPERTINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	pomegranate_juice =
	{
		test = function(boilier, names, tags) return (names.pomegranate or names.pomegranate_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = TUNING.HEALING_HUGE,
		hunger = TUNING.DRINK_CALORIES/4,
		sanity = TUNING.SANITY_SUPERTINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	fig_juice =
	{
		test = function(boilier, names, tags) return (names.fig or names.fig_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 3,
		health = TUNING.HEALING_MOREHUGE,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	dragonjuice =
	{
		test = function(boilier, names, tags) return (names.dragonfruit or names.dragonfruit_cooked) and tags.fruit and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = TUNING.HEALING_MEDLARGE,
		hunger = TUNING.CALORIES_LARGE,
		sanity = TUNING.SANITY_MED/3,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	glowberryjuice =
	{
		test = function(boilier, names, tags) return ((names.wormlight and names.wormlight >= 2) or (names.wormlight_lesser and names.wormlight_lesser >= 3)) and (Preference(names, tags) >= 0.5) and not tags.veggie and notmeat(tags) and notname(names) end,
		priority = 4,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES/5,
		sanity = 0,
		thirst = TUNING.HYDRATION_SMALL,
		tags = {"lightdrink"},
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "wormlight_light_greater" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_GLOW,
		card_def = {ingredients={{"wormlight_lesser",3},{"honey",1}}},
		oneatenfn = function(inst, eater)
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
	    end,
	},
	
	caffeinberry_juice =
	{
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 ) >= 3) and Preference(names, tags) and not tags.veggie and notmeat(tags) and notname(names) end,
		priority = 5,
		health = TUNING.HEALING_TINY,
		hunger = 0,
		sanity = -TUNING.SANITY_SUPERTINY,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "caffeinbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_CAFFINE,
		card_def={ingredients={{"caffeinberry_bean_cooked",3},{"honey",1}}},
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
		end,
	},

	-- 야채차(목마름 특화)
	
	carrot_tea =
	{
		test = function(boilier, names, tags) return (names.carrot or names.carrot_cooked) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL*1.5,
		hunger = TUNING.DRINK_CALORIES/5,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "high",
		potlevel_bottle = "mid",
		card_def={ingredients={{"carrot",3},{"twigs",1}},},
	},

	veggie_tea =
	{
		test = function(boilier, names, tags) return tags.veggie and not tags.lotus and Preference(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_SMALL*2,
		hunger = TUNING.DRINK_CALORIES/4,
		sanity = -TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneatenfn = function(inst, eater)
			if eater:HasTag("player") and not eater:HasTag("playermerm") then
				if eater:HasTag("masterchef") then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_EAT","RAW"))
				else
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_EAT","PAINFUL"))
				end
				eater.components.debuffable:RemoveDebuff("waterbornedebuff")
			end
		end
	},
	
	cactus_tea =
	{
		test = function(boilier, names, tags) return (names.cactus_meat or names.cactus_meat_cooked or names.aloe or names.aloe_cooked or names.kyno_aloe or names.kyno_aloe_cooked or names.mfp_aloe or names.mfp_aloe_cooked ) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL*2,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},

	tomato_juice = {
		test = function(boilier, names, tags) return (names.tomato or names.tomato_cooked or names.tomato_dried) and tags.veggie and Preference(names, tags) and not tags.fruit and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL*2,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY/2,
		thirst = TUNING.HYDRATION_LARGE,
		potlevel = "high",
		potlevel_bottle = "mid",
		perishtime = TUNING.PERISH_MED,
		prefabs = { "detoxbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_DETOX,
		oneatenfn = function(inst, eater)
			if eater:HasTag("drunk") then
				eater.detoxbuff_duration = TUNING.DRUNKARD_DURATION*.5
				eater:AddDebuff("detoxbuff", "detoxbuff")
			elseif eater.components.dcapacity ~= nil and eater.components.dcapacity:GetCapacity() > 0 then
				eater.components.dcapacity:Remove_Capacity(1)
			end
		end,
	},

	mulled =
	{
		test = function(boilier, names, tags) return (( names.onion or 0 ) + ( names.onion_cooked or 0 ) + ( names.garlic or 0 ) + ( names.garlic_cooked or 0 ) >= 2) and tags.sweetener and tags.sweetener >= 1 and Preference(names, tags) and not tags.frozen and notmeat(tags) and notname(names) end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "mid",
		potlevel_bottle = "high",
		prefabs = { "sleepdrinkbuff", "healthregenbuff","honeyed" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_MULLED,
		oneatenfn = function(inst, eater)
			eater.sleepdrinkbuff_duration = TUNING.TEASLEEP_TIME + math.random()
			eater:AddDebuff("sleepdrinkbuff", "sleepdrinkbuff")
		end,
	},
	
	-- 잎&꽃차 종류(정신력 특화)

	-- 꽃을 섞으면 나오는 결과물
	mixflower =
	{
		test = function(boilier, names, tags) return Tea_Def(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 0,
		health = TUNING.HEALING_TINY,
		hunger = 0,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",

	},
	
	greentea =
	{
		test = function(boilier, names, tags) return IsTealeaves(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_TINY,
		hunger = 0,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	-- 녹차 건조대 말린것
	blacktea =
	{
		test = function(boilier, names, tags) return IsTealeaves_dried(names, tags) and not tags.frozen and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = 0,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def={ingredients={{"tealeaves_dried",4}}},
	},
	
	blacktea_iced =
	{
		test = function(boilier, names, tags) return IsTealeaves_dried(names, tags) and tags.frozen and tags.frozen >= 1 and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = 0,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLD_FOOD,
	},
	
	-- 동굴 고사리(수인성 질병 해결)
	fuer =
	{
		test = function(boilier, names, tags) return IsFoliage(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = 0,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
		potlevel = "mid",
		potlevel_bottle = "mid",
		oneatenfn = function(inst, eater)
			eater.components.debuffable:RemoveDebuff("waterbornedebuff")
		end,
	},
	
	-- 일반 꽃잎
	hibiscustea =
	{
		test = function(boilier, names, tags) return IsFlower(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = 0,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_SMALLTINY,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	--일시적으로 유령으로 만드는 차
	sushibiscus =
	{
		test = function(boilier, names, tags) return IsFlower_Evil(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = TUNING.ANTI_GHOST,
		thirst = 0,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_ABI,
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "obebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SUS,
		card_def={ingredients={{"petals_evil",1},{"firenettles",1},{"tillweed",1},{"twigs",1}}},
		oneatenfn = function(inst, eater)
				eater:AddDebuff("obebuff", "obebuff")
		end,
	},

	-- 선인장 꽃잎
	cactusflower_tea =
	{
		test = function(boilier, names, tags) return IsFlower_Cactus(names, tags) and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = TUNING.HEALING_MED/2,
		hunger = TUNING.DRINK_CALORIES/2,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.BUFF_FOOD_TEMP_DURATION,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "high",
		potlevel_bottle = "mid",
	},
	
	lotustea = {
			test = function(boilier, names, tags) return IsFlower_Lotus(names, tags) and notmeat(tags) and notname(names)and ressthing(names) end,
			priority = 1,
			health = TUNING.HEALING_MED,
			hunger = 0,
			sanity = TUNING.SANITY_LARGE,
			thirst = TUNING.HYDRATION_SMALL,
			perishtime = TUNING.PERISH_MED,
			cooktime = TUNING.KETTLE_DECORATION,
			temperature = TUNING.HOT_FOOD_BONUS_TEMP,
			temperatureduration = TUNING.FOOD_TEMP_BRIEF,
	        prefabs = { "sweettea_buff" },
			tags = {"honeyed"},
	        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HOT_SANITY_REGEN, -- 바꿔야함
	        oneatenfn = function(inst, eater)
				eater:AddDebuff("buff_moistureimmunity", "buff_moistureimmunity")
	        end,
			potlevel = "mid",
			potlevel_bottle = "mid",
	},
}

--[[local lotustea = {
		test = function(boilier, names, tags) return ( names.lotus_flower or names.kyno_lotus_flower or names.mfp_lotus_flower ) and ((tags.veggie or 0) <= 2) and not tags.fruit and notmeat(tags) and notname(names)and ressthing(names) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = 0,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		potlevel = "mid",
		potlevel_bottle = "high",
}

for k, mod_id in ipairs(KnownModIndex:GetModsToLoad()) do
    if mod_id == "workshop-2334209327" or mod_id == "workshop-1467214795" or mod_id == "workshop-1505270912" or mod_id == "workshop-2762334054" then
    	drinks.lotustea = lotustea
	end
end]]

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

    v.cookbook_category = "cookpot"

	if v.card_def then
		AddRecipeCard_Kettle("kettle",v)
	end
end

return drinks

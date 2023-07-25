require("brewery_recpie_cards")

local function alcahol(inst, eater)
	if eater:HasTag("player") then
		eater.components.dcapacity:Start_Intoxication()
		if eater.components.dcapacity:IsDrunk() then
			if not eater:HasTag("valkyrie") then
				eater.alcoholdebuff_duration = TUNING.INTOXICATION_TIME
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
		eater.immunebuff_duration = TUNING.IMMUNE_TIME
		eater:AddDebuff("immunebuff", "immunebuff")
	else
		eater.alcoholdebuff_duration = TUNING.INTOXICATION_TIME
		eater.immunebuff_duration = TUNING.IMMUNE_TIME
		eater:AddDebuff("immunebuff", "immunebuff")
		eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
		eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
	end
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
	-- 탄산수 만들때 필수적으로 refined_dust 첨가
	soda =
	{
		test = function(boilier, names, tags) return names.refined_dust and names.refined_dust >= 1 and notmeat(tags) end,
		priority = 0,
		health = TUNING.HEALING_TINY,
		hunger = TUNING.CALORIES_TINY,
		sanity = TUNING.SANITY_SUPERTINY*3,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_DECORATION + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		card_def = {ingredients = {{"refined_dust", 1}, {"twigs", 3}}},
	},
	
	
	fruitsoda =
	{
		test = function(boilier, names, tags) return names.refined_dust and names.refined_dust >= 1 and tags.fruit and tags.fruit >= 1 and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_SMALL,
		sanity = TUNING.SANITY_SUPERTINY*3,
		thirst = TUNING.HYDRATION_HUGE,
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_DECORATION + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
	},
	
	
	lemonlimesoda =
	{
		test = function(boilier, names, tags) return names.refined_dust and names.refined_dust >= 1 and names.royal_jelly and names.royal_jelly >=1 and notmeat(tags) and notname(names) and ressthing(names) end,
		priority = 3,
		health = TUNING.HEALING_MED,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_MOREHUGE,
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "healthregenbuff","honeyed" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HEALTH_REGEN,
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
            else
				eater:AddDebuff("healthregenbuff", "healthregenbuff")
			end
		end,
	},
	
	cola =
	{
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) + ( names.mfp_coffeecherry_cooked or 0 ) >= 1) and names.refined_dust and names.refined_dust >= 1 and names.royal_jelly and names.royal_jelly >= 1 and notmeat(tags) and notname(names) end,
		priority = 4,
		health = TUNING.HEALING_MED/2,
		hunger = TUNING.CALORIES_MEDSMALL,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_MOREHUGE,
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "healthregenbuff","caffeinbuff","honeyed" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLA,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
		end,
	},
	
	colaquantum =
	{
		test = function(boilier, names, tags) return names.wormlight and (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) == 1) and names.refined_dust and names.royal_jelly and notmeat(tags) end,
		priority = 5,
		health = TUNING.HEALING_SUPERHUGE*4,
		hunger = TUNING.CALORIES_HUGE*4,
		sanity = TUNING.SANITY_HUGE*8,
		thirst = TUNING.HYDRATION_SUPERHUGE,
		tags = { "masterfood","lightdrink","honeyed" },
		perishtime = TUNING.PERISH_PRESERVED,
		cooktime = (TUNING.KETTLE_LUXURY_GOODS + TUNING.SODA_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "healthregenbuff","drunkarddebuff","wormlight_light_greater" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_COLAQUANTUM,
		oneatenfn = function(inst, eater)
			eater.caffeinbuff_duration = TUNING.CAFFEIN_TIME
            eater:AddDebuff("healthregenbuff", "healthregenbuff")
			eater:AddDebuff("caffeinbuff", "caffeinbuff")
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
	
	-- 술(물 장기 보관용도)
	corn_beer =
	{
		test = function(boilier, names, tags) return (( names.corn or 0 ) + ( names.corn_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = 0,
		hunger = TUNING.CALORIES_SMALL,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","caffeinbuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		card_def = {ingredients = {{"corn", 4}}},
		oneatenfn = function(inst, eater)
			alcahol(inst, eater)
		end,
	},
	--꿀술
	madhu =
	{
		test = function(boilier, names, tags) return tags.sweetener and tags.sweetener >= 3 and notmeat(tags) and notname(names) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL*3,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_TINY,
		tags = {"alcohol","honeyed"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "high",
		prefabs = { "alcoholdebuff","caffeinbuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			alcahol(inst, eater)
		end,
	},	
	-- 베리류
	wine =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_juicy or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 2,
		health = 0,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_TINY,
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","caffeinbuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			alcahol(inst, eater)
		end,
	},

	noblewine = 
	{
		test = function(boilier, names, tags) return (( names.berries_cooked or 0 ) + ( names.berries_juicy_cooked or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 2,
		health = 0,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_TINY,
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","caffeinbuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		oneatenfn = function(inst, eater)
			alcahol(inst, eater)
		end,
	},
	
	sparklingwine =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_juicy or 0 ) >= 2) and names.refined_dust and names.refined_dust >= 1 and notmeat(tags) and notname(names) end,
		priority = 3,
		health = TUNING.HEALING_SMALL*2,
		hunger = TUNING.CALORIES_SMALL,
		sanity = TUNING.SANITY_HUGE/2,
		thirst = TUNING.HYDRATION_MED,
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","caffeinbuff","immunebuff" },
		card_def = {ingredients = {{"refined_dust",1},{"berries",1},{"berries_juicy",1},{"twigs",1}}},
		oneatenfn = function(inst, eater)
			alcahol(inst, eater)
		end,
	},
	-- 발광 베리류
	glowberrywine =
	{
		test = function(boilier, names, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0 ) >= 3) and notmeat(tags) and notname(names) end,
		priority = 1,
		health = 0,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_TINY,
		tags = {"alcohol","lightdrink"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		potlevel = "high",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","caffeinbuff","immunebuff","wormlight_light" },
		cooktime = (TUNING.KETTLE_FRUIT + TUNING.BEER_WAIT),
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION_GLOW,
		oneatenfn = function(inst, eater)
			alcahol(inst, eater)
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
	    end,
	},
	-- 우유
	kumis = {
		test = function(boilier, names, tags) return ( ( tags.milk or 0 ) + ( tags.dairy or 0 ) + ( names.goatmilk or 0 ) + ( names.kyno_milk_beefalo or 0 ) + ( names.kyno_milk_koalefant or 0 ) + ( names.milk_box or 0 ) + ( names.beefalo_milk or 0 ) + ( names.rawmilk or 0 ) >= 3) and notmeat(tags) and notname(names) and not tags.fat end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_TINY,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_TINY,
		tags = {"alcohol"},
		perishtime = TUNING.PERISH_SUPERSLOW,
		cooktime = (TUNING.KETTLE_VEGGIE + TUNING.BEER_WAIT),
		potlevel = "mid",
		potlevel_bottle = "mid",
		prefabs = { "alcoholdebuff","caffeinbuff","immunebuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_INTOXICATION,
		card_def = {ingredients = {{"goatmilk",4}}},
		oneatenfn = function(inst, eater)
			alcahol(inst, eater)
		end,
	}
}

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

    v.cookbook_category = "cookpot"

	if v.card_def then
		AddRecipeCard_Brewery("brewery",v)
	end
end

return drinks

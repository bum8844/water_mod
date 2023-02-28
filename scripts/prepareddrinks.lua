local function dummy(boiler, name, tags)
	return false
end

function notmeat(tags)
	return not (tags.meat or tags.egg)
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
	},
	-- 과일차 종류
	
	fruitjuice =
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 1.5 and notmeat(tags) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES ,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
	},
	
	berries_tea =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_cooked or 0 ) + ( names.berries_juicy or 0 ) + ( names.berries_juicy_cooked or 0 ) >= 2) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
	},

	pomegranate_juice =
	{
		test = function(boilier, names, tags) return (( names.pomegranate or 0 ) + ( names.pomegranate_cooked or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDLARGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
	},
	
	banana_tea =
	{
		test = function(boilier, names, tags) return (( names.cave_banana or 0 ) + ( names.cave_banana_cooked or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
	},
	
	fig_juice =
	{
		test = function(boilier, names, tags) return (( names.fig or 0) + ( names.fig_cooked or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
	},
	
	dragonjuice =
	{
		test = function(boilier, names, tags) return (( names.dragonfruit or 0 ) + ( names.dragonfruit_cooked or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_HUGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED ,
		thirst = TUNING.HYDRATION_HUGE,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_FRUIT,
		potlevel = "small",
		oneatenfn = function(inst, eater)
			local knockouttime = TUNING.TEASLEEP_TIME + math.random()

			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
				eater:AddTag("drinksleep")
				eater:PushEvent("yawn", { grogginess = 4, knockoutduration = knockouttime })
				eater:DoTaskInTime(knockouttime, function()
					eater.components.debuffable:RemoveDebuff("alcoholdebuff")
					eater:DoTaskInTime(4.1, function()
						eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "alcoholdebuff")
						if eater:HasTag("drunk") then
							eater:DoTaskInTime(9, function()
								eater:PushEvent("sleep_end")
								eater:RemoveTag("drunk")
							end)
						end
					end)
				end)
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
		test = function(boilier, names, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0) >= 2) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_HUGE,
		tags = {"lightdrink"},
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		--potlevel = "small",
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
	
	-- 일시적 겉는 속도 증가[추가해야함]
	caffeinberry_juice =
	{
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.coffeebeans_cooked or 0 ) >= 2) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_SMALL,
		perishtime = TUNING.PERISH_SLOW,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
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
	
	-- 야채차 종류
	veggie_tea =
	{
		test = function(boilier, names, tags) return tags.veggie and tags.veggie >= 1.5 and notmeat(tags) end,
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "small",
	},
	
	carrot_tea =
	{
		test = function(boilier, names, tags) return (( names.carrot or 0 ) + ( names.carrot_cooked or 0 ) >= 2 )and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_VEGGIE,
		potlevel = "small",
		basename = "carrot_tea",
	},
	
	-- 선인장, 다육, 알로에는 무조건 이걸로 만들어지게
	cactus_tea =
	{
		test = function(boilier, names, tags) return (( names.cactus_meat or 0 ) + ( names.cactus_meat_cooked or 0 ) + ( names.aloe or 0 ) + ( names.aloe_cooked or 0 ) + ( names.kyno_aloe or 0 ) + ( names.kyno_aloe_cooked or 0 ) + ( names.succulent_picked or 0 ) >= 2)  end,
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
		basename = "cactus_tea",
	},
	
	mulled =
	{
		test = function(boilier, names, tags) return (( names.onion or 0 ) + ( names.onion_cooked or 0 ) + ( names.garlic or 0 ) + ( names.garlic_cooked or 0 ) >= 2) and tags.sweetener and tags.sweetener >= 1 and not tags.frozen and notmeat(tags) end,
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
		oneatenfn = function(inst, eater)
			local knockouttime = TUNING.TEASLEEP_TIME + math.random()
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
				eater:AddTag("drinksleep")
				eater:PushEvent("yawn", { grogginess = 4, knockoutduration = knockouttime })
				eater:DoTaskInTime(knockouttime, function()
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_SLEEP_DRUNK_END"))
					eater.components.debuffable:RemoveDebuff("alcoholdebuff")
					eater:DoTaskInTime(4.1, function()
						eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "alcoholdebuff")
						if eater:HasTag("drunk") then
							eater:DoTaskInTime(9, function()
								eater:PushEvent("sleep_end")
								eater:RemoveTag("drunk")
							end)
						end
					end)
					eater:AddDebuff("healthregenbuff", "healthregenbuff")
				end)
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
		test = function(boilier, names, tags) return names.tealeaves and names.tealeaves >= 2 and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
	},
	
	-- 녹차 건조대 말린것
	blacktea =
	{
		test = function(boilier, names, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and not tags.frozen and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		--potlevel = "high",
	},
	
	blacktea_iced =
	{
		test = function(boilier, names, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and tags.frozen and tags.frozen >= 1 and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		--potlevel = "small",
	},
	
	-- 동굴 고사리
	fuer =
	{
		test = function(boilier, names, tags) return names.foliage and names.foliage >= 2 and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_TEA,
	},
	
	-- 꽃을 섞으면 나오는 결과물
	mixflower =
	{
		test = function(boilier, names, tags) return tags.decoration and tags.decoration >= 2 and notmeat(tags) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MEDSMALL,
		perishtime = TUNING.PERISH_FASTISH,
		cooktime = TUNING.KETTLE_DECORATION,
		--potlevel = "small",
	},
	
	-- 일반 꽃잎
	hibiscustea =
	{
		test = function(boilier, names, tags) return (( names.petals or 0 ) + ( names.forgetmelots or 0 ) + ( names.moon_tree_blossom or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		--potlevel = "high",
	},

	-- 선인장 꽃잎
	cactusflower_tea =
	{
		test = function(boilier, names, tags) return names.cactus_flower and names.cactus_flower >= 2 and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		--potlevel = "high",
	},
	
	lotustea =
	{
		test = function(boilier, names, tags) return (( names.lotus_flower or 0 ) + ( names.lotus_flower_cooked or 0 ) + ( names.kyno_lotus_flower or 0 ) + ( names.kyno_lotus_flower_cooked or 0 ) >= 2) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		--potlevel = "high",
	},
	
	--일시적으로 유령으로 만드는 차[추가해야함]
	sushibiscus =
	{
		test = function(boilier, names, tags) return (( names.petals_evil or 0 ) + ( names.firenettles or 0 ) + ( names.tillweed  or 0 ) >= 2) and notmeat(tags) end,
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		perishtime = TUNING.PERISH_MED,
		cooktime = TUNING.KETTLE_ABI,
		--potlevel = "high",
		oneatenfn = function(inst, eater)
			if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
				return
			elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
				local currenthealth = eater.components.health.currenthealth
				local currenthunger = eater.components.hunger.current
				local currentsanity = eater.components.sanity.current
				TheNet:Announce(""..eater:GetDisplayName().." drank ".. STRINGS.NAMES.GHOSTLY_TEA ..", and became a ghost for "..TUNING.GHOST_TIME.." seconds!")
				eater.components.health:DoDelta(-10000, nil, "death_by_tea")
				eater:DoTaskInTime(TUNING.GHOST_TIME, function()
			        TheNet:Announce(eater:GetDisplayName().."'s ghost effect ended. Respawning!")
			        eater:PushEvent("respawnfromghost", { source = eater })
			        eater:DoTaskInTime(1,function()
						eater.components.health.currenthealth = currenthealth
						eater.components.hunger.current = currenthunger
						eater.components.sanity.current = currentsanity
			    	end)
			    end)
			else
				eater.components.health:DoDelta(-10000)
			end
		end,
	},
	
}

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

    v.cookbook_category = "cookpot"
end

return drinks

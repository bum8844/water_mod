local function returnbottle(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	local uses = inst.components.finiteuses:GetUses()
	uses = uses - 1

	local refund = nil
	if uses > 0 then
		refund = SpawnPrefab(inst.prefab)
		refund.components.finiteuses:SetUses(uses)
	else
		refund = SpawnPrefab("messagebottleempty")
	end

	inst:Remove()

	if eater ~= nil and eater.components.inventory ~= nil then
		eater.components.inventory:GiveItem(refund, nil, Vector3(x, y, z))
	else
		refund.Transform:SetPosition(x,y,z)
	end
end


local function returncup(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	local refund = SpawnPrefab("cup")
	if eater ~= nil and eater.components.inventory ~= nil then
		eater.components.inventory:GiveItem(refund, nil, Vector3(x, y, z))
	else
		refund.Transform:SetPosition(x,y,z)
	end
end

local function dummy(boiler, name, tags)
	return false
end

function notmeat(tags)
	return not (tags.meat or tags.egg)
end

local drinks =
{
	
	-- 기본 물
	-- 다른 차를 만들 경우 같은 아이템을 2개 넣어야함
	water =
	{
		test = dummy,
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		cooktime = TUNING.KETTLE_WATER,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	dirty =
	{
		test = dummy,
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	salt =
	{
		test = dummy,
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	-- 조합법이 잘못되면 나오는 결과물
	garbage = 
	{
		test = function(boilier, names, tags) return true end,
		priority = -2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		cooktime = TUNING.INCORRECT_BOIL,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	-- 과일차 종류
	
	fruit =
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 1.5 and notmeat(tags) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES ,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	berries =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_cooked or 0 ) + ( names.berries_juicy or 0 ) + ( names.berries_juicy_cooked or 0 ) >= 2) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},

	pomegranate =
	{
		test = function(boilier, names, tags) return (( names.pomegranate or 0 ) + ( names.pomegranate_cooked or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDLARGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	banana =
	{
		test = function(boilier, names, tags) return (( names.cave_banana or 0 ) + ( names.cave_banana_cooked or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	fig =
	{
		test = function(boilier, names, tags) return (( names.fig or 0) + ( names.fig_cooked or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	dragonfruit =
	{
		test = function(boilier, names, tags) return (( names.dragonfruit or 0 ) + ( names.dragonfruit_cooked or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_HUGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED ,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	glowberry =
	{
		test = function(boilier, names, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0) >= 2) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
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
	
	-- 일시적 겉는 속도 증가[추가해야함]
	coffee =
	{
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) >= 2) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = 25,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	-- 야채차 종류
	veggie =
	{
		test = function(boilier, names, tags) return tags.veggie and tags.veggie >= 1.5 and notmeat(tags) end,
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_VEGGIE,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	carrot =
	{
		test = function(boilier, names, tags) return (( names.carrot or 0 ) + ( names.carrot_cooked or 0 ) >= 2 )and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	-- 선인장, 다육, 알로에는 무조건 이걸로 만들어지게
	cactus =
	{
		test = function(boilier, names, tags) return (( names.cactus_meat or 0 ) + ( names.cactus_meat_cooked or 0 ) + ( names.aloe or 0 ) + ( names.aloe_cooked or 0 ) + ( names.kyno_aloe or 0 ) + ( names.kyno_aloe_cooked or 0 ) + ( names.succulent_picked or 0 ) >= 2)  end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	mulled =
	{
		test = function(boilier, names, tags) return (( names.onion or 0 ) + ( names.onion_cooked or 0 ) + ( names.garlic or 0 ) + ( names.garlic_cooked or 0 ) >= 1) and tags.sweetener and not tags.frozen and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_LARGE,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
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
		cooktime = TUNING.KETTLE_TEA,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
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
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	blacktea_iced =
	{
		test = function(boilier, names, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
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
		cooktime = TUNING.KETTLE_TEA,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	-- 꽃을 섞으면 나오는 결과물
	mixflower =
	{
		test = function(boilier, names, tags) return tags.decoration and tags.decoration >= 2 and tags.meat and not tags.egg end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_DECORATION,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	-- 일반 꽃잎
	hibiscus =
	{
		test = function(boilier, names, tags) return (( names.petals or 0 ) + ( names.moon_tree_blossom or 0 ) >= 2 ) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},

	-- 선인장 꽃잎
	cactusflower =
	{
		test = function(boilier, names, tags) return names.cactus_flower and names.cactus_flower >= 2 and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_DECORATION,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	lotusflower =
	{
		test = function(boilier, names, tags) return (( names.lotus_flower or 0 ) + ( names.lotus_flower_cooked or 0 ) + ( names.kyno_lotus or 0 ) + ( names.kyno_lotus_cooked or 0 ) >= 2) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_DECORATION,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	--일시적으로 유령으로 만드는 차[추가해야함]
	sushibiscus =
	{
		test = function(boilier, names, tags) return names.forgetmelots and names.firenettles and names.tillweeds end,
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		cooktime = TUNING.KETTLE_ABI,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			
		end,
	},
	
}

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
end

return drinks
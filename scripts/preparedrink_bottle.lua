local function returnbottle(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	local refund = SpawnPrefab("messagebottleempty")
	if eater ~= nil and eater.components.inventory ~= nil then
		eater.components.inventory:GiveItem(refund, nil, Vector3(x, y, z))
	else
		refund.Transform:SetPosition(x,y,z)
	end
end

local drinks =
{
	
	-- 기본 물
	-- 다른 차를 만들 경우 같은 아이템을 2개 넣어야함
	bottle_water =
	{
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		cooktime = TUNING.KETTLE_WATER,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_dirty =
	{
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	bottle_salt =
	{
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	-- 조합법이 잘못되면 나오는 결과물
	bottle_garbage = 
	{
		priority = -2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		cooktime = TUNING.INCORRECT_BOIL,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	-- 과일차 종류
	
	bottle_fruit =
	{
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES ,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_berry =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},

	bottle_pomegranate =
	{
		priority = 1,
		health = TUNING.HEALING_MEDLARGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_banana =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_fig =
	{
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_dragonfruit =
	{
		priority = 1,
		health = TUNING.HEALING_HUGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED ,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.KETTLE_FRUIT,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 일시적 빛나는 효과[추가해야함]
	bottle_growberry =
	{
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
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
			returnbottle(inst, eater)
		end,
	},
	
	-- 일시적 겉는 속도 증가[추가해야함]
	bottle_coffee =
	{
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = 25,
		oneatenfn = function(inst, eater)
			
			returnbottle(inst, eater)
		end,
	},
	
	-- 야채차 종류
	bottle_veggie =
	{
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_VEGGIE,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_carrot =
	{
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 선인장, 다육, 알로에는 무조건 이걸로 만들어지게
	bottle_cactus =
	{
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_mulled =
	{
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_LARGE,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 잎&꽃차 종류
	
	bottle_greentea =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		cooktime = TUNING.KETTLE_TEA,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 녹차 건조대 말린것
	bottle_blacktea =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_blacktea_iced =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 동굴 고사리
	bottle_fuer =
	{
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_MED,
		cooktime = TUNING.KETTLE_TEA,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 꽃을 섞으면 나오는 결과물
	bottle_mixflower =
	{
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_DECORATION,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 일반 꽃잎
	bottle_hibiscus =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		cooktime = TUNING.KETTLE_DECORATION,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},

	-- 선인장 꽃잎
	bottle_cactusflower =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_DECORATION,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	bottle_lotusflower =
	{
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_DECORATION,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	--일시적으로 유령으로 만드는 차[추가해야함]
	bottle_sushibiscus =
	{
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		cooktime = TUNING.KETTLE_ABI,
		oneatenfn = function(inst, eater)
			
			returnbottle(inst, eater)
		end,
	},
	
}

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
end

return drinks
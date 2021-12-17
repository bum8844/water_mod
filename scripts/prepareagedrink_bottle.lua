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

	-- 공통적으로 hot, cold 없음
	-- 잘못된 발효음료 조합법(재료중 찻잎, 꽃류, 채소 제외)
	bottle_strang =
	{
		priority = -2,
		health = TUNING.STRANG_POISOE,
		hunger = TUNING.DRINK_CALORIES_POISOE,
		sanity = TUNING.SANITY_POISOE,
		thirst = TUNING.HYDRATION_POISOE,
		cooktime = TUNING.INCORRECT_BOIL,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 탄산수 만들때 필수적으로 refined_dust 첨가
	-- 일반 탄산수
	bottle_soda =
	{
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_TINY,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.SODA_WAIT,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 과일 탄산수
	bottle_fruitsoda =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_SMALL*2,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.SODA_WAIT,
		oneatenfn = function(inst, eater)
			returnbottle(inst, eater)
		end,
	},
	
	-- 로얄젤리만 넣을경우(치유효과)
	bottle_llsoda =
	{
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.CALORIES_HUGE,
		sanity = TUNING.SANITY_MEDLARGE *4,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.SODA_WAIT,
		oneatenfn = function(inst, eater)
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
			returnbottle(inst, eater)
		end,
	},
	-- 로얄젤리 + 볶은커피(스피드 버프[추가해야함], 채력 버프[추가해야함])
	bottle_cola =
	{
		priority = 2,
		health = TUNING.HEALING_LARGE,
		hunger = TUNING.CALORIES_HUGE,
		sanity = TUNING.SANITY_HUGE*2,
		thirst = TUNING.HYDRATION_SUPERHUGE,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
			
			returnbottle(inst, eater)
		end
	},
	-- 로얄젤리 + 볶은커피 + 발광베리 (스피드 버프[추가해야함], 채력 버프[추가해야함], 빛이남[추가해야함])
	bottle_colaquantum =
	{
		priority = 3,
		health = TUNING.HEALING_SUPERHUGE*4,
		hunger = TUNING.CALORIES_HUGE*4,
		sanity = TUNING.SANITY_HUGE*8,
		thirst = TUNING.HYDRATION_HUGE*4,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
			
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
		end
	},
	
	-- 술[알콜 효과 추가해야함]
	bottle_beer =
	{
		priority = 1,
		health = TUNING.HEALING_SMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			
			returnbottle(inst, eater)
		end
	},
		
	-- 선인장, 다육, 알로에, 드래곤 후르츠 사용
	bottle_pulqu =
	{
		priority = 2,
		health = TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			
			returnbottle(inst, eater)
		end
	},
	
	--꿀술
	bottle_mead =
	{
		priority = 2,
		health = TUNING.HEALING_TINY + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			
			returnbottle(inst, eater)
		end
	},
	
	
	-- 베리류, 드래곤 후르츠 외 과일들
	bottle_fruitwine =
	{
		priority = 1,
		health = TUNING.HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			
			returnbottle(inst, eater)
		end
	},
	
	-- 베리류
	bottle_wine =
	{
		priority = 2,
		health = TUNING.HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			
			returnbottle(inst, eater)
		end
	},
	
	-- 발광 베리류
	bottle_lightwine =
	{
		priority = 3,
		health = TUNING.HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.BEER_WAIT,
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
	
	-- 인삼술
	bottle_ginsengwine =
	{
		priority = 4,
		health = TUNING.HEALING_HUGE + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES_GINSENG,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			
			returnbottle(inst, eater)
		end
	},
	
}

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
end

return drinks

local function returnbottle(inst, eater)
	local x, y, z = inst.Transform:GetWorldPosition()
	local uses = inst.components.finiteuses:GetUses()
	uses = uses - 1

	local item = nil
	if uses > 0 then
		item = SpawnPrefab(inst.prefab)
		item.components.finiteuses:SetUses(uses)
	else
		item = SpawnPrefab("messagebottleempty")
	end

	inst:Remove()

	if eater ~= nil and eater.components.inventory ~= nil then
		eater.components.inventory:GiveItem(item)
	else
		item.Transform:SetPosition(x,y,z)
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

function notmeat(tags)
	return not (tags.meat or tags.egg)
end

local drinks =
{

	-- 공통적으로 hot, cold 없음
	-- 잘못된 발효음료 조합법(재료중 찻잎, 꽃류, 채소 제외)
	strang =
	{
		test = function(boilier, names, tags) return true end,
		priority = -2,
		health = TUNING.STRANG_POISOE,
		hunger = TUNING.DRINK_CALORIES_POISOE,
		sanity = TUNING.SANITY_POISOE,
		thirst = TUNING.HYDRATION_POISOE,
		cooktime = TUNING.INCORRECT_BOIL,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	-- 탄산수 만들때 필수적으로 refined_dust 첨가
	-- 일반 탄산수
	soda =
	{
		test = function(boilier, names, tags) return names.refined_dust and names.refined_dust == 1 and notmeat(tags) end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_TINY,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.SODA_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	-- 과일 탄산수
	fruitsoda =
	{
		test = function(boilier, names, tags) return names.refined_dust and names.refined_dust == 1 and tags.fruit and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_SMALL*2,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.SODA_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
		end,
	},
	
	-- 로얄젤리만 넣을경우(치유효과)
	llsoda =
	{
		test = function(boilier, names, tags) return names.refined_dust and names.refined_dust == 1 and names.royal_jelly and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.CALORIES_HUGE,
		sanity = TUNING.SANITY_MEDLARGE *4,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.SODA_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
		end,
	},
	-- 로얄젤리 + 볶은커피(스피드 버프[추가해야함], 채력 버프[추가해야함])
	cola =
	{
		test = function(boilier, names, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) >= 1) and names.refined_dust and names.refined_dust == 1 and names.royal_jelly and notmeat(tags) end,
		priority = 2,
		health = TUNING.HEALING_LARGE,
		hunger = TUNING.CALORIES_HUGE,
		sanity = TUNING.SANITY_HUGE*2,
		thirst = TUNING.HYDRATION_SUPERHUGE,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			eater:AddDebuff("healthregenbuff", "healthregenbuff")
			
		end
	},
	-- 로얄젤리 + 볶은커피 + 발광베리 (스피드 버프[추가해야함], 채력 버프[추가해야함], 빛이남[추가해야함])
	colaquantum =
	{
		test = function(boilier, names, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0 ) >= 1) and (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) >= 1) and names.refined_dust and names.refined_dust == 1 and names.royal_jelly and notmeat(tags) end,
		priority = 3,
		health = TUNING.HEALING_SUPERHUGE*4,
		hunger = TUNING.CALORIES_HUGE*4,
		sanity = TUNING.SANITY_HUGE*8,
		thirst = TUNING.HYDRATION_HUGE*4,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
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
		end
	},
	
	-- 술[알콜 효과 추가해야함]
	beer =
	{
		test = function(boilier, names, tags) return (( names.corn or 0 ) + ( names.corn_cooked or 0 ) == 4) and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_SMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			
		end
	},
		
	-- 선인장, 다육, 알로에, 드래곤 후르츠 사용
	pulque =
	{
		test = function(boilier, names, tags) return (( names.cactus_meat or 0 ) + ( names.cactus_meat_cooked or 0 ) + ( names.aloe or 0 ) + ( names.aloe_cooked or 0 ) + ( names.kyno_aloe or 0 ) + ( names.kyno_aloe_cooked or 0 ) + ( names.succulent_picked or 0 ) + ( names.dragonfruit or 0 ) + ( names.dragonfruit_cooked or 0 ) == 4 ) and notmeat(tags) end,
		priority = 2,
		health = TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			
		end
	},
	
	--꿀술
	mead =
	{
		test = function(boilier, names, tags) return tags.sweetener and tags.sweetener == 4 and notmeat(tags) end,
		priority = 2,
		health = TUNING.HEALING_TINY + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			
		end
	},
	
	
	-- 베리류, 드래곤 후르츠 외 과일들
	fruitwine =
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit == 4 and notmeat(tags) end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			
		end
	},
	
	-- 베리류
	wine =
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_cooked or 0 ) + ( names.berries_juicy or 0 ) + ( names.berries_juicy_cooked or 0 ) == 4) and notmeat(tags) end,
		priority = 2,
		health = TUNING.HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			
		end
	},
	
	-- 발광 베리류
	glowberrywine =
	{
		test = function(boilier, names, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0 ) == 4) and notmeat(tags) end,
		priority = 3,
		health = TUNING.HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.BEER_WAIT,
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
	
	-- 인삼술
	ginseng_liquor =
	{
		test = function(boilier, names, tags) return names.mandrake and notmeat(tags) end,
		priority = 4,
		health = TUNING.HEALING_HUGE + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES_GINSENG,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.BEER_WAIT,
		oneatenfn = function(inst, eater)
			if inst:HasTag("preparedrink_cup") then
				returncup(inst, eater)
			else
				returnbottle(inst, eater)
			end
			
		end
	},
	
}

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0
end

return drinks

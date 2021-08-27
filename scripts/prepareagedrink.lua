local agedrinks =
{

	-- 공통적으로 hot, cold 없음
	-- 잘못된 발효음료 조합법(재료중 찻잎, 꽃류, 채소 제외)
	cup_strang
	{
		test = function(boilier, names, tags) return true end
		priority = -2,
		health = TUNING.STRANG_POISOE,
		hunger = TUNING.DRINK_CALORIES_POISOE,
		sanity = TUNING.SANITY_POISOE
		thirst = TUNING.HYDRATION_POISOE,
		cooktime = TUNING.INCORRECT_BOIL,
	},
	
	-- 탄산수 만들때 필수적으로 refined_dust 첨가
	-- 일반 탄산수
	cup_soda
	{
		test = function(boilier, names, tags) return namess.refined_dust and namess.refined_dust == 1 and not tags.meat and not tags.egg end
		priority = 0,
		health = HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_TINY,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.SODA_WAIT,
	},
	
	-- 과일 탄산수
	cup_fruit_soda
	{
		test = function(boilier, names, tags) return namess.refined_dust and namess.refined_dust == 1 and tags.fruit and not tags.meat and not tags.egg end
		priority = 1,
		health = HEALING_MEDSMALL,
		hunger = TUNING.CALORIES_SMALL*2,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.SODA_WAIT,
	},
	
	-- 로얄젤리만 넣을경우
	cup_llsoda
	{
		test = function(boilier, names, tags) return namess.refined_dust and namess.refined_dust == 1 and namess.royal_jelly and not tags.meat and not tags.egg end
		priority = 1,
		health = HEALING_MED,
		hunger = TUNING.CALORIES_HUGE,
		sanity = SANITY_MEDLARGE*4,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.SODA_WAIT,
		prefabs = { "healthregenbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HEALTH_REGEN,
        oneatenfn = function(inst, eater)
            if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
                not (eater.components.health ~= nil and eater.components.health:IsDead()) and
                not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("healthregenbuff", "healthregenbuff")
            end
        end,
	},
	-- 로얄젤리 + 볶은커피(스피드 버프[추가해야함], 채력 버프)
	cup_cola
	{
		test = function(boilier, names, tags) return (( namess.caffeinberry_bean_cooked or 0 ) + ( namess.kyno_coffeebeans_cooked or 0 ) >= 1) and namess.refined_dust and namess.refined_dust == 1 and namess.royal_jelly and not tags.meat and not tags.egg end
		priority = 2,
		health = TUNING.HEALING_LARGE,
		hunger = TUNING.CALORIES_TUNING.CALORIES_HUGE,
		sanity = SANITY_HUGE*2,
		thirst = TUNING.HYDRATION_SUPERHUGE,
		cooktime = TUNING.BEER_WAIT,
		prefabs = { "healthregenbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HEALTH_REGEN,
        oneatenfn = function(inst, eater)
            if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
                not (eater.components.health ~= nil and eater.components.health:IsDead()) and
                not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("healthregenbuff", "healthregenbuff")
            end
        end,
	},
	-- 로얄젤리 + 볶은커피 + 발광베리 (스피드 버프[추가해야함], 채력 버프, 빛이남)
	cup_colaquantum
	{
		test = function(boilier, names, tags) return (( namess.wormlight or 0 ) + ( namess.wormlight_lesser or 0 ) >= 1) and (( namess.caffeinberry_bean_cooked or 0 ) + ( namess.kyno_coffeebeans_cooked or 0 ) >= 1) and namess.refined_dust and namess.refined_dust == 1 and namess.royal_jelly and not tags.meat and not tags.egg end
		priority = 3,
		health = TUNING.HEALING_SUPERHUGE*4,
		hunger = TUNING.CALORIES_HUGE*4,
		sanity = TUNING.SANITY_HUGE*8,
		thirst = TUNING.HYDRATION_HUGE*4,
		cooktime = TUNING.BEER_WAIT,
		prefabs = { "healthregenbuff" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_HEALTH_REGEN,
        oneatenfn = function(inst, eater)
            if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() and
                not (eater.components.health ~= nil and eater.components.health:IsDead()) and
                not eater:HasTag("playerghost") then
                eater.components.debuffable:AddDebuff("healthregenbuff", "healthregenbuff")
            end
        end,
		prefabs = { "wormlight_light_greater" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_GLOW,
        oneatenfn = function(inst, eater)
            --see wormlight.lua for original code
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
	
	-- 술[알콜 효과 추가해야함]
	cup_corned_beer
	{
		test = function(boilier, names, tags) return namess.corn and namess.corn == 4 end
		priority = 1,
		health = HEALING_SMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
	},
		
	-- 선인장, 다육, 알로에, 드래곤 후르츠 사용
	cup_pulqu
	{
		test = function(boilier, names, tags) return (( namess.cactus_meat or 0 ) + ( namess.aloe or 0 ) + ( namess.kyno_aloe or 0 ) + ( namess.succulent_picked or 0 ) + ( namess.dragonfruit or 0 ) == 4 ) end
		priority = 2,
		health = TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
	},
	
	--꿀술
	cup_mead
	{
		test = function(boilier, names, tags) return tags.sweetener and tags.sweetener == 4 end
		priority = 2,
		health = HEALING_TINY + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
	},
	
	
	-- 베리류, 드래곤 후르츠 외 과일들
	cup_fruit_wine
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit == 4 end
		priority = 1,
		health = HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = TUNING.BEER_WAIT,
	},
	
	-- 베리류
	cup_wine
	{
		test = function(boilier, names, tags) return (( namess.berries or 0 ) + ( names.berries_juicy or 0 ) == 4) end
		priority = 2,
		health = HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.BEER_WAIT,
	},
	
	-- 발광 베리류
	cup_lightwine
	{
		test = function(boilier, names, tags) return (( namess.wormlight or 0 ) + ( names.wormlight_lesser or 0 ) == 4) end
		priority = 3,
		health = HEALING_MEDSMALL + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.BEER_WAIT,
		prefabs = { "wormlight_light_greater" },
		oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_GLOW,
        oneatenfn = function(inst, eater)
            --see wormlight.lua for original code
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
	cup_ginseng_wine =
	{
		test = function(boilier, name, tags) return names.mandrake and not tags.meat and not tags.egg end,
		priority = 4,
		health = TUNING.HEALING_HUGE + TUNING.ALCAHOL_POISOE,
		hunger = TUNING.DRINK_CALORIES_GINSENG,
		sanity = TUNING.SANITY_HUGE,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.BEER_WAIT,
	},
	
}

for k, v in pairs(agedrinks) do
    v.names = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

	v.cupsjournal_category = "beer_barrle"
end

return agedrinks

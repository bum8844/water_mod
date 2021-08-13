local agedrink =
{

	-- 공통적으로 hot, cold 없음
	-- 잘못된 발효음료 조합법(재료중 찻잎, 꽃류, 채소 제외)
	cup_strang
	{
		test = function(boilier, name, tags) return true end
		priority = -2,
		health = -2,
		hunger = -3,
		sanity = -5,
		thirst = -5,
		cooktime = 4,
	},
	
	-- 탄산수 만들때 필수적으로 refined_dust 첨가
	-- 일반 탄산수
	cup_soda
	{
		test = function(boilier, name, tags) return names.refined_dust and names.refined_dust == 1 and not tags.meat and not tags.egg end
		priority = 0,
		health = 5,
		hunger = 12,
		sanity = 10,
		thirst = 100,
		cooktime = sodacooktime,
	},
	
	-- 과일 탄산수
	cup_fruit_soda
	{
		test = function(boilier, name, tags) return names.refined_dust and names.refined_dust == 1 and tags.fruit and not tags.meat and not tags.egg end
		priority = 1,
		health = 10,
		hunger = 24,
		sanity = 20,
		thirst = 100,
		cooktime = sodacooktime,
	},
	
	-- 로얄젤리만 넣을경우
	cup_cider
	{
		test = function(boilier, name, tags) return names.refined_dust and names.refined_dust == 1 and names.royal_jelly and not tags.meat and not tags.egg end
		priority = 1,
		health = 20,
		hunger = 40,
		sanity = 80,
		thirst = 120,
		cooktime = sodacooktime,
	},
	-- 로얄젤리 + 볶은커피(스피드 버프[추가해야함], 채력 버프)
	cup_cola
	{
		test = function(boilier, name, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) >= 1) and names.refined_dust and names.refined_dust == 1 and names.royal_jelly and not tags.meat and not tags.egg end
		priority = 2,
		health = 40,
		hunger = 80,
		sanity = 100,
		thirst = 150,
		cooktime = sodacooktime,
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
		test = function(boilier, name, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0 ) >= 1) and (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) >= 1) and names.refined_dust and names.refined_dust == 1 and names.royal_jelly and not tags.meat and not tags.egg end
		priority = 3,
		health = 400,
		hunger = 400,
		sanity = 400,
		thirst = 300,
		cooktime = sodacooktime,
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
		test = function(boilier, name, tags) return names.corn and names.corn == 4 end
		priority = 1,
		health = -10,
		hunger = 10,
		sanity = 55,
		thirst = -5,
		cooktime = 4,
	},
	
	-- 베리류, 드래곤 후르츠 외 과일들
	cup_fruit_wine
	{
		test = function(boilier, name, tags) return tags.fruit and tags.fruit == 4 end
		priority = 1,
		health = -5,
		hunger = 17,
		sanity = 60,
		thirst = -5,
		cooktime = 4,
	},
	
	-- 베리류
	cup_wine
	{
		test = function(boilier, name, tags) return (( names.berries or 0 ) + ( name.berries_juicy or 0 ) == 4) end
		priority = 2,
		health = -5,
		hunger = 17,
		sanity = 65,
		thirst = 6,
		cooktime = 4,
	},
	-- 발광 베리류
	cup_lightwine
	{
		test = function(boilier, name, tags) return (( names.wormlight or 0 ) + ( name.wormlight_lesser or 0 ) == 4) end
		priority = 3,
		health = -5,
		hunger = 20,
		sanity = 65,
		thirst = 6,
		cooktime = 4,
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
	
	-- 선인장, 다육, 알로에, 드래곤 후르츠 사용
	cup_pulqu
	{
		test = function(boilier, name, tags) return (( names.cactus_meat or 0 ) + ( names.aloe or 0 ) + ( names.kyno_aloe or 0 ) + ( names.succulent_picked or 0 ) + ( names.dragonfruit or 0 ) == 4 ) end
		priority = 2,
		health = -10,
		hunger = 10,
		sanity = 55,
		thirst = -5,
		cooktime = 4,
	},
	
	--꿀술
	cup_mead
	{
		test = function(boilier, name, tags) return tags.sweetener and tags.sweetener == 4 end
		priority = 2,
		health = -10,
		hunger = 10,
		sanity = 60,
		thirst = -5,
		cooktime = 4,
	},
	
}

for k, v in pairs(agedrink) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

	v.cupsjournal_category = "beer_barrle"
end

return agedrink

local drinks =
{
	-- 조합법이 잘못되면 나오는 결과물
	
	cup_garbage = 
	{
		test = function(boilier, name, tags) return true end,
		priority = -2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		cooktime = TUNING.INCORRECT_BOIL,
		--wet_prefix = STRINGS.WET_PREFIX.WETGOOP,
        --floater = {"small", nil, nil},
	},
	
	-- 기본 물(이 외에 음료에는 얼음을 넣으면 찬음료 변경)
	-- 다른 차를 만들 경우 같은 아이템을 2개 넣어야함
	cup_water =
	{
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = 0,
		thirst = TUNING.HYDRATION_TINY,
		cooktime = TUNING.KETTLE_WATER,
	},
	
	-- 과일차 종류
	
	cup_fruit =
	{
		test = function(boilier, name, tags) return tags.fruit and tags.fruit >= 1.5 and not tags.meat and not tags.egg end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES ,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_FRUIT,
	},
	
	cup_berry =
	{
		test = function(boilier, name, tags) return (( names.berries or 0 ) + ( names.berries_juicy or 0 ) >= 2) and not tags.meat and not tags.egg end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
	},

	cup_pomegranate =
	{
		test = function(boilier, name, tags) return names.pomegranate and names.pomegranate >= 2 and not tags.meat and not tags.egg end,
		priority = 1,
		health = TUNING.HEALING_MEDLARGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
	},
	
	cup_banana =
	{
		test = function(boilier, name, tags) return names.cave_banana and names.cave_banana >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
	},
	
	cup_fig =
	{
		test = function(boilier, name, tags) return names.fig and names.fig >= 2 and not tags.meat and not tags.egg end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_FRUIT,
	},
	
	cup_dragonfruit =
	{
		test = function(boilier, name, tags) return names.dragonfruit and names.dragonfruit >= 2 and not tags.meat and not tags.egg end,
		priority = 1,
		health = TUNING.HEALING_HUGE,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED ,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.KETTLE_FRUIT,
	},
	
	-- 일시적 빛나는 효과
	cup_wormlight =
	{
		test = function(boilier, name, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0) >= 2) and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = TUNING.HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_HUGE,
		cooktime = TUNING.KETTLE_LUXURY_GOODS,
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
	
	-- 일시적 겉는 속도 증가[추가해야함]
	cup_coffee =
	{
		test = function(boilier, name, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) >= 2) and not tags.meat and not tags.egg end,
		priority = 1,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MED,
		thirst = TUNING.HYDRATION_SMALL,
		cooktime = 25,
	},
	
	-- 야채차 종류
	cup_veggie =
	{
		test = function(boilier, name, tags) return tags.veggie and tags.veggie >= 1.5 and not tags.meat and not tags.egg end,
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_VEGGIE,
	},
	
	cup_carrot =
	{
		test = function(boilier, name, tags) return names.carrot and names.carrot >= 2 and not tags.meat and not tags.egg end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_SMALL,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_VEGGIE,
	},
	
	-- 선인장, 다육, 알로에는 무조건 이걸로 만들어지게
	cup_cactus =
	{
		test = function(boilier, name, tags) return (( names.cactus_meat or 0 ) + ( names.aloe or 0 ) + ( names.kyno_aloe or 0 ) + ( names.succulent_picked or 0 ) >= 2)  and tags.frozen and tags.frozen >= 1 end,
		priority = 0,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_LARGE,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
	},
	
	cup_mulled =
	{
		test = function(boilier, name, tags) return (( names.onion or 0 ) + ( names.garlic or 0 ) >= 1) and tags.sweetener and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = TUNING.SANITY_TINY,
		thirst = TUNING.HYDRATION_LARGE,
		temperature = TUNING.HOT_FOOD_WARMING_THRESHOLD,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = TUNING.KETTLE_VEGGIE,
	},
	
	-- 잎&꽃차 종류
	
	cup_greentea =
	{
		test = function(boilier, name, tags) return names.tealeaves and names.tealeaves >= 2 and not tags.meat and not tags.egg end,
		priority = 1,
		health = TUNING.HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		cooktime = TUNING.KETTLE_TEA,
	},
	
	-- 녹차 건조대 말린것
	cup_blacktea =
	{
		test = function(boilier, name, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		temperature = TUNING.HOT_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
	},
	
	cup_blacktea_iced =
	{
		test = function(boilier, name, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		temperature = TUNING.COLD_FOOD_BONUS_TEMP,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = TUNING.KETTLE_TEA,
	},
	
	-- 동굴 고사리
	cup_fuer =
	{
		test = function(boilier, name, tags) return names.foliage and names.foliage >= 2 and not tags.meat and not tags.egg end,
		priority = 1,
		health = HEALING_MED,
		hunger = TUNING.DRINK_CALORIES,
		sanity = SANITY_LARGE,
		thirst = TUNING.HYDRATION_MED,
		cooktime = TUNING.KETTLE_TEA,
	},
	
	-- 꽃을 섞으면 나오는 결과물
	cup_mixflower =
	{
		test = function(boilier, name, tags) return tags.decoration and tags.decoration >= 2 and tags.meat and not tags.egg end,
		priority = 0,
		health = HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = SANITY_SMALL,
		thirst = TUNING.HYDRATION_MEDSMALL,
		cooktime = TUNING.KETTLE_DECORATION,
	},
	
	-- 일반 꽃잎
	cup_hibiscus =
	{
		test = function(boilier, name, tags) return (( names.petals or 0 ) + ( names.moon_tree_blossom or 0 ) >= 2) and not tags.meat and not tags.egg end,
		priority = 1,
		health = HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = SANITY_MEDLARGE,
		thirst = TUNING.HYDRATION_MED,
		cooktime = TUNING.KETTLE_DECORATION,
	},

	-- 선인장 꽃잎
	cup_cactusflower =
	{
		test = function(boilier, name, tags) return names.cactus_flower and names.cactus_flower >= 2 and not tags.meat and not tags.egg end,
		priority = 1,
		health = HEALING_MEDSMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_DECORATION,
	},
	
	cup_lotusflower =
	{
		test = function(boilier, name, tags) return (( names.lotus_flower or 0 ) + ( names.kyno_lotus or 0 ) >= 2) and not tags.meat and not tags.egg end,
		priority = 1,
		health = HEALING_SMALL,
		hunger = TUNING.DRINK_CALORIES,
		sanity = SANITY_LARGE,
		thirst = TUNING.HYDRATION_LARGE,
		cooktime = TUNING.KETTLE_DECORATION,
	},
	
	--일시적으로 유령으로 만드는 차[추가해야함]
	cup_suspicious_hibiscus =
	{
		test = function(boilier, name, tags) return names.forgetmelots and names.firenettles and names.tillweeds) end,
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		cooktime = TUNING.KETTLE_ABI,
	},
	
}

for k, v in pairs(drinks) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

	v.cupsjournal_category = "kettles"
	--v.cookbook_category = "cookpot"
end

return drinks

-- caffeinberry caffeinberry_bean caffeinberry_bean_cooked

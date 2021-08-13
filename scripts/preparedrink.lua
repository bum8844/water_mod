local drink =
{
	-- 조합법이 잘못되면 나오는 결과물
	
	cup_garbage = 
	{
		test = function(boilier, names, tags) return true end,
		priority = -2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 8,
		cooktime = 4,
		--wet_prefix = STRINGS.WET_PREFIX.WETGOOP,
        --floater = {"small", nil, nil},
	},
	
	-- 기본 물(이 외에 음료에는 얼음을 넣으면 찬음료 변경)
	-- 다른 차를 만들 경우 같은 아이템을 2개 넣어야함
	cup_water =
	{
		priority = 0,
		health = 2,
		hunger = 3,
		sanity = 0,
		thirst = 17,
		cooktime = 17,
	},
	
	-- 과일차 종류
	
	cup_fruit_hot
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 1.5 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 9,
		sanity = 7,
		thirst = 22,
		temperature = 10,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
		cooktime = 20,
	},
	
	cup_fruit_cold
	{
		test = function(boilier, names, tags) return tags.fruit and tags.fruit >= 1.5 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 9,
		sanity = 7,
		thirst = 22,
		temperature = -10,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
		cooktime = 20,
	},
	
	cup_berry_hot
	{
		test = function(boilier, names, tags) return (( names.berries or 0 ) + ( names.berries_juicy or 0 ) >= 2) and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 8,
		hunger = 18,
		sanity = 15,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_berry_cold
	{
		test = function(boilier, name, tags) return (( names.berries or 0 ) + ( names.berries_juicy or 0 ) >= 2) and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 8,
		hunger = 18,
		sanity = 15,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_pomegranate_hot
	{
		test = function(boilier, name, tags) return names.pomegranate and names.pomegranate >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 26,
		hunger = 19,
		sanity = 15,
		thirst = 60,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_pomegranate_cold
	{
		test = function(boilier, name, tags) return names.pomegranate and names.pomegranate >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 26,
		hunger = 19,
		sanity = 15,
		thirst = 60,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_watermelon_hot
	{
		test = function(boilier, name, tags) return names.watermelon and names.watermelon >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 10,
		hunger = 20,
		sanity = 18,
		thirst = 80,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_watermelon_cold
	{
		test = function(boilier, name, tags) return names.watermelon and names.watermelon >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 10,
		hunger = 20,
		sanity = 18,
		thirst = 80,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_banana_hot
	{
		test = function(boilier, name, tags) return names.cave_banana and names.cave_banana >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 7,
		hunger = 18,
		sanity = 21,
		thirst = 90,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_banana_cold
	{
		test = function(boilier, name, tags) return names.cave_banana and names.cave_banana >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 7,
		hunger = 18,
		sanity = 21,
		thirst = 90,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	-- 잠드는 효과
	cup_dragonfruit_hot
	{
		test = function(boilier, name, tags) return names.dragonfruit and names.dragonfruit >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 15,
		hunger = 10,
		sanity = 35,
		thirst = 90,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	cup_dragonfruit_cold
	{
		test = function(boilier, name, tags) return names.dragonfruit and names.dragonfruit >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 15,
		hunger = 10,
		sanity = 35,
		thirst = 90,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	cup_fig_hot
	{
		test = function(boilier, name, tags) return names.fig and names.fig >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 15,
		hunger = 10,
		sanity = 35,
		thirst = 90,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	cup_fig_cold
	{
		test = function(boilier, name, tags) return names.fig and names.fig >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 15,
		hunger = 10,
		sanity = 35,
		thirst = 90,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	-- 일시적 빛나는 효과
	cup_wormlight_hot
	{
		test = function(boilier, name, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0) >= 2) and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 18,
		hunger = 31,
		sanity = 5,
		thirst = 90,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 25,
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
	
	cup_wormlight_cold
	{
		test = function(boilier, name, tags) return (( names.wormlight or 0 ) + ( names.wormlight_lesser or 0) >= 2) and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 18,
		hunger = 31,
		sanity = 5,
		thirst = 90,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 25,
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
	cup_coffee_hot
	{
		test = function(boilier, name, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) >= 2) and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 5,
		hunger = 5,
		sanity = 19,
		thirst = 25,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 25,
	},
	
	cup_coffee_cold
	{
		test = function(boilier, name, tags) return (( names.caffeinberry_bean_cooked or 0 ) + ( names.kyno_coffeebeans_cooked or 0 ) >= 2) and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 5,
		hunger = 5,
		sanity = 19,
		thirst = 25,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 25,
	},
	
	-- 야채차 종류
	
	cup_veggie_hot
	{
		test = function(boilier, name, tags) return tags.veggie and tags.veggie >= 1.5 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 16,
		sanity = 4,
		thirst = 22,
		temperature = 10,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
		cooktime = 20,
	},
	
	cup_veggie_cold
	{
		test = function(boilier, name, tags) return tags.veggie and tags.veggie >= 1.5 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 16,
		sanity = 4,
		thirst = 22,
		temperature = -10,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
		cooktime = 20,
	},
	
	cup_carrot_hot
	{
		test = function(boilier, name, tags) return names.carrot and names.carrot >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 23,
		sanity = 7,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_carrot_cold
	{
		test = function(boilier, name, tags) return names.carrot and names.carrot >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 23,
		sanity = 7,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_radish_hot
	{
		test = function(boilier, name, tags) return (( names.radish or 0 ) + ( names.kyno_radish or 0 ) >= 2 ) and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 23,
		sanity = 7,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_radish_cold
	{
		test = function(boilier, name, tags) return (( names.radish or 0 ) + ( names.kyno_radish or 0 ) >= 2 ) and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 23,
		sanity = 7,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_corn_hot
	{
		test = function(boilier, name, tags) return names.corn and names.corn >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 37,
		sanity = 7,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_corn_cold
	{
		test = function(boilier, name, tags) return names.corn and names.corn >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 37,
		sanity = 7,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_pumpkin_hot
	{
		test = function(boilier, name, tags) return names.pumpkin and names.pumpkin >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 9,
		hunger = 70,
		sanity = 7,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_pumpkin_cold
	{
		test = function(boilier, name, tags) return names.pumpkin and names.pumpkin >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 9,
		hunger = 70,
		sanity = 7,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_eggplant_hot
	{
		test = function(boilier, name, tags) return names.eggplant and names.eggplant >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 21,
		hunger = 50,
		sanity = 7,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_eggplant_cold
	{
		test = function(boilier, name, tags) return names.eggplant and names.eggplant >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 21,
		hunger = 50,
		sanity = 7,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	-- 선인장, 다육, 알로에는 무조건 이걸로 만들어지게
	cup_cactus_hot
	{
		test = function(boilier, name, tags) return (( names.cactus_meat or 0 ) + ( names.aloe or 0 ) + ( names.kyno_aloe or 0 ) + ( names.succulent_picked or 0 ) >= 2) and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 25,
		sanity = 22,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_cactus_cold
	{
		test = function(boilier, name, tags) return (( names.cactus_meat or 0 ) + ( names.aloe or 0 ) + ( names.kyno_aloe or 0 ) + ( names.succulent_picked or 0 ) >= 2)  and tags.frozen and tags.frozen >= 1 end,
		priority = 0,
		health = 2,
		hunger = 25,
		sanity = 22,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_asparagus_hot
	{
		test = function(boilier, name, tags) return names.asparagus and names.asparagus >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 50,
		sanity = 7,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_asparagus_cold
	{
		test = function(boilier, name, tags) return names.asparagus and names.asparagus >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 50,
		sanity = 7,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_kelp_hot
	{
		test = function(boilier, name, tags) return names.kelp and names.kelp >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 12,
		sanity = 17,
		thirst = 65,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_kelp_cold
	{
		test = function(boilier, name, tags) return names.kelp and names.kelp >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 12,
		sanity = 17,
		thirst = 65,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_avocado_hot
	{
		test = function(boilier, name, tags) return names.rock_avocado_fruit_ripe and names.rock_avocado_fruit_ripe >= 2 and not tags.frozen and not tags.meat and not tags.egg  end,
		priority = 0,
		health = 4,
		hunger = 23,
		sanity = 7,
		thirst = 65,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_avocado_cold
	{
		test = function(boilier, name, tags) return names.rock_avocado_fruit_ripe and names.rock_avocado_fruit_ripe >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 4,
		hunger = 23,
		sanity = 7,
		thirst = 65,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_garlic_hot
	{
		test = function(boilier, name, tags) return names.garlic and names.garlic >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 12,
		sanity = 2,
		thirst = 65,
		temperature = 20,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_garlic_cold
	{
		test = function(boilier, name, tags) return names.garlic and names.garlic >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 12,
		sanity = 2,
		thirst = 65,
		temperature = -20,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_onion_hot
	{
		test = function(boilier, name, tags) return names.onion and names.onion >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 12,
		sanity = 2,
		thirst = 65,
		temperature = 20,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_onion_cold
	{
		test = function(boilier, name, tags) return names.onion and names.onion >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 2,
		hunger = 12,
		sanity = 2,
		thirst = 65,
		temperature = -20,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_tomato_hot
	{
		test = function(boilier, name, tags) return names.tomato and names.tomato >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 21,
		hunger = 23,
		sanity = 7,
		thirst = 55,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_tomato_cold
	{
		test = function(boilier, name, tags) return names.tomato and names.tomato >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 21,
		hunger = 23,
		sanity = 7,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	
	cup_pepper_hot
	{
		test = function(boilier, name, tags) return names.pepper and names.pepper >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = -2,
		hunger = 12,
		sanity = -3,
		thirst = 70,
		temperature = 25,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 20,
	},
	
	cup_pepper_cold
	{
		test = function(boilier, name, tags) return names.pepper and names.pepper >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = -2,
		hunger = 12,
		sanity = -3,
		thirst = 70,
		temperature = -25,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 20,
	},
	
	-- 만드레이크 차
	cup_ginseng_hot
	{
		test = function(boilier, name, tags) return names.mandrake and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 4,
		health = 100,
		hunger = 150,
		sanity = 12,
		thirst = 120,
		temperature = 25,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	cup_ginseng_cold
	{
		test = function(boilier, name, tags) return names.mandrake and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 4,
		health = 100,
		hunger = 150,
		sanity = 12,
		thirst = 120,
		temperature = -25,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	-- 버섯차 종류
	
	-- 정신력 증가 버프(젤리빈 채력버프와 똑같이)
	cup_greencap_hot
	{
		test = function(boilier, name, tags) return names.green_cap and names.green_cap >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 0,
		hunger = 12.5,
		sanity = 15,
		thirst = 25,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	-- 정신력 증가 버프(젤리빈 채력버프와 똑같이)
	cup_greencap_cold
	{
		test = function(boilier, name, tags) return names.green_cap and names.green_cap >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 0,
		hunger = 12.5,
		sanity = 15,
		thirst = 25,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	cup_redcap_hot
	{
		test = function(boilier, name, tags) return names.red_cap and names.red_cap >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 1,
		hunger = 12.5,
		sanity = 0,
		thirst = 25,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
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
	
	cup_redcap_cold
	{
		test = function(boilier, name, tags) return names.red_cap and names.red_cap >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 1,
		hunger = 12.5,
		sanity = 0,
		thirst = 25,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
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
	
	-- 정신력 반전 버프(제한시간)
	cup_bluecap_hot
	{
		test = function(boilier, name, tags) return names.blue_cap and names.blue_cap >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 20,
		hunger = 12.5,
		sanity = 10,
		thirst = 25,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	-- 정신력 반전 버프(제한시간)
	cup_bluecap_cold
	{
		test = function(boilier, name, tags) return names.blue_cap and names.blue_cap >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 20,
		hunger = 12.5,
		sanity = 10,
		thirst = 25,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	cup_mooncap_hot
	{
		test = function(boilier, name, tags) return names.moon_cap and names.moon_cap >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 0,
		hunger = 12.5,
		sanity = 10,
		thirst = 25,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
		
		prefabs = { "buff_sleepresistance" },
        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SLEEP_RESISTANCE,
        oneatenfn = function(inst, eater)
            if eater.components.grogginess ~= nil and
                    (eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled()) and
                    not (eater.components.health ~= nil and eater.components.health:IsDead()) and
                    not eater:HasTag("playerghost") then

                if eater.components.grogginess ~= nil then
                    eater.components.grogginess:ResetGrogginess()
                end

                if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() then
                    eater.components.debuffable:AddDebuff("shroomsleepresist", "buff_sleepresistance")
                end
            end
        end,
	},
	
	cup_mooncap_cold
	{
		test = function(boilier, name, tags) return names.moon_cap and names.moon_cap >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 0,
		hunger = 12.5,
		sanity = 10,
		thirst = 25,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
		
		prefabs = { "buff_sleepresistance" },
        oneat_desc = STRINGS.UI.COOKBOOK.FOOD_EFFECTS_SLEEP_RESISTANCE,
        oneatenfn = function(inst, eater)
            if eater.components.grogginess ~= nil and
                    (eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled()) and
                    not (eater.components.health ~= nil and eater.components.health:IsDead()) and
                    not eater:HasTag("playerghost") then

                if eater.components.grogginess ~= nil then
                    eater.components.grogginess:ResetGrogginess()
                end

                if eater.components.debuffable ~= nil and eater.components.debuffable:IsEnabled() then
                    eater.components.debuffable:AddDebuff("shroomsleepresist", "buff_sleepresistance")
                end
            end
        end,
	},
	
	-- 잎&꽃차 종류
	
	cup_greentea_hot
	{
		test = function(boilier, name, tags) return names.tealeaves and names.tealeaves >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 7,
		hunger = 5,
		sanity = 20,
		thirst = 67,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_honeygreentea_hot
	{
		test = function(boilier, name, tags) return names.tealeaves and names.tealeaves >= 2 and tags.sweetener and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 2,
		health = 12,
		hunger = 12,
		sanity = 25,
		thirst = 78,
		temperature = 20,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_milkgreentea_hot
	{
		test = function(boilier, name, tags) return names.tealeaves and names.tealeaves >= 2 and tags.sweetener and tags.dairy and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 3,
		health = 21,
		hunger = 19,
		sanity = 30,
		thirst = 89,
		temperature = 25,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 25,
	},
	
	cup_greentea_cold
	{
		test = function(boilier, name, tags) return names.tealeaves and names.tealeaves >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 7,
		hunger = 5,
		sanity = 20,
		thirst = 67,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_honeygreentea_cold
	{
		test = function(boilier, name, tags) return names.tealeaves and names.tealeaves >= 2 and tags.sweetener and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 2,
		health = 12,
		hunger = 12,
		sanity = 25,
		thirst = 78,
		temperature = -20,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_milkgreentea_cold
	{
		test = function(boilier, name, tags) return names.tealeaves and names.tealeaves >= 2 and tags.sweetener and tags.dairy and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 3,
		health = 21,
		hunger = 19,
		sanity = 30,
		thirst = 89,
		temperature = 25,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 25,
	},
	
	-- 녹차 건조대 말린것
	cup_blacktea_hot
	{
		test = function(boilier, name, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 12,
		hunger = 12,
		sanity = 20,
		thirst = 78,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_honeyblacktea_hot
	{
		test = function(boilier, name, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and tags.sweetener and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 2,
		health = 21,
		hunger = 19,
		sanity = 30,
		thirst = 89,
		temperature = 20,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_milkblacktea_hot
	{
		test = function(boilier, name, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and tags.sweetener and tags.dairy and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 3,
		health = 35,
		hunger = 26,
		sanity = 40,
		thirst = 100,
		temperature = 25,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 25,
	},
	
	cup_blacktea_cold
	{
		test = function(boilier, name, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 12,
		hunger = 12,
		sanity = 20,
		thirst = 78,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_honeyblacktea_cold
	{
		test = function(boilier, name, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and tags.sweetener and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 2,
		health = 21,
		hunger = 19,
		sanity = 30,
		thirst = 89,
		temperature = -20,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_milkblacktea_cold
	{
		test = function(boilier, name, tags) return names.tealeaves_dried and names.tealeaves_dried >= 2 and tags.sweetener and tags.dairy and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 3,
		health = 35,
		hunger = 26,
		sanity = 40,
		thirst = 100,
		temperature = -25,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 25,
	},
	
	-- 동굴 고사리
	cup_fuer_hot
	{
		test = function(boilier, name, tags) return names.foliage and names.foliage >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 27,
		hunger = 24,
		sanity = 30,
		thirst = 89,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_fuer_cold
	{
		test = function(boilier, name, tags) return names.foliage and names.foliage >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 27,
		hunger = 24,
		sanity = 30,
		thirst = 89,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	-- 꽃을 섞으면 나오는 결과물
	cup_mixflower_hot
	{
		test = function(boilier, name, tags) return tags.decoration and tags.decoration >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 0,
		health = 7,
		hunger = 5,
		sanity = 11,
		thirst = 36,
		temperature = 10,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
		cooktime = 20,
	},
	
	cup_mixflower_cold
	{
		test = function(boilier, name, tags) return tags.decoration and tags.decoration >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 0,
		health = 7,
		hunger = 5,
		sanity = 11,
		thirst = 36,
		temperature = -10,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
		cooktime = 20,
	},
	
	-- 일반 꽃잎
	cup_hibiscus_hot
	{
		test = function(boilier, name, tags) return (( names.petals or 0 ) + ( names.moon_tree_blossom or 0 ) >= 2) and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 15,
		hunger = 10,
		sanity = 22,
		thirst = 73,
		temperature = 17,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_hibiscus_cold
	{
		test = function(boilier, name, tags) return (( names.petals or 0 ) + ( names.moon_tree_blossom or 0 ) >= 2) and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 15,
		hunger = 10,
		sanity = 22,
		thirst = 73,
		temperature = -17,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	-- 악마 꽃잎(몬스터태그 확인해서 효과주기)
	cup_bitter_hot
	{
		test = function(boilier, name, tags) return tags.monster and tags.monster >= 1.5 and not tags.frozen end,
		priority = 2,
            --if eater:HasTag("monster") and eater:HasTag("player") then
		       --eater.components.health:DoDelta(37)
		       --eater.components.sanity:DoDelta(25)
            --end,
	        --if not eater:HasTag("monster") and eater:HasTag("player") then
		        --eater.components.health:DoDelta(-10)
		        --eater.components.sanity:DoDelta(-20)
		        --eater.components.hunger:DoDelta(-10)
            --end,
		thirst = 80,
		temperature = 5,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 23,
	},
	
	cup_bitter_cold
	{
		test = function(boilier, name, tags) return tags.monster and tags.monster >= 1.5 and tags.frozen and tags.frozen >= 1 end,
		priority = 2,
            --if eater:HasTag("monster") and eater:HasTag("player") then
		       --eater.components.health:DoDelta(37)
		       --eater.components.sanity:DoDelta(25)
            --end,
	        --if not eater:HasTag("monster") and eater:HasTag("player") then
		        --eater.components.health:DoDelta(-10)
		        --eater.components.sanity:DoDelta(-20)
		        --eater.components.hunger:DoDelta(-10)
            --end,
		thirst = 80,
		temperature = -5,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 23,
	},
	
	-- 선인장 꽃잎
	cup_cactusflower_hot
	{
		test = function(boilier, name, tags) return names.cactus_flower and names.cactus_flower >= 2 and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 10,
		hunger = 10,
		sanity = 40,
		thirst = 84,
		temperature = 17,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_cactusflower_hot
	{
		test = function(boilier, name, tags) return tags.cactus_flower and tags.cactus_flower >= 2 and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 10,
		hunger = 10,
		sanity = 40,
		thirst = 84,
		temperature = -17,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_lotusflower_hot
	{
		test = function(boilier, name, tags) return (( names.lotus_flower or 0 ) + ( names.kyno_lotus or 0 ) >= 2) and not tags.frozen and not tags.meat and not tags.egg end,
		priority = 1,
		health = 2,
		hunger = 25,
		sanity = 30,
		thirst = 84,
		temperature = 17,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_lotus_flower_cold
	{
		test = function(boilier, name, tags) return (( names.lotus_flower or 0 ) + ( names.kyno_lotus or 0 ) >= 2) and tags.frozen and tags.frozen >= 1 and not tags.meat and not tags.egg end,
		priority = 1,
		health = 2,
		hunger = 25,
		sanity = 30,
		thirst = 84,
		temperature = -17,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	--일시적으로 유령으로 만드는 차(hot, cold 없음)[추가해야함]
	cup_suspicious_hibiscus
	{
		test = function(boilier, name, tags) return names.forgetmelots and names.firenettles and names.tillweeds end,
		priority = 2,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		cooktime = 45,
	},
	
}

for k, v in pairs(drink) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

	v.cupsjournal_category = "kettles"
	--v.cookbook_category = "cookpot"
end

return drink

-- caffeinberry caffeinberry_bean caffeinberry_bean_cooked

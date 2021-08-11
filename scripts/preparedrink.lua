local drink =
{
	-- 조합법이 잘못되면 나오는 결과물
	
	cup_garbage = 
	{
		test = function(boilier, name, tags) return true end,
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
	cup_water_hot =
	{
		priority = 0,
		health = 2,
		hunger = 3,
		sanity = 0,
		thirst = 17,
		temperature = 5,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
		cooktime = 17,
	},
	
	cup_water_cold =
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 2,
		hunger = 3,
		sanity = 0,
		thirst = 17,
		temperature = -5,
		temperatureduration = TUNING.FOOD_TEMP_BRIEF,
		cooktime = 8,
	},
	
	-- 과일차 종류
	
	cup_fruit_hot
	{
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 18,
		hunger = 31,
		sanity = 5,
		thirst = 90,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 25,
	},
	
	cup_wormlight_cold
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 18,
		hunger = 31,
		sanity = 5,
		thirst = 90,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 25,
	},
	
	-- 일시적 겉는 속도 증가[추가해야함]
	cup_coffee_hot
	{
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 2,
		hunger = 25,
		sanity = 22,
		thirst = 55,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_kelp_hot
	{
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 4,
		hunger = 23
		sanity = 7,
		thirst = 65,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_avocado_cold
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 4,
		hunger = 23
		sanity = 7,
		thirst = 65,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_garlic_hot
	{
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 100,
		hunger = 150,
		sanity = 12,
		thirst = 120,
		temperature = 25,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	-- 버섯차 종류
	cup_greencap_hot
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 0,
		hunger = 12.5,
		sanity = 15,
		thirst = 25,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	cup_greencap_cold
	{
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
	
	cup_bluecap_hot
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 20,
		hunger = 12.5,
		sanity = 10,
		thirst = 25,
		temperature = 15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	cup_bluecap_cold
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 20,
		hunger = 12.5,
		sanity = 10,
		thirst = 25,
		temperature = -15,
		temperatureduration = TUNING.FOOD_TEMP_LONG,
		cooktime = 30,
	},
	
	-- 잠들는 것을 막아주는 효능추가
	cup_mooncap_hot
	{
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
            --if eater:HasTag("monster") and eater:HasTag("player") then
		       --eater.components.health:DoDelta(37)
		       --eater.components.sanity:DoDelta(25)
            --end
	        --if not eater:HasTag("monster") and eater:HasTag("player") then
		        --eater.components.health:DoDelta(-10)
		        --eater.components.sanity:DoDelta(-20)
		        --eater.components.hunger:DoDelta(-10)
            --end
		thirst = 80,
		temperature = 5,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 23,
	},
	
	cup_bitter_cold
	{
		test = function(boilier, name, tags) return end
		priority = 0,
            --if eater:HasTag("monster") and eater:HasTag("player") then
		       --eater.components.health:DoDelta(37)
		       --eater.components.sanity:DoDelta(25)
            --end
	        --if not eater:HasTag("monster") and eater:HasTag("player") then
		        --eater.components.health:DoDelta(-10)
		        --eater.components.sanity:DoDelta(-20)
		        --eater.components.hunger:DoDelta(-10)
            --end
		thirst = 80,
		temperature = -5,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 23,
	},
	
	-- 선인장 꽃잎
	cup_cactusflower_hot
	{
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 10,
		hunger = 10,
		sanity = 40,
		thirst = 84,
		temperature = -17,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 20,
	},
	
	cup_lotus_flower_hot
	{
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
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
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 0,
		hunger = 0,
		sanity = 0,
		thirst = 0,
		cooktime = 45,
	},
	
	-- 플레이어에게 몬스터 태그 붙어주기
	cup_teatox_hot
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 5,
		hunger = 5,
		sanity = 10,
		thirst = 42,
		temperature = 5,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 23,
	},
	
	cup_teatox_cold
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = 5,
		hunger = 5,
		sanity = 10,
		thirst = 42,
		temperature = -5,
		temperatureduration = TUNING.FOOD_TEMP_AVERAGE,
		cooktime = 23,
	},
	
}

for k, v in pairs(drink) do
    v.name = k
    v.weight = v.weight or 1
    v.priority = v.priority or 0

	v.cupsjournal_category = "kettles"
end

return drink

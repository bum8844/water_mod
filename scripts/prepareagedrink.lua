local agedrink =
{

	-- 공통적으로 hot, cold 없음
	-- 잘못된 발효음료 조합법(재료중 찻잎, 꽃류, 채소 제외)
	cup_strang
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -2,
		hunger = -3,
		sanity = -5,
		thirst = -5,
		cooktime = 4,
	},
	
	-- 일반 탄산수
	cup_soda
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -2,
		hunger = -3,
		sanity = 9,
		thirst = 120,
		cooktime = sodacooktime,
	},
	
	-- 과일 탄산수
	cup_fruit_soda
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -2,
		hunger = -3,
		sanity = 19,
		thirst = 120,
		cooktime = sodacooktime,
	},
	
	-- 꿀만 넣을경우
	cup__cider
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -2,
		hunger = -3,
		sanity = 38,
		thirst = 125,
		cooktime = sodacooktime,
	},
	-- 꿀 + 볶은커피(스피드 버프[추가해야함], 채력 버프)
	cup_cola
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -2,
		hunger = -3,
		sanity = 75,
		thirst = 130,
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
	
	-- 술만들때 필수적으로 refined_dust 첨가[알콜 효과 추가해야함]
	cup_corned_beer
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -10,
		hunger = 10,
		sanity = 55,
		thirst = -5,
		cooktime = 4,
	},
	
	-- 베리류, 드래곤 후르츠 외 과일들
	cup_fruit_wine
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -5,
		hunger = 17,
		sanity = 60,
		thirst = -5,
		cooktime = 4,
	},
	
	-- 베리류
	cup_wine
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -5,
		hunger = 17,
		sanity = 65,
		thirst = 6,
		cooktime = 4,
	},
	
	-- 선인장, 다육, 알로에, 드래곤 후르츠 사용
	cup_pulqu
	{
		test = function(boilier, name, tags) return end
		priority = 0,
		health = -10,
		hunger = 10,
		sanity = 55,
		thirst = -5,
		cooktime = 4,
	},
	
	--꿀술
	cup_mead
	{
		test = function(boilier, name, tags) return end
		priority = 0,
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

return drink

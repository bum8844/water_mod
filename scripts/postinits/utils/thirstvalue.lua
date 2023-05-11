local function SetVeggieTag(inst)
	inst:AddTag("veggie")
end

local function SetFruitTag(inst)
	inst:AddTag("fruit")
end

local function SetDrinkableAction(inst)
	inst:AddTag("drink")
end

local function oneatenfn(inst, eater)
	if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
		return
	elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() and eater:HasTag("player") then
		eater.components.dcapacity:Start_Intoxication()
		if eater.components.dcapacity:IsDrunk() then
			if not eater:HasTag("valkyrie") then
				eater.alcoholdebuff_duration = TUNING.INTOXICATION_TIME
				eater.components.debuffable:AddDebuff("alcoholdebuff", "alcoholdebuff")
				eater.components.debuffable:AddDebuff("drunkarddebuff", "drunkarddebuff")
			else
				eater.components.talker:Say(GLOBAL.GetString(eater,"ANNOUNCE_DRUNK_IMMUNITY"))
			end
		end
		eater.immunebuff_duration = TUNING.IMMUNE_TIME
		eater.components.debuffable:AddDebuff("immunebuff", "immunebuff")
	else
		eater.components.health.externalabsorbmodifiers:SetModifier(eater, TUNING.BUFF_PLAYERABSORPTION_MODIFIER)
		eater.components.locomotor:SetExternalSpeedMultiplier(eater, "alcoholdebuff", 0.5)
		eater:DoTaskInTime(TUNING.INTOXICATION_TIME, function()
			eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "alcoholdebuff")
		end)
   		eater:DoTaskInTime(TUNING.IMMUNE_TIME, function()
   			eater.components.health.externalabsorbmodifiers:RemoveModifier(eater)
   		end)
	end
end 

local function SetAnyoneCanDrink(inst)
    if inst.components.edible ~= nil then
    	if inst.components.edible.foodtype ~= GLOBAL.FOODTYPE.GOODIES then
      		inst.components.edible.secondaryfoodtype = GLOBAL.FOODTYPE.GOODIES
      	end
    end
end

local function SetAnyoneCanDrink_Alcohl(inst)
    if inst.components.edible ~= nil then
    	if inst.components.edible.foodtype ~= GLOBAL.FOODTYPE.GOODIES then
      		inst.components.edible.secondaryfoodtype = GLOBAL.FOODTYPE.GOODIES
      	end
      	inst.components.edible:SetOnEatenFn(oneatenfn)
    end
end

local function SetHydration(inst, value)
	if inst.components.edible ~= nil then
		inst.components.edible.thirstvalue = TUNING["HYDRATION_"..value]
	end
end

local function SetIngredientDrinkable(inst, value)
	SetDrinkableAction(inst)
	inst:AddTag("pre-prepareddrink")

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	SetHydration(inst, value)
	SetAnyoneCanDrink(inst)
end

local function SetDrinkable(inst, value)
	SetDrinkableAction(inst)
	inst:AddTag("prepareddrink")

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	SetHydration(inst, value)
	SetAnyoneCanDrink(inst)
end

local function SetAlcohlDrink(inst, value)
	SetDrinkableAction(inst)
	inst:AddTag("prepareddrink")
	inst:AddTag("alcohol")

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	SetHydration(inst, value)
	SetAnyoneCanDrink_Alcohl(inst)
end

for _, v in pairs(FOODTYPEGROUP.TYPEVEGGIE) do 
	AddPrefabPostInit(v, SetVeggieTag)
	AddPrefabPostInit(v.."_cooked", SetVeggieTag)
end

for _, v in pairs(FOODTYPEGROUP.TYPEVEGGIE_NONE_COOKED) do 
	AddPrefabPostInit(v, SetVeggieTag)
end

for _, v in pairs(FOODTYPEGROUP.TYPEFRUIT) do 
	AddPrefabPostInit(v, SetFruitTag)
	AddPrefabPostInit(v.."_cooked", SetFruitTag)
end

for _, v in pairs(FOODTYPEGROUP.TYPEFRUIT_HAS_HALVED) do 
	AddPrefabPostInit(v.."_halved",SetFruitTag)
	AddPrefabPostInit(v.."_cooked", SetFruitTag)
end

for _, v in pairs(FOODTYPEGROUP.SOUP_AND_STEW) do 
	AddPrefabPostInit(v,SetDrinkableAction)
	AddPrefabPostInit(v.."_spice_caffeinpepper", SetDrinkableAction)
	AddPrefabPostInit(v.."_spice_chili", SetDrinkableAction)
	AddPrefabPostInit(v.."_spice_salt", SetDrinkableAction)
	AddPrefabPostInit(v.."_spice_suger", SetDrinkableAction)
	AddPrefabPostInit(v.."_spice_garlic", SetDrinkableAction)
end

for k, v in pairs(FOODTYPEGROUP.NONE_HUNGER_INGREDIENT) do 
	for _, u in pairs(v) do
		AddPrefabPostInit(u, function(inst)
			SetHydration(inst, k)
		end)
	end
end

for k, v in pairs(FOODTYPEGROUP.ICED) do 
	for _, u in pairs(v) do
		AddPrefabPostInit(u, function(inst)
			SetHydration(inst, k)
		end)
	end
end

for k, v in pairs(FOODTYPEGROUP.INGREDIENT_DRINKABLE) do 
	for _, u in pairs(v) do
		AddPrefabPostInit(u, function(inst)
			SetIngredientDrinkable(inst, k)
		end)
	end
end

for k, v in pairs(FOODTYPEGROUP.DRINKABLE_HOLIDAY) do 
	for _, u in pairs(v) do
		AddPrefabPostInit(u, function(inst)
			SetDrinkable(inst, k)
		end)
	end
end

for k, v in pairs(FOODTYPEGROUP.DRINKABLE_HOLIDAY_ALCOHO) do 
	for _, u in pairs(v) do
		AddPrefabPostInit(u, function(inst)
			SetAlcohlDrink(inst, k)
		end)
	end
end

for k, v in pairs(FOODTYPEGROUP.DRINKABLE) do 
	for _, u in pairs(v) do
		AddPrefabPostInit(u, function(inst)
			SetDrinkable(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_caffeinpepper", function(inst)
			SetDrinkable(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_chili", function(inst)
			SetDrinkable(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_salt", function(inst)
			SetDrinkable(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_suger", function(inst)
			SetDrinkable(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_garlic", function(inst)
			SetDrinkable(inst, k)
		end)
	end
end

for k, v in pairs(FOODTYPEGROUP.DRINKABLE_ALCOHO) do 
	for _, u in pairs(v) do
		AddPrefabPostInit(u, function(inst)
			SetAlcohlDrink(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_caffeinpepper", function(inst)
			SetAlcohlDrink(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_chili", function(inst)
			SetAlcohlDrink(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_salt", function(inst)
			SetAlcohlDrink(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_suger", function(inst)
			SetAlcohlDrink(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_garlic", function(inst)
			SetAlcohlDrink(inst, k)
		end)
	end
end
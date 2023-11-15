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
	if eater:HasTag("player") then
		eater.components.dcapacity:Start_Intoxication(TUNING.ALCOHOL_CAPACITY)
		if eater.components.dcapacity:IsDrunk() then
			if not eater:HasTag("valkyrie") then
				eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
				eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
			else
				eater.components.talker:Say(GetString(eater,"ANNOUNCE_DRUNK_IMMUNITY"))
			end
		else
			if not eater:HasTag("valkyrie") then
				if eater.components.dcapacity:IsCritical() then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_DCAPACITY_CRITICAL"))
				elseif eater.components.dcapacity:IsHalf() then
					eater.components.talker:Say(GetString(eater,"ANNOUNCE_DCAPACITY_HALF"))
				end
			end
		end
		eater:AddDebuff("resistancebuff", "resistancebuff")
	else
		eater:AddDebuff("alcoholdebuff", "alcoholdebuff")
		eater:AddDebuff("drunkarddebuff", "drunkarddebuff")
	end
end 

local function SetAnyoneCanDrink(inst)
    if inst.components.edible ~= nil then
    	if inst.components.edible.foodtype ~= GLOBAL.FOODTYPE.GOODIES then
    		if inst.components.edible.foodtype == GLOBAL.FOODTYPE.GENERIC then
    			inst.components.edible.foodtype = GLOBAL.FOODTYPE.GOODIES
    		else
      			inst.components.edible.secondaryfoodtype = GLOBAL.FOODTYPE.GOODIES
      		end
      	end
    end
end

local function SetAnyoneCanDrink_Alcohl(inst)
    if inst.components.edible ~= nil then
    	if inst.components.edible.foodtype ~= GLOBAL.FOODTYPE.GOODIES then
    		if inst.components.edible.foodtype == GLOBAL.FOODTYPE.GENERIC then
    			inst.components.edible.foodtype = GLOBAL.FOODTYPE.GOODIES
    		else
      			inst.components.edible.secondaryfoodtype = GLOBAL.FOODTYPE.GOODIES
      		end
      	end
      	if inst.components.edible.oneaten ~= nil then
      		local old_oneaten = inst.components.edible.oneaten
      		inst.components.edible:SetOnEatenFn(function(inst, eater)
	      		old_oneaten(inst, eater)
	      		oneatenfn(inst, eater)
	      	end)
	    else
	    	inst.components.edible:SetOnEatenFn(oneatenfn)
      	end
    end
end

local function SetHydration(inst, value)
	if inst.components.edible ~= nil then
		inst.components.edible.thirstvalue = TUNING["HYDRATION_"..value]
	end
end

local function SetIngredientDrinkable(inst, value)
	SetDrinkableAction(inst)
	inst:AddTag("nomeatfood")

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	SetHydration(inst, value)
	SetAnyoneCanDrink(inst)
end

local function SetDrinkable(inst, value)
	SetDrinkableAction(inst)

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	SetHydration(inst, value)
	SetAnyoneCanDrink(inst)
end

local function SetAlcohlDrink(inst, value)
	SetDrinkableAction(inst)
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
	AddPrefabPostInit(v.."_spice_sugar", SetDrinkableAction)
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
		AddPrefabPostInit(u.."_spice_sugar", function(inst)
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
		AddPrefabPostInit(u.."_spice_sugar", function(inst)
			SetAlcohlDrink(inst, k)
		end)
		AddPrefabPostInit(u.."_spice_garlic", function(inst)
			SetAlcohlDrink(inst, k)
		end)
	end
end
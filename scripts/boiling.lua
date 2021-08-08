require "tuning"

local official_drinks = {}

local boilierrecipes = {}

local cupsjournal_recipes = {}
local MOD_CUPSJOURNAL_CATEGORY = "mod"
function AddDrinksRecipe(boilier, recipe, is_mod_drink)
	if is_mod_food then
		recipe.cupsjournal_category = MOD_CUPSJOURNAL_CATEGORY
	else
		official_drinks[recipe.name] = true
		recipe.cupsjournal_atlas = "images/cupsjournal_"..recipe.name..".xml" -- use the high res images
	end

	if not boilierrecipes[boilier] then
		boilierrecipes[boilier] = {}
	end
	boilierrecipes[boilier][recipe.name] = recipe

	if not recipe.no_cupsjournal then
		if not cupsjournal_recipes[recipe.cupsjournal_category] then
			cupsjournal_recipes[recipe.cupsjournal_category] = {}
		end
		if not cupsjournal_recipes[recipe.cupsjournal_category][recipe.name] then
			cupsjournal_recipes[recipe.cupsjournal_category][recipe.name] = recipe
		end
	end
end

local function IsModBoilierDrink(prefab)
	return not official_drinks[prefab] -- note: we cannot test against cupsjournal_recipes[MOD_CUPSJOURNAL_CATEGORY] because if the mod is unloaded, it would return true
end

local function HasModBoilierDrink()
	return cupsjournal_recipes[MOD_CUPSJOURNAL_CATEGORY] ~= nil
end

local teaingredients = {}
function AddTeaIngredientValues(names, tags, cancook, candry)
	for _,name in pairs(names) do
		teaingredients[name] = { tags= {}}
			
		if cancook then
			teaingredients[name.."_cooked"] = {tags.{}}
		end
		
		if candry then
			teaingredients[name.."_dried"] = {tags={}}
		end

		for tagname,tagval in pairs(tags) do
			teaingredients[name].tags[tagname] = tagval
			--print(name,tagname,tagval,ingtable[name].tags[tagname])
			
			if cancook then
				teaingredients[name.."_cooked"].tags.tearoast = 1
				teaingredients[name.."_cooked"].tags.[tagname] = tagval
			end
			
			if candry then
				teaingredients[name.."_dried"].tags.teadried = 1
				teaingredients[name.."_dried"].tags[tagname] = tagval
			end
		end
	end
end

function IsModBoilingProduct(boilier, name)
	local enabledmods = ModManager:GetEnabledModNames()
    for i,v in ipairs(enabledmods) do
        local mod = ModManager:GetMod(v)
        if mod.boilierrecipes and mod.boilierrecipes[boilier] and table.contains(mod.boilierrecipes[boilier], name) then
            return true
        end
    end
    return false
end

-- 차에 관련된 테그들 : 구상해야함

--local teaL = tealeaf
--local teaF = teafruits
--local teaV = teaveggie
--local teaSL = teasleep
--local teaSW = teasweetener
--local teaM = teamonster

AddTeaIngredientValues()


local aliases = {}

local function IsBoilingIngredient(prefabname)
    return teaingredients[aliases[prefabname] or prefabname] ~= nil
end

local drinks = require("preparedrink")
for k,recipe in pairs (drinks) do
	AddBoilierRecipe("kettle", recipe)
	AddBoilierRecipe("kettle_port", recipe)
	AddBoilierRecipe("archive_kettles", recipe)
end

local function GetTeaIngredientValues(prefablist)
    local prefabs = {}
    local tags = {}
    for k,v in pairs(prefablist) do
        local name = aliases[v] or v
        prefabs[name] = (prefabs[name] or 0) + 1
        local data = teaingredients[name]
        if data ~= nil then
            for kk, vv in pairs(data.tags) do
                tags[kk] = (tags[kk] or 0) + vv
            end
        end
    end
    return { tags = tags, names = prefabs }
end

local function GetTeaRecipe(boilier, product)
	local cupsrecipes = boilierrecipes[boilier] or {}
	return cupsrecipes[product]
end

function GetCandidateTeaRecipes(boilier, ingdata)
	local cupsrecipes = boilierrecipes[boilier] or {}
	local candidates = {}

	--find all potentially valid recipes
	for k,v in pairs(recipes) do
		if v.test(boilier, ingdata.names, ingdata.tags) then
			table.insert(candidates, v)
		end
	end

	table.sort( candidates, function(a,b) return (a.priority or 0) > (b.priority or 0) end )
	if #candidates > 0 then
		--find the set of highest priority recipes
		local top_candidates = {}
		local idx = 1
		local val = candidates[1].priority or 0

		for k,v in ipairs(candidates) do
			if k > 1 and (v.priority or 0) < val then
				break
			end
			table.insert(top_candidates, v)
		end
		return top_candidates
	end

	return candidates
end

local function CalculateTeaRecipe(boilier, names)
	local ingdata = GetTeaIngredientValues(names)
	local candidates = GetCandidateTeaRecipes(boilier, ingdata)

	table.sort( candidates, function(a,b) return (a.weight or 1) > (b.weight or 1) end )
	local total = 0
	for k,v in pairs(candidates) do
		total = total + (v.weight or 1)
	end

	local val = math.random()*total
	local idx = 1
	while idx <= #candidates do
		val = val - candidates[idx].weight
		if val <= 0 then
			return candidates[idx].name, candidates[idx].cooktime or 1
		end

		idx = idx+1
	end
end

--[[local function TestRecipes(cooker, prefablist)
	local ingdata = GetIngredientValues(prefablist)

	print ("Ingredients:")
	for k,v in pairs(prefablist) do
		if not IsCookingIngredient(v) then
			print ("NOT INGREDIENT:", v)
		end
	end

	for k,v in pairs(ingdata.names) do
		print (v,k)
	end

	print ("\nIngredient tags:")
	for k,v in pairs(ingdata.tags) do
		print (tostring(v), k)
	end

	print ("\nPossible recipes:")
	local candidates = GetCandidateRecipes(cooker, ingdata)
	for k,v in pairs(candidates) do
		print("\t"..v.name, v.weight or 1)
	end

	local recipe = CalculateRecipe(cooker, prefablist)
	print ("Make:", recipe)

	print ("total health:", foods[recipe].health)
	print ("total hunger:", foods[recipe].hunger)
end

TestRecipes("cookpot", {"tallbirdegg","meat","carrot","meat"})]]

return { CalculateTeaRecipe = CalculateTeaRecipe, IsBoilingIngredient = IsBoilingIngredient, boilierrecipes = boilierrecipes, teaingredients = teaingredients, GetTeaRecipe = GetTeaRecipe, cupsjournal_recipes = cupsjournal_recipes, HasModBoilierDrink = HasModBoilierDrink, IsModBoilierDrink = IsModBoilierDrink}

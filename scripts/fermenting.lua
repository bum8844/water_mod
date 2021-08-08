require "tuning"

local official_sodas = {}

local fermenterrecipes = {}

local sodasjournal_recipes = {}
local MOD_CUPSJOURNAL_CATEGORY = "mod"
function AddSodasRecipe(fermenter, recipe, is_mod_soda)
	if is_mod_food then
		recipe.sodasjournal_category = MOD_CUPSJOURNAL_CATEGORY
	else
		official_sodas[recipe.name] = true
		recipe.sodasjournal_atlas = "images/sodasjournal_"..recipe.name..".xml" -- use the high res images
	end

	if not fermenterrecipes[fermenter] then
		fermenterrecipes[fermenter] = {}
	end
	fermenterrecipes[fermenter][recipe.name] = recipe

	if not recipe.no_sodasjournal then
		if not sodasjournal_recipes[recipe.sodasjournal_category] then
			sodasjournal_recipes[recipe.sodasjournal_category] = {}
		end
		if not sodasjournal_recipes[recipe.sodasjournal_category][recipe.name] then
			sodasjournal_recipes[recipe.sodasjournal_category][recipe.name] = recipe
		end
	end
end

local function IsModFermentingSoda(prefab)
	return not official_sodas[prefab] -- note: we cannot test against sodasjournal_recipes[MOD_CUPSJOURNAL_CATEGORY] because if the mod is unloaded, it would return true
end

local function HasModFermentingSoda()
	return sodasjournal_recipes[MOD_CUPSJOURNAL_CATEGORY] ~= nil
end

local fermeningredients = {}
function AddFermenIngredientValues(names, tags, cancook, candry)
	for _,name in pairs(names) do
		fermeningredients[name] = { tags= {}}
			
		if cancook then
			fermeningredients[name.."_cooked"] = {tags.{}}
		end
		
		if candry then
			fermeningredients[name.."_dried"] = {tags={}}
		end

		for tagname,tagval in pairs(tags) do
			fermeningredients[name].tags[tagname] = tagval
			--print(name,tagname,tagval,ingtable[name].tags[tagname])
			
			if cancook then
				fermeningredients[name.."_cooked"].tags.fermenroast = 1
				fermeningredients[name.."_cooked"].tags.[tagname] = tagval
			end
			
			if candry then
				fermeningredients[name.."_dried"].tags.fermendried = 1
				fermeningredients[name.."_dried"].tags[tagname] = tagval
			end
		end
	end
end

function IsModFermentingProduct(fermenter, name)
	local enabledmods = ModManager:GetEnabledModNames()
    for i,v in ipairs(enabledmods) do
        local mod = ModManager:GetMod(v)
        if mod.fermenterrecipes and mod.fermenterrecipes[fermenter] and table.contains(mod.fermenterrecipes[fermenter], name) then
            return true
        end
    end
    return false
end

-- 차에 관련된 테그들 : 구상해야함

--local fermenL = fermenleaf
--local fermenF = fermenfruits
--local fermenV = fermenveggie
--local fermenSL = fermensleep
--local fermenSW = fermensweetener
--local fermenM = fermenmonster

AddFermentIngredientValues()


local aliases = {}

local function IsFermentingIngredient(prefabname)
    return fermeningredients[aliases[prefabname] or prefabname] ~= nil
end

local foods = require("preparesoda")
for k,recipe in pairs (foods) do
	AddFermentingRecipe("kettle", recipe)
	AddFermentingRecipe("kettle_port", recipe)
	AddFermentingRecipe("archive_kettles", recipe)
end

local function GetFermenIngredientValues(prefablist)
    local prefabs = {}
    local tags = {}
    for k,v in pairs(prefablist) do
        local name = aliases[v] or v
        prefabs[name] = (prefabs[name] or 0) + 1
        local data = fermeningredients[name]
        if data ~= nil then
            for kk, vv in pairs(data.tags) do
                tags[kk] = (tags[kk] or 0) + vv
            end
        end
    end
    return { tags = tags, names = prefabs }
end

local function GetFermenRecipe(fermenter, product)
	local sodasrecipes = fermenterrecipes[fermenter] or {}
	return sodasrecipes[product]
end

function GetCandidateFermenRecipes(fermenter, ingdata)
	local sodasrecipes = fermenterrecipes[fermenter] or {}
	local candidates = {}

	--find all potentially valid recipes
	for k,v in pairs(recipes) do
		if v.test(fermenter, ingdata.names, ingdata.tags) then
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

local function CalculateFermenRecipe(fermenter, names)
	local ingdata = GetFermenIngredientValues(names)
	local candidates = GetCandidateFermenRecipes(fermenter, ingdata)

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

return { CalculateFermenRecipe = CalculateFermenRecipe, IsFermentingIngredient = IsFermentingIngredient, fermenterrecipes = fermenterrecipes, fermeningredients = fermeningredients, GetFermenRecipe = GetFermenRecipe, sodasjournal_recipes = sodasjournal_recipes, HasModFermentingSoda = HasModFermentingSoda, IsModFermentingSoda = IsModFermentingSoda}

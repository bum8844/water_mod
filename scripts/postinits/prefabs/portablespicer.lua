local cooking = require("cooking")

local list = {
	"spice_caffeinpepper",
	"spice_ruincolate_spread"
}

local function ShowProduct(inst ,spice)
    if not inst:HasTag("burnt") then
        local product = inst.components.stewer.product
        local recipe = cooking.GetRecipe(inst.prefab, product)
        if recipe ~= nil then
            product = recipe.basename or product
            if recipe.spice ~= nil then
                inst.AnimState:OverrideSymbol("swap_plate", "plate_food", "plate")
                inst.AnimState:OverrideSymbol("swap_garnish", "water_spice", spice)
            else
                inst.AnimState:ClearOverrideSymbol("swap_plate")
                inst.AnimState:ClearOverrideSymbol("swap_garnish")
            end
        else
            inst.AnimState:ClearOverrideSymbol("swap_plate")
            inst.AnimState:ClearOverrideSymbol("swap_garnish")
        end

        local build =
	            (recipe ~= nil and recipe.overridebuild) or
	            (GLOBAL.IsModCookingProduct(inst.prefab, product) and product) or
	            "cook_pot_food"
	    local overridesymbol = recipe ~= nil and recipe.overridesymbolname or product
        inst.AnimState:OverrideSymbol("swap_cooked", build, overridesymbol)
    end
end

local function checkitem(inst)
	for k, v in pairs(list) do
		if inst.components.stewer.ingredient_prefabs[2] == v then
			return v
		end
	end
	return false
end

local function checkname(inst)
	for k, v in pairs(list) do
		if string.find(inst.components.stewer.product,"_"..v) then
			return v
		end
	end
	return false
end

local function continuedonefn(inst)
	local result = checkname(inst)
    if not inst:HasTag("burnt") then
		if result then
	        inst.AnimState:PlayAnimation("idle_full")
	        ShowProduct(inst)
		else
			return inst.components.stewer.dehy_oncontinuedone(inst)
		end
	end
end

local function ondonecookingfn(inst)
	local test = checkitem(inst)
    if not inst:HasTag("burnt") then
		if test then
	        inst.AnimState:PlayAnimation("cooking_pst")
	        inst.AnimState:PushAnimation("idle_full", false)
	        ShowProduct(inst, test)
	        inst.SoundEmitter:KillSound("snd")
	        inst.SoundEmitter:PlaySound("dontstarve/common/together/portable/spicer/cooking_pst")
		else
			return inst.components.stewer.dehy_ondonecooking(inst)
		end
	end
end

AddPrefabPostInit("portablespicer", function(inst)

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

    if inst.components.stewer ~= nil then
		inst.components.stewer.dehy_oncontinuedone = inst.components.stewer.oncontinuedone
		inst.components.stewer.dehy_ondonecooking = inst.components.stewer.ondonecooking
	end

	inst.components.stewer.oncontinuedone = continuedonefn
	inst.components.stewer.ondonecooking = ondonecookingfn
end)

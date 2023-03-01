local cooking = require("cooking")

local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        local product = inst.components.stewer.product
        local recipe = cooking.GetRecipe(inst.prefab, product)
        local chktag = SpawnPrefab(inst.components.stewer.product)
        if recipe ~= nil then
            product = recipe.basename or product
            if recipe.spice ~= nil then
                inst.AnimState:OverrideSymbol("swap_plate", "plate_food", "plate")
                inst.AnimState:OverrideSymbol("swap_garnish", "water_spice", "spice_caffeinpepper")
            else
                inst.AnimState:ClearOverrideSymbol("swap_plate")
                inst.AnimState:ClearOverrideSymbol("swap_garnish")
            end
        else
            inst.AnimState:ClearOverrideSymbol("swap_plate")
            inst.AnimState:ClearOverrideSymbol("swap_garnish")
        end
        if chktag:HasTag("watermod") then
            inst.AnimState:OverrideSymbol("swap_cooked", product, product)
        else
            local symbol_override_build = (recipe ~= nil and recipe.overridebuild) or "cook_pot_food"
            inst.AnimState:OverrideSymbol("swap_cooked", symbol_override_build, product)
        end
        chktag:Remove()
    end
end

local function checkitem(inst)
	return inst.components.stewer.ingredient_prefabs[2] == "spice_caffeinpepper"
end

local function checkname(inst)
	return string.find(inst.components.stewer.product,"_spice_caffeinpepper")
end

local function continuedonefn(inst)
	local result = checkname(inst)
    if not inst:HasTag("burnt") then
		if result then
	        inst.AnimState:PlayAnimation("idle_full")
	        ShowProduct(inst)
		elseif inst.components.stewer.ondonecooking_old ~= nil then
			return inst.components.stewer.oncontinuedone_old(inst)
		end
	end
end

local function ondonecookingfn(inst)
	local test = checkitem(inst)
    if not inst:HasTag("burnt") then
		if test then
	        inst.AnimState:PlayAnimation("cooking_pst")
	        inst.AnimState:PushAnimation("idle_full", false)
	        ShowProduct(inst)
	        inst.SoundEmitter:KillSound("snd")
	        inst.SoundEmitter:PlaySound("dontstarve/common/together/portable/spicer/cooking_pst")
		elseif inst.components.stewer.ondonecooking_old ~= nil then
			return inst.components.stewer.ondonecooking_old(inst)
		end
	end
end

AddPrefabPostInit("portablespicer", function(inst)

    if not GLOBAL.TheWorld.ismastersim then
        return inst
    end

	if inst.components.stewer ~= nil then
		inst.components.stewer.oncontinuedone_old = inst.components.stewer.oncontinuedone
		inst.components.stewer.ondonecooking_old = inst.components.stewer.ondonecooking
	end
	inst.components.stewer.oncontinuedone = continuedonefn
	inst.components.stewer.ondonecooking = ondonecookingfn
end)
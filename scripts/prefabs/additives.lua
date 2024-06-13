local additives = {
	additive_seed = {},
    additive_nut = {},
    additive_dairy = {},
	additive_petals = {},
}

for k, v in pairs (additives) do
    v.name = k
end

local function MakeAdditives(data)
	local assets = {
    	Asset("ANIM", "anim/water_additives.zip"),
	}

	if data.overridebuild then
		table.insert(assets, Asset("ANIM", "anim/"..data.overridebuild))
	end

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.water_swap_type = true
        --inst.water_use_prefab_name = true

    	inst.AnimState:SetBuild("water_additives")
        inst.AnimState:SetBank("water_additives")
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", data.overridebuild or "water_additives", data.basename or data.name)

        if data.tags ~= nil then
            for k, v in ipairs(data.tags) do
                inst:AddTag(v)
            end
        end

        MakeInventoryFloatable(inst)
        
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddTag("additives")

        inst:AddComponent("inspectable")
    	inst:AddComponent("inventoryitem")

    	MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    	MakeSmallPropagator(inst)

    	MakeHauntableLaunch(inst)

        return inst
    end

    return Prefab(data.name, fn, assets)
end

local prefs = {}

for k, v in pairs(additives) do
    table.insert(prefs, MakeAdditives(v))
end

return unpack(prefs)
local additives = {
	"additives_seed",
    "additives_nut",
    "additives_dairy",
	"additives_petals",
}

local function MakeAdditives(data)
	local assets = {
    	Asset("ANIM", "anim/additives.zip"),
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

    	inst.AnimState:SetBuild("additives")
        inst.AnimState:SetBank("additives")
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", data.overridebuild or "additives", data.basename or data.name)

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
local assets = {
	kettle = {
	    Asset("ANIM", "anim/kettle.zip"),
	    Asset("ANIM", "anim/kettle_drink.zip"),
	    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),
	},
	portable_kettle = {
	    Asset("ANIM", "anim/portablekettle.zip"),
	    Asset("ANIM", "anim/kettle_drink.zip"),
		Asset("ANIM", "anim/portablekettle_meter_dirty.zip"),
		Asset("ANIM", "anim/portablekettle_meter_water.zip"),
	    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),
	}
}

local prefabs = {
	kettle = {
		"collapse_small",
	},
	portable_kettle = {
	    "portable_kettle_item",
	}
}

local function MakeKettles(name, tags)

	local function GetWet(inst)
	    if not inst:HasTag("burnt") then
	        if inst.components.waterlevel:GetPercent() > 0 then
	            SpawnPrefab("waterballoon_splash").Transform:SetPosition(inst.Transform:GetWorldPosition())
	            inst.SoundEmitter:KillSound("destroy")
	            inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
	            inst.components.wateryprotection:SpreadProtection(inst)
	        end
	    end
	end

	local function onpercentusedchange(inst, data)
	    inst.components.wateryprotection.addwetness = data.percent * TUNING.WATER_BARREL_WETNESS
	end

	local function onhammered(inst, worker)
	    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
	        inst.components.burnable:Extinguish()
	    end
	    if inst.components.container ~= nil then
	        inst.components.container:DropEverything()
	    end
	    inst.components.lootdropper:DropLoot()
	    local fx = SpawnPrefab("collapse_small")
	    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
	    fx:SetMaterial("metal")
	    GetWet(inst)
	    inst:Remove()
	end

	local function fn(name)
		local inst = CreateEntity()



		return inst
	end
	
	return Prefab(name, fn, assets[name], prefabs[name])
end

local function item_fn()
	local inst = CreateEntity()

	return inst
end

return MakeKettles("kettle"),
	   MakeKettles("portable_kettle"),
	   Prefab("portable_kettle_item", item_fn, assets.portable_kettle),
	   MakePlacer("kettle_placer", "kettle", "kettle", "idle_empty"),
	   MakePlacer("portable_kettle_placer", "portable_kettle", "portable_kettle", "idle_empty"),
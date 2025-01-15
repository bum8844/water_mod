local assets = {
	kettle = {
	    Asset("ANIM", "anim/kettle.zip"),
	    Asset("ANIM", "anim/kettle_drink.zip"),
	    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),
	},
	portablekettle = {
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
	portablekettle = {
	    "portable_kettle_item",
	}
}

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

local function kettlefn(inst)

	local function onbuilt(inst)
	    inst.AnimState:PlayAnimation("place")
		inst.AnimState:PushAnimation("idle_empty", false)
		inst.SoundEmitter:PlaySound("dontstarve/common/cook_pot_craft")
	end

	local function onburnt(inst)
	    inst.components.waterlevel.accepting = false
	    inst.components.water.available = false
	    inst.components.waterlevel:SetPercent(0)
	    local amount = math.ceil(inst.components.wateryprotection.addwetness * MOISTURE_ON_BURNT_MULTIPLIER)
	    if amount > 0 then
	        local x, y, z = inst.Transform:GetWorldPosition()
	        TheWorld.components.farming_manager:AddSoilMoistureAtPoint(x, 0, z, amount)
	    end
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

	local function onhit(inst, worker)
	    if not inst:HasTag("burnt") then
	        if inst.components.distiller:isBoiling() then
	            inst.AnimState:PlayAnimation("hit_cooking")
	            inst.AnimState:PushAnimation("cooking_loop", true)
	            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
	        else
	            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
	            inst.AnimState:PlayAnimation("hit_empty")
	            inst.AnimState:PushAnimation("idle_empty", false)
	        end
	    end
	end

	local function onsave(inst, data)
	    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
	        data.burnt = true
	    end
	end

	local function onload(inst, data)
	    if data ~= nil then 
	        if data.burnt then
	            inst.components.burnable.onburnt(inst)
	            inst.Light:Enable(false)
	        end
	    end
	end

	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

    inst:ListenForEvent("onbuilt", onbuilt)
    inst:ListenForEvent("onburnt", onburnt)
	
	MakeHauntableWork(inst)
	
	MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload

end

local function portable_kettlefn(inst)

	local function ChangeToItem(inst)
	    if inst.components.container ~= nil then
	        inst.components.container:DropEverything()
	    end

	    local item = SpawnPrefab("portable_kettle_item")
	    item.Transform:SetPosition(inst.Transform:GetWorldPosition())
	    item.AnimState:PlayAnimation("collapse")
	    item.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/collapse")
	end

	local function OnBurnt(inst)
	    DefaultBurntStructureFn(inst)
	    RemovePhysicsColliders(inst)
	    SpawnPrefab("ash").Transform:SetPosition(inst.Transform:GetWorldPosition())
	    if inst.components.workable ~= nil then
	        inst:RemoveComponent("workable")
	    end
	    if inst.components.portablestructure ~= nil then
	        inst:RemoveComponent("portablestructure")
	    end
	    inst.components.waterlevel.accepting = false
	    inst.components.water.available = false
	    inst.components.waterlevel:SetPercent(0)
	    local amount = math.ceil(inst.components.wateryprotection.addwetness * MOISTURE_ON_BURNT_MULTIPLIER)
	    if amount > 0 then
	        local x, y, z = inst.Transform:GetWorldPosition()
	        TheWorld.components.farming_manager:AddSoilMoistureAtPoint(x, 0, z, amount)
	    end
	    inst.persists = false
	    inst:AddTag("FX")
	    inst:AddTag("NOCLICK")
	    inst:ListenForEvent("animover", ErodeAway)
	    inst.AnimState:PlayAnimation("burnt_collapse")
	end

	local function OnDismantle(inst, doer)
	    if inst.components.waterlevel.currentwater == 0 or doer == nil then
	        ChangeToItem(inst)
	        inst:Remove()
	    else
	        doer.components.talker:Say(GetString(doer,"ACTIONFAIL",{"DISMANTLE","NOTEMPTY"}))
	    end
	end

	local function onhammered(inst)--, worker)
	    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
	        inst.components.burnable:Extinguish()
	    end

	    if inst:HasTag("burnt") then
	        inst.components.lootdropper:SpawnLootPrefab("ash")
	        local fx = SpawnPrefab("collapse_small")
	        fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
	        fx:SetMaterial("metal")
	    else
	        GetWet(inst)
	        ChangeToItem(inst)
	    end

	    inst:Remove()
	end

	local function onhit(inst)--, worker)
	    if not inst:HasTag("burnt") then
	        if inst.components.brewing:IsCooking() or inst.components.distiller:isBoiling() then
	            inst.AnimState:PlayAnimation("hit_cooking")
	            inst.AnimState:PushAnimation("cooking_loop", true)
	            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
	        else
	            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
	            inst.AnimState:PlayAnimation("hit_empty")
	            inst.AnimState:PushAnimation("idle_empty", false)
	        end
	    end
	end

	local function onsave(inst, data)
	    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
	        data.burnt = true
	    end
	end

	local function onload(inst, data)
	    if data ~= nil and data.burnt then
	        inst.components.burnable.onburnt(inst)
	    end
	end

    inst:AddComponent("portablestructure")
    inst.components.portablestructure:SetOnDismantleFn(OnDismantle)

	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

    MakeMediumBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)
    inst.components.burnable:SetFXLevel(2)
    inst.components.burnable:SetOnBurntFn(OnBurnt)

    inst.OnSave = onsave
    inst.OnLoad = onload

end

local function MakeKettles(name, masterfn, tags)

	local function onpercentusedchange(inst, data)
	    inst.components.wateryprotection.addwetness = data.percent * TUNING.WATER_BARREL_WETNESS
	end

	local function ondoneboilingfn(inst)
		if not inst:HasTag("burnt") then
			if inst.components.waterlevel:GetWater() > 0 then
				local meter_name = name or inst.prefab
			    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
			    inst.components.pickable.canbepicked = true
			    inst.components.pickable.product = "water_"..inst.components.waterlevel.watertype
			    inst.components.waterlevel.waterperish = nil
			    inst.AnimState:PlayAnimation("idle_empty")
			    inst.SoundEmitter:KillSound("snd")
			    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_finish", "snd")
			    inst.AnimState:OverrideSymbol("swap_meter", meter_name.."_meter_water", tostring(inst._waterlevel))
			else
				inst.components.pickable.canbepicked = false
			end
		end
	end

	local function onstartboilingfn(inst)
		if not inst:HasTag("burnt") then
		    inst.AnimState:PlayAnimation("cooking_loop", true)
		    inst.SoundEmitter:KillSound("snd")
		    inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
		end
	end
	    
	local function OnTakeWater(inst)
		if not inst:HasTag("burnt") then
		    inst.AnimState:PlayAnimation("take_water")
		    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	        if not inst.components.distiller:isDone() then
	            inst.AnimState:PushAnimation("idle_empty", false)
	            inst:DoTaskInTime(1,function(inst)
	            inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_close")
	                if not inst.components.distiller:isDone() then
	                    onstartboilingfn(inst)
	                end
	            end)
	        else
			    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
			    inst.components.pickable.canbepicked = true
			    inst.components.pickable.product = "water_"..inst.components.waterlevel.watertype
	        end
	    end
	end

	local function OnSectionChange(new, old, inst)
		if not inst:HasTag("burnt") then
			local meter_name = name or inst.prefab
		    local watertype = (inst.components.waterlevel.watertype == WATERTYPE.DIRTY or inst.components.waterlevel.watertype == WATERTYPE.DIRTY_ICE) and "dirty" or "water"
		    if new ~= nil then
		        if inst._waterlevel ~= new then
		            inst._waterlevel = new
		        end
		    end
		    inst.AnimState:OverrideSymbol("swap_meter", meter_name.."_meter_"..watertype, tostring(new))
		end
	end

	local function OnTaken(inst, source, delta)
	    if not inst:HasTag("burnt") then
	        inst.components.container.canbeopened = false
	        inst.AnimState:PlayAnimation("getdrink_empty")
	        inst.AnimState:PushAnimation("idle_empty", false)
	        inst:DoTaskInTime(.5,function(inst)
	            inst.components.container.canbeopened = true
	        end)
	        inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/medium")
	    end
	end

	local function OnPickedFn(inst,picker,loot)
	    loot.components.inventoryitemmoisture:SetMoisture(0)
	    inst.components.waterlevel.watertype = nil
	    loot.components.perishable:SetPercent(inst.components.waterlevel.waterperish or 1)
	    inst.components.waterlevel:DoDelta(-inst.components.waterlevel:GetWater())
	    inst.AnimState:PlayAnimation("getdrink_empty")
	    inst.AnimState:PushAnimation("idle_empty")
	    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/emerge/small")
	    inst.components.pickable.canbepicked = false
	    inst.components.waterlevel.accepting = true
	end 

	local function getstatus(inst)
	    return (inst:HasTag("burnt") and "BURNT")
	        or (inst.components.distiller:isBoiling() and ( 
	                inst.components.distiller:GetTimeToBoil() > 15 and ( inst.components.waterlevel.watertype == WATERTYPE.CLEAN_ICE and "MELT_LONG" or "PURIFY_LONG" )
	                or ( inst.components.waterlevel.watertype == WATERTYPE.CLEAN_ICE and "MELT_SHORT" or "PURIFY_SHORT" )
	            ))
	        or (inst.components.waterlevel:GetWater() > 0 and "DONE")
	        or "EMPTY"
	end

	local function onpercentusedchange(inst, data)
	    inst.components.wateryprotection.addwetness = data.percent * TUNING.KETTLE_WETNESS
	end

	local function fn()
		local inst = CreateEntity()
		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddMiniMapEntity()
		inst.entity:AddSoundEmitter()
	    inst.entity:AddLight()
	    inst.entity:AddNetwork()
		
		local minimap = inst.entity:AddMiniMapEntity()
		minimap:SetIcon(name..".tex")

	    inst.Light:Enable(false)
	    inst.Light:SetRadius(.6)
	    inst.Light:SetFalloff(1)
	    inst.Light:SetIntensity(.5)
	    inst.Light:SetColour(235/255,62/255,12/255)

	    if name == "kettle" then
	    	MakeObstaclePhysics(inst, .1)
	    else
	    	inst.entity:AddDynamicShadow()

		    inst:SetPhysicsRadiusOverride(.5)
		    MakeObstaclePhysics(inst, inst.physicsradiusoverride)
	    	inst.DynamicShadow:SetSize(2, 1)
		end

	    inst.AnimState:SetBuild(name)
	    inst.AnimState:SetBank(name)
	    inst.AnimState:PlayAnimation("idle_empty")
	    inst.AnimState:OverrideSymbol("swap_meter", name.."_meter_water", "0")

        if tags ~= nil then
            for k, v in ipairs(tags) do
                inst:AddTag(v)
            end
        end

        if not TheWorld.ismastersim then
            return inst
        end

	    inst:AddComponent("waterlevel")
	    inst.components.waterlevel.onlysamewater = true
	    inst.components.waterlevel.save_waterperish = true
	    inst.components.waterlevel:SetCanAccepts({WATERGROUP.BOILABLE})
	    inst.components.waterlevel:SetTakeWaterFn(OnTakeWater)
	    inst.components.waterlevel:SetSections(TUNING.KETTLE_MAX_LEVEL)
	    inst.components.waterlevel:SetSectionCallback(OnSectionChange)
	    inst.components.waterlevel.maxwater = TUNING.KETTLE_MAX_LEVEL
	    inst.components.waterlevel:InitializeWaterLevel(0)

	    inst:AddComponent("distiller")
	    inst.components.distiller.onstartboiling = OnTakeWater
	    inst.components.distiller.oncontinueboiling = onstartboilingfn
	    inst.components.distiller.ondoneboiling = ondoneboilingfn

	    inst:AddComponent("pickable")
	    inst.components.pickable.canbepicked = false
	    --inst.components.pickable.product = "water_"..inst.components.waterlevel.watertype
	    inst.components.pickable.numtoharvest = inst.components.waterlevel:GetWater()
	    inst.components.pickable:SetOnPickedFn(OnPickedFn)

	    inst:AddComponent("water")
	    inst.components.water.available = false
	    inst.components.water:SetOnTakenFn(OnTaken)

	    inst:AddComponent("wateryprotection")
	    inst.components.wateryprotection.extinguishheatpercent = TUNING.WATER_BARREL_EXTINGUISH_HEAT_PERCENT
	    inst.components.wateryprotection.temperaturereduction = TUNING.WATER_BARREL_TEMP_REDUCTION
	    inst.components.wateryprotection.witherprotectiontime = TUNING.WATER_BARREL_PROTECTION_TIME
	    inst.components.wateryprotection.addwetness = 0 -- 물의 양에 따라 변형
	    inst.components.wateryprotection.protection_dist = TUNING.WATER_BARREL_DIST

		inst:AddComponent("lootdropper")
	    inst:AddComponent("inspectable")
	    inst.components.inspectable.getstatus = getstatus

		inst:AddComponent("workable")
	    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	    inst.components.workable:SetWorkLeft(4)

		if masterfn ~= nil then
			masterfn(inst)
		end

		inst:ListenForEvent("percentusedchange", onpercentusedchange)

		return inst
	end
	
	return Prefab(name, fn, assets[name], prefabs[name])
end

local function ondeploy(inst, pt, deployer)
    local pot = SpawnPrefab("portablekettle")
    if pot ~= nil then
        pot.Physics:SetCollides(false)
        pot.Physics:Teleport(pt.x, 0, pt.z)
        pot.Physics:SetCollides(true)
        pot.AnimState:PlayAnimation("place")
        pot.AnimState:PushAnimation("idle_empty", false)
        pot.SoundEmitter:PlaySound("dontstarve/common/together/portable/cookpot/place")
        inst:Remove()
        PreventCharacterCollisionsWithPlacedObjects(pot)
    end
end

local function item_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.minisign_atlas = "minisign_dehy_items_swap"
    inst.minisign_prefab_name = true

    inst.AnimState:SetBank("portablekettle")
    inst.AnimState:SetBuild("portablekettle")
    inst.AnimState:PlayAnimation("idle_ground")

    inst:AddTag("portableitem")

    MakeInventoryFloatable(inst, "med", 0.1, 0.8)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.replica.inventoryitem:SetImage("portablekettle_item")
	inst.components.inventoryitem.atlasname= "images/inventoryitems/tea_inventoryitem.xml"
    inst.components.inventoryitem.imagename= "portablekettle_item"

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy
    --inst.components.deployable:SetDeployMode(DEPLOYMODE.ANYWHERE)
    --inst.components.deployable:SetDeploySpacing(DEPLOYSPACING.NONE)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    MakeMediumBurnable(inst)
    MakeSmallPropagator(inst)

    return inst
end

return MakeKettles("kettle",kettlefn,{"structure","cleanwaterproduction","kettle"}),
	   MakeKettles("portablekettle",portable_kettlefn,{"structure","cleanwaterproduction","kettle"}),
	   Prefab("portablekettle_item", item_fn, assets.portablekettle),
	   MakePlacer("kettle_placer", "kettle", "kettle", "idle_empty"),
	   MakePlacer("portablekettle_item_placer", "portablekettle", "portablekettle", "idle_empty")
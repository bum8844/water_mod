-- Upgrade Firepit or Campfire with Camp Kettle
local function install_kettle(inst, setkittle, no_built_callback)
	inst._kettle = SpawnPrefab(setkittle)
	inst:AddChild(inst._kettle)
	inst._kettle.entity:SetParent(inst.entity)
	--inst.components.burnable:OverrideBurnFXBuild("campkettlefire")
	inst.components.burnable:OverrideBurnFXBuild("quagmire_pot_fire")

	inst._kettle._fire = inst

	inst.components.upgradeable.upgradetype = nil
	if inst.components.trader ~= nil then --for compatibility with Heap of Foods
		inst.components.trader:Disable()
	end

	if not no_built_callback then
		inst._kettle:PushEvent("onbuilt")
	else
		if inst.prefab == "firepit" then
			inst._kettle._type = "B"
		else
			inst._kettle._type = "A"
		end
		inst._kettle.AnimState:SetBank("type_"..inst._kettle._type)
	end
end

local function FailUpgrade(inst, performer, upgraded_from_item)
	local refund = SpawnPrefab(upgraded_from_item.prefab)
    if performer ~= nil and performer.components.inventory ~= nil then
		performer.components.inventory:GiveItem(refund, nil)
	else
    	refund.Transform:SetPosition(x,y,z)
	end
	inst.components.upgradeable.upgradetype = UPGRADETYPES.CAMPFIRE
	inst.components.upgradeable.numupgrades = 0
	performer.components.talker:Say(_G.GetActionFailString(performer,"CONSTRUCT","NOTALLOWED"))
end

local function OnUpgrade(inst, performer, upgraded_from_item)
	local numupgrades = inst.components.upgradeable.numupgrades
	local modEnabled = _G.KnownModIndex:IsModEnabled("workshop-2334209327") or _G.KnownModIndex:IsModForceEnabled("workshop-2334209327")
	local traderEnabled = inst.components.trader ~= nil and inst.components.trader.enabled
	local item = upgraded_from_item.prefab
	local setkittle = item == "campkettle_item" and "campkettle" or "campdesalinator"

	if item == "campkettle_item" or "campdesalinator_item" then
		if modEnabled then
			if traderEnabled and numupgrades == 1 then
				install_kettle(inst, setkittle)
			elseif inst.prefab == "campfire" and numupgrades == 1 then
				install_kettle(inst, setkittle)
			else
				FailUpgrade(inst, performer, upgraded_from_item)
			end
		elseif numupgrades == 1 then
			install_kettle(inst, setkittle)
		else
			FailUpgrade(inst, performer, upgraded_from_item)
		end
		return true
	end

	if inst._onupgradefn then
		inst._onupgradefn(inst, performer, upgraded_from_item)
	else
		FailUpgrade(inst, performer, upgraded_from_item)
	end
end

local function OnSave(inst, data)
	local kettle = inst._kettle
	if kettle ~= nil then
		local distiller = kettle.components.distiller
		local boilingtime = distiller.boiling_timer ~= nil and distiller.boiling_timer - GLOBAL.GetTime() or distiller.firetime or 0
		data.kettle =
		{
			prefab = kettle.prefab,
			waterlevel = kettle.components.waterlevel.currentwater,
			watertype = kettle.components.waterlevel.watertype,
			boilingtime = boilingtime > 0 and boilingtime or nil
		}
	else
		data.kettle = nil
	end
end

local function OnLoad(inst, data)
	local numupgrades = inst.components.upgradeable.numupgrades
	if numupgrades ~= 0 then
		if data ~= nil and data.kettle ~= nil then
			local setkittle = data.kettle.prefab
			install_kettle(inst, setkittle, true)
			inst._kettle.components.waterlevel:InitializeWaterLevel(math.max(0, data.kettle.waterlevel))
			inst._kettle.components.waterlevel:SetWaterType(data.kettle.watertype)
			if data.kettle.boilingtime then
				inst._kettle.components.distiller.firetime = data.kettle.boilingtime
				if inst.components.fueled:GetCurrentSection() > 0 then
					inst._kettle.components.distiller:startBoiling(0,true)
				end
			elseif data.kettle.watertype == WATERTYPE.CLEAN and data.kettle.waterlevel > 0 then
				inst._kettle.components.pickable.numtoharvest = inst._kettle.components.waterlevel:GetWater()
				inst._kettle.components.pickable.canbepicked = true
			end
			inst._kettle.components.waterlevel:UtilityCheck(inst._kettle)
		end
	end
end

local function DoDismantle(inst)
	if inst._kettle and inst._kettle:IsValid() and inst._kettle.components.waterlevel:GetWater() ~= 0 then
		inst._kettle.components.portablestructure:Dismantle()
	    inst:RemoveChild(inst._kettle)
	    inst.components.burnable:OverrideBurnFXBuild("campfire_fire")
	end
end

local function AutoDismantle(inst)
	if inst._kettle and inst._kettle:IsValid() then
		inst._kettle.components.portablestructure:Dismantle()
	    inst:RemoveChild(inst._kettle)
	end
end

AddPrefabPostInit("campfire",function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("upgradeable")
	inst.components.upgradeable.upgradetype = UPGRADETYPES.CAMPFIRE
	inst.components.upgradeable.onupgradefn = OnUpgrade

	inst.OnLoad = OnLoad
	inst.OnSave = OnSave

	inst:ListenForEvent("onextinguish", AutoDismantle)
end)

local function onhammered(inst, worker, ...)
	if inst._kettle and inst._kettle:IsValid() then
		inst._kettle.components.portablestructure:Dismantle()
	    inst:RemoveChild(inst._kettle)
	end
	return inst.components.workable.old_onfinish(inst, worker, ...)
end

local function startboil(inst)
	if inst._kettle ~= nil and inst._kettle:IsValid() and inst._kettle.components.waterlevel:GetWater() ~= 0 and inst._kettle.components.waterlevel.watertype ~= WATERTYPE.CLEAN then
		inst._kettle.components.distiller:startBoiling(inst._kettle.components.waterlevel:GetWater()*2, true)
	end
end

local function stopboil(inst)
	if inst._kettle ~= nil and inst._kettle:IsValid() then
		inst._kettle.components.distiller:stopBoiling(0, true)
	end
end

AddPrefabPostInit("firepit",function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end

    if inst.components.workable.onfinish ~= nil and inst.components.workable.old_onfinish == nil then
       	inst.components.workable.old_onfinish = inst.components.workable.onfinish
       	inst:DoTaskInTime(0,function()
    	inst.components.workable:SetOnFinishCallback(onhammered)
       	end)
    end

    if inst.components.upgradeable and inst.components.upgradeable.onupgradefn then
		inst._onupgradefn = inst.components.upgradeable.onupgradefn
	end

	inst:AddComponent("upgradeable")
	inst.components.upgradeable.upgradetype = UPGRADETYPES.CAMPFIRE
 	inst.components.upgradeable.onupgradefn = OnUpgrade

	inst.left_timer = 0

	inst.OnLoad = OnLoad
	inst.OnSave = OnSave

	inst:ListenForEvent("onextinguish", stopboil)
	inst:ListenForEvent("onignite", startboil)
end)

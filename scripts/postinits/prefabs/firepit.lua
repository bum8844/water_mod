-- Upgrade Firepit or Campfire with Camp Kettle
local function install_kettle(inst, no_built_callback)
	inst._kettle = SpawnPrefab("campkettle")

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
	end
end

local function OnUpgrade(inst, performer, upgraded_from_item)
	local numupgrades = inst.components.upgradeable.numupgrades
	if numupgrades == 1 then
		install_kettle(inst)
	end
end

local function OnSave(inst, data)
	local kettle = inst._kettle
	if kettle ~= nil then
		data.kettle =
		{
			waterlevel = kettle.components.waterlevel.currentwater,
			watertype = kettle.components.waterlevel.watertype,
			boil_timer = kettle._timer,
		}
	else
		data.kettle = nil
	end
end

local function OnLoad(inst, data)
	if data.kettle ~= nil then
		install_kettle(inst)
		inst._kettle.components.waterlevel:InitializeWaterLevel(math.max(0, data.kettle.waterlevel))
		inst._kettle.components.waterlevel:SetWaterType(data.kettle.watertype)
		inst._kettle._timer = data.kettle.boil_timer
		inst._kettle:doboil()
	end
end

local function DoDismantle(inst)
	if inst._kettle and inst._kettle:IsValid() then
		inst._kettle.components.portablestructure:Dismantle()
	    inst:RemoveChild(inst._kettle)
	    inst.components.burnable:OverrideBurnFXBuild("campfire_fire")
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

	inst:ListenForEvent("onextinguish", DoDismantle)
end)

local function startboil(inst)
	if inst._kettle ~= nil and inst._kettle:IsValid() then
		inst._kettle:doboil()
	end
end

local function stopboil(inst)
	if inst._kettle ~= nil and inst._kettle:IsValid() then
		inst._kettle:stopboil()
	end
end

AddPrefabPostInit("firepit",function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("upgradeable")
	inst.components.upgradeable.upgradetype = UPGRADETYPES.CAMPFIRE
	inst.components.upgradeable.onupgradefn = OnUpgrade

	inst.OnLoad = OnLoad
	inst.OnSave = OnSave

	inst:ListenForEvent("onextinguish", stopboil)
	inst:ListenForEvent("onignite", startboil)
end)

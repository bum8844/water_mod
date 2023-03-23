local assets =
{
	Asset("ANIM", "anim/well_sprinkler_pipes.zip")
}

local prefabs =
{
}

local function HideLayers(inst)

    inst.AnimState:Hide("joint")
    inst.AnimState:Hide("pipe")
	local rays = {1, 2, 3}
    for i = 1, #rays, 1 do
        inst.AnimState:Hide("joint_"..i)
        inst.AnimState:Hide("pipe_"..i)
    end
end

local function OnSave(inst, data)
	data.jointLayerShown = inst.jointLayerShown
	data.pipeLayerShown = inst.pipeLayerShown
end

local function OnLoad(inst, data)
	if data ~= nil then
		inst.jointLayerShown = data.jointLayerShown
		inst.pipeLayerShown = data.pipeLayerShown
	end
end

local function ShowRandomLayers(inst)

	if not inst.jointLayerShown then
		inst.jointLayerShown = "joint_"..math.random(1,3)
		if inst.jointLayerShown == "joint_1" then
			inst.jointLayerShown = "joint"
		end
	end

	if not inst.pipeLayerShown then
		inst.pipeLayerShown = "pipe_"..math.random(1,3)
		if inst.pipeLayerShown == "pipe_1" then
			inst.pipeLayerShown = "pipe"
		end
	end

	inst.AnimState:Show(inst.jointLayerShown)
	inst.AnimState:Show(inst.pipeLayerShown)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	inst.AnimState:SetBank("well_sprinkler_pipes")
	inst.AnimState:SetBuild("well_sprinkler_pipes")

	inst.AnimState:PlayAnimation("place")
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    HideLayers(inst)
	ShowRandomLayers(inst)

	inst.OnSave = OnSave 
    inst.OnLoad = OnLoad
	
	inst:SetStateGraph("SGwell_sprinkler_pipes")

	return inst
end

return Prefab("well_water_pipe", fn, assets, prefabs)
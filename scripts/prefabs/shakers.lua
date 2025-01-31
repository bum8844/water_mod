require "prefabutil"

local assets = {
	cobbler_shaker = {
		Asset("ANIM", "anim/cobbler_shaker.zip"),
	},
	boston_shaker = {
		Asset("ANIM", "anim/boston_shaker.zip"),
	},
}

local function OnOpen(inst,data)
	inst.components.cocktailmaker:SetOwner(data.doer)
    inst.SoundEmitter:PlaySound("meta3/wigfrid/battlesong_container_open")
    inst.AnimState:PlayAnimation("open")
    inst.components.inventoryitem:ChangeImageName(inst.prefab.."_open")
end

local function OnClose(inst)
	if not inst.components.cocktailmaker:IsShaking() then
		inst.components.cocktailmaker:SetOwner()
	end
	inst.SoundEmitter:PlaySound("meta3/wigfrid/battlesong_container_close")
    inst.components.inventoryitem:ChangeImageName()
    if not inst.components.inventoryitem:IsHeld() then
        inst.AnimState:PlayAnimation("close")
        inst.AnimState:PushAnimation("closed", false)
    else
        inst.AnimState:PlayAnimation("closed", false)
    end
end

local function OnPutInInventory(inst, owner)
	inst.components.cocktailmaker:SetCanMakeCocktail(true)
    inst.components.container:Close()
    inst.AnimState:PlayAnimation("closed", false)
end

local function OnDropped(inst)
	inst.components.cocktailmaker:SetCanMakeCocktail(false)
end

local function MakeShaker(name,isadvanced)

	local function fn()
		local inst = CreateEntity()

		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddMiniMapEntity()
		inst.entity:AddSoundEmitter()
    	inst.entity:AddNetwork()

	    MakeInventoryPhysics(inst)

	    MakeInventoryFloatable(inst, "small", 0.35, 1.15, nil, nil, { bank = name.."_shaker", anim = "closed" })

	    inst:AddTag("portablestorage")

	    if isadvanced then
			inst:AddTag("mastercookware")
		end

        inst.minisign_atlas = "minisign_dehy_items_swap"

        inst.AnimState:SetBuild(name.."_shaker")
        inst.AnimState:SetBank(name.."_shaker")
        inst.AnimState:PlayAnimation("closed")

		inst.entity:SetPristine()
		
	    if not TheWorld.ismastersim then
	        return inst
	    end

	    inst:AddComponent("inspectable")

		inst:AddComponent("cocktailmaker")

		inst:AddComponent("container")
		inst.components.container:WidgetSetup(name.."_shaker")
	    inst.components.container.onopenfn = OnOpen
	    inst.components.container.onclosefn = OnClose
	    inst.components.container.skipclosesnd = true
	    inst.components.container.skipopensnd = true
	    inst.components.container.droponopen = true

	    inst:AddComponent("inventoryitem")
	    inst.components.inventoryitem:ChangeImageName("battlesong_container")
	    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPutInInventory)
	    inst.components.inventoryitem:SetOnDroppedFn(OnDropped)

	    MakeHauntableLaunchAndDropFirstItem(inst)

		return inst
	end

	return Prefab(name.."_shaker",fn,assets[name.."_shaker"])
end

return MakeShaker("cobbler"),
	   MakeShaker("boston",true)
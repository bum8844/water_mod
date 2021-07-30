local assets =
{
	Asset("ANIM", "anim/tee.zip"),
	Asset("IMAGE", "images/water_images.tex"),
    Asset("ATLAS", "images/water_images.xml"),
    Asset("ATLAS", "images/inventoryimages/tee.xml"),
	Asset("IMAGE", "images/inventoryimages/tee_r.tex"),
	Asset("ATLAS", "images/inventoryimages/tee_r.xml"),
	Asset("IMAGE", "images/inventoryimages/tea_berry.tex"),
	Asset("ATLAS", "images/inventoryimages/tea_berry.xml"),
	Asset("IMAGE", "images/inventoryimages/tea_carrot.tex"),
	Asset("ATLAS", "images/inventoryimages/tea_carrot.xml"),
	Asset("IMAGE", "images/inventoryimages/tea_cactus.tex"),
	Asset("ATLAS", "images/inventoryimages/tea_cactus.xml"),
	Asset("IMAGE", "images/inventoryimages/tea_banana.tex"),
	Asset("ATLAS", "images/inventoryimages/tea_banana.xml"),
	Asset("IMAGE", "images/inventoryimages/tea_honey.tex"),
	Asset("ATLAS", "images/inventoryimages/tea_honey.xml"),
}


local function tea_common()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tee")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tee.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_g()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("ghost")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tee_g")
    inst.components.inventoryitem.atlasname = "images/water_images.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_m()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("s_m")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	
	inst:AddTag("bundle")

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tee_m")
    inst.components.inventoryitem.atlasname = "images/water_images.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_s()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("s")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tee__s")
    inst.components.inventoryitem.atlasname = "images/water_images.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_r()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("red")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tee_r")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tee_r.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_r2()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("red2")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tee_r")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tee_r.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_berry()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("berry")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tea_berry")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tea_berry.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_carrot()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("carrot")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tea_carrot")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tea_carrot.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_cactus()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("cactus")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tea_cactus")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tea_cactus.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_banana()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("banana")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tea_banana")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tea_banana.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

local function tea_honey()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)	

    inst.AnimState:SetBuild("tee")
    inst.AnimState:SetBank("tee")
    inst.AnimState:PlayAnimation("honey")
	
	inst:AddTag("kettlebrew")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	
	inst:AddComponent("tradable")
	
	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddTag("show_spoilage")
	

    inst:AddComponent("inventoryitem")

    inst.replica.inventoryitem:SetImage("tea_honey")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tea_honey.xml"

    MakeHauntableLaunchAndSmash(inst)

    return inst
end

return Prefab("tee", tea_common, assets),
	   Prefab("tee_g", tea_g, assets),
	   Prefab("tee_m", tea_m, assets),
	   Prefab("tee_s", tea_s, assets),
	   Prefab("tee_r", tea_r, assets),
	   Prefab("tee_r2", tea_r2, assets),
	   Prefab("tea_berry", tea_berry, assets),
	   Prefab("tea_carrot", tea_carrot, assets),
	   Prefab("tea_cactus", tea_cactus, assets),
	   Prefab("tea_banana", tea_banana, assets),
	   Prefab("tea_honey", tea_honey, assets)

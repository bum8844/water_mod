local prefabs =
{
    water_clean = 
    {
        "water_dirty",
        "water_clean_ice",
    },

    water_clean_ice =
    {
        "water_clean",
        "water_dirty_ice",
    },

    water_dirty_ice =
    {
        "wetgoop",
    },
}   

local function Get_Waterborne_Disease(inst, eater)
    if TUNING.ENABLE_WATERBORNE and not eater:HasTag("waterborne_immune") and
        eater:HasTag("player") and not eater:HasTag("playerghost") then
        eater:AddDebuff("waterbornedebuff", "waterbornedebuff")
    end
end

local function OnTake(inst, taker, delta)
    local stacksize = math.clamp(math.floor(delta/TUNING.CUP_MAX_LEVEL), 1, inst.components.stackable:StackSize())

    if inst.components.stackable:IsStack() then
        inst.components.stackable:Get(stacksize):Remove()
    else
        inst:Remove()
    end
end

local function TransferComponents(inst, newinst, num)
    local moisture = inst.components.inventoryitem:GetMoisture()
    local iswet = inst.components.inventoryitem:IsWet()
    local spoilage = inst.components.perishable  and inst.components.perishable:GetPercent()
    local stacksize = num or
        (inst.components.stackable and
        inst.components.stackable:IsStack() and
        inst.components.stackable:StackSize())
        or nil

    if stacksize and newinst.components.stackable then
        newinst.components.stackable:SetStackSize(stacksize)
    end
    if inst.components.temperature and newinst.components.temperature then
        inst.components.temperature:TransferComponent(newinst)
    end
    if inst.components.perishable and newinst.components.perishable then
        local spoilage = inst.components.perishable:GetPercent()
        newinst.components.perishable:SetPercent(spoilage)
    end
    inst.components.inventoryitem:InheritMoisture(moisture, iswet)
end

local function ChangeItem(original_inst, prefab)
    local x,y,z = original_inst.Transform:GetWorldPosition()

    local replacement_inst = SpawnPrefab(prefab)
    TransferComponents(original_inst, replacement_inst)
    replacement_inst.Transform:SetPosition(x,y,z)

    original_inst:Remove()

    return replacement_inst
end

local function onperish(inst, item)
    if inst.components.temperature and item ~= nil and item.components.temperature then
        inst.components.temperature:TransferComponent(item)
    end
end 

-------- Solids --------
local function MakeDone(new_item, container, pos, owner, doer)
    if container ~= nil then
        container:GiveItem(new_item,nil,owner:GetPosition())
    else
        new_item.Physics:Teleport(pos:Get())
        new_item.components.inventoryitem:OnDropped(true, .5)
    end
    doer.SoundEmitter:PlaySound("dontstarve/common/bush_fertilize")
end

local function MakeItem(inst, item, pos, doer)
    local stacksize = (inst.components.stackable and inst.components.stackable:StackSize()) or 1
    local moisture = inst.components.inventoryitem:GetMoisture()
    local iswet = inst.components.inventoryitem:IsWet()
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner() or nil
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil

    local num_def

    while stacksize > 0 do
        local new_item = SpawnPrefab(item)
        num_def = math.min(stacksize, new_item.components.stackable and new_item.components.stackable.maxsize or 1)

        TransferComponents(inst, new_item, num_def)
        MakeDone(new_item, container, pos, owner, doer)
        --print("num = "..tostring(stacksize).." num_def = "..tostring(num_def)..": 만약 이 문구가 도배되고 있다면 루프에 문제가 생긴 것입니다")
        stacksize = stacksize - num_def
    end
end 

local function OnUnwrapped(inst, pos, doer)
    local item = inst:HasTag("dirty") and "wetgoop" or "ice"
    MakeItem(inst, item, pos, doer)
    inst:Remove()
end
---------------------------
local function doThaw(inst)
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner()
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local item = string.gsub(inst.prefab, "_ice", "")

    local newinst = ChangeItem(inst, item)
    if container ~= nil then
        container:GiveItem(newinst)
    else
        local watertype = inst:HasTag("dirty") and "_dirty" or ""
        newinst.AnimState:PlayAnimation("turn_to_full"..watertype)
        newinst.AnimState:PushAnimation("idle")
    end
end

local function ThawToWater(inst, data)
    local cur_temp = inst.components.temperature:GetCurrent()
    --local min_temp = inst.componnets.temperature.mintemp
    local max_temp = inst.components.temperature.maxtemp
    if cur_temp >= max_temp then
        doThaw(inst)
    end
end

local function common_solid(inst)

    inst:AddComponent("unwrappable")
    inst.components.unwrappable:SetOnUnwrappedFn(OnUnwrapped)

    --기온이 녹는점 이상이면 잠시 유예시간을 주도록 설정
    inst:AddComponent("temperature")
    inst.components.temperature.current = math.min(TheWorld.state.temperature, TUNING.WATER_FROZEN_INITTEMP)
    inst.components.temperature.maxtemp = TUNING.WATER_INITTEMP
    inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
    inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE

    inst:ListenForEvent("temperaturedelta", ThawToWater)
end

-------- Liquids --------
local function doFreeze(inst)
    local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem:GetGrandOwner()
    local container = owner ~= nil and (owner.components.inventory or owner.components.container) or nil
    local item = inst.prefab.."_ice"
    --print("'"..inst.prefab.."' has generated '"..item.."'")

    local newinst = ChangeItem(inst, item)
    if container ~= nil then
        container:GiveItem(newinst)
    else
        local watertype = inst:HasTag("dirty") and "_dirty" or ""
        newinst.AnimState:PlayAnimation("turn_to_ice"..watertype)
        newinst.AnimState:PushAnimation("idle")
    end
end

--혹시 확장해야 할 필요가 있을지 모르니 로컬 변수를 남겨둡니다
local function FreezeToIce(inst, data)
    local cur_temp = inst.components.temperature:GetCurrent()
    local min_temp = inst.components.temperature.mintemp
    --local max_temp = inst.components.temperature.maxtemp
    if cur_temp <= min_temp then
        doFreeze(inst)
    end
end

local function common_liquid(inst)

    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.GOODIES

    --기온이 어는점 이하이면 잠시 유예시간을 주도록 설정
    inst:AddComponent("temperature")
    inst.components.temperature.current = math.max(TheWorld.state.temperature, TUNING.WATER_INITTEMP)
    inst.components.temperature.mintemp = TUNING.WATER_FROZEN_INITTEMP
    inst.components.temperature.inherentinsulation = TUNING.INSULATION_MED_LARGE
    inst.components.temperature.inherentsummerinsulation = TUNING.INSULATION_MED_LARGE

    inst.components.watersource.available = true

    inst:ListenForEvent("temperaturedelta", FreezeToIce)
end
---------------------------
local function cleanwater(inst)
    common_liquid(inst)

    inst.components.edible.healthvalue = 0
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = 0
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SMALLTINY
    inst.components.edible.degrades_with_spoilage = false

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onreplacedfn = onperish
    inst.components.perishable.onperishreplacement = "water_dirty"

    inst.components.water:SetWaterType(WATERTYPE.CLEAN)
end

local function dirtywater(inst)
    common_liquid(inst)
    inst.components.edible.healthvalue = -TUNING.HEALING_TINY
    inst.components.edible.hungervalue = 0
    inst.components.edible.sanityvalue = -TUNING.SANITY_MED
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SUPERTINY
    inst.components.edible:SetOnEatenFn(Get_Waterborne_Disease)

    inst.components.water:SetWaterType(WATERTYPE.DIRTY)
end

local function saltywater(inst)
    --소금물은 상당히 이레귤러라서 직접 넣어줬습니다
    inst:AddComponent("edible")
    inst.components.edible.foodtype = FOODTYPE.GOODIES
    inst.components.edible.healthvalue = -TUNING.HEALING_TINY
    inst.components.edible.hungervalue = -TUNING.DRINK_CALORIES
    inst.components.edible.sanityvalue = -TUNING.SANITY_MEDLARGE
    inst.components.edible.thirstvalue = TUNING.HYDRATION_SALT

    inst.components.water:SetWaterType(WATERTYPE.SALTY)
end

local function cleanice(inst)
    common_solid(inst)

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable:SetOnPerishFn(onperish)
    inst.components.perishable.onperishreplacement = "water_dirty_ice"

    inst.components.water:SetWaterType(WATERTYPE.CLEAN_ICE)
end

local function dirtyice(inst)
    common_solid(inst)

    inst.components.water:SetWaterType(WATERTYPE.DIRTY_ICE)
end

local function MakeWaterItem(name, masterfn, tags, _prefabs)
	local assets =
	{
		Asset("ANIM", "anim/kettle_drink.zip"),
		Asset("ANIM", "anim/kettle_drink_bottle.zip"),
	}

    local prefabs = _prefabs or nil

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("kettle_drink")
        inst.AnimState:SetBuild("kettle_drink")
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap", "kettle_drink", name)

        if tags ~= nil then
            for k, v in ipairs(tags) do
                inst:AddTag(v)
            end
        end

        MakeInventoryFloatable(inst)

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("smotherer")

        inst:AddComponent("inspectable")

        inst:AddComponent("water")
        inst.components.water.watervalue = TUNING.CUP_MAX_LEVEL
        inst.components.water:SetOnTakenFn(OnTake)

        inst:AddComponent("watersource")
        inst.components.watersource.available = false

        inst:AddComponent("inventoryitem")

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_TINYITEM

        inst:AddComponent("tradable")
        MakeHauntableLaunchAndPerish(inst)
        MakeDynamicCupImage(inst, "swap", "kettle_drink")

        if masterfn ~= nil then
            masterfn(inst)
        end

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

return MakeWaterItem("water_clean", cleanwater, {"show_spoilage", "icebox_valid","clean","farm_water","pre-prepareddrink","potion","drink"}, prefabs.water_clean),
    MakeWaterItem("water_dirty", dirtywater, {"show_spoiled", "icebox_valid","dirty","farm_water","drink"}),
    MakeWaterItem("water_salty", saltywater, {"salty","drink"}),
    MakeWaterItem("water_clean_ice", cleanice, {"show_spoilage", "icebox_valid","clean","frozen","unwrappable"}, prefabs.water_clean_ice),
    MakeWaterItem("water_dirty_ice", dirtyice, {"show_spoiled", "icebox_valid","dirty","frozen","unwrappable"}, prefabs.water_dirty_ice)

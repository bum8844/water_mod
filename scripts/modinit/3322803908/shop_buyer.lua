local SHOPTYPES = require("prefabs/pig_shop_defs").SHOPTYPES
local list = {
	"greentea",
	"blacktea",
	"hibiscustea",
	"fuer",
	"carrot_tea",
	"lumpy_tea",
	"watermelon_juice",
	"dragonjuice",
}

local function CheckList(prefab)
	for k, v in pairs(list) do
		if prefab == v then
			return true
		end
	end
	return false
end

AddComponentPostInit("shopped",function(self)
	function self:SetItemToSell(prefab, slot, imgname)
	    local old = self:RemoveItemToSell(slot)
	    if old then
	        old:Remove()
	    end

	    local item = SpawnPrefab(prefab)
	    if imgname then
	    	item.components.inventoryitem:ChangeImageName(imgname)
	    end
	    self.inst.components.container:GiveItem(item, slot)
	end
end)

local function GetNewProduct(inst)
    if not inst.shop_type then
        return
    end
    local items = TheWorld.state.isfiesta and SHOPTYPES[inst.shop_type .. "_fiesta"] or SHOPTYPES[inst.shop_type]
    if items then
        return GetRandomItem(items)
    end
end

local function SpawnInventory(inst, prefab, costprefab, cost)

	local islist = CheckList(prefab)
	local imgname = nil

	if islist then
		imgname = prefab.."_bottle"
	end

    inst.components.shopped:SetCost(costprefab, cost)
    inst.components.shopped:SetItemToSell(prefab, 1, imgname)
end

local function InitShop(inst, shop_type)
    inst.shop_type = shop_type
    local itemset = inst.saleitem or GetNewProduct(inst)

    SpawnInventory(inst, itemset[1], itemset[2], itemset[3])
end

local function Restock(inst, force)
    if inst:HasTag("nodailyrestock") then
        -- print("NO DAILY RESTOCK")
        return
    elseif inst:HasTag("robbed") then
        inst.components.shopped:SetCost("cost-nil", nil)
        inst:MakeShopkeeperSpeech("CITY_PIG_SHOPKEEPER_ROBBED")
    elseif force or (inst:IsAsleep() and not inst:HasTag("justsellonce") and (not inst.components.shopped:GetItemToSell() or math.random() < 0.16)) then
        local newproduct = inst.saleitem or GetNewProduct(inst)

        SpawnInventory(inst, newproduct[1], newproduct[2], newproduct[3])
    end
end

local function OnItemGet(inst, data)
    if data and data.item and data.item.components.perishable then
        data.item.components.perishable:StopPerishing()
        local islist = CheckList(data.item.prefab)
		if islist then
			local name = data.item.prefab.."_bottle"
			data.item.components.inventoryitem:ChangeImageName(name)
		end
    end
end

local function OnItemLose(inst, data)
    if data and data.prev_item and data.prev_item.components.perishable then
        data.prev_item.components.perishable:StartPerishing()
        local islist = CheckList(data.prev_item.prefab)
		if islist then
			local stack = data.prev_item.components.stackable.stacksize
			data.prev_item.components.stackable:SetStackSize(stack+4)
		end
    end
end

AddPrefabPostInit("shop_buyer",function(inst)
	inst.InitShop = InitShop
	inst.Restock = Restock
	inst:ListenForEvent("itemget", OnItemGet)
	inst:ListenForEvent("itemlose", OnItemLose)
	inst:WatchWorldState("cycles", function() inst:Restock() end)
	inst:WatchWorldState("isfiesta", function() inst:Restock() end)
end)
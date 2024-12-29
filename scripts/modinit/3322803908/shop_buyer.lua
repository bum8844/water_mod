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
	function self:SetItemToSell(prefab, slot)
	    local old = self:RemoveItemToSell(slot)
	    if old then
	        old:Remove()
	    end

		local islist = CheckList(prefab)

	    local item = SpawnPrefab(prefab)
	    if islist then
	    	item.components.inventoryitem:ChangeImageName(prefab.."_bottle")
	    end
	    self.inst.components.container:GiveItem(item, slot)
	end
end)

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
	inst:ListenForEvent("itemget", OnItemGet)
	inst:ListenForEvent("itemlose", OnItemLose)
end)
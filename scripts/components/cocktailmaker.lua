local cooking = require("cooking")
local boilling = require("boilling")

local function oncanmakecocktail(self, set)
	self.inst.replica.cocktailmaker:SetCanShack(set)
end

local function ondone(self, done)
    if done then
        self.inst:AddTag("doneshaking")
    else
        self.inst:RemoveTag("doneshaking")
    end
end

local function oncheckready(inst)
	if inst.components.cocktailmaker.canmakecocktail and 
		inst.components.container ~= nil and
        not inst.components.container:IsOpen() and
        inst.components.container:IsFull() then
		inst:AddTag("readymakecocktail")
	else
		inst:RemoveTag("readymakecocktail")
	end
end

local CocktailMaker = Class(function(self, inst)
	self.inst = inst

	self.inst:AddTag("cocktailmaker")

	self.done = nil
	self.shaking = nil
	self.shakerowner = nil
	self.canmakecocktail = false
	self.targettime = nil

	self.task = nil
    self.product = nil
    self.product_spoilage = nil
    self.spoiledproduct = "spoiled_drink"
    self.spoiltime = nil

    self.onspoil = nil

	self.chef_id = nil
	self.ingredient_prefabs = nil

    self.inst:ListenForEvent("itemget", oncheckready)
    self.inst:ListenForEvent("onclose", oncheckready)

    self.inst:ListenForEvent("itemlose", oncheckready)
    self.inst:ListenForEvent("onopen", oncheckready)

end,
nil,
{
	canmakecocktail = oncanmakecocktail,
	done = ondone,
})

local function dospoil(inst, self)
    self.task = nil
    self.targettime = nil
    self.spoiltime = nil
    self.product = self.spoiledproduct

    if self.onspoil ~= nil then
        self.onspoil(inst)
    end
end

function CocktailMaker:SetCanMakeCocktail(bool)
	self.canmakecocktail = bool
end

function CocktailMaker:IsShaking()
	return self.shaking
end

function CocktailMaker:DoShaking(bool)
	self.shaking = bool
end

function CocktailMaker:SetOwner(owner)
	local old_owner = self.shakerowner

	if old_owner and old_owner.components.craftbartender then
		old_owner.components.craftbartender:SetShaker()
	end

	self.shakerowner = owner

	if self.shakerowner and self.shakerowner.components.craftbartender then
		self.shakerowner.components.craftbartender:SetShaker(self.inst)
	end
end

function CocktailMaker:CanShaking()
    return self.inst.components.container ~= nil and self.inst.components.container:IsFull()
end

function CocktailMaker:SetCocktail(doer)
	if self.inst.components.container ~= nil then
		self.chef_id = (doer ~= nil and doer.player_classified ~= nil) and doer.userid
		self.ingredient_prefabs = {}

        self.done = nil
        self.spoiltime = nil

		for k, v in pairs (self.inst.components.container.slots) do
			table.insert(self.ingredient_prefabs, v.prefab)
		end

		local _ = 1

        self.product, _ = cooking.CalculateRecipe(self.inst.prefab, self.ingredient_prefabs)
        local productperishtime = cooking.GetRecipe(self.inst.prefab, self.product).perishtime or 0

        if productperishtime > 0 then
			local spoilage_total = 0
			local spoilage_n = 0
			for k, v in pairs (self.inst.components.container.slots) do
				if v.components.perishable ~= nil then
					spoilage_n = spoilage_n + 1
					spoilage_total = spoilage_total + v.components.perishable:GetPercent()
				end
			end
            self.product_spoilage =
                (spoilage_n <= 0 and 1) or
                (self.keepspoilage and spoilage_total / spoilage_n) or
                1 - (1 - spoilage_total / spoilage_n) * .5
		else
			self.product_spoilage = nil
		end

	    if self.product == self.spoiledproduct then
	        if self.onspoil ~= nil then
	            self.onspoil(self.inst)
	        end
	    elseif self.product ~= nil then
	        local recipe = cooking.GetRecipe(self.inst.prefab, self.product)
	        local prep_perishtime = (recipe ~= nil and (recipe.cookpot_perishtime or recipe.perishtime)) or 0
	        if prep_perishtime > 0 then
				local prod_spoil = self.product_spoilage or 1
				self.spoiltime = prep_perishtime * prod_spoil
				self.targettime =  GetTime() + self.spoiltime
				self.task = self.inst:DoTaskInTime(self.spoiltime, dospoil, self)
			end
	    end

	    self.inst.components.container:DestroyContents()
	    self.done = true
	    self:SetOwner()
	    self:DoShaking()
	end
end

function CocktailMaker:Harvest(harvester)
    if self.done then
        if self.onharvest ~= nil then
            self.onharvest(self.inst)
        end

        if self.product ~= nil then
            local loot = SpawnPrefab(self.product)
            if loot ~= nil then
				local recipe = boilling.GetRecipe(self.inst.prefab, self.product)

				if harvester ~= nil and
					self.chef_id == harvester.userid and
					recipe ~= nil and
					recipe.boilbook_category ~= nil and
					boilling.boilbook_recipes[recipe.boilbook_category] ~= nil and
					boilling.boilbook_recipes[recipe.boilbook_category][self.product] ~= nil then
					harvester:PushEvent("learncookbookrecipe", {product = self.product, ingredients = self.ingredient_prefabs})
                end

                if self.spoiltime ~= nil and loot.components.perishable ~= nil then
                    local spoilpercent = self:GetTimeToSpoil() / self.spoiltime
                    loot.components.perishable:SetPercent(self.product_spoilage * spoilpercent)
                    loot.components.perishable:StartPerishing()
                end
                if harvester ~= nil and harvester.components.inventory ~= nil then
                    harvester.components.inventory:GiveItem(loot, nil, self.inst:GetPosition())
                else
                    LaunchAt(loot, self.inst, nil, 1, 1)
                end
            end
            self.product = nil
        end

        if self.task ~= nil then
            self.task:Cancel()
            self.task = nil
        end
        self.targettime = nil
        self.done = nil
        self.spoiltime = nil
        self.product_spoilage = nil

        if self.inst.components.container ~= nil then
            self.inst.components.container.canbeopened = true
        end

        return true
    end
end

function CocktailMaker:OnSave()
    local remainingtime = self.targettime ~= nil and self.targettime - GetTime() or 0
    return
    {
    	owner = self.shakerowner,
        product = self.product,
        product_spoilage = self.product_spoilage,
        spoiltime = self.spoiltime,
        remainingtime = remainingtime > 0 and remainingtime or nil,

		chef_id = self.chef_id,
		ingredient_prefabs = self.ingredient_prefabs,
    }
end

function CocktailMaker:OnLoad(data)
	if data.owner then
		self:SetOwner(owner)
	end

    if data.product ~= nil then
    	self.done = true
		self.chef_id = data.chef_id
		self.ingredient_prefabs = data.ingredient_prefabs
 
        self.product = data.product
        self.product_spoilage = data.product_spoilage
        self.spoiltime = data.spoiltime

        if self.task ~= nil then
            self.task:Cancel()
            self.task = nil
        end
        self.targettime = nil

        if data.remainingtime ~= nil then
            self.targettime = GetTime() + math.max(0, data.remainingtime)
            self.task = self.inst:DoTaskInTime(data.remainingtime, dospoil, self)
		end

        if self.inst.components.container ~= nil then
            self.inst.components.container.canbeopened = false
        end
    end
end

return CocktailMaker

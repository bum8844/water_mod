AddComponentPostInit("stewer",function(self, inst)
	local cooking = require("cooking")
	local _Harvest = self.Harvest

	if self.inst:HasTag("drinkproduction") then
		function self:Harvest(harvester)
		    if self.done then
		        if self.onharvest ~= nil then
		            self.onharvest(self.inst)
		        end

		        if self.product ~= nil then
		            local loot = SpawnPrefab(self.product)
		            if loot ~= nil then
						local recipe = cooking.GetRecipe(self.inst.prefab, self.product)

						if harvester ~= nil and
							self.chef_id == harvester.userid and
							recipe ~= nil and
							recipe.cookbook_category ~= nil and
							cooking.cookbook_recipes[recipe.cookbook_category] ~= nil and
							cooking.cookbook_recipes[recipe.cookbook_category][self.product] ~= nil then
							harvester:PushEvent("learncookbookrecipe", {product = self.product, ingredients = self.ingredient_prefabs})
						end

						local stacksize = self.inst.components.waterlevel and self.inst.components.waterlevel:GetWater() or 1
						if stacksize > 1 then
							loot.components.stackable:SetStackSize(stacksize)
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
	else
		return _Harvest(self)
	end
end)
local Color = require("helpers/color")

local function EscapeRichText(str)
	return str:gsub("<", "&lt;"):gsub(">", "&gt;")
end

local function CombineLines(...)
	local lines, argnum = nil, select("#",...)

	for i = 1, argnum do
		local v = select(i, ...)
		
		if v ~= nil then
			lines = lines or {}
			lines[#lines+1] = tostring(v)
		end
	end

	return (lines and table.concat(lines, "\n")) or nil
end

local function Descriptors()
	Insight.descriptors.brewing = {
		Describe = function(self, context)

			local cooking = require("cooking")

			local function GetRecipe(cooker, product)
				if cooking.GetRecipe then
					return cooking.GetRecipe(cooker, product)
				end

				local recipes = cooking.recipes[cooker] or {}
				return recipes[product]
			end

			local function GetChef(self)
				if self.chef_id then -- dst check implicit
					local client = TheNet:GetClientTableForUser(self.chef_id)
					
					if client then
						client.colour = Color.ToHex(client.colour)
						return client
					end

					client = {
						name = "??",
						colour = "#555555",
					}

					return client
				end

				return nil
			end

			local function GetCookTimeModifier(self)
				if not self.cooktimemult then
					return 0
				end

				return 1 - self.cooktimemult
			end

			local function GetRecipeInfo(recipe)
				local data = {
					basename = recipe.basename or recipe.name,
					spice = recipe.spice,
					name = recipe.name,
				}
				return data
			end

			local function Describe(self, context)

				local description, food, chef_string, cook_time_string
				local cooktime = self:GetTimeToCook()

				local is_authentic = self.GetTimeToCook == require("components/brewing").GetTimeToCook

				if not (is_authentic) then
					return
				end

				local cook_time_modifier = GetCookTimeModifier(self)
				if cook_time_modifier < 0 then
					cook_time_string = string.format(context.lstr.stewer.cooktime_modifier_slower, math.abs(cook_time_modifier) * 100)
				elseif cook_time_modifier > 0 then
					cook_time_string = string.format(context.lstr.stewer.cooktime_modifier_faster, cook_time_modifier * 100)
				end

				if self.done or cooktime > 0 then -- IsDone() missing in DS, exists in DLC
					local chef = context.config["stewer_chef"] and GetChef(self)
					if chef then
						chef_string = string.format(context.lstr.stewer.cooker, chef.colour, EscapeRichText(chef.name))
					end

					cooktime = math.ceil(cooktime)

					local recipe = GetRecipe(self.inst.prefab, self.product)

					if not recipe then
						local base_food_string = context.usingIcons and PrefabHasIcon(self.product) and context.lstr.stewer.product or context.lstr.lang.stewer.product
						food = string.format(base_food_string, self.product, "?")
					else
						local data = GetRecipeInfo(recipe)
                		local waterlevel = self.inst.components.waterlevel and self.inst.components.waterlevel:GetWater() or 1
                		local stacksize = self.usedistill and math.floor(self.distill_stack*self.reduce) or math.ceil(waterlevel/self.reduce)

						if context.usingIcons and PrefabHasIcon(data.name) then -- self.product
							local base_food_string = cooktime > 0 and context.lstr.stewer.cooktime_remaining or context.lstr.stewer.product
							food = string.format(base_food_string, data.name, stacksize, cooktime)
						else
							local base_food_string = cooktime > 0 and context.lstr.lang.stewer.cooktime_remaining or context.lstr.lang.stewer.product
							food = string.format(base_food_string, data.name, stacksize, cooktime)
						end
					end
				end

				description = CombineLines(food, chef_string, cook_time_string)

				return {
					priority = 2,
					description = description
				}
			end

			return Describe(self, context)
		end
	}
end

return { Descriptors = Descriptors }
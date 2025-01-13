local function Descriptors()
	Insight.descriptors.wateringstructure = {
		Describe = function(self, context)
			local function Describe(self, context)


				--[[return {
					priority = 0,
					description = description,
					alt_description = alt_description,
				}]]
			end

			return Describe(self, context)
		end
	}
end

return { Descriptors = Descriptors }
local function Descriptors()
	Insight.descriptors.desalinatiorable = {
		Describe = function(self, context)
			local function Describe(self, context)
				local description, alt_description

				local rawtext, rawtext_ext = STRINGS.INSIGHT.DESALINATIORABLE.RAWTEXT, STRINGS.INSIGHT.DESALINATIORABLE.RAWTEXT_EXT

				local sludgevalue = self.sludge or 0
				local maxsludgevalue = self.maxsludge or 0

				local sludgetype = self.sludgetype == "moonglass" and STRINGS.INSIGHT.STATE.MOONGLASS or STRINGS.INSIGHT.STATE.SALT
				local color_code = self.sludgetype == "moonglass" and STRINGS.INSIGHT.COLOR_CODE.MOONGLASS or STRINGS.INSIGHT.COLOR_CODE.SALT
				local sludge = self.pickablevalue
				local maxsludge = math.floor(maxsludgevalue / self.sludge_per_sludge)

				description = string.format(rawtext,sludgetype,color_code,sludge,maxsludge)
				alt_description = string.format(rawtext_ext,sludgetype,color_code,sludge,maxsludge,color_code,sludgevalue,maxsludgevalue)
			
				return {
					priority = 1,
					description = description,
					alt_description = alt_description,
				}
			end

			return Describe(self, context)
		end
	}
end

return { Descriptors = Descriptors }
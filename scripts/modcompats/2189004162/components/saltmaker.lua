local function Descriptors()
	Insight.descriptors.saltmaker = {
		Describe = function(self, context)
			local function Describe(self, context)
				local description, alt_description

				local rawtext, rawtext_ext = STRINGS.INSIGHT.SALTMAKER.RAWTEXT, STRINGS.INSIGHT.SALTMAKER.RAWTEXT_EXT

				local saltvalue = self.saltvalue or 0
				local maxsaltvalue = self.maxsaltvalue or 0

				local salt = self.pickablevalue
				local maxsalt = math.floor(maxsaltvalue / self.saltvalue_per_salt)

				description = string.format(rawtext,salt,maxsalt)
				alt_description = string.format(rawtext_ext,salt,maxsalt,saltvalue,maxsaltvalue)
			
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
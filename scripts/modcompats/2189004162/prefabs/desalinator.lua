local function AddPrefabDescriptors()
	Insight.prefab_descriptors.desalinator = {
		Describe = function(inst, context)
			local function Describe(inst, context)
				local description, alt_description

				local rawtext, rawtext_ext = STRINGS.INSIGHT.DESALINATION.RAWTEXT, STRINGS.INSIGHT.DESALINATION.RAWTEXT_EXT

				local saltvalue = inst._saltvalue or 0
				local maxsaltvalue = inst._saltvaluemax or 0

				local salt = math.floor(saltvalue / 10)
				local maxsalt = math.floor(maxsaltvalue / 10)

				description = string.format(rawtext,salt,maxsalt)
				alt_description = string.format(rawtext_ext,salt,maxsalt,saltvalue,maxsaltvalue)
			
				return {
					priority = 1,
					description = description,
					alt_description = alt_description,
				}
			end

			return Describe(inst, context)
		end
	}
end

return { AddPrefabDescriptors = AddPrefabDescriptors }
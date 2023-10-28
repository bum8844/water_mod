local OldDoRetrofitting = require("map/retrofit_savedata").DoRetrofitting

require("map/retrofit_savedata").DoRetrofitting = function(savedata, world_map, ...)
	local dirty = false
	
	if GetModConfigData("biome_retrofit") == 1 and savedata.map ~= nil and savedata.map.prefab == "forest" then
		if savedata.ents ~= nil and savedata.ents.cherry_foreststatue ~= nil then
			print("Retrofitting for Cherry Forest - Cherry Stone found, it seems the island already exists.")
		else
			print("Retrofitting for Cherry Forest - Looking to generate new Cherry Island.")
			require("map/retrofit_cherryforest").CherryForestRetrofitting_CherryIsland(GLOBAL.TheWorld.Map, savedata)
		end
		dirty = true
	end
	
	if GetModConfigData("biome_retrofit") == 2 and savedata.map ~= nil and savedata.map.prefab == "cave" then
		print("Retrofitting for Cherry Forest - Looking to generate new Areborestone.")
		require("map/retrofit_cherryforest").CherryForestRetrofitting_CherryRuins(GLOBAL.TheWorld.Map, savedata)
	end
	
	if dirty then
		savedata.map.tiles = world_map:GetStringEncode()
		savedata.map.nodeidtilemap = world_map:GetNodeIdTileMapStringEncode()
	end
	
	OldDoRetrofitting(savedata, world_map, ...)
end
AddComponentPostInit("retrofitforestmap_anr", function(self)

	local tea_tree_biome = {
		"BGForest",
		"BGDeepForest",
		"DeepForest",
		"Forest",
		"BGCrappyForest",
		"CrappyDeepForest",
		"CrappyForest",
		"SpiderForest",
	}

	local caffeinberry_biome = {
		"MoonIsland_Forest",
		"MoonIsland_IslandShard",
		"MoonIsland_Mine",
		"MoonIsland_Baths",
		"MoonIsland_Meadows",
	}

	--[[if GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1467214795") then
		AddThingtoWorldGeneration("tea_tree",{JungleClearing=gen_tea_tree,JungleDenseVery=gen_tea_tree,JungleFrogSanctuary=gen_tea_tree,JungleSappy=gen_tea_tree,JungleSkeleton=gen_tea_tree,JungleSparse=gen_tea_tree,JungleDenseMed=gen_tea_tree,JungleDenseMedHome=gen_tea_tree,JungleFlower=gen_tea_tree,JungleMonkeyHell=gen_tea_tree,JungleEyeplant=gen_tea_tree,JungleGrassy=gen_tea_tree,JungleEvilFlowers=gen_tea_tree})
		AddThingtoWorldGeneration("caffeinberry",{NoOxMeadow=gen_caffeinberry,MeadowOxBoon=gen_caffeinberry,MeadowCarroty=gen_caffeinberry,MeadowSpider=gen_caffeinberry,MeadowMandrake=gen_caffeinberry,MeadowRocky=gen_caffeinberry})
	elseif GLOBAL.KnownModIndex:IsModEnabled("workshop-1505270912") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1505270912") then
		AddThingtoWorldGeneration("tea_tree",{BG_deeprainforest_base=gen_tea_tree,deeprainforest_fireflygrove=gen_tea_tree,deeprainforest_flytrap_grove=gen_tea_tree,deeprainforest_mandrakeman=gen_tea_tree,JungleClearing=gen_tea_tree,JungleDenseVery=gen_tea_tree,JungleFrogSanctuary=gen_tea_tree,JungleSappy=gen_tea_tree,JungleSkeleton=gen_tea_tree,JungleSparse=gen_tea_tree,JungleDenseMed=gen_tea_tree,JungleDenseMedHome=gen_tea_tree,JungleFlower=gen_tea_tree,JungleMonkeyHell=gen_tea_tree,JungleEyeplant=gen_tea_tree,JungleGrassy=gen_tea_tree,JungleEvilFlowers=gen_tea_tree})
		AddThingtoWorldGeneration("caffeinberry",{deeprainforest_gas=gen_caffeinberry,deeprainforest_gas_set=gen_caffeinberry,deeprainforest_gas_flytrap_grove=gen_caffeinberry,deeprainforest_gas_flytrap_grove_set=gen_caffeinberry,NoOxMeadow=gen_caffeinberry,MeadowOxBoon=gen_caffeinberry,MeadowCarroty=gen_caffeinberry,MeadowSpider=gen_caffeinberry,MeadowMandrake=gen_caffeinberry,MeadowRocky=gen_caffeinberry})
	end]]

	local function Tea_Tree_Retrofitting()
		local gen_tea_tree = TUNING.ADD_TEA_TREE

		local node_indices = {}
		local candidtate_nodes = {}

		local count = 0
		for _, ent in pairs(Ents) do
			if ent:IsValid() and ent.prefab == "tea_tree" then
				count = count + 1
				if count >= gen_tea_tree then
					print("Retrofitting for Tea Trees De-extinction: Found enough Tea Trees in the world.")
					return
				end
			end
		end


		for b,_ in ipairs(tea_tree_biome) do
			for i,v in ipairs(TheWorld.topology.ids) do
				if string.find(v,b) then
					table.insert(candidtate_nodes, TheWorld.topology.nodes[i])
				end
			end
		end

		if #candidtate_nodes == 0 then
			print("Retrofitting for Tea Trees De-extinction: Failed to find any nodes!")
			return
		end

		local turf_fn = function(x, y, z, prefab)
		--[[if GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1467214795") then
		elseif GLOBAL.KnownModIndex:IsModEnabled("workshop-1505270912") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1505270912") then
		else]]
			return TheWorld.Map:GetTileAtPoint(x, y, z) == WORLD_TILES.FOREST
		--end
		end

		print("Retrofitting for Tea Trees De-extinction: Found " .. tostring(count) .. " Tea Trees in the world. Adding "..tostring(min_dens - count) .. " more.")
		for i = count, gen_tea_tree-1 do
			if not RetrofitNewContentPrefab(inst, "tea_tree", 1, 4, turf_fn, candidtate_nodes) then
				RetrofitNewContentPrefab(inst, "tea_tree", 1, 2, turf_fn, candidtate_nodes)
			end
		end
	end

	local function CaffeinBerry_Bush_Retrofitting()
		local gen_caffeinberry = TUNING.ADD_CAFFEINBERRY_BUSH

		local node_indices = {}
		local candidtate_nodes = {}

		local count = 0
		for _, ent in pairs(Ents) do
			if ent:IsValid() and ent.prefab == "caffeinberry" then
				count = count + 1
				if count >= gen_caffeinberry then
					print("Retrofitting for CaffeinBerry Bush De-extinction: Found enough CaffeinBerry Bush in the world.")
					return
				end
			end
		end


		for b,_ in ipairs(caffeinberry_biome) do
			for i,v in ipairs(TheWorld.topology.ids) do
				if string.find(v,b) then
					table.insert(candidtate_nodes, TheWorld.topology.nodes[i])
				end
			end
		end

		if #candidtate_nodes == 0 then
			print("Retrofitting for CaffeinBerry Bush De-extinction: Failed to find any nodes!")
			return
		end

		local turf_fn = function(x, y, z, prefab)
		--[[if GLOBAL.KnownModIndex:IsModEnabled("workshop-1467214795") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1467214795") then
		elseif GLOBAL.KnownModIndex:IsModEnabled("workshop-1505270912") or GLOBAL.KnownModIndex:IsModForceEnabled("workshop-1505270912") then
		else]]
			return TheWorld.Map:GetTileAtPoint(x, y, z) == WORLD_TILES.METEOR or TheWorld.Map:GetTileAtPoint(x, y, z) == WORLD_TILES.PEBBLEBEACH
		--end
		end

		print("Retrofitting for CaffeinBerry Bush De-extinction: Found " .. tostring(count) .. " CaffeinBerry Bush in the world. Adding "..tostring(min_dens - count) .. " more.")
		for i = count, gen_caffeinberry-1 do
			if not RetrofitNewContentPrefab(inst, "caffeinberry", 1, 4, turf_fn, candidtate_nodes) then
				RetrofitNewContentPrefab(inst, "caffeinberry", 1, 2, turf_fn, candidtate_nodes)
			end
		end
	end
end)
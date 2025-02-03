local MAX_PLACEMENT_ATTEMPTS = 50

local STRUCTURE_TAGS = {"structure"}

local biome_data = require("utils/water_retorfit_biome")

local re_retrofit = GetModConfigData("re_retrofit")

local ruincacao_tree_biome = biome_data.GetRuinCacaoTreeBiome()

local function RetrofitNewContentPrefab(inst, prefab, min_space, dist_from_structures, canplacefn, candidtate_nodes, on_add_prefab)
	local attempt = 1
	local topology = GLOBAL.TheWorld.topology

	while attempt <= MAX_PLACEMENT_ATTEMPTS do
		local area = nil
		if candidtate_nodes ~= nil then
			area = candidtate_nodes[math.random(#candidtate_nodes)]
		else
			area = topology.nodes[math.random(#topology.nodes)]
		end

		local points_x, points_y = GLOBAL.TheWorld.Map:GetRandomPointsForSite(area.x, area.y, area.poly, 1)
		if #points_x == 1 and #points_y == 1 then
			local x = points_x[1]
			local z = points_y[1]

			if (canplacefn ~= nil and canplacefn(x, 0, z, prefab)) or
                (canplacefn == nil and GLOBAL.TheWorld.Map:CanPlacePrefabFilteredAtPoint(x, 0, z, prefab)) then
				local ents = GLOBAL.TheSim:FindEntities(x, 0, z, min_space)
				if #ents == 0 then
					if dist_from_structures ~= nil then
						ents = GLOBAL.TheSim:FindEntities(x, 0, z, dist_from_structures, STRUCTURE_TAGS )
					end

					if #ents == 0 then
						local e = SpawnPrefab(prefab)
						e.Transform:SetPosition(x, 0, z)
						if on_add_prefab ~= nil then
							on_add_prefab(e)
						end
						break
					end
				end
			end
		end
		attempt = attempt + 1
	end
	print ("Retrofitting world for " .. prefab .. ": " .. (attempt <= MAX_PLACEMENT_ATTEMPTS and ("Success after "..attempt.." attempts.") or "Failed."))
	return attempt <= MAX_PLACEMENT_ATTEMPTS
end

local function Ruincacao_Tree_Retrofitting()

	local node_indices = {}
	local candidtate_nodes = {}

	for b,_ in ipairs(ruincacao_tree_biome) do
		for i,v in ipairs(GLOBAL.TheWorld.topology.ids) do
			if string.find(v,b) then
				table.insert(candidtate_nodes, GLOBAL.TheWorld.topology.nodes[i])
			end
		end
	end

	if #candidtate_nodes == 0 then
		print("Retrofitting for Tea Trees De-extinction: Failed to find any nodes!")
		return
	end

	local nodes = #candidtate_nodes/8

	local gen_ruincacao_tree = math.floor(TUNING.ADD_RUINCACAO_TREE*nodes)

	local count = 0
	for _, ent in pairs(GLOBAL.Ents) do
		if ent:IsValid() and ent.prefab == "ruincacao_tree" then
			count = count + 1
			if count >= gen_ruincacao_tree then
				print("Retrofitting for RuinCacao Trees De-extinction: Found enough RuinCacao Trees in the world.")
				return
			end
		end
	end

	local turf_fn = function(x, y, z, prefab)
		return GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == WORLD_TILES.MUD or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == WORLD_TILES.ASH or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == WORLD_TILES.VOLCANO_NOISE or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == WORLD_TILES.VOLCANO or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == GROUND.ASH or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == GROUND.VOLCANO or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == GROUND.RAINFOREST
	end

	print("Retrofitting for RuinCacao Trees De-extinction: Found " .. tostring(count) .. " RuinCacao Trees in the world. Adding "..tostring(gen_ruincacao_tree - count) .. " more.")
	for i = count, gen_ruincacao_tree-1 do
		RetrofitNewContentPrefab(inst, "ruincacao_tree", 1, 2, turf_fn, candidtate_nodes)
	end
end

AddComponentPostInit("retrofitcavemap_anr",function(self)

	local oldonpostinit_cave = self.OnPostInit
	local oldonload = self.OnLoad
	function self:OnPostInit(...)

		local ruincacao_tree = (self.retrofit_tea_tree or re_retrofit == 1 or re_retrofit == 4) and true or false

		print("Retrofit Forest:OnPostInit RuinCacao Trees : "..tostring(ruincacao_tree))

		if ruincacao_tree then
			print ("Retrofitting for RuinCacao Trees: Adding RuinCacao Trees.")
			Ruincacao_Tree_Retrofitting()
		end

		if re_retrofit ~= 0 then
			GLOBAL.SetRetrofitSetting("re_retrofit", 0)
		end
		
		return oldonpostinit_cave(self, ...)
	end

	function self:OnLoad(data, ...)
		oldonload(data, self, ...)
		self.retrofit_ruincacao_tree = data.retrofit_ruincacao_tree or false
	end
end)


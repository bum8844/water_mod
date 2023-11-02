local MAX_PLACEMENT_ATTEMPTS = 50

local STRUCTURE_TAGS = {"structure"}

local biome_data = require("utils/water_retorfit_biome")

local tea_tree_biome = biome_data.GetTeaTreeBiome()
local caffeinberry_biome = biome_data.GetCaffeinBerryBiome()
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

local function Tea_Tree_Retrofitting()

	local node_indices = {}
	local candidtate_nodes = {}

	for b,_ in ipairs(tea_tree_biome) do
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

	local nodes = #candidtate_nodes/4

	local gen_tea_tree = math.floor(TUNING.ADD_TEA_TREE*nodes)

	local count = 0
	for _, ent in pairs(GLOBAL.Ents) do
		if ent:IsValid() and ent.prefab == "tea_tree" then
			count = count + 1
			if count >= gen_tea_tree then
				print("Retrofitting for Tea Trees De-extinction: Found enough Tea Trees in the world.")
				return
			end
		end
	end

	local turf_fn = function(x, y, z, prefab)
		return GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == WORLD_TILES.FOREST or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == WORLD_TILES.JUNGLE or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == GROUND.JUNGLE or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x,y,z) == GROUND.FIELDS
	end

	print("Retrofitting for Tea Trees De-extinction: Found " .. tostring(count) .. " Tea Trees in the world. Adding "..tostring(gen_tea_tree - count) .. " more.")
	for i = count, gen_tea_tree-1 do
		RetrofitNewContentPrefab(inst, "tea_tree", 1, 2, turf_fn, candidtate_nodes)
	end
end

local function CaffeinBerry_Bush_Retrofitting()

	local node_indices = {}
	local candidtate_nodes = {}

	for b,_ in ipairs(caffeinberry_biome) do
		for i,v in ipairs(GLOBAL.TheWorld.topology.ids) do
			if string.find(v,b) then
				table.insert(candidtate_nodes, GLOBAL.TheWorld.topology.nodes[i])
			end
		end
	end

	if #candidtate_nodes == 0 then
		print("Retrofitting for CaffeinBerry Bush De-extinction: Failed to find any nodes!")
		return
	end

	local nodes = #candidtate_nodes/4

	local gen_caffeinberry = math.floor(TUNING.ADD_CAFFEINBERRY_BUSH*nodes)

	local count = 0
	for _, ent in pairs(GLOBAL.Ents) do
		if ent:IsValid() and ent.prefab == "caffeinberry" then
			count = count + 1
			if count >= gen_caffeinberry then
				print("Retrofitting for CaffeinBerry Bush De-extinction: Found enough CaffeinBerry Bush in the world.")
				return
			end
		end
	end

	local turf_fn = function(x, y, z, prefab)

		return GLOBAL.TheWorld.Map:GetTileAtPoint(x, y, z) == WORLD_TILES.METEOR or 
			GLOBAL.TheWorld.Map:GetTileAtPoint(x, y, z) == WORLD_TILES.PEBBLEBEACH or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x, y, z) == WORLD_TILES.MEADOW or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x, y, z) == GROUND.MEADOW or
			GLOBAL.TheWorld.Map:GetTileAtPoint(x, y, z) == GROUND.GASJUNGLE

	end
		print("Retrofitting for CaffeinBerry Bush De-extinction: Found " .. tostring(count) .. " CaffeinBerry Bush in the world. Adding "..tostring(gen_caffeinberry - count) .. " more.")
	for i = count, gen_caffeinberry-1 do
		RetrofitNewContentPrefab(inst, "caffeinberry", 1, 2, turf_fn, candidtate_nodes)
	end
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

AddComponentPostInit("retrofitforestmap_anr",function(self)

	local oldonpostinit_forest = self.OnPostInit
	local oldonload = self.OnLoad
	function self:OnPostInit(...)

		local tea_tree = self.retrofit_tea_tree and "true" or "false"
		local caffeinberry_bush = self.retrofit_caffeinberry_bush and "true" or "false"
		local ruincacao_tree = self.retrofit_tea_tree and "true" or "false"

		print("Retrofit Forest:OnPostInit tea tree : "..tea_tree..", caffeinberry bush : "..caffeinberry_bush..", Retrofit Forest:OnPostInit RuinCacao Trees : "..ruincacao_tree)

		if self.retrofit_tea_tree then
			print ("Retrofitting for Tea Trees: Adding Tea Trees.")
			Tea_Tree_Retrofitting()
		end

		if self.retrofit_caffeinberry_bush then
			print ("Retrofitting for CaffeinBerry Bushs: Adding CaffeinBerry Bushs.")
			CaffeinBerry_Bush_Retrofitting()
		end

		if self.retrofit_ruincacao_tree then
			print ("Retrofitting for RuinCacao Trees: Adding RuinCacao Trees.")
			Ruincacao_Tree_Retrofitting()
		end
		
		return oldonpostinit_forest(self, ...)
	end

	function self:OnLoad(data, ...)
		oldonload(data, self, ...)
		self.retrofit_tea_tree = data.retrofit_tea_tree or false
		self.retrofit_caffeinberry_bush = data.retrofit_caffeinberry_bush or false
		self.retrofit_ruincacao_tree = data.retrofit_ruincacao_tree or false
	end
end)
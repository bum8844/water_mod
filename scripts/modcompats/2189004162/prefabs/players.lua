local function AddPrefabDescriptors()
	Insight.player_stat_sync_task = TheWorld:DoPeriodicTask(1, function()

			local shard_players = {}
			for _, player in pairs(AllPlayers) do
				local ist = player.components.insight
				if ist then
					ist:SendNaughtiness() -- for timetodecay
				end
				
				if player.userid ~= "" then
					shard_players[player.userid] = {
						health = player.components.health and Insight.descriptors.health.GetData(player.components.health) or nil,
						sanity = player.components.sanity and Insight.descriptors.sanity.GetData(player.components.sanity) or nil,
						hunger = player.components.hunger and Insight.descriptors.hunger.GetData(player.components.hunger) or nil,
						thirst = player.components.thirst and Insight.descriptors.thirst.Descriptors.GetData(player.components.thirst) or nil,
						wereness = player.components.wereness and Insight.descriptors.wereness.GetData(player.components.wereness) or nil,
					}
				end 
			end

			shard_players = compress(shard_players)

			rpcNetwork.SendModRPCToAllClients(GetClientModRPC(modname, "ShardPlayers"), shard_players)

			-- shard stuff
			--rpcNetwork.SendModRPCToClient(GetClientModRPC(modname, "ShardPlayers"), player.userid, compress(shard_players))
		end)

end

return { AddPrefabDescriptors = AddPrefabDescriptors }
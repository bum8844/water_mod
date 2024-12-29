local CHATTER_DELAYS = {
	["SHARKBOI_ACCEPT_PART"] = { delay = 3 },
}

local DEFAULT_CHAT_ECHO_PRIORITY = CHATPRIORITIES.LOW
local CHATTER_ECHO_PRIORITIES =
{
	["SHARKBOI_ACCEPT_PART"]		= CHATPRIORITIES.HIGH,
}

local function TryChatter(inst, strtblname, index, ignoredelay, force)
	local t = GetTime()
	local delays = CHATTER_DELAYS[strtblname]
	if ignoredelay or (inst.sg.mem.lastchatter or 0) + (delays and delays.delay or 0) < t then
		inst.sg.mem.lastchatter = t
		local echo_priority = CHATTER_ECHO_PRIORITIES[strtblname] or DEFAULT_CHAT_ECHO_PRIORITY
		inst.components.talker:Chatter(
			strtblname,
			index or math.random(#STRINGS[strtblname]),
			(delays and delays.len) or nil,
			force,
			echo_priority
		)
	end
end

AddStategraphPostInit("sharkboi", function(sg)
	do
		sg.states["give_part"] = State{
			name = "give_part",
			tags = { "busy" },

			onenter = function(inst, giver)
				inst.components.locomotor:Stop()
				inst.Transform:SetSixFaced()
				inst.AnimState:PlayAnimation("sharkboi_take")
				inst.sg.statemem.giver = giver
				TryChatter(inst, "SHARKBOI_ACCEPT_PART", nil, nil, true)
			end,

			onupdate = function(inst)
				if inst.sg.statemem.giver then
					if inst.sg.statemem.giver:IsValid() then
						inst:ForceFacePoint(inst.sg.statemem.giver.Transform:GetWorldPosition())
					else
						inst.sg.statemem.giver = nil
					end
				end
			end,

			timeline =
			{
				FrameEvent(12, function(inst)
					inst:GiveBlueprint(inst.sg.statemem.giver)
					inst.sg.statemem.giver = nil
				end),
				FrameEvent(23, function(inst)
					inst.sg:RemoveStateTag("busy")
				end),
			},

			events =
			{
				EventHandler("animover", function(inst)
					if inst.AnimState:AnimDone() then
						inst.sg.statemem.keepsixfaced = true
						inst.sg:GoToState("idle", true)
					end
				end),
			},

			onexit = function(inst)
				if not inst.sg.statemem.keepsixfaced then
					inst.Transform:SetFourFaced()
				end
			end,
		}

		local trader = sg.events["trade"].fn
		sg.events["trade"].fn = function(inst, data)
			if data.item.prefab == "wine_cellar_part" then
				inst.sg:GoToState("give_part", data and data.giver or nil)
			else
				trader(inst, data)
			end
		end
	end
end)
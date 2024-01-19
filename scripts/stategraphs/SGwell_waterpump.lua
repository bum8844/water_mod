local StateGraph = _G.StateGraph

require("stategraphs/commonstates")

local actionhandlers =
{
}

local events =
{
}

local function SetActionSection(inst)
	local section = "empty"
	if inst.components.machine:IsOn() then
		local test = inst.components.steampressure:GetPressureSection()
		section = test == 4 and "_high" or test == 3 and "_middle" or test == 2 and "_low" or "_empty"
	end
	return section
end

local states =
{
	State
	{
		name = "deactive",
		tags = {"idle","deactive"},
		onenter = function(inst)
			inst.AnimState:PushAnimation("deactive")
			inst.SoundEmitter:PlaySound("dontstarve/common/together/dragonfly_furnace/fire_LP", "loop_deactive")
			inst:PushEvent("showmeter")
		end,
	},
	State
	{
		name = "active",
		tags = {"idle","active"},
		onenter = function(inst)
			local section = SetActionSection(inst)
			inst.AnimState:PushAnimation("active"..section,true)
			inst.SoundEmitter:PlaySound("rifts3/sawhorse/proximity_lp","loop_active")
			inst:PushEvent("showmeter")
		end,
	},
	State
	{
		name = "clutch",
		tags = {"busy","active","clutching"},
		onenter = function(inst)
			inst:PushEvent("showmeter")
			inst.AnimState:PlayAnimation("active_clutch")
		end,

		timeline = {
			TimeEvent(1 * FRAMES,function(inst) inst.SoundEmitter:PlaySound("monkeyisland/autopilot/magnet_search_pre") end),
			TimeEvent(2 * FRAMES,function(inst) inst.SoundEmitter:PlaySound("monkeyisland/autopilot/beacon_search","search_loop") end),
			TimeEvent(48 * FRAMES,function(inst) inst.SoundEmitter:KillSound("search_loop") end)
		},

		events = {
			EventHandler("animover",
				function(inst)
					inst.sg:GoToState("active")
				end),
		}
	},
	State
	{
		name = "place",
		tags = {"place","busy"},
		onenter = function(inst)
			inst.AnimState:PlayAnimation("place")
		end,

        timeline =
        {
        	TimeEvent(1 * FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/together/dragonfly_furnace/place") end),
            TimeEvent(24 * FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve/common/together/catapult/hit") end),
            TimeEvent(36 * FRAMES, function(inst) inst:PushEvent("setmeter") end)
        },

        events = {
			EventHandler("animover",
				function(inst)
					inst.sg:GoToState("deactive")
				end),
        }
	},
	State
	{
		name = "hit",
		tags = {"hit","busy"},
		onenter = function(inst,ison)
			inst.sg.statemem.ison = ison
			inst:PushEvent("hidemeter")
			inst.SoundEmitter:KillSound("loop_active")
			inst.SoundEmitter:KillSound("loop_deactive")
			if inst.sg.statemem.ison then
				inst.AnimState:PlayAnimation("hit_active")
			else
				inst.AnimState:PlayAnimation("hit_deactive")
			end
		end,

		timeline = {
			TimeEvent(1 * FRAMES,function(inst) inst.SoundEmitter:PlaySound("grotto/common/turf_crafting_station/hit") end),
		},

		events = {
			EventHandler("animover",
				function(inst)
					if inst.sg.statemem.ison then
						inst.sg:GoToState("active")
					else
						inst.sg:GoToState("deactive")
					end
				end),
		}
	},
	State
	{
		name = "pumping",
		tags = {"busy","pumping"},
		onenter = function(inst,ison)
			inst.sg.statemem.ison = ison
			inst:PushEvent("hidemeter")
			inst.SoundEmitter:KillSound("loop_active")
			inst.SoundEmitter:KillSound("loop_deactive")
			if inst.sg.statemem.ison then
				inst.AnimState:PlayAnimation("pumping_active")
			else
				inst.AnimState:PlayAnimation("pumping_deactive")
			end
		end,

		timeline = {
			TimeEvent(1 * FRAMES,function(inst) inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/downgrade") end)
		},

		events = {
			EventHandler("animover",
				function(inst)
					if inst.sg.statemem.ison then
						inst.sg:GoToState("active")
					else
						inst.sg:GoToState("deactive")
					end
				end),
		}
	},
	State
	{
		name = "turn_on",
		tags = {"busy","turn_on","active"},
		onenter = function(inst)
			inst:PushEvent("hidemeter")
			inst.SoundEmitter:KillSound("loop_deactive")
			inst.AnimState:PlayAnimation("activeing")
		end,

		timeline = {
			TimeEvent(1 * FRAMES,function(inst) inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/upgrade") end),
		},

		events = {
			EventHandler("animover",
				function(inst)
					inst.sg:GoToState("active")
				end),
		}
	},
	State
	{
		name = "turn_off",
		tags = {"busy","turn_off","deactive"},
		onenter = function(inst)
			inst:PushEvent("hidemeter")
			inst.SoundEmitter:KillSound("search_loop")
			inst.SoundEmitter:KillSound("loop_active")
			inst.AnimState:PlayAnimation("deactiveing")
		end,

		timeline = {
			TimeEvent(1 * FRAMES,function(inst) inst.SoundEmitter:PlaySound("rifts3/wagpunk_armor/downgrade") end),
		},

		events = {
			EventHandler("animover",
				function(inst)
					inst.sg:GoToState("deactive")
				end),
		}
	}
}

return StateGraph("well_waterpump", states, events, "deactive", actionhandlers)
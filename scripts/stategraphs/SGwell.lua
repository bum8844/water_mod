local StateGraph = _G.StateGraph

require("stategraphs/commonstates")

local actionhandlers =
{
}

local events =
{
}

local states =
{
    State
    {
    	name = "idle",
    	tag = {"idle"},

        onenter = function(inst)
			inst.AnimState:Hide("well_buckets_empty")
			inst.AnimState:Hide("well_buckets_full")
			inst.AnimState:Hide("well_buckets_dirty")
			inst.AnimState:Hide("well_buckets_ice")
			inst.AnimState:Hide("well_buckets_ice_dirty")

			inst.AnimState:PushAnimation("idle_empty", true)
        end,
    },
	State
	{
		name = "watering",
		tags = {"busy", "watering"},

		onenter = function(inst)
			inst.AnimState:Show("well_buckets_empty")
			inst.AnimState:Show("well_buckets_full")
			
			inst.AnimState:PlayAnimation("watering", false)

			inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/tether_land")
			inst:DoTaskInTime(1.1,function(inst)
				inst.SoundEmitter:PlaySound("turnoftides/common/together/boat/anchor/ocean_hit")
			end)

			inst.sg.statemem.setwatertype = "_full"
			inst.sg.statemem.isnewwater = true
		end,

		events = {
			EventHandler("animover",
				function(inst)
					inst.sg:GoToState("watering_idle",inst.sg.statemem)
				end),
		} 
	},
	State
	{
		name = "turn_to_ice",
		tags = {"busy", "watering"},

		onenter = function(inst)
			local isdirty = inst.components.wateringstructure:GetWater() == WATERTYPE.DIRTY and "_dirty" or nil
			local watertype = isdirty and isdirty or "_full"
			local frozenwatertype = isdirty and isdirty or ""

			inst.sg.statemem.setwatertype = "_ice"..frozenwatertype

			inst.AnimState:Show("well_buckets"..watertype)
			inst.AnimState:Show("well_buckets_ice"..frozenwatertype)

			inst.AnimState:PlayAnimation("turn_to_ice"..frozenwatertype, false)

			inst.SoundEmitter:PlaySound("dontstarve/common/bush_fertilize")
		end,

		events = {
			EventHandler("animover",
				function(inst)
					 inst.sg:GoToState("watering_idle",inst.sg.statemem)
				end),
		} 
	},
	State
	{
		name = "turn_to_full",
		tags = {"busy", "watering"},

		onenter = function(inst)
			local isdirty = inst.components.wateringstructure:GetWater() == WATERTYPE.DIRTY and "_dirty" or ""
			local watertype = isdirty ~= "" and isdirty or "_full"

			inst.sg.statemem.setwatertype = watertype

			inst.AnimState:Show("well_buckets_ice"..isdirty)
			inst.AnimState:Show("well_buckets"..watertype)

			inst.AnimState:PlayAnimation("turn_to_full"..isdirty, false)

			inst.SoundEmitter:PlaySound("dontstarve/creatures/pengull/splash")
		end,

		events = {
			EventHandler("animover",
				function(inst)
					 inst.sg:GoToState("watering_idle",inst.sg.statemem)
				end),
		} 
	},
	State
	{
		name = "watering_idle",
		tags = {"idle", "watering"},

		onenter = function(inst, data)

			local showanim = data.setwatertype

			inst.AnimState:Hide("well_buckets_empty")
			inst.AnimState:Hide("well_buckets_full")
			inst.AnimState:Hide("well_buckets_dirty")
			inst.AnimState:Hide("well_buckets_ice")
			inst.AnimState:Hide("well_buckets_ice_dirty")

			inst.AnimState:Show("well_buckets"..showanim)

			inst.AnimState:PushAnimation("idle_watering", true)
			if data.isnewwater then
				print("물양정하는중")
				inst:PushEvent("setwateramount")
			end
		end,

	}
}

return StateGraph("well", states, events, "idle", actionhandlers)
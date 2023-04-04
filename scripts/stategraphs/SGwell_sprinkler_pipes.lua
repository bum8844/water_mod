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
        tags = {"idle", "canrotate"},

        onenter = function(inst, playanim)
            inst:Show()
            inst.AnimState:PlayAnimation("idle", true)
        end,
    },

    State
    {
        name = "hidden",
        tags = {"idle", "canrotate"},

        onenter = function(inst, playanim)
            inst:Hide()
        end,
    },

    State
    {
        name = "extend",
        tags = {"canrotate"},

        onenter = function(inst, parents)
            inst:Show()
            inst.AnimState:PlayAnimation("place", false)

            inst.sg.statemem.parents = parents

            inst.SoundEmitter:PlaySound("dontstarve/common/together/catapult/hit")
            
        end,

        events =
        {
            EventHandler("animover",
                function(inst)
                    if inst.nextPipe then
                        inst.nextPipe.sg:GoToState("extend", inst.sg.statemem.parents)
                    else
                        inst.sg.statemem.parents:PushEvent("pipedone")
                    end

                    inst.sg:GoToState("idle")
                end),
        }
    },

	State
	{
		name = "retract",
		tags = {"canrotate"},

		onenter = function(inst, intensity)
			inst.AnimState:PlayAnimation("retract", false)

			inst.sg.statemem.intensity = intensity

            inst.SoundEmitter:PlaySound("dontstarve/common/together/catapult/hit")
		end,

        events =
        {
            EventHandler("animover",
                function(inst)
                    if inst.prevPipe then
                        inst.prevPipe.sg:GoToState("retract", inst.sg.statemem.intensity-1)
                    end

                    inst:Remove()
                end),
        }
	},
}

return StateGraph("well_sprinkler_pipe", states, events, "hidden", actionhandlers)

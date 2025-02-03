local StateGraph = _G.StateGraph

require("stategraphs/commonstates")

local actionhandlers = {}

local events =
{
}

local states =
{
    State
    {
        name = "turn_on",
        tags = {"idle"},

        onenter = function(inst)
            inst.AnimState:PlayAnimation("turn_on")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst:PushEvent("checkweather")
            end),
        }
    },

    State
    {
        name = "turn_off",
        tags = {"idle"},

        onenter = function(inst)
            inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/firesupressor_off")
            inst.AnimState:PlayAnimation("turn_off")
        end,

        events =
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle_off") end),
        }
    },

    State
    {
        name = "idle_on",
        tags = {"idle"},

        onenter = function(inst)
            inst.AnimState:PushAnimation("idle_on_loop")
        end,

        -- timeline =
        -- {
        --     TimeEvent(16*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_DLC001/common/firesupressor_chuff") end)
        -- },

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("idle_on")
            end),
        }
    },

    State
    {
        name = "idle_off",
        tags = {"idle"},

        onenter = function(inst)
            --Stop some loop sound
            inst.SoundEmitter:KillSound("firesuppressor_idle")
            inst.AnimState:PlayAnimation("idle_off", true)
        end,
    },

    State
    {
        name = "spin_up",
        tags = { "busy" },

        onenter = function(inst, data)
            inst.AnimState:PlayAnimation("launch_pre")
            --inst.sg.statemem.data = data
        end,

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("shoot")--, inst.sg.statemem.data)
            end),
        },
    },            

    State
    {
        name = "shoot",
        tags = { "busy", "shooting" },

        onenter = function(inst, data)
            if not inst.SoundEmitter:PlayingSound("firesuppressor_idle") then
                inst.SoundEmitter:PlaySound("dangerous_sea/common/water_pump/LP", "firesuppressor_idle")
            end
            inst.AnimState:PushAnimation("launch")
        end,

        timeline =
        {
            TimeEvent(6 * FRAMES, function(inst)
                inst.SoundEmitter:PlaySound("farming/common/watering_can/use")
            end),
        },

        events =
        {
            EventHandler("animover", function(inst)
                inst.sg:GoToState("shoot")
            end),
        },
    },

    State
    {
        name = "spin_down",
        tags = { "busy" },

        onenter = function(inst)
            inst.SoundEmitter:KillSound("firesuppressor_idle")
            inst.AnimState:PlayAnimation("launch_pst")
        end,

        events =
        {
            EventHandler("animover", function(inst)
                if inst._powertask then
                    inst.sg:GoToState("idle_on")
                else
                    inst:PushEvent("smart_off")
                end
            end),
        },
    },

    State
    {  
        name = "place",
        tags = {"busy"},

        onenter = function(inst, data)
            inst.AnimState:PlayAnimation("place")
            -- inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/crafted/sprinkler/place")
            --Play some sound / good idea
        end,

        timeline = {},

        events =
        {
            EventHandler("animover", function(inst) inst.sg:GoToState("idle_on") end)
        },
    },

    State
    {  
        name = "hit",
        tags = {"busy"},

        onenter = function(inst, data)
            if inst._powertask then 
                inst.AnimState:PlayAnimation("hit_on")
            else
                inst.AnimState:PlayAnimation("hit_off")
            end
            --Play some sound 
        end,

        timeline = {},

        events =
        {
            EventHandler("animover", function(inst) 
                if inst._powertask then
                    if inst._on then
                        inst.sg:GoToState("shoot")
                    else
                        inst.sg:GoToState("idle_on")
                    end
                else
                    inst.sg:GoToState("idle_off")
                end
            end)
        },
    },
}

return StateGraph("well_winona_sprinkler", states, events, "idle_off", actionhandlers)
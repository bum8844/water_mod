local drinkstew_client = State{
    name = "drinkstew",
    tags = { "busy" },
    server_states = { "drinkstew" },

    onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("eat_pre")
        inst.AnimState:PushAnimation("eat_lag", false)

        inst:PerformPreviewBufferedAction()
        inst.sg:SetTimeout(TIMEOUT)
    end,

    onupdate = function(inst)
        if inst.sg:ServerStateMatches() then
            if inst.entity:FlattenMovementPrediction() then
                inst.sg:GoToState("idle", "noanim")
            end
        elseif inst.bufferedaction == nil then
            inst.sg:GoToState("idle")
        end
    end,

    ontimeout = function(inst)
        inst:ClearBufferedAction()
        inst.sg:GoToState("idle")
    end,
}

local drink_client = State{
    name = "drink",
    tags = {"busy"},
    server_states = { "drink" },
                
    onenter = function(inst)
        inst.components.locomotor:Stop()
        inst.AnimState:PlayAnimation("quick_eat_pre")
        inst.AnimState:PushAnimation("quick_eat_lag", false)

        inst:PerformPreviewBufferedAction()
        inst.sg:SetTimeout(TIMEOUT)
    end,

    onupdate = function(inst)
        if inst:HasTag("busy") then
            if inst.entity:FlattenMovementPrediction() then
                inst.sg:GoToState("idle", "noanim")
            end
        elseif inst.bufferedaction == nil then
            inst.sg:GoToState("idle")
        end
    end,

    ontimeout = function(inst)
        inst:ClearBufferedAction()
        inst.sg:GoToState("idle")
    end,
}

local boilbook_open_client = State{
    name = "boilbook_open",
    server_states = { "boilbook_open" },
    forward_server_states = true,
    onenter = function(inst) inst.sg:GoToState("action_uniqueitem_busy") end,
}

local shaker_shaking_client = State{
    name = "shaker_shaking",
    tags = { "doing", "busy" },
    server_states = { "shaker_shaking" },

    onenter = function(inst)
        inst.components.locomotor:Stop()
        --V2C: always use "dontstarve/wilson/make_trap" for preview
        --     (even for things like makeballoon or shave)
        --     switch to server sound when action actually executes on server
        inst.SoundEmitter:PlaySound("dontstarve/wilson/make_trap", "make_preview")
        inst.AnimState:PlayAnimation("build_pre")
        inst.AnimState:PushAnimation("build_loop", true)

        inst:PerformPreviewBufferedAction()
        inst.sg:SetTimeout(TIMEOUT)
    end,

    timeline =
    {
        TimeEvent(4 * FRAMES, function(inst)
            inst.sg:RemoveStateTag("busy")
        end),
    },

    onupdate = function(inst)
        if inst.sg:ServerStateMatches() then
            if inst.entity:FlattenMovementPrediction() then
                inst.sg:GoToState("idle", "noanim")
            end
        elseif inst.bufferedaction == nil then
            inst.AnimState:PlayAnimation("build_pst")
            inst.sg:GoToState("idle", true)
        end
    end,

    ontimeout = function(inst)
        inst:ClearBufferedAction()
        inst.AnimState:PlayAnimation("build_pst")
        inst.sg:GoToState("idle", true)
    end,

    onexit = function(inst)
        inst.SoundEmitter:KillSound("make_preview")
    end,
}

local fest_shaker_shaking_client = State{
    name = "fest_shaker_shaking",
    onenter = function(inst) inst.sg:GoToState("shaker_shaking") end,
}

AddStategraphState("wilson_client", drinkstew_client)
AddStategraphState("wilson_client", drink_client)
AddStategraphState("wilson_client", boilbook_open_client)
AddStategraphState("wilson_client", shaker_shaking_client)
AddStategraphState("wilson_client", fest_shaker_shaking_client)

------------------------------------------------------------------------

local refresh_drunk_event = EventHandler("refreshdrunk", function(inst)
        if not inst.sg:HasStateTag("dead") then
            inst.sg:GoToState("refreshdrunk")
        end
    end)

local drunk_event = EventHandler("drunk", function(inst)
        if not inst.sg:HasStateTag("dead") then
            inst.sg:GoToState("drunk")
        end
    end)

local drink_event = EventHandler("drink",function(inst, action)
        if inst.sg:HasStateTag("busy") or inst:HasTag("busy") then
            return
        end
        local obj = action.target or action.invobject
        if obj == nil then
            return
        end
        if obj:HasTag("drink") then
            for k, v in pairs(FOODTYPE) do
                if obj:HasTag("edible_"..v) then
                    return (v == FOODTYPE.MEAT and not obj:HasTag("nomeatfood") and not obj:HasTag("alcohol") and "drinkstew") or "drink"
                end
            end
        else
            return eater(inst, action)
        end
    end)

AddStategraphEvent("wilson_client", refresh_drunk_event)
AddStategraphEvent("wilson_client", drunk_event)
AddStategraphEvent("wilson_client", drink_event)

------------------------------------------------------------------------

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.GIVEWATER, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TAKEWATER, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRAMATIC_RAISE, "doshortaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRAMATIC_LOWER, "doshortaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TAKEWATER_OCEAN, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.MILKINGTOOL, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.UPGRADE_TILEARRIVE, "dolongaction"))
--[[AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRINK,
        function(inst, action)
            if inst.sg:HasStateTag("busy") or inst:HasTag("busy") then
                return
            end
            local obj = action.target or action.invobject
            if obj == nil then
                return
            end
            for k, v in pairs(FOODTYPE) do
                if obj:HasTag("edible_"..v) then
                    return (v == FOODTYPE.MEAT and not obj:HasTag("alcohol") and "drinkstew")
                or "drink"
                end
            end
        end
    )
)]]

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TURNON_TILEARRIVE, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TURNON_TILEARRIVE, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TURNON_TILEARRIVE, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.BREWING,
        function(inst, action)
            return inst:HasTag("expertchef") and "domediumaction" or "dolongaction"
        end
    )
)
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.READBOILBOOK,"boilbook_open"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.SHAKING,
        function(inst, action)
            return inst:HasTag("expertchef") and "fest_shaker_shaking" or "shaker_shaking"
        end
    )
)

------------------------------------------------------------------------

AddStategraphPostInit("wilson_client", function(sg)
    do
        local function isgroggy(inst)
            return inst.components.grogginess and not inst.components.grogginess.isgroggy
        end

        local _idle_onenter = sg.states["idle"].onenter
        sg.states["idle"].onenter = function(inst, pushanim,...)
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end
            _idle_onenter(inst, pushanim,...)
        end

        local _run_start_onenter = sg.states["run_start"].onenter
        sg.states["run_start"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end
             _run_start_onenter(inst,...)
            end

        local _run_onenter = sg.states["run"].onenter
        sg.states["run"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end
            _run_onenter(inst,...)
        end

        local _run_stop_onenter = sg.states["run_stop"].onenter
        sg.states["run_stop"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst:AddTag("groggy")
            elseif isgroggy(inst) then 
                inst:RemoveTag("groggy")
            end
            _run_stop_onenter(inst,...)
        end
        
    end
    local eater = sg.actionhandlers[ACTIONS.EAT].deststate
    sg.actionhandlers[ACTIONS.EAT].deststate = function(inst, action)
            if inst.sg:HasStateTag("busy") or inst:HasTag("busy") then
                return
            end
            local obj = action.target or action.invobject
            if obj == nil then
                return
            end
            if obj:HasTag("drink") then
                for k, v in pairs(FOODTYPE) do
                    if obj:HasTag("edible_"..v) then
                        return (v == FOODTYPE.MEAT and not obj:HasTag("alcohol") and "drinkstew") or "drink"
                    end
                end
            else
                return eater(inst, action)
            end
        end
    end)

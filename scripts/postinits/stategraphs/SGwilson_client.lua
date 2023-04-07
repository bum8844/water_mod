local drink_client = State{
    name = "drink",
    tags = {"busy"},
                
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

AddStategraphState("wilson_client", drink_client)

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
        for k, v in pairs(FOODTYPE) do
            if obj:HasTag("edible_"..v) and obj:HasTag("drink") then
                return v == "drink"
            end
        end
    end)

AddStategraphEvent("wilson_client", refresh_drunk_event)
AddStategraphEvent("wilson_client", drunk_event)
AddStategraphEvent("wilson_client", drink_event)

------------------------------------------------------------------------

AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.GIVEWATER, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TAKEWATER, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TAKEWATER_OCEAN, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.MILKINGTOOL, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.UPGRADE_TILEARRIVE, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRINK, "drink"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRINKPLAYER, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.TURNON_TILEARRIVE, "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRINK_HARVEST, "dolongaction"))

------------------------------------------------------------------------

AddStategraphPostInit("wilson_client", function(sg)
    do
        local _idle_onenter = sg.states["idle"].onenter
        sg.states["idle"].onenter = function(inst, pushanim,...)
            local anims = {}
            _idle_onenter(inst, pushanim,...)
            if inst:HasTag("drunk") then
                table.insert(anims, "idle_groggy_pre")
                table.insert(anims, "idle_groggy")
            else
                table.insert(anims, "idle_loop")
            end
            if pushanim then
                for k, v in pairs(anims) do
                    inst.AnimState:PushAnimation(v, k == #anims)
                end
            else
                inst.AnimState:PlayAnimation(anims[1], #anims == 1)
                for k, v in pairs(anims) do
                    if k > 1 then
                        inst.AnimState:PushAnimation(v, k == #anims)
                    end
                end
            end
        end
        local _run_start_onenter = sg.states["run_start"].onenter
        sg.states["run_start"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst.sg.statemem.groggy = true
                inst.components.locomotor:RunForward()
                inst.AnimState:PlayAnimation("idle_walk_pre")
                inst.sg.mem.footsteps = 0
            else
                _run_start_onenter(inst,...)
            end
        end
        local _run_onenter = sg.states["run"].onenter
        sg.states["run"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst.sg.statemem.groggy = true
                inst.AnimState:PlayAnimation("idle_walk", true)
                inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
            else
                _run_onenter(inst,...)
            end
        end
        local _run_stop_onenter = sg.states["run_stop"].onenter
        sg.states["run_stop"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                inst.sg.statemem.groggy = true
                inst.components.locomotor:Stop()
                inst.AnimState:PlayAnimation("idle_walk_pst")
            else
                _run_stop_onenter(inst,...)
            end
        end
    end
    local eater = sg.actionhandlers[ACTIONS.EAT].deststate
    sg.actionhandlers[ACTIONS.EAT].deststate = function(inst, action)
        local result = eater(inst, action)
        if result ~= nil then
            local obj = action.target or action.invobject
            if obj:HasTag("drink") then
                return "drink"
            end
        end
        return result
    end
end)

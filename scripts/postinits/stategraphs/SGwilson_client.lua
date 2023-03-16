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
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.PURIFY, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRINK, "drink"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DRINKPLAYER, "give"))

------------------------------------------------------------------------

AddStategraphPostInit("wilson_client", function(sg)
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

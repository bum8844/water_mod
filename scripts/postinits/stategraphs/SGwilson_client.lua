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
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.BREWING,
        function(inst, action)
            return inst:HasTag("expertchef") and "domediumaction" or "dolongaction"
        end)
)

------------------------------------------------------------------------

AddStategraphPostInit("wilson_client", function(sg)
    do
        local function DoEquipmentFoleySounds(inst)
            local inventory = inst.replica.inventory
            if inventory ~= nil then
                for k, v in pairs(inventory:GetEquips()) do
                    if v.foleysound ~= nil then
                        inst.SoundEmitter:PlaySound(v.foleysound, nil, nil, true)
                    end
                end
            end
        end

        local function ClearCachedServerState(inst)
            if inst.player_classified ~= nil then
                inst.player_classified.currentstate:set_local(0)
            end
        end

        local function DoFoleySounds(inst)
            DoEquipmentFoleySounds(inst)
            if inst.foleysound ~= nil then
                inst.SoundEmitter:PlaySound(inst.foleysound, nil, nil, true)
            end
        end
        local function PlayMooseFootstep(inst, volume, ispredicted)
            --moose footstep always full volume
            inst.SoundEmitter:PlaySound("dontstarve/characters/woodie/moose/footstep", nil, nil, ispredicted)
            PlayFootstep(inst, volume, ispredicted)
        end

        local function ConfigureRunState(inst)
            if inst.replica.rider ~= nil and inst.replica.rider:IsRiding() then
                inst.sg.statemem.riding = true
                inst.sg.statemem.groggy = inst:HasTag("groggy") or inst:HasTag("drunk")

                local mount = inst.replica.rider:GetMount()
                inst.sg.statemem.ridingwoby = mount and mount:HasTag("woby")

            elseif inst.replica.inventory:IsHeavyLifting() then
                inst.sg.statemem.heavy = true
                inst.sg.statemem.heavy_fast = inst:HasTag("mightiness_mighty")
            elseif inst:HasTag("wereplayer") then
                inst.sg.statemem.iswere = true
                if inst:HasTag("weremoose") then
                    if inst:HasTag("groggy") then
                        inst.sg.statemem.moosegroggy = true
                    else
                        inst.sg.statemem.moose = true
                    end
                elseif inst:HasTag("weregoose") then
                    if inst:HasTag("groggy") then
                        inst.sg.statemem.goosegroggy = true
                    else
                        inst.sg.statemem.goose = true
                    end
                elseif inst:HasTag("groggy") or inst:HasTag("drunk") then
                    inst.sg.statemem.groggy = true
                else
                    inst.sg.statemem.normal = true
                end
            elseif inst:GetStormLevel() >= TUNING.SANDSTORM_FULL_LEVEL and not inst.components.playervision:HasGoggleVision() then
                inst.sg.statemem.sandstorm = true
            elseif inst:HasTag("groggy") or inst:HasTag("drunk") then
                inst.sg.statemem.groggy = true
            elseif inst:IsCarefulWalking() then
                inst.sg.statemem.careful = true
            else
                inst.sg.statemem.normal = true
                inst.sg.statemem.normalwonkey = inst:HasTag("wonkey") or nil
            end
        end

        local function GetRunStateAnim(inst)
            return ((inst.sg.statemem.heavy and inst.sg.statemem.heavy_fast) and "heavy_walk_fast")
                or (inst.sg.statemem.heavy and "heavy_walk")
                or (inst.sg.statemem.sandstorm and "sand_walk")
                or ((inst.sg.statemem.groggy or inst.sg.statemem.moosegroggy or inst.sg.statemem.goosegroggy) and "idle_walk")
                or (inst.sg.statemem.careful and "careful_walk")
                or (inst.sg.statemem.ridingwoby and "run_woby")
                or "run"
        end

        local _idle_onenter = sg.states["idle"].onenter
        sg.states["idle"].onenter = function(inst, pushanim,...)    
            if inst:HasTag("drunk") then
                inst.entity:SetIsPredictingMovement(false)
                inst.components.locomotor:Stop()
                inst.components.locomotor:Clear()

                if pushanim == "cancel" then
                    return
                elseif inst:HasTag("nopredict") or inst:HasTag("pausepredict") then
                    inst:ClearBufferedAction()
                    return
                elseif pushanim == "noanim" then
                    ClearCachedServerState(inst)
                    inst.sg:SetTimeout(TIMEOUT)
                    return
                end

                local anim
                if inst.replica.rider ~= nil and inst.replica.rider:IsRiding() then
                    anim = "idle_loop"
                elseif inst:HasTag("wereplayer") then
                    if not inst:HasTag("groggy") or not inst:HasTag("drunk") or inst:HasTag("beaver") then
                        anim = "idle_loop"
                    elseif inst:HasTag("weremoose") then
                        anim = (inst.AnimState:IsCurrentAnimation("idle_walk_pst") or
                                inst.AnimState:IsCurrentAnimation("idle_walk") or
                                inst.AnimState:IsCurrentAnimation("idle_walk_pre")) and
                            "idle_groggy" or
                            "idle_loop"
                    else
                        anim = (inst.AnimState:IsCurrentAnimation("idle_walk_pst") or
                                inst.AnimState:IsCurrentAnimation("idle_walk") or
                                inst.AnimState:IsCurrentAnimation("idle_walk_pre")) and
                            "idle_groggy" or
                            "idle_loop"
                    end
                elseif inst.player_classified ~= nil and inst.player_classified.inmightygym:value() > 0 then
                    anim = "mighty_gym_active_loop"
                else
                    anim =
                        (inst.replica.inventory ~= nil and inst.replica.inventory:IsHeavyLifting() and "heavy_idle") or
                        (   inst:GetStormLevel() >= TUNING.SANDSTORM_FULL_LEVEL and
                            not inst.components.playervision:HasGoggleVision() and
                            (   inst.AnimState:IsCurrentAnimation("sand_walk_pst") or
                                inst.AnimState:IsCurrentAnimation("sand_walk") or
                                inst.AnimState:IsCurrentAnimation("sand_walk_pre")
                            ) and
                            "sand_idle_loop"
                        ) or
                        "idle_loop"
                end

                if pushanim then
                    inst.AnimState:PushAnimation(anim, true)
                else
                    inst.AnimState:PlayAnimation(anim, true)
                end
            else
                _idle_onenter(inst, pushanim,...)
            end
        end
        local _run_start_onenter = sg.states["run_start"].onenter
        sg.states["run_start"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                ConfigureRunState(inst)
                if inst.sg.statemem.normalwonkey and inst.components.locomotor:GetTimeMoving() >= TUNING.WONKEY_TIME_TO_RUN then
                    inst.sg:GoToState("run_monkey") --resuming after brief stop from changing directions
                    return
                end
                inst.components.locomotor:RunForward()
                inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pre")
                inst.sg.mem.footsteps = (inst.sg.statemem.goose or inst.sg.statemem.goosegroggy) and 4 or 0
                else
                    _run_start_onenter(inst,...)
                end
            end
        local _run_onenter = sg.states["run"].onenter
        sg.states["run"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                ConfigureRunState(inst)
                inst.components.locomotor:RunForward()

                local anim = GetRunStateAnim(inst)
                if anim == "run" then
                    anim = "run_loop"
                elseif anim == "run_woby" then
                    anim = "run_woby_loop"
                end

                if not inst.AnimState:IsCurrentAnimation(anim) then
                    inst.AnimState:PlayAnimation(anim, true)
                end

                inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength())
            else
                _run_onenter(inst,...)
            end
        end
        local _run_stop_onenter = sg.states["run_stop"].onenter
        sg.states["run_stop"].onenter = function(inst,...)
            if inst:HasTag("drunk") then
                ConfigureRunState(inst)
                inst.components.locomotor:Stop()
                inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pst")

                if inst.sg.statemem.moose or inst.sg.statemem.moosegroggy then
                    PlayMooseFootstep(inst, .6, true)
                    DoFoleySounds(inst)
                end
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

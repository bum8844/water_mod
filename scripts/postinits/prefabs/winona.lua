local function WinonaRightClickPicker(inst, target, pos)
    return target ~= nil
        and not inst:HasTag("playerghost")
        and not inst.replica.health:IsDead()
        and inst.components.playercontroller ~= nil
        and inst.components.playeractionpicker ~= nil
        and target ~= inst
        and inst.components.playercontroller:IsControlPressed(CONTROL_FORCE_ATTACK)
        and target:HasTag("engineering")
        and target:HasTag("well_waterpump")
        and not inst.components.playercontroller.isclientcontrollerattached
        and inst.components.playeractionpicker:SortActionList({ACTIONS.DISMANTLE}, target, nil) or nil, true
    
end
local function onrespawnedfromghost(inst)
    inst.components.playeractionpicker.rightclickoverride = WinonaRightClickPicker
end
local function onbecameghost(inst)
    inst.components.playeractionpicker.rightclickoverride = nil
end

AddPrefabPostInit("winona",function(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onrespawnedfromghost)
    inst:ListenForEvent("ms_becameghost", onbecameghost)
    inst:DoTaskInTime(0, onrespawnedfromghost)
end)

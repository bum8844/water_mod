local it = {
	"minisign",
	"minisign_item",
	"minisign_drawn",
}

local function OnDrawnFn(inst, image, src, atlas, bgimage, bgatlas)
	if 	(atlas and (
			atlas=="minisign_dehy_drinks_swap" or 
			atlas=="minisign_dehy_drinks_bottle_swap" or 
			atlas=="minisign_dehy_items_swap"
			)
		) or (
		bgatlas and (
			bgatlas=="minisign_dehy_drinks_swap" or 
			bgatlas=="minisign_dehy_drinks_bottle_swap" or 
			bgatlas=="minisign_dehy_items_swap")
		) then
	    if image ~= nil then
	        inst.AnimState:OverrideSymbol("SWAP_SIGN", atlas or GetInventoryItemAtlas(image..".tex"), image..".tex")
	        if bgimage ~= nil then
	            inst.AnimState:OverrideSymbol("SWAP_SIGN_BG", bgatlas or GetInventoryItemAtlas(bgimage..".tex"), bgimage..".tex")
	        else
	            inst.AnimState:ClearOverrideSymbol("SWAP_SIGN_BG")
	        end

	        if inst:HasTag("sign") then
	            inst.components.drawable:SetCanDraw(false)
	            inst._imagename:set(src ~= nil and (src.drawnameoverride or src:GetBasicDisplayName()) or "")
	            if src ~= nil then
	                inst.SoundEmitter:PlaySound("dontstarve/common/together/draw")
	            end
	        end
	    else
	        inst.AnimState:ClearOverrideSymbol("SWAP_SIGN")
	        inst.AnimState:ClearOverrideSymbol("SWAP_SIGN_BG")
	        if inst:HasTag("sign") then
	            if not (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
	                inst.components.drawable:SetCanDraw(true)
	            end
	            inst._imagename:set("")
	        end
	    end
	else
		inst.components.drawable.ondrawnfn(inst, image, src, atlas, bgimage, bgatlas)
	end
end

local function OnSave(inst, data)
	if inst.atlas or inst.image then
		data.atlas = inst.atlas
		data.image = inst.image	
	else
	    data.imagename =
	        inst.components.drawable:GetImage() ~= nil and
	        #inst._imagename:value() > 0 and
	        inst._imagename:value() ~= STRINGS.NAMES[string.upper(inst.components.drawable:GetImage())] and
	        inst._imagename:value() or
	        nil
    end
end

local function OnLoad(inst, data)
	if data.atlas or data.image then
		inst.atlas = data.atlas or nil
		inst.image = data.image or nil
		if inst.atlas ~= nil then
			inst.AnimState:OverrideSymbol("SWAP_SIGN", resolvefilepath(inst.atlas), inst.image..".tex")	
		end
	else
		inst._imagename:set(
	        inst.components.drawable:GetImage() ~= nil and (
	            data ~= nil and
	            data.imagename ~= nil and
	            #data.imagename > 0 and
	            data.imagename or
	            STRINGS.NAMES[string.upper(inst.components.drawable:GetImage())]
	        ) or ""
	    )
	end
end

for k, v in pairs(it) do
	AddPrefabPostInit(v,function(inst)
		if inst.components.drawable and inst.components.drawable.ondrawnfn then
			inst.components.drawable.old_ondrawnfn = inst.components.drawable.ondrawnfn
			inst.components.drawable:SetOnDrawnFn(OnDrawnFn)
		end

		if inst.OnSave then
			inst.OnSave = OnSave
		end
		if inst.OnLoad then
			inst.OnLoad = OnLoad
		end
	end)
end


local modlist = require("utils/water_modlist").active_mod_compatibility

AddComponentPostInit("drawable", function(self)
<<<<<<< HEAD
	self._OnDrawn = self.OnDrawn
=======
	self.dehy_OnDrawn = self.OnDrawn
>>>>>>> Beta_1.2.8

	function self:OnDrawn(imagename, imagesource, atlasname, bgimagename, bgatlasname)
		if imagesource then
			print("GetInventoryItemAtlas",GetInventoryItemAtlas(imagename..".tex"))
			if imagesource.minisign_atlas then
				atlasname = imagesource.minisign_atlas
			end

			if imagesource.minisign_prefab_name then
				imagename = tostring(imagesource.prefab)
			elseif imagesource.minisign_custom_name then
				imagename = imagesource.minisign_custom_name 
			end

			if bgimagename and bgatlasname == nil and imagesource.inv_image_bg.minisign_atlas ~= nil then
				bgatlasname = imagesource.inv_image_bg.minisign_atlas
			end
		end

<<<<<<< HEAD
		self:_OnDrawn(imagename, imagesource, atlasname, bgimagename, bgatlasname)
=======
		self:dehy_OnDrawn(imagename, imagesource, atlasname, bgimagename, bgatlasname)
>>>>>>> Beta_1.2.8
	end
end)

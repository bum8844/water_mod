AddComponentPostInit("drawable", function(self)
	self._OnDrawn = self.OnDrawn
	
	function self:OnDrawn(imagename, imagesource, atlasname, bgimagename, bgatlasname)
		if imagesource then
			if imagesource.water_swap_type then
				atlasname = "water_minisign_swap"
			end
			if imagesource.water_use_prefab_name then
				imagename = tostring(imagesource.prefab)
			elseif imagesource.water_swap_img then
				imagename = imagesource.water_swap_img
			end
			--[[print("imagename : ",imagename)
			print("imagesource : ",imagesource)
			print("atlasname : ",atlasname)]]
		end
		self:_OnDrawn(imagename, imagesource, atlasname, bgimagename, bgatlasname)
	end
end)

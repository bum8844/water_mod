AddComponentPostInit("drawable", function(self)
	self._OnDrawn = self.OnDrawn
	
	function self:OnDrawn(imagename, imagesource, atlasname, bgimagename, bgatlasname)
		if imagesource then
			if imagesource._swap_type then
				atlasname = imagesource._swap_type
			end
			if imagesource._same_name then
				imagename = tostring(imagesource.prefab)
			elseif imagesource._swap_img then
				imagename = imagesource._swap_img
			end
		end
		self:_OnDrawn(imagename, imagesource, atlasname, bgimagename, bgatlasname)
	end
end)

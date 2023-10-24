AddClassPostConstruct("components/container_replica", function(self)
	function self:HasItemWithTag(tag, amount)
	    if self.inst.components.container ~= nil then
	        return self.inst.components.container:HasItemWithTag(tag, amount)
	    elseif self.classified ~= nil and self.opener ~= nil then
	        return self.classified:HasItemWithTag(tag, amount)
	    else
	        return amount <= 0, 0
	    end
	end
end)
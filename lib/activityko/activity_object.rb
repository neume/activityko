module Activityko
	module ActivityObject
		def activity_name
			try(:name) || self.class.to_s
		end
	end
end

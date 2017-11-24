require "activityko/activity_subject"
require "activityko/activity_object"
module Activityko
	module Loggable
		def act_as_loggable
			include Activityko::ActivitySubject
			include Activityko::ActivityObject
		end
		def act_as_activity_object
			include Activityko::ActivityObject
		end
	end
end

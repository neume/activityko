module Activityko
	module Generators
		class ModelGenerator < Rails::Generators::Base
			source_root File.expand_path("../templates", __FILE__)
			desc "generates models/activity.rb"
			def generate_model
				copy_file 'activity.rb', 'app/models/activity.rb'
			end
		end
	end
end

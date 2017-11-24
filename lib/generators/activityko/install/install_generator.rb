require 'rails/generators'
require 'rails/generators/active_record'
require 'generators/activityko/model/model_generator'
require 'generators/activityko/migration/migration_generator'
module Activityko
	module Generators
		class InstallGenerator < Rails::Generators::Base
			include Rails::Generators::Migration
			def self.next_migration_number(dirname)
				ActiveRecord::Generators::Base.next_migration_number(dirname)
			end
			source_root File.expand_path("../..", __FILE__)
			desc "generates migration file"
			def generate_migration
				migration_template 'migration/templates/migration.rb', 'db/migrate/create_activities.rb'
				copy_file 'model/templates/activity.rb', 'app/models/activity.rb'
			end
		end
	end
end

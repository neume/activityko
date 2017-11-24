require 'rails/generators'
require 'rails/generators/active_record'
module Activityko
	module Generators
		class MigrationGenerator < Rails::Generators::Base
			include Rails::Generators::Migration
		  def self.next_migration_number(dirname)
		    ActiveRecord::Generators::Base.next_migration_number(dirname)
		  end
			source_root File.expand_path("../templates", __FILE__)
			desc "generates migration file"
			def generate_migration
				migration_template 'migration.rb', 'db/migrate/create_activities.rb'
			end
		end
	end
end

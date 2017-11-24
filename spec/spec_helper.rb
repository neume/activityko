require "bundler/setup"
require "activityko"
require 'active_record'
require 'action_view'
require 'active_record/connection_adapters/sqlite3_adapter'
require "mock_app/models/user"
require "mock_app/models/group"
require "mock_app/models/location"
require "mock_app/models/activity"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
	
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
ActiveRecord::Migrator.migrate(File.expand_path('../mock_app/migrations', __FILE__))

def create_records
	@lelouch = User.create(name: "Lelouch")
	@group = User.create(name: "Anbu")
	@suzaku = User.create(name: "Suzaku")
	@activity = @lelouch.create_activity("added", dir_obj: @suzaku, prep: "to", prep_obj: @group)
end

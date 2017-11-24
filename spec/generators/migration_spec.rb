require "generator_spec"
require "generators/activityko/migration/migration_generator"
describe Activityko::Generators::MigrationGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before do
    prepare_destination
    run_generator
  end
  it "generates migration file" do
    expect(destination_root).to have_structure {
			directory "db" do
				directory "migrate" do
					migration "create_activities.rb"
				end
      end
    }
  end
end

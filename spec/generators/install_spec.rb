require "generator_spec"
require "generators/activityko/install/install_generator"
describe Activityko::Generators::InstallGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)
  before do
    prepare_destination
    run_generator
  end
  it "generates both migration and model files" do
    expect(destination_root).to have_structure {
			directory "db" do
				directory "migrate" do
					migration "create_activities.rb"
				end
      end
			directory "app" do
				directory "models" do
					file "activity.rb"
				end
			end
    }
  end
end

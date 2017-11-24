require "generator_spec"
require "generators/activityko/model/model_generator"
describe Activityko::Generators::ModelGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before do
    prepare_destination
    run_generator
  end
  it "generates model file" do
    expect(destination_root).to have_structure {
			directory "app" do
				directory "models" do
					file "activity.rb"
				end
      end
    }
  end
end

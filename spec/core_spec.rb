require "spec_helper"

RSpec.describe "Loggable" do
	context "when a model acts as loggable" do
		before do
			create_records
			# @activity = Activity.create(subj: @suzaku, action: "added", dir_obj:@lelouch)
		end
		it "has an activity" do
			expect(@activity).to be_present
		end
		it "has all the record objects" do
			expect(@activity.subj).to eq(@lelouch)
			expect(@activity.action).to eq("added")
			expect(@activity.dir_obj).to eq(@suzaku)
			expect(@activity.prep).to eq("to")
			expect(@activity.prep_obj).to eq(@group)
		end
  end

end

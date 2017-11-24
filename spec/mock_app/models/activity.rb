class Activity <ActiveRecord::Base
	belongs_to :subj, polymorphic: true
	belongs_to :dir_obj, polymorphic: true
	belongs_to :prep_obj, polymorphic: true
end

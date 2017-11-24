require 'active_support/concern'
module Activityko
	module ActivitySubject
		extend ActiveSupport::Concern
		included do
			has_many :activities, as: :subj
		end
	  def create_activity action, options={}
			options.merge!({action: action})
			activities.create(options)
		end
	end
end

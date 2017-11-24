require "action_view"
module Activityko
	module ViewHelpers
		def render_activity activity
	    render partial: "activities/#{activity.dir_obj_type.downcase}/#{activity.action}",
	      locals: { activity: activity } rescue basic_activity(activity)
	  end
	  def basic_activity activity
			@activityko_instance = activity
			if block_given?
				yield
			else
		    sentence = []
		    sentence << activity_subj if activity.subj
		    sentence << activity_action
		    sentence << activity_dir_obj if activity.dir_obj
		    sentence << activity_prep if activity.prep
		    sentence << activity_prep_obj if activity.prep_obj
		    return sentence.join(" ").html_safe
			end
	  end
		def activity_dir_obj
			dir_obj = @activityko_instance.dir_obj
			link_to dir_obj.activity_name, dir_obj
		end
	  def activity_subj
			subj = @activityko_instance.subj
	    link_to(subj.activity_name, subj)
	  end
		def activity_action
			@activityko_instance.action.humanize.downcase
		end
		def activity_prep
			@activityko_instance.prep.humanize.downcase
		end
		def activity_prep_obj
			prep_obj = @activityko_instance.prep_obj
			link_to prep_obj.activity_name, prep_obj
		end
	  def activity_time
	    time_ago_in_words @activityko_instance.created_at
	  end
	end
	ActionView::Base.send :include, ViewHelpers
end
